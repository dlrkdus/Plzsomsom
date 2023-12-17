package controller.userInfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.service.UserNotFoundException;
import model.UserInfoDTO;
import model.service.UserInfoServiceImpl;

public class ProfileController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {         
       // 로그인 여부 확인
       if (!UserSessionUtils.hasLogined(request.getSession())) {
            return "redirect:/user/login/form";      // login form 요청으로 redirect
        }
       
       UserInfoServiceImpl manager = UserInfoServiceImpl.getInstance();
       HttpSession session = request.getSession();
        String postWriterId = UserSessionUtils.getLoginUserId(session);
      
       UserInfoDTO user = null;
      try {
         user = manager.findUserInfo(postWriterId);   // 사용자 정보 검색
      } catch (UserNotFoundException e) {            
           return "redirect:/user/list";
      }   

      request.setAttribute("user", user);      // 사용자 정보 저장            
      return "/mypage/profile.jsp";            // 사용자 보기 화면으로 이동

    }
}
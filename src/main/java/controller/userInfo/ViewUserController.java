package controller.userInfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.service.UserNotFoundException;
import model.UserInfoDTO;
import model.service.UserInfoServiceImpl;

public class ViewUserController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {			
    	// 로그인 여부 확인
    	if (!UserSessionUtils.hasLogined(request.getSession())) {
            return "redirect:/user/login/form";		// login form 요청으로 redirect
        }
    	
    	UserInfoServiceImpl manager = UserInfoServiceImpl.getInstance();
		String userId = request.getParameter("userId");
		
    	UserInfoDTO user = null;
		try {
			user = manager.findUserInfo(userId);	// 사용자 정보 검색
		} catch (UserNotFoundException e) {				
	        return "redirect:/user/list";
		}	
		
		request.setAttribute("user", user);		// 사용자 정보 저장				
		return "/user/profileView.jsp";				// 사용자 보기 화면으로 이동

    }
}

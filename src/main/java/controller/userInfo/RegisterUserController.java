package controller.userInfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.UserInfoDTO;
import model.service.UserInfoServiceImpl;

public class RegisterUserController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(RegisterUserController.class);


    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	//필요x
    	if (request.getMethod().equals("GET")) {	
    		// GET request: 회원정보 등록 form 요청	
    		log.debug("RegisterForm Request");
		
			return "/user/registerForm.jsp";   // 검색한 커뮤니티 리스트를 registerForm으로 전송     	
	    }
    	
		/*
		 * SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd"); String date =
		 * request.getParameter("joinDate"); Date joinDate = format.parse(date);
		 */UserInfoDTO user = new UserInfoDTO(
				request.getParameter("userId"), request.getParameter("password"),
				request.getParameter("name"), request.getParameter("nickname"),
				request.getParameter("phone"), request.getParameter("email"),
			//	joinDate
				null
				 );

		try {
			UserInfoServiceImpl userInfoService = UserInfoServiceImpl.getInstance();
			userInfoService.joinUserInfo(user);
	        return "redirect:/user/list";	// 성공 시 사용자 리스트 화면으로 redirect
	        
		} catch (Exception e) {	// 예외 발생 시 회원가입 form으로 forwarding
            request.setAttribute("registerFailed", true);
			request.setAttribute("exception", e);
			request.setAttribute("user", user);
			return "/user/registerForm.jsp";
		}
    }
}


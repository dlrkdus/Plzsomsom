package controller.userInfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;

import model.service.UserInfoServiceImpl;

public class LoginController implements Controller {
	private UserInfoServiceImpl userInfoService;
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      	String userId = request.getParameter("userId");
		String password = request.getParameter("password");  	

		
		try {
			 userInfoService = UserInfoServiceImpl.getInstance();
				/*UserInfoDAO를 직접 호출하여 로그인 작업 수행*/
				userInfoService.loginUserInfo(userId, password);
				HttpSession session = request.getSession();
	            session.setAttribute(UserSessionUtils.USER_SESSION_KEY, userId);
	          
            return "redirect:/user/list";			
		} catch (Exception e) {
			/* UserNotFoundException이나 PasswordMismatchException 발생 시
			 * 다시 login form을 사용자에게 전송하고 오류 메세지도 출력
			 */
            request.setAttribute("loginFailed", true);
			request.setAttribute("exception", e);
            return "/user/loginForm.jsp";			
		}	
    }
}
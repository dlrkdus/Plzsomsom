package controller.comments;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.userInfo.UserSessionUtils;
import model.CommentsDTO;

import model.service.CommentsManager;


public class InsertCommentsController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(InsertCommentsController.class);
    private CommentsManager commMan;

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	
    	//session userid랑 commwrtierId 값
		HttpSession session = request.getSession();
		String commWriterId = request.getParameter("commWriterId");
		commWriterId = UserSessionUtils.getLoginUserId(session);
    	
		log.debug("뭔데 이게", commWriterId);
		
		CommentsDTO comments = new CommentsDTO(
				// Integer.parseInt(request.getParameter("commentsNum"))
				request.getParameter("commContent"), commWriterId, Integer.parseInt(request.getParameter("postNum")),
				null
				);
    	
		try {
			
			commMan = CommentsManager.getInstance();
			commMan.insertComments(comments);
			request.setAttribute("postNum", Integer.parseInt(request.getParameter("postNum")));
			log.debug("Insert Comments : {}", comments);
			// /post/detail requestMapping
			return "redirect:/comments/list"+ "?postNum=" + comments.getPostNum();
	        
		} catch (Exception e) {	
			request.setAttribute("insertFailed", true);
			request.setAttribute("exception", e);

			return "/post/view.jsp";
		}
		
    	
    }
}

package controller.comments;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.service.CommentsManager;

public class DeleteCommentsController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(DeleteCommentsController.class);

    private CommentsManager commMan;
    
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	
    	int commentsNum = Integer.parseInt(request.getParameter("commentsNum"));		//commentsNum 값 저장

    	try {
			commMan = CommentsManager.getInstance();		//manager호출
			commMan.deleteComments(commentsNum);			//try-catch 내 deleteComments
			
			log.debug("Comments Delete : {}", commentsNum);
			
			return "redirect:/post/main";
		}catch(Exception e) {
			request.setAttribute("deleteFailed", true);
			request.setAttribute("exception", e);
			
			// 해당 post 다시 보기
			return "/post/view.jsp";
		}
    	
    	
    }
}

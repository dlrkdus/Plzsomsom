package controller.comments;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.CommentsDTO;
import model.PostDTO;
import model.service.CommentsManager;
import model.service.PostManager;


public class ListCommentsController implements Controller {
	private static final Logger log = LoggerFactory.getLogger(ListCommentsController.class);
	private CommentsManager commMan;

	@Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
		
		int postNum = Integer.parseInt(request.getParameter("postNum"));		//postNum 값 저장
		commMan = CommentsManager.getInstance();

		List<CommentsDTO> commentsList = commMan.getCommentsList(postNum);		//postNum에 있는 comments 출력
		request.setAttribute("commentsList", commentsList);
	
		PostDTO post = null;
		PostManager manager = PostManager.getInstance();
		post = manager.getPost(postNum);
		
		request.setAttribute("post", post);
		
		log.debug("CommentsList : {}", commentsList);
		
		//작성된 댓글이 있는 뷰로 이동
		return "/post/view.jsp";
     
    }
}

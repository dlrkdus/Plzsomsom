package controller.post;

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

/*게시글 상세보기 Controller*/
public class SelectPostController implements Controller{
	private static final Logger log = LoggerFactory.getLogger(SelectPostController.class);
	PostManager manager;
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int postNum = Integer.parseInt(request.getParameter("postNum"));
		PostDTO post = null;
		
		manager = PostManager.getInstance();
		post = manager.getPost(postNum);
		
		request.setAttribute("post", post);
		
		CommentsManager commMan = CommentsManager.getInstance();
		List<CommentsDTO> commentsList = commMan.getCommentsList(postNum);		//postNum에 있는 comments 출력
		request.setAttribute("commentsList", commentsList);
		
		
		log.debug("Select One Post : {}", postNum);
		
		/*게시글 보기 화면으로 forwarding*/
		return "/post/view.jsp";
	}
}
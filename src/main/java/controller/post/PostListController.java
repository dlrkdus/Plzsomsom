package controller.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.PostDTO;
import model.service.PostManager;

/*카테고리별 게시글 조회 Controller*/
public class PostListController implements Controller{
	private static final Logger log = LoggerFactory.getLogger(PostListController.class);
	private PostManager manager;
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		manager = PostManager.getInstance();
		String productCategoryNum = request.getParameter("productCategoryNum");
		
		List<PostDTO> postList = manager.getList(productCategoryNum);
		
		request.setAttribute("postList", postList);
		request.setAttribute("pdNum", productCategoryNum);
		
		log.debug("Post List : {}", postList);
		
		/*게시글 조회 화면으로 forwarding*/
		return "/post/Board.jsp";
	}
}
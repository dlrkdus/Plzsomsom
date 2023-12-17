package controller.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.service.PostManager;

public class DeletePostController implements Controller{
	private static final Logger log = LoggerFactory.getLogger("DeletePostController.class");
	PostManager manager;
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int postNum = Integer.parseInt(request.getParameter("postNum"));
		String productCategoryNum = request.getParameter("productCategoryNum");
		
		try {
			manager = PostManager.getInstance();
			manager.delete(postNum);
			
			log.debug("Post Delete : {}", postNum);
			
			/*적용될 명칭에 따라 변경*/
			return "redirect:/post/list" + "?productCategoryNum=" + productCategoryNum;
		}catch(Exception e) {
			request.setAttribute("deleteFailed", true);
			request.setAttribute("exception", e);
			
			/*게시글 리스트 화면으로 forwarding*/
			return "/board/main.jsp";
		}
	}
	
}

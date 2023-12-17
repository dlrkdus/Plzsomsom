package controller.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.PostDTO;
import model.service.PostManager;

public class UpdatePostController implements Controller{
	private static final Logger log = LoggerFactory.getLogger("UpdatePostController.class");
	PostManager manager;
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equals("GET")) {
			int updatePostNum = Integer.parseInt(request.getParameter("postNum"));
			
			log.debug("UpdateForm Request : {}", updatePostNum);
			
			manager = PostManager.getInstance();
			PostDTO Post = manager.getPost(updatePostNum);
			
			request.setAttribute("updatePost", Post);
			
			return "/post/modify.jsp";
		}
		
		PostDTO updatePost = new PostDTO(
				request.getParameter("postContent"),
				Integer.parseInt(request.getParameter("price")), 
				Integer.parseInt(request.getParameter("count")), 
				request.getParameter("time"),
				request.getParameter("photo"), 
				request.getParameter("productCategoryNum"),
				request.getParameter("title"),
				null, 
				Integer.parseInt(request.getParameter("postNum"))
				);
		
		

		log.debug("Update Post : {}", updatePost);
		
		manager = PostManager.getInstance();
		manager.update(updatePost);
		
		return "redirect:/post/detail" + "?postNum=" + updatePost.getPostNum();
	}
	
}
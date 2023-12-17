package controller.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.PostDTO;
import model.service.PostManager;

/*게시글 검색 Controller*/
public class SearchPostController implements Controller{
	private static final Logger log = LoggerFactory.getLogger(SearchPostController.class);

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PostManager manager = PostManager.getInstance();
		String keyword = request.getParameter("keyword");
		
		List<PostDTO> searchList = manager.getSearch(keyword);
		
		request.setAttribute("searchList", searchList);
		
		log.debug("Post Search : {}", searchList);
		
		/*검색 결과 jsp로 forwarding*/
		return "/post/searchResultPage.jsp";
	}
}

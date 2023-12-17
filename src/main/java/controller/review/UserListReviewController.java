package controller.review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.Controller;
import model.ReviewDTO;
import model.dao.ReviewDAOImpl;

public class UserListReviewController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		//상대방의 리스트 조회
				String userId = request.getParameter("userId");
				
				ReviewDAOImpl reviewDao = new ReviewDAOImpl();
				
				List<ReviewDTO> reviewList = reviewDao.UserReviewList(userId);

				List<ReviewDTO> reviewList2 = reviewDao.getReviewList(userId);
				
				request.setAttribute("reviewList", reviewList);
				request.setAttribute("reviewList2", reviewList2);
				
				return "/mypage/review.jsp";
		
	}

}

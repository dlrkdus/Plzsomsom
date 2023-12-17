package controller.review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.userInfo.UserSessionUtils;
import model.dao.ReviewDAOImpl;
import model.ReviewDTO;

public class ListReviewController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		//마이페이지에서 본인의 리스트 조회
		HttpSession session = request.getSession();
		String userId = UserSessionUtils.getLoginUserId(session);
		
		ReviewDAOImpl reviewDao1 = new ReviewDAOImpl();
		ReviewDAOImpl reviewDao2 = new ReviewDAOImpl();
		
		List<ReviewDTO> reviewList = reviewDao1.getReviewList(userId);

		List<ReviewDTO> reviewList2 = reviewDao2.UserReviewList(userId);
		
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("reviewList2", reviewList2);
		
		return "/mypage/review.jsp";
	}

}

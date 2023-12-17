package model.dao;

import java.util.List;

import model.ReviewDTO;

public interface ReviewDAO {
	/*리뷰추가*/
	public int insertReview(ReviewDTO review);
	/*사용자가 작성한 리뷰리스트*/
	public List<ReviewDTO> UserReviewList(String ReviewWriterId);
/*사용자앞으로 작성된 리뷰리스트*/
	public List<ReviewDTO> getReviewList(String postWriterId);
		
}



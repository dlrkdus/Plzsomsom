package model.dao.mapper;

import java.util.List;

import model.ReviewDTO;

public interface ReviewMapper {
	public int insertReview(ReviewDTO review);
	public List<ReviewDTO> getReviewList(String postWriterId);
	public List<ReviewDTO> UserReviewList(String ReviewWriterId);
		
}

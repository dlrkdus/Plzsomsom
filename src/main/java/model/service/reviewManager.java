package model.service;

import model.dao.ReviewDAOImpl;

import java.util.List;

import model.ReviewDTO;

public class reviewManager {
	private static reviewManager review = new reviewManager();
	private ReviewDAOImpl reviewDao;
	
	private reviewManager() {
		try {
			reviewDao = new ReviewDAOImpl();
		
		}catch (Exception e){
			e.printStackTrace();
		}
	}
	
	public static reviewManager getInstance() {
		return review;
	}
	
	public int insertReview(ReviewDTO review) {
		return reviewDao.insertReview(review);
	}
	public List<ReviewDTO> getReviewList(String postWriterId){
		return reviewDao.getReviewList(postWriterId);
	}
	public List<ReviewDTO> UserReviewList(String ReviewWriterId){
		return reviewDao.UserReviewList(ReviewWriterId);
		
	}
	
	
}

package model.service;

import java.sql.SQLException;
import java.util.List;

import model.CommentsDTO;
import model.dao.CommentsDAO;

/*CommentsManager 클래스*/
public class CommentsManager {
	private static CommentsManager CommMan = new CommentsManager();
	private CommentsDAO CommentsDAO;
	
	private CommentsManager() {
		try{
			CommentsDAO = new CommentsDAO();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static CommentsManager getInstance() {
		return CommMan;
	}
	
	public int insertComments(CommentsDTO comments) throws SQLException{
		return CommentsDAO.insertComments(comments);
	}
	
	public int deleteComments(int commentsNum) {
		return CommentsDAO.deleteComments(commentsNum);
	}
	
	public CommentsDTO getComments(int commentsNum) throws SQLException{
		return CommentsDAO.getComments(commentsNum);
	}
	
	public List<CommentsDTO> getCommentsList(int postNum) throws SQLException{
		return CommentsDAO.getCommentsList(postNum);
	}

	

}
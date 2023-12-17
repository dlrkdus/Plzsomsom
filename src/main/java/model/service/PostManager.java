package model.service;

import java.sql.SQLException;
import java.util.List;

import model.PostDTO;
import model.dao.PostDAO;

/*PostManager 클래스*/
public class PostManager {
	private static PostManager postMan = new PostManager();
	private PostDAO postDAO;
	
	private PostManager() {
		try{
			postDAO = new PostDAO();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static PostManager getInstance() {
		return postMan;
	}
	
	public int insert(PostDTO post) throws SQLException{
		return postDAO.insertPost(post);
	}
	
	public int update(PostDTO post) throws SQLException{
		return postDAO.updatePost(post);
	}
	
	public int delete(int postNum) {
		return postDAO.deletePost(postNum);
	}
	
	public PostDTO getPost(int postNum) throws SQLException{
		return postDAO.getPost(postNum);
	}
	
	public List<PostDTO> getList(String productCategoryNum) throws SQLException{
		return postDAO.getPostList(productCategoryNum);
	}
	
	public List<PostDTO> getSearch(String keyword)throws SQLException {
		return postDAO.getSearchPost(keyword);
	}
	
	public PostDAO getPostDAO() {
		return this.postDAO;
	}
}
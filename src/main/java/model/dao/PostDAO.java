package model.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;

import model.PostDTO;

/*myBatis를 이용한 PostDAO*/
public class PostDAO {
	
	private String namespace = "model.dao.mybatis.mapper.PostMapper";
	private SqlSessionFactory sqlSessionFactory = createSqlSessionFactory();
	
	private SqlSessionFactory createSqlSessionFactory() {
		String resource = "mybatis-config.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		return new SqlSessionFactoryBuilder().build(inputStream);
	}
	
	/*게시글 작성*/
	public int insertPost(PostDTO post) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		try {
			int result = sqlSession.insert(namespace + ".insertPost", post);
			
			if(result > 0) {
				sqlSession.commit();
			}else {
				sqlSession.rollback();
			}
			
			return result;
		}finally {
			sqlSession.close();
			}
	}
	
	/*게시글 수정*/
	public int updatePost(PostDTO post) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		try {
			int result = sqlSession.update(namespace + ".updatePost", post);
			
			if(result > 0) {
				sqlSession.commit();
			}else {
				sqlSession.rollback();
			}
			
			return result;
		}finally {
			sqlSession.close();
		}
	}
	
	/*게시글 삭제*/
	public int deletePost(int postNum) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		try {
			int result = sqlSession.delete(namespace + ".deletePost", postNum);
			
			if(result > 0) {
				sqlSession.commit();
			}else {
				sqlSession.rollback();
			}
			
			return result;
		}finally {
			sqlSession.close();
		}
	}
	
	/*게시글 조회*/
	public PostDTO getPost(int postNum) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		try {
			return sqlSession.selectOne(namespace + ".getPost", postNum);
		}finally {
			sqlSession.close();
		}
	}
	
	/*카테고리별 게시글 조회*/
	/*해당 카데고리의 전체 게시글을 List로 만들어 반환*/
	public List<PostDTO> getPostList(String productCategoryNum){
		List<PostDTO> postList = new ArrayList<PostDTO>();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		try {
			postList = sqlSession.selectList(namespace + ".getPostList", productCategoryNum);
		}finally {
			sqlSession.close();
		}
		return postList;
	}
	
	/*게시글 검색*/
	/*검색할 단어를 입력받아 제목 또는 내용에 검색어가 포함되는 게시글을 List로 만들어 반환*/
	public List<PostDTO> getSearchPost(String keyword){
		List<PostDTO> searchList = new ArrayList<PostDTO>();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		try {
			searchList = sqlSession.selectList(namespace + ".getSearchPost", keyword);
		}finally {
			sqlSession.close();
		}
		return searchList;
	}
}
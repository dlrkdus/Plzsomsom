package model.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.CommentsDTO;

/**
 * 댓글 관리를 위해 데이터베이스 작업을 전담하는 DAO 클래스
 * Comments 테이블에서 정보를 추가, 수정, 삭제, 검색 수행 
 */
public class CommentsDAO {
	private static SqlSessionFactory sqlSessionFactory;
	private static String namespace="model.dao.mybatis.mapper.CommentsMapper";
	
	public CommentsDAO() {
		String resource = "mybatis-config.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}

	
	/**
	 * 댓글 가져오기
	 */
	public CommentsDTO getComments(int commentsNum) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return (CommentsDTO)sqlSession.selectOne(namespace+".getComments", commentsNum);
			
		} finally {
			sqlSession.close();
		}
	}
		

	/**
	 * 댓글 테이블에 새로운 행 생성 (PK 값은 Sequence를 이용하여 자동 생성. 댓글은 5000에서 시작)
	 */
	public int insertComments(CommentsDTO comments) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int result = sqlSession.insert(namespace+".insertComments", comments);
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


	/**
	 * commentsNum에 해당하는 댓글 정보를 삭제.
	 */
	public int deleteComments(int commentsNum) {		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int result =  sqlSession.delete(namespace+".deleteComments", commentsNum);
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

	
	/**
	 * postNum에 해당하는 댓글 리스트를 보여줌.
	 */
	public List<CommentsDTO> getCommentsList(int postNum){
		List<CommentsDTO> commentsList = new ArrayList<CommentsDTO>();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		try {
			commentsList = sqlSession.selectList(namespace + ".getCommentsList", postNum);
		}finally {
			sqlSession.close();
		}
		return commentsList;
	}
	

	
}
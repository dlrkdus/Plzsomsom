package model.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.ReviewDTO;

public class ReviewDAOImpl implements ReviewDAO {

	private SqlSessionFactory sqlSessionFactory;
	private String namespace="model.dao.mybatis.mapper.ReviewMapper";

	public ReviewDAOImpl() {
		String resource = "mybatis-config.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}

	
	@Override
	public int insertReview(ReviewDTO review) {
		// TODO Auto-generated method stub
		SqlSession session = sqlSessionFactory.openSession();
		try {
			int succ = 0;
			succ = session.insert(namespace + ".insertReview", review);
			if(succ > 0) {
				session.commit();
			}else {
				session.rollback();
			}
			return succ;
		}finally {
			session.close();
		}

	}
	//사용자가 작성
	@Override
	public List<ReviewDTO> UserReviewList(String reviewWriterId) {
		// TODO Auto-generated method stub
		SqlSession session = sqlSessionFactory.openSession();
		List<ReviewDTO> list = null;
		list = session.selectList(namespace + ".UserReviewList", reviewWriterId);
		session.close();
		return list;
	}
	//사용자앞으로 작성됨
	@Override
	public List<ReviewDTO> getReviewList(String postWriterId) {
		// TODO Auto-generated method stub
		SqlSession session = sqlSessionFactory.openSession();
		List<ReviewDTO> list = null;
		list = session.selectList(namespace + ".getReviewList", postWriterId);
		session.close();
		return list;
	}



}

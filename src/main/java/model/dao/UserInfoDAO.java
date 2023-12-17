package model.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;

import model.UserInfoDTO;
import model.dao.mapper.UserInfoMapper;


public class UserInfoDAO implements UserInfoMapper {
	private SqlSessionFactory sqlSessionFactory;
	private String namespace="model.dao.mybatis.mapper.UserInfoMapper";

	public UserInfoDAO() {
		String resource = "mybatis-config.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}
	
	  
/*	public UserInfoDTO loginUserInfo(String userId, String password) {
		SqlSession session = sqlSessionFactory.openSession();

		UserInfoDTO res = null;
		try {
			res = session.selectOne(namespace + ".Longin");
		}catch(Exception e){
			e.printStackTrace();
		}
		return res;
	}*/
	
	/*회원가입*/
	public int joinUserInfo(UserInfoDTO UserInfo) {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			int succ = 0;
			succ = session.insert(namespace + ".joinUserInfo", UserInfo);
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
	
	/*회원탈퇴,삭제*/
	public int deleteUserInfo(String userId) {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			int succ = 0;
			succ = session.delete(namespace + ".deleteUserInfo", userId);
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
	
	/*회원리스트*/
	public List<UserInfoDTO> UserInfoList(){
		SqlSession session = sqlSessionFactory.openSession();
//		try {
//			return session.getMapper(UserInfoMapper.class).UserInfoList();
//			
//		}finally {
	//		session.close();
	//	}
		List<UserInfoDTO> list = null;
		list = session.selectList(namespace + ".UserInfoList");
		session.close();
		return list;
	}
	
	/*회원정보불러오기*/
	public UserInfoDTO findUserInfo(String userId) {
		SqlSession session = sqlSessionFactory.openSession();
		UserInfoDTO userInfo = null;
		userInfo = session.selectOne(namespace + ".findUserInfo", userId);
		
		session.close();
		return userInfo;
	}
	
	/*회원정보수정*/
	public int updateUserInfo(UserInfoDTO UserInfo) {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			int succ = 0;
			succ = session.delete(namespace + ".updateUserInfo", UserInfo);
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
	


	
}

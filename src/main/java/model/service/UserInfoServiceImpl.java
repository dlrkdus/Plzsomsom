package model.service;

import java.sql.SQLException;
import java.util.List;
import javax.servlet.http.HttpSession;

import model.dao.UserInfoDAO;
import model.UserInfoDTO;

public class UserInfoServiceImpl {
	
	private static UserInfoServiceImpl userService = new UserInfoServiceImpl();
	private UserInfoDAO userInfoDao;
	
	private UserInfoServiceImpl() {
		try {
			userInfoDao = new UserInfoDAO();
		
		}catch (Exception e){
			e.printStackTrace();
			
		}
	}
	public static UserInfoServiceImpl getInstance() {
		return userService;
	}
	public boolean loginUserInfo(String userId, String password) throws SQLException, UserNotFoundException, PasswordMismatchException {
		UserInfoDTO user = findUserInfo(userId);

		if (!user.matchPassword(password)) {
			throw new PasswordMismatchException("비밀번호가 일치하지 않습니다.");
		}
		return true;
	}

	
	public void logout(HttpSession session) {
		// TODO Auto-generated method stub
		session.invalidate(); //세션 초기화
	}

	public List<UserInfoDTO> UserInfoList() {
		// TODO Auto-generated method stub
		return userInfoDao.UserInfoList();
	}

	public int joinUserInfo(UserInfoDTO UserInfo) {
		// TODO Auto-generated method stub
		return userInfoDao.joinUserInfo(UserInfo);
	}

	public int deleteUserInfo(String userId) {
		// TODO Auto-generated method stub
		return userInfoDao.deleteUserInfo(userId);
	}

	public int updateUserInfo(UserInfoDTO UserInfo) {
		// TODO Auto-generated method stub
		return userInfoDao.updateUserInfo(UserInfo);
	}

	public UserInfoDTO findUserInfo(String userId) throws SQLException, UserNotFoundException {
		UserInfoDTO user = userInfoDao.findUserInfo(userId);
		
		if (user == null) {
			throw new UserNotFoundException(userId + "는 존재하지 않는 아이디입니다.");
		}		
		return user;
	}



	

}

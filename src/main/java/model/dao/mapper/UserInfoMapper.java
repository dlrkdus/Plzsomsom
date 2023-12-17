package model.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import model.UserInfoDTO;
@Mapper
public interface UserInfoMapper {
//	public UserInfoDTO loginUserInfo(String userId, String password);
	
	public int joinUserInfo(UserInfoDTO UsertInfo);
	
	public int deleteUserInfo(String userId);
	
	public UserInfoDTO findUserInfo(String userId);
	
	public List<UserInfoDTO> UserInfoList();
	
	public int updateUserInfo(UserInfoDTO UserInfo);
	
}

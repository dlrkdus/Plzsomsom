package model;

import java.sql.Date;

public class UserInfoDTO {
	private String userId;
	private String password;
	private String name;
	private String nickname;
	private String phone;
	private String email;
	private Date joinDate;
	
	public UserInfoDTO() {}
	
	public UserInfoDTO(String userId, String password, String name, String nickname, String phone, String email, java.util.Date joinDate) {
		this.userId = userId;
		this.password = password;
		this.name = name;
		this.nickname = nickname;
		this.phone = phone;
		this.joinDate = (java.sql.Date)joinDate;
		this.email = email;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	/* 비밀번호 검사 */
	public boolean matchPassword(String password) {
		if (password == null) {
			return false;
		}
		return this.password.equals(password);
	}
	public boolean isSameUser(String userid) {
        return this.userId.equals(userid);
    }
	@Override
	public String toString() {
		return "UserInfoDTO [userId=" + userId + ", password=" + password + ", name=" + name + ", nickname=" + nickname
				+ ", phone=" + phone + ", email=" + email + ", joinDate=" + joinDate + "]";
	}
	
	
	
}

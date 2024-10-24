package com.otz.bean;

public class User {
	private int userId;
	private String userName;
	private String userEmail;
	private String userPass;
	private String userPhone;
	private String redgDate;
	private String userImg;
	private int roleId;
	private int userStatus;
	
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getRedgDate() {
		return redgDate;
	}
	public void setRedgDate(String redgDate) {
		this.redgDate = redgDate;
	}
	public String getUserImg() {
		return userImg;
	}
	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public int getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(int userStatus) {
		this.userStatus = userStatus;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", userEmail=" + userEmail + ", userPass="
				+ userPass + ", userPhone=" + userPhone + ", redgDate=" + redgDate + ", userImg=" + userImg
				+ ", roleId=" + roleId + ", userStatus=" + userStatus + "]";
	}
	
}

package com.otz.bean;

public class Account {
	private int accId;
	private String  accName ;
	private String  accNumber ;
	private double  balance ;
	private int  acctStatus ;
	private String  userName ;
	private int  userId;
	public int getAccId() {
		return accId;
	}
	public void setAccId(int accId) {
		this.accId = accId;
	}
	public String getAccName() {
		return accName;
	}
	public void setAccName(String accName) {
		this.accName = accName;
	}
	public String getAccNumber() {
		return accNumber;
	}
	public void setAccNumber(String accNumber) {
		this.accNumber = accNumber;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	public int getAcctStatus() {
		return acctStatus;
	}
	public void setAcctStatus(int acctStatus) {
		this.acctStatus = acctStatus;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "Account [accId=" + accId + ", accName=" + accName + ", accNumber=" + accNumber + ", balance=" + balance
				+ ", acctStatus=" + acctStatus + ", userName=" + userName + ", userId=" + userId + "]";
	}	
	
	
	
}

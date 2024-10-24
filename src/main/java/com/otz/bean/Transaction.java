package com.otz.bean;

public class Transaction {
	private int tId;
	private String tDate;
	private String compName;
	private int sQty;
	private double sAmount;
	private double totalAmount;
	private int userId;
	private int accId;
	private int status;
	private String userName;
	private String accName;
	private String accNumber;
	private int sId;
	private String sName;
	public int getsId() {
		return sId;
	}
	public void setsId(int sId) {
		this.sId = sId;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
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
	public int gettId() {
		return tId;
	}
	public void settId(int tId) {
		this.tId = tId;
	}
	public String gettDate() {
		return tDate;
	}
	public void settDate(String tDate) {
		this.tDate = tDate;
	}
	public String getCompName() {
		return compName;
	}
	public void setCompName(String compName) {
		this.compName = compName;
	}
	public int getsQty() {
		return sQty;
	}
	public void setsQty(int sQty) {
		this.sQty = sQty;
	}
	public double getsAmount() {
		return sAmount;
	}
	public void setsAmount(double sAmount) {
		this.sAmount = sAmount;
	}
	public double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getAccId() {
		return accId;
	}
	public void setAccId(int accId) {
		this.accId = accId;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Transaction [tId=" + tId + ", tDate=" + tDate + ", compName=" + compName + ", sQty=" + sQty
				+ ", sAmount=" + sAmount + ", totalAmount=" + totalAmount + ", userId=" + userId + ", accId=" + accId
				+ ", status=" + status + ", userName=" + userName + ", accName=" + accName + ", accNumber=" + accNumber
				+ ", sId=" + sId + ", sName=" + sName + "]";
	}
	
	
}

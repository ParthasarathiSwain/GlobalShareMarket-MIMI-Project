package com.otz.bean;

public class Share {
	private int sId;
	private String sName;
	private int sQty;
	private double sAmount;
	private double sTotalAmt;
	private String sDate;
	private int userId;
	private String userName;
	private int status;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
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
	public double getsTotalAmt() {
		return sTotalAmt;
	}
	public void setsTotalAmt(double sTotalAmt) {
		this.sTotalAmt = sTotalAmt;
	}
	public String getsDate() {
		return sDate;
	}
	public void setsDate(String sDate) {
		this.sDate = sDate;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Share [sId=" + sId + ", sName=" + sName + ", sQty=" + sQty + ", sAmount=" + sAmount + ", sTotalAmt="
				+ sTotalAmt + ", sDate=" + sDate + ", userId=" + userId + ", userName=" + userName + ", status="
				+ status + "]";
	}
	
	
}
 
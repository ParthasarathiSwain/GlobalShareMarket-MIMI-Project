package com.otz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.otz.bean.Share;
import com.otz.bean.Transaction;
import com.otz.util.DbConnection;

public class TransactionDao {

	public int makeTransaction(Transaction t) {
		int status=0;
		try {
			Connection con=DbConnection.getConnection();
			String query="INSERT INTO Transaction(tDate,compName,sQty,sAmount,totalAmount,userId,accId,sId)VALUES(now(),?,?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, t.getCompName());
			ps.setInt(2, t.getsQty());
			ps.setDouble(3, t.getsAmount());
			ps.setDouble(4, t.getTotalAmount());
			ps.setInt(5, t.getUserId());
			ps.setInt(6, t.getAccId());
			ps.setInt(7, t.getsId());
			status=ps.executeUpdate();
			con.close();  
		}  catch (SQLException e) {e.printStackTrace();}	
		return status;
	}

	public List<Transaction> viewTransactionById(int userId) {
		ArrayList<Transaction> tranList=new ArrayList<Transaction>();//Creating Arraylist 
		try {
			Connection con = DbConnection.getConnection();
			String sql="select A.compName,A.sQty,A.sAmount,A.totalAmount,A.tDate,A.status,B.userName,C.accName,C.accNumber ,D.sName from transaction as A inner join User B on A.userId=B.userId inner join account C on A.accId=C.accId inner join share D on A.sId=D.sId where A.userId=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs=ps.executeQuery();  
			while(rs.next())
			{
				Transaction t=new Transaction();				
				t.setCompName(rs.getString(1));
				t.setsQty(rs.getInt(2));
				t.setsAmount(rs.getDouble(3));
				t.setTotalAmount(rs.getDouble(4));
				t.settDate(rs.getString(5));
				t.setStatus(rs.getInt(6));
				t.setUserName(rs.getString(7));
				t.setAccName(rs.getString(8));
				t.setAccNumber(rs.getString(9));
				t.setsName(rs.getString(10));
				tranList.add(t);
			}
			con.close();  
		}catch(Exception ex) {ex.printStackTrace();}
		return tranList ;
	}

	public List<Transaction> viewAllTransaction() {
		ArrayList<Transaction> tranList=new ArrayList<Transaction>();//Creating Arraylist 
		try {
			Connection con = DbConnection.getConnection();
			String sql="select A.compName,A.sQty,A.sAmount,A.totalAmount,A.tDate,A.status,B.userName,C.accName,C.accNumber ,D.sName from transaction as A inner join User B on A.userId=B.userId inner join account C on A.accId=C.accId inner join share D on A.sId=D.sId ";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();  
			while(rs.next())
			{
				Transaction t=new Transaction();				
				t.setCompName(rs.getString(1));
				t.setsQty(rs.getInt(2));
				t.setsAmount(rs.getDouble(3));
				t.setTotalAmount(rs.getDouble(4));
				t.settDate(rs.getString(5));
				t.setStatus(rs.getInt(6));
				t.setUserName(rs.getString(7));
				t.setAccName(rs.getString(8));
				t.setAccNumber(rs.getString(9));
				t.setsName(rs.getString(10));
				tranList.add(t);
			}
			con.close();  
		}catch(Exception ex) {ex.printStackTrace();}
		return tranList ;
	}
	public List<Transaction> viewTransactionByUserEmail(String userName) {
		ArrayList<Transaction> tranList=new ArrayList<Transaction>();//Creating Arraylist 
		try {
			Connection con = DbConnection.getConnection();
			String sql="select A.tId,A.compName,A.sQty,A.sAmount,A.totalAmount,A.tDate,A.status,B.userName,C.accName,C.accNumber ,D.sName from transaction as A inner join User B on A.userId=B.userId inner join account C on A.accId=C.accId inner join share D on A.sId=D.sId where A.compName=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, userName);
			ResultSet rs=ps.executeQuery();  
			while(rs.next())
			{
				Transaction t=new Transaction();
				t.settId(rs.getInt(1));
				t.setCompName(rs.getString(2));
				t.setsQty(rs.getInt(3));
				t.setsAmount(rs.getDouble(4));
				t.setTotalAmount(rs.getDouble(5));
				t.settDate(rs.getString(6));
				t.setStatus(rs.getInt(7));
				t.setUserName(rs.getString(8));
				t.setAccName(rs.getString(9));
				t.setAccNumber(rs.getString(10));
				t.setsName(rs.getString(11));
				tranList.add(t);
			}
			con.close();  
		}catch(Exception ex) {ex.printStackTrace();}
		return tranList ;
	}

	public List<Transaction> viewTransactionByTid(int tId) {
		ArrayList<Transaction> tranList=new ArrayList<Transaction>();//Creating Arraylist 
		try {
			Connection con = DbConnection.getConnection();
			String sql="select tId,status,sQty,sId,accId,userId from transaction where tId=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, tId);
			ResultSet rs=ps.executeQuery();  
			while(rs.next())
			{
				Transaction t=new Transaction();
				t.settId(rs.getInt(1));
				t.setStatus(rs.getInt(2));
				t.setsQty(rs.getInt(3));
				t.setsId(rs.getInt(4));
				t.setAccId(rs.getInt(5));
				t.setUserId(rs.getInt(6));
				tranList.add(t);
			}
			con.close();  
		}catch(Exception ex) {ex.printStackTrace();}
		return tranList ;
	}
	public  double getTotalAmount(int tId) {
		double bal=0;
		try {
			Connection con=DbConnection.getConnection();
			String sql="select totalAmount from transaction where tId=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, tId);
			ResultSet rs=ps.executeQuery();  
			while(rs.next())
			{
				bal=rs.getDouble(1);
			}
			con.close();
		}catch (SQLException e) {e.printStackTrace();}
		return bal;
	}
	public int updateTransactionStatus(int tId, int status) {
		int res=0;
		try {
			Connection con=DbConnection.getConnection();
			String query="update Transaction set status=? where tId=?";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, status);
			ps.setInt(2, tId);
			res=ps.executeUpdate();
			con.close();  
		}  catch (SQLException e) {e.printStackTrace();}	
		return res;
	}

}

package com.otz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.otz.bean.Account;
import com.otz.bean.Share;
import com.otz.util.DbConnection;

public class AccountDao {

	public int addAccount(Account acc) {
		int status=0;
		try {
			Connection con=DbConnection.getConnection();
			String query="INSERT INTO account(accName,accNumber,balance,userId)VALUES(?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,acc.getAccName());
			ps.setString(2,acc.getAccNumber());
			ps.setDouble(3,acc.getBalance());
			ps.setInt(4,acc.getUserId());
			status=ps.executeUpdate();
			con.close();  
		}  catch (SQLException e) {e.printStackTrace();}	
		return status;
	}

	public List<Account> viewAcountByUserId(int userId) {
		ArrayList<Account> accList=new ArrayList<Account>();//Creating Arraylist 
		try {
			Connection con = DbConnection.getConnection();
			String sql="select accId,accName,accNumber,balance,userId,acctStatus from account where userId=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs=ps.executeQuery();  
			while(rs.next())
			{
				Account acc = new Account();
				acc.setAccId(rs.getInt(1));
				acc.setAccName(rs.getString(2));
				acc.setAccNumber(rs.getString(3));
				acc.setBalance(rs.getDouble(4));
				acc.setUserId(rs.getInt(5));
				acc.setAcctStatus(rs.getInt(6));
				accList.add(acc);
			}
			con.close();  
		}catch(Exception ex) {ex.printStackTrace();}
		return accList ;
	}

	public static int deactivatedAccount(int accId) {
		int status=0;
		try{  
			Connection con=DbConnection.getConnection(); 
			String sql="update Account set acctStatus=?  where accId=?";
			PreparedStatement ps=con.prepareStatement(sql);  
			ps.setInt(1,0);  
			ps.setInt(2,accId); 
			status =ps.executeUpdate();  
		}catch(Exception e){System.out.println(e);}  				  
		return status;
	}

	public List<Account> viewAcountByAccId(int accId) {
		ArrayList<Account> accList=new ArrayList<Account>();//Creating Arraylist 
		try {
			Connection con = DbConnection.getConnection();
			String sql="select accId,accName,accNumber,balance,userId,acctStatus from account where accId=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, accId);
			ResultSet rs=ps.executeQuery();  
			while(rs.next())
			{
				Account acc = new Account();
				acc.setAccId(rs.getInt(1));
				acc.setAccName(rs.getString(2));
				acc.setAccNumber(rs.getString(3));
				acc.setBalance(rs.getDouble(4));
				acc.setUserId(rs.getInt(5));
				acc.setAcctStatus(rs.getInt(6));
				accList.add(acc);
			}
			con.close();  
		}catch(Exception ex) {ex.printStackTrace();}
		return accList ;
	}

	public int updateAccount(Account acc) {
		int status=0;
		try {
			Connection con=DbConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("update account set accName=?,accNumber=?,balance=?,acctStatus=? where accId=?");
			ps.setString(1,acc.getAccName());
			ps.setString(2,acc.getAccNumber());
			ps.setDouble(3,acc.getBalance());
			ps.setInt(4,acc.getAcctStatus());
			ps.setInt(5,acc.getAccId());
			status=ps.executeUpdate();
		}catch (SQLException e) {e.printStackTrace();}
		return status;
	}

	public double getBalance(int userId, int accId) {
		double status=0.0;
		try {
			Connection con=DbConnection.getConnection();
			String sql="select balance from account where accId=? And userId=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, accId);
			ps.setInt(2, userId);
			ResultSet rs=ps.executeQuery();  
			while(rs.next())
			{
				status=rs.getDouble(1);
				System.out.println(status);
			}
			con.close();
		}catch (SQLException e) {e.printStackTrace();}
		return status;
	}

	public void updateBalance(double finalBalance, int accId, int userId) {
		try {
			Connection con=DbConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("update account set balance=? where accId=? and userId=?");
			ps.setDouble(1,finalBalance);
			ps.setInt(2,accId);
			ps.setInt(3,userId);
			ps.executeUpdate();
		}catch (SQLException e) {e.printStackTrace();}

	}
	
}



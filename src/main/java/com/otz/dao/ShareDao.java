package com.otz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.otz.bean.Share;
import com.otz.bean.User;
import com.otz.util.DbConnection;

public class ShareDao {

	public int addShare(Share share) {
		int status=0;
		try {
			Connection con=DbConnection.getConnection();
			String query="INSERT INTO Share(sName,sQty,sAmount,sTotalAmt,sDate,userId)VALUES(?,?,?,?,now(),?)";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,share.getsName());
			ps.setInt(2,share.getsQty());
			ps.setDouble(3,share.getsAmount());
			ps.setDouble(4,share.getsTotalAmt());
			ps.setInt(5,share.getUserId());
			status=ps.executeUpdate();
			con.close();  
		}  catch (SQLException e) {e.printStackTrace();}	
		return status;
	}

	public List<Share> viewShare(int userId) {
		ArrayList<Share> shareList=new ArrayList<Share>();//Creating Arraylist 
		try {
			Connection con = DbConnection.getConnection();
			String sql="select sId,sName,sQty,sAmount,sTotalAmt,sDate,Status from Share where userId=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs=ps.executeQuery();  
			while(rs.next())
			{
				Share share = new Share();
				share.setsId(rs.getInt(1));
				share.setsName(rs.getString(2));
				share.setsQty(rs.getInt(3));
				share.setsAmount(rs.getDouble(4));
				share.setsTotalAmt(rs.getDouble(5));
				share.setsDate(rs.getString(6));
				share.setStatus(rs.getInt(7));
				shareList.add(share);
			}
			con.close();  
		}catch(Exception ex) {ex.printStackTrace();}
		return shareList ;	
	}
	
	//view All
	public List<Share> viewAllShare() {
		ArrayList<Share> shareList=new ArrayList<Share>();//Creating Arraylist 
		try {
			Connection con = DbConnection.getConnection();
			String sql="select A.sId,A.sName,A.sQty,A.sAmount,A.sTotalAmt,A.sDate,A.Status,B.userName from Share as A inner join User B on A.userId=B.userId ";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();  
			while(rs.next())
			{
				Share share = new Share();
				share.setsId(rs.getInt(1));
				share.setsName(rs.getString(2));
				share.setsQty(rs.getInt(3));
				share.setsAmount(rs.getDouble(4));
				share.setsTotalAmt(rs.getDouble(5));
				share.setsDate(rs.getString(6));
				share.setStatus(rs.getInt(7));
				share.setUserName(rs.getString(8));
				shareList.add(share);
			}
			con.close();  
		}catch(Exception ex) {ex.printStackTrace();}
		return shareList ;	
	}
	public List<Share> viewShareByShareId(int sId) {
		ArrayList<Share> shareList=new ArrayList<Share>();//Creating Arraylist 
		try {
			Connection con = DbConnection.getConnection();
			String sql="select A.sId,A.sName,A.sQty,A.sAmount,A.sTotalAmt,A.sDate,A.Status,B.userName from Share as A inner join User B on A.userId=B.userId where sid=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, sId);
			ResultSet rs=ps.executeQuery();  
			while(rs.next())
			{
				Share share = new Share();
				share.setsId(rs.getInt(1));
				share.setsName(rs.getString(2));
				share.setsQty(rs.getInt(3));
				share.setsAmount(rs.getDouble(4));
				share.setsTotalAmt(rs.getDouble(5));
				share.setsDate(rs.getString(6));
				share.setStatus(rs.getInt(7));
				share.setUserName(rs.getString(8));				
				
				shareList.add(share);
			}
			con.close();  
		}catch(Exception ex) {ex.printStackTrace();}
		return shareList ;	
	}

	public static int deactivatedShare(int sId) {
		int status=0;
		try{  
			Connection con=DbConnection.getConnection(); 
			String sql="update Share set status=?  where sId=?";
			PreparedStatement ps=con.prepareStatement(sql);  
			ps.setInt(1,0);  
			ps.setInt(2,sId); 
			status =ps.executeUpdate();  
		}catch(Exception e){System.out.println(e);}  				  
		return status;
	}

	public int updateShare(Share share) {
		int status=0;
		try {
			Connection con=DbConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("update share set sName=?,sQty=?,sAmount=?,sTotalAmt=? where sId=?");
			ps.setString(1,share.getsName());
			ps.setInt(2,share.getsQty());
			ps.setDouble(3,share.getsAmount());
			ps.setDouble(4,share.getsTotalAmt());
			ps.setInt(5,share.getsId());
			status=ps.executeUpdate();
		}catch (SQLException e) {e.printStackTrace();}
		return status;
	}

	public int updateShareStatus(int sId, int status) {
		int x=0;
		try {
			Connection con=DbConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("update share set status=? where sId=?");
			ps.setInt(1,status);
			ps.setInt(2,sId);
			
			x=ps.executeUpdate();
		}catch (SQLException e) {e.printStackTrace();}
		return x;
	}
	public static int getShareQtyById(int sId) {
		int avalSQty=0;
		try {
			Connection con = DbConnection.getConnection();
			String sql="select sQty from Share where sId=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, sId);
			ResultSet rs=ps.executeQuery();  
			while(rs.next())
			{
				
				avalSQty=rs.getInt(1);
			}
			con.close();  
		}catch(Exception ex) {ex.printStackTrace();}
		return avalSQty ;	
	}
	public void updateSQty(int sQty,int sId) {
		int x=getShareQtyById(sId);
		int finalSQty=x-sQty;
		try {
			Connection con=DbConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("update share set sQty=? where sId=?");
			ps.setInt(1,finalSQty);
			ps.setInt(2,sId);
			
			ps.executeUpdate();
		}catch (SQLException e) {e.printStackTrace();}
		
	}

}

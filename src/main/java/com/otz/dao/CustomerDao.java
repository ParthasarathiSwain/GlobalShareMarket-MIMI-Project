package com.otz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.otz.bean.User;
import com.otz.util.DbConnection;

public class CustomerDao {
	
	public int updatePassword(String confirm ,int id) {
		int status=0;
		try{  
			Connection con=DbConnection.getConnection(); 
			String sql="update user set userPass=?  where userId=?";
			PreparedStatement ps=con.prepareStatement(sql);  
			ps.setString(1,confirm); 
			ps.setInt(2,id);
			status=ps.executeUpdate(); 

		}catch(Exception e){System.out.println(e);}  	
		return status;
	}
	public String fatchPassWord(int id) {
		String status="";
		try{  
			Connection con=DbConnection.getConnection(); 
			String sql="Select userPass from  user where userid=?";
			PreparedStatement ps=con.prepareStatement(sql);  
			ps.setInt(1,id);  
			ResultSet rs=ps.executeQuery(); 
			while(rs.next())
			{
				status=rs.getString(1);

			}
		}catch(Exception e){System.out.println(e);}  

		return status;  
	}
	// save  Customer
	public int addCustomer(User user) {
		int status=0;
		try {
			Connection con=DbConnection.getConnection();
			String query="INSERT INTO user(userName,userEmail,userPass,userPhone,redgDate,userImg,roleId)VALUES(?,?,?,?,now(),?,?)";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,user.getUserName());
			ps.setString(2,user.getUserEmail());
			ps.setString(3,user.getUserPass());
			ps.setString(4,user.getUserPhone());
			ps.setString(5,user.getUserImg());
			ps.setString(6,"2");
			status=ps.executeUpdate();
			con.close();  
		}  catch (SQLException e) {e.printStackTrace();}	
		return status;
	} 
	// get role  & id & name & image
//	public User getIdAndRoleName(String email, String password) {
//		User user =new User();
//		try {
//			Connection con = DbConnection.getConnection();
//			String sql="Select id ,name, role ,image from user where email=? and password=?";
//			PreparedStatement ps=con.prepareStatement(sql);  
//			ps.setString(1, email);
//			ps.setString(2, password);
//			ResultSet rs=ps.executeQuery();  
//			while(rs.next())
//			{
//				user.setId(rs.getInt(1));
//				user.setName(rs.getString(2));
//				user.setRole(rs.getInt(3));
//				user.setImage(rs.getString(4));
//
//			}
//			con.close();  
//		}catch(Exception ex) {ex.printStackTrace();}
//		return user;
//
//	}
	//view Customers
	public List<User> viewCustomers(){
		ArrayList<User> customerList=new ArrayList<User>();//Creating Arraylist 
		try {
			Connection con = DbConnection.getConnection();
			String sql="select userId,userName,userEmail,userPass,userImg,userPhone,redgDate,userStatus from user where roleId=2";
			PreparedStatement ps=con.prepareStatement(sql);  
			ResultSet rs=ps.executeQuery();  
			while(rs.next())
			{
				User user = new User();
				user.setUserId(rs.getInt(1));
				user.setUserName(rs.getString(2));
				user.setUserEmail(rs.getString(3));
				user.setUserPass(rs.getString(4));
				user.setUserImg(rs.getString(5));
				user.setUserPhone(rs.getString(6));
				user.setRedgDate(rs.getString(7));
				user.setUserStatus(rs.getInt(8));
				customerList.add(user);
			}
			con.close();  
		}catch(Exception ex) {ex.printStackTrace();}
		return customerList ;	
	}
//	//delete customer
//
//	public static int deleteCustomer(int id){  
//		int status=0;
//		try{  
//			Connection con=DbConnection.getConnection(); 
//			String sql="delete from user where id=?";
//			PreparedStatement ps=con.prepareStatement(sql);  
//			ps.setInt(1,id);  
//			status =ps.executeUpdate();  
//		}catch(Exception e){System.out.println(e);}  
//
//		return status;  
//	}
	// sort Customer by Id
	public  List<User> fatchCustById(int userId){
		ArrayList<User> obj=new ArrayList<User>();
		try {
			Connection con = DbConnection.getConnection();
			String sql="Select  userId,userName,userEmail,userPass,userImg,UserPhone,redgDate,userStatus from user where userId=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs=ps.executeQuery();  
			while(rs.next())
			{
				User user = new User();
				user.setUserId(rs.getInt(1));
				user.setUserName(rs.getString(2));
				user.setUserEmail(rs.getString(3));
				user.setUserPass(rs.getString(4));
				user.setUserImg(rs.getString(5));
				user.setUserPhone(rs.getString(6));
				user.setRedgDate(rs.getString(7));
				user.setUserStatus(rs.getInt(8));
				obj.add(user);
			}
			con.close();  
		}catch(Exception ex) {ex.printStackTrace();}

		return obj ;
	}

	
	//update Customer without image
	public int updateCustomer(User user) {
		int status=0;
		try {
			Connection con=DbConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("update user set userName=?,userPhone=?,userEmail=?,userPass=?,userStatus=? where userId=?");
			ps.setString(1,user.getUserName());
			ps.setString(2,user.getUserPhone());
			ps.setString(3,user.getUserEmail());
			ps.setString(4,user.getUserPass());
			ps.setInt(5,user.getUserStatus());
			ps.setInt(6,user.getUserId());
			status=ps.executeUpdate();
		}catch (SQLException e) {e.printStackTrace();}
		return status;
	}	

	public static int deactivatedAccount(int userId) {
		int status=0;
		try{  
			Connection con=DbConnection.getConnection(); 
			String sql="update user set userStatus=?  where userId=?";
			PreparedStatement ps=con.prepareStatement(sql);  
			ps.setInt(1,0);  
			ps.setInt(2,userId); 
			status =ps.executeUpdate();  
		}catch(Exception e){System.out.println(e);}  				  
		return status; 
	
	}
	public int updateCustomer2(User user) {
		int status=0;
		try {
			Connection con=DbConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("update user set userName=?,userPhone=?,userEmail=? where userId=?");
			ps.setString(1,user.getUserName());
			ps.setString(2,user.getUserPhone());
			ps.setString(3,user.getUserEmail());
			ps.setInt(4,user.getUserId());
			status=ps.executeUpdate();
		}catch (SQLException e) {e.printStackTrace();}
		return status;
	}
}

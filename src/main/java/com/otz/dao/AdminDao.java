package com.otz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.otz.bean.User;
import com.otz.util.DbConnection;

public class AdminDao {
	// save  Admin
			public int addAdmin(User user) {
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
					ps.setString(6,"1");
					status=ps.executeUpdate();
					con.close();  
				}  catch (SQLException e) {e.printStackTrace();}	
				return status;
			}
			
			public List<User> viewAdmin() {
				ArrayList<User> adminList=new ArrayList<User>();//Creating Arraylist 
				try {
					Connection con = DbConnection.getConnection();
					String sql="select userId,userName,userEmail,userPass,userImg,userPhone,redgDate,userStatus from user where roleId=1";
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
						adminList.add(user);
					}
					con.close();  
				}catch(Exception ex) {ex.printStackTrace();}
				return adminList ;	
			} 
}

package com.otz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.otz.bean.User;
import com.otz.util.DbConnection;

public class LoginDao {

	public int checkUser(String email,String pass ) {
		int status=0;
		try {
			Connection con=DbConnection.getConnection();
			String sql="SELECT count(*) FROM USER WHERE userEmail=? AND userPass=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,email);
			ps.setString(2,pass);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) 
			{
				int r=rs.getInt(1);
				if(r>0) {
					status=r;
				}else {
					status = r;
				}
			}
		} catch (SQLException e) {e.printStackTrace();}
		return status;
	}

	public User getUser(String email, String password) {
		User user=new User();
		try {
			Connection con=DbConnection.getConnection();
			String sql="SELECT userId,userName,userEmail,userImg,roleId ,userStatus FROM USER WHERE userEmail=? AND userPass=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,email);
			ps.setString(2,password);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) 
			{
				user.setUserId(rs.getInt(1));
				user.setUserName(rs.getString(2));
				user.setUserEmail(rs.getString(3));
				user.setUserImg(rs.getString(4));
				user.setRoleId(rs.getInt(5));
				user.setUserStatus(rs.getInt(6));
			}
		} catch (SQLException e) {e.printStackTrace();}

		return user;
	}
}

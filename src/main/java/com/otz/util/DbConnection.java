package com.otz.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
	public static Connection getConnection() {

		Connection con=null;
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");  
			con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/gsm","",""); 

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return con;

	}

	public static String Path() {
		String Path="C:/Users/HP/eclipse-workspace/GlobalShareMarket/src/main/webapp/images";
		return Path;
	}
	
}

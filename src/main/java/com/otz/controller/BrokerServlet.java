package com.otz.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.otz.bean.User;
import com.otz.dao.BrokerDao;
import com.otz.dao.CustomerDao;
import com.otz.util.DbConnection;

@WebServlet("/brokerController")
@MultipartConfig(maxFileSize = 1024 * 1024 * 2)
public class BrokerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String event=request.getParameter("event");

		if(event.equals("brokerRedg")) {
			String userName=request.getParameter("userName");
			String userEmail=request.getParameter("userEmail");
			String userPass=request.getParameter("userPass");
			String userPhone=request.getParameter("userPhone");
			
			Part p1=request.getPart("userImg");
			String Path=DbConnection.Path();			
			String appPath =Path+"/brokerImg";
			String imagePath = appPath + "";
			File fileDir = new File(imagePath);
			if (!fileDir.exists()) 
				fileDir.mkdirs();
			//Get Image Name
			String imageName1 = p1.getSubmittedFileName();
			String fileExt1 = imageName1.substring(imageName1.length()-3);
			String imgname1=new Date().getTime() +"1"+"."+fileExt1;	        
			String finalImgPath1="brokerImg" + "/"+ imgname1;
			if(validateImage1(imageName1)){
				try{
					p1.write(imagePath + "/" + imgname1);
				}catch (Exception ex) { }
			}else{ out.print("<script> alert('Invalid Image Format')</script>");  }
			User user=new User();
			user.setUserEmail(userEmail);
			user.setUserImg(imgname1);
			user.setUserName(userName);
			user.setUserPass(userPass);
			user.setUserPhone(userPhone);
			BrokerDao cd=new BrokerDao();
			int x=cd.addBroker(user);
			if(x>0) {
				out.print("done");
			}else {
				out.println("Failed");
			}			        					
		}else if(event.equals("viewBroker")) {
			
			try {
				BrokerDao bd=new BrokerDao();
				List<User> broker = bd.viewBroker();
				GsonBuilder gsonBuilder = new GsonBuilder();
				Gson  gson = gsonBuilder.create();
				String JSONObject = gson.toJson(broker);
				System.out.print(JSONObject);
				out.print(JSONObject);				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	private boolean validateImage1(String imageName1){
		String fileExt1 = imageName1.substring(imageName1.length()-3);
		if("jpg".equals(fileExt1) || "png".equals(fileExt1) || "gif".equals(fileExt1))
		{ 
			return true;
		}
		return false;
	}
	

}

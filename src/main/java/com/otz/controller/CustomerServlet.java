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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.otz.bean.User;
import com.otz.dao.CustomerDao;
import com.otz.util.DbConnection;


@WebServlet("/custController")
@MultipartConfig(maxFileSize = 1024 * 1024 * 2)
public class CustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html"); 
		PrintWriter out=response.getWriter();
		String event=request.getParameter("event");

		if(event.equals("custRedg")) {
			String userName=request.getParameter("userName");
			String userEmail=request.getParameter("userEmail");
			String userPass=request.getParameter("userPass");
			String userPhone=request.getParameter("userPhone");
			
			Part p1=request.getPart("userImg");
			String Path=DbConnection.Path();			
			String appPath =Path+"/custImg";
			String imagePath = appPath + "";
			File fileDir = new File(imagePath);
			if (!fileDir.exists()) 
				fileDir.mkdirs();
			//Get Image Name
			String imageName1 = p1.getSubmittedFileName();
			String fileExt1 = imageName1.substring(imageName1.length()-3);
			String imgname1=new Date().getTime() +"1"+"."+fileExt1;	        
			String finalImgPath1="adminImg" + "/"+ imgname1;
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
			CustomerDao cd=new CustomerDao();
			int x=cd.addCustomer(user);
			if(x>0) {
				out.print("done");
			}else {
				out.println("Failed");
			}			        					
		}else if(event.equals("viewCustomers")) {
			
			try {
				CustomerDao cd=new CustomerDao();
				List<User> customer = cd.viewCustomers();
				GsonBuilder gsonBuilder = new GsonBuilder();
				Gson  gson = gsonBuilder.create();
				String JSONObject = gson.toJson(customer);
				System.out.print(JSONObject);
				out.print(JSONObject);				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else if(event.equals("cust_delete")){
			int userId=Integer.parseInt(request.getParameter("userId"));
			int status=CustomerDao.deactivatedAccount(userId);
			if(status>0) {
				out.print("done");
			}else {
				out.print("failed");
			}
		}else if(event.equals("fatchCustById")) {
			try {
				int userId=Integer.parseInt(request.getParameter("userId"));
				CustomerDao ad=new CustomerDao();
				List<User> user= ad.fatchCustById(userId);
				GsonBuilder gsonBuilder = new GsonBuilder();
				Gson  gson = gsonBuilder.create();
				String JSONObject = gson.toJson(user);				
				out.print(JSONObject);				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(event.equals("fatchCustByIdForCustDashBoard")) {
			try {
				int userId=(int) request.getSession(false).getAttribute("id");
				CustomerDao ad=new CustomerDao();
				List<User> user= ad.fatchCustById(userId);
				GsonBuilder gsonBuilder = new GsonBuilder();
				Gson  gson = gsonBuilder.create();
				String JSONObject = gson.toJson(user);				
				out.print(JSONObject);				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else if(event.equals("updateCust")) {
			String userName=request.getParameter("userName");
			String userEmail=request.getParameter("userEmail");
			String userPass=request.getParameter("userPass");
			String userPhone=request.getParameter("userPhone");
			int userId=Integer.parseInt(request.getParameter("userId"));
			int userStatus=Integer.parseInt(request.getParameter("userStatus"));
			User user=new User();
			user.setUserEmail(userEmail);
			user.setUserStatus(userStatus);
			user.setUserName(userName);
			user.setUserPass(userPass);
			user.setUserPhone(userPhone);
			user.setUserId(userId);
			CustomerDao cd=new CustomerDao();
			int status=cd.updateCustomer(user);
			if(status>0) {
				out.print("done");
			}else {
				out.print("failed");
			}
		}else if(event.equals("updateCust2")) {
			String userName=request.getParameter("userName");
			String userEmail=request.getParameter("userEmail");
			String userPhone=request.getParameter("userPhone");
			int userId=Integer.parseInt(request.getParameter("userId"));
			
			User user=new User();
			user.setUserEmail(userEmail);
			user.setUserName(userName);
			user.setUserPhone(userPhone);
			user.setUserId(userId);
			
			CustomerDao cd=new CustomerDao();
			int status=cd.updateCustomer2(user);
			if(status>0) {
				out.print("done");
			}else {
				out.print("failed");
			}
		}else if(event.equals("changePassword")){
			String oldPass=request.getParameter("oldPass");
			String newPass=request.getParameter("newPass");
			String confirm=request.getParameter("confirm");


			HttpSession session = request.getSession(true);
			String id= session.getAttribute("id").toString();
			int id2=Integer.parseInt(id);


			CustomerDao cd=new CustomerDao();
			String password=cd.fatchPassWord(id2);
			String status="";
			GsonBuilder gsonBuilder = new GsonBuilder();
			Gson  gson = gsonBuilder.create();
			if(oldPass!=newPass) {
				if(newPass.trim().equals(confirm.trim())) {
					if(oldPass.trim().equals(password.trim())) {
						status=cd.updatePassword(confirm,id2)==1?"done":"";
						String JSONObject = gson.toJson(status);
						out.print(JSONObject);
					}else {
						status="error3";
						String JSONObject = gson.toJson(status);
						out.print(JSONObject);
					}
				}else {
					status="error2";
					String JSONObject = gson.toJson(status);
					out.print(JSONObject);
				}
			}else {
				status="error1";
				String JSONObject = gson.toJson(status);
				out.print(JSONObject);
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

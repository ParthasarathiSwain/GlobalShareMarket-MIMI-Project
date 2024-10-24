package com.otz.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.otz.bean.User;
import com.otz.dao.LoginDao;
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String event=request.getParameter("event");
		if(event.equals("Login")) {
			int status=0;
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			LoginDao ld= new LoginDao();
			int res=ld.checkUser(email, password);
			if (res>0) {
				User user=ld.getUser(email,password);
				HttpSession session = request.getSession(true);
				if(user.getRoleId()==1 && user.getUserStatus()>0) { 
					session.setAttribute("email", user.getUserEmail());
					session.setAttribute("name", user.getUserName());
					session.setAttribute("id", user.getUserId());
					session.setAttribute("image", user.getUserImg());
					status=1;
				}
				else if(user.getRoleId()==2 && user.getUserStatus()>0) { 
					session.setAttribute("email", user.getUserEmail());
					session.setAttribute("name", user.getUserName());
					session.setAttribute("id", user.getUserId());
					session.setAttribute("image", user.getUserImg());
					status=2;
				}
				else if(user.getRoleId()==3 && user.getUserStatus()>0) { 
					session.setAttribute("email", user.getUserEmail());
					session.setAttribute("name", user.getUserName());
					session.setAttribute("id", user.getUserId());
					session.setAttribute("image", user.getUserImg());
					status=3;
				}
				else if(user.getRoleId()==4 && user.getUserStatus()>0) { 
					session.setAttribute("email", user.getUserEmail());
					session.setAttribute("name", user.getUserName());
					session.setAttribute("id", user.getUserId());
					session.setAttribute("image", user.getUserImg());
					status=4;
				}
				else {
					status=5;
				}
				
			} else {
				status=6;
			}
			
			out.print(status);
		}
	}

}

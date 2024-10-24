package com.otz.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.otz.bean.Account;
import com.otz.bean.Share;
import com.otz.dao.AccountDao;
import com.otz.dao.ShareDao;
@WebServlet("/account")
public class AccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html"); 
		PrintWriter out=response.getWriter();
		String event=request.getParameter("event");

		if(event.equals("addAccount")) {
			String accName=request.getParameter("accName");
			String accNumber=request.getParameter("accNumber");
			double balance=Double.parseDouble(request.getParameter("balance"));
			int userId=(int) request.getSession(false).getAttribute("id");
			Account acc=new Account();
			acc.setAccName(accName);
			acc.setAccNumber(accNumber);
			acc.setBalance(balance);
			acc.setUserId(userId);
			AccountDao ad=new AccountDao();
			int x=ad.addAccount(acc);
			if(x>0) {
				out.print("done");
			}else {
				out.println("Failed");
			}		
		}
		else if(event.equals("viewAccount")) {
			try {
				int userId=(int) request.getSession(false).getAttribute("id");
				AccountDao cd=new AccountDao();
				List<Account> acc = cd.viewAcountByUserId(userId);
				GsonBuilder gsonBuilder = new GsonBuilder();
				Gson  gson = gsonBuilder.create();
				String JSONObject = gson.toJson(acc);
				System.out.print(JSONObject);
				out.print(JSONObject);				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else if(event.equals("account_delete")){
			int accId=Integer.parseInt(request.getParameter("accId"));
			int status=AccountDao.deactivatedAccount(accId);
			if(status>0) {
				out.print("done");
			}else {
				out.print("failed");
			}
		}
		else if(event.equals("fatchAccById")) {
			System.out.println("hyyy");
			try {
				int accId=Integer.parseInt(request.getParameter("accId"));
				AccountDao cd=new AccountDao();
				List<Account> acc = cd.viewAcountByAccId(accId);
				GsonBuilder gsonBuilder = new GsonBuilder();
				Gson  gson = gsonBuilder.create();
				String JSONObject = gson.toJson(acc);
				System.out.print(JSONObject);
				out.print(JSONObject);				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else if(event.equals("updateAccount")) {

			String accName=request.getParameter("accName");
			String accNumber=request.getParameter("accNumber");
			double balance=Double.parseDouble(request.getParameter("balance"));
			int accId=Integer.parseInt(request.getParameter("accId"));
			int accStatus=Integer.parseInt(request.getParameter("accStatus"));
			Account acc=new Account();
			acc.setAccName(accName);
			acc.setAccNumber(accNumber);
			acc.setBalance(balance);
			acc.setAccId(accId);
			acc.setAcctStatus(accStatus);
			AccountDao ad=new AccountDao();
			int x=ad.updateAccount(acc);
			if(x>0) {
				out.print("done");
			}else {
				out.println("Failed");
			}			
		}
	}

}

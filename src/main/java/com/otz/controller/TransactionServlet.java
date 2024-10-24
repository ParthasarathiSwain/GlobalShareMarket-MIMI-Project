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
import com.otz.bean.Transaction;
import com.otz.dao.AccountDao;
import com.otz.dao.ShareDao;
import com.otz.dao.TransactionDao;

@WebServlet("/transaction")
public class TransactionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html"); 
		PrintWriter out=response.getWriter();
		String event=request.getParameter("event");
		
		if(event.equals("makeTransaction")) {
			String compName=request.getParameter("compName");
			int sId=Integer.parseInt(request.getParameter("sId"));
			int sQty=Integer.parseInt(request.getParameter("sQty"));
			double sAmount=Double.parseDouble(request.getParameter("sAmount"));
			double totalAmount=sQty*sAmount;
			int accId=Integer.parseInt(request.getParameter("accId"));
			int userId=(int) request.getSession(false).getAttribute("id");
			Transaction t=new Transaction();
			t.setAccId(accId);
			t.setsId(sId);
			t.setCompName(compName);
			t.setsQty(sQty);
			t.setsAmount(sAmount);
			t.setTotalAmount(totalAmount);
			t.setUserId(userId);
			TransactionDao td=new TransactionDao();
			int x=td.makeTransaction(t);
			if(x>0) {
				out.print("done");
			}else {
				out.println("Failed");
			}	
			
		}else if(event.equals("viewAllTransactionByUserId")) {
			try {
				int userId=(int) request.getSession(false).getAttribute("id");
				TransactionDao td=new TransactionDao();
				List<Transaction> t = td.viewTransactionById(userId);
				GsonBuilder gsonBuilder = new GsonBuilder();
				Gson  gson = gsonBuilder.create();
				String JSONObject = gson.toJson(t);
				System.out.print(JSONObject);
				out.print(JSONObject);				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(event.equals("viewAllTransaction")) {
			try {
				TransactionDao td=new TransactionDao();
				List<Transaction> t = td.viewAllTransaction();
				GsonBuilder gsonBuilder = new GsonBuilder();
				Gson  gson = gsonBuilder.create();
				String JSONObject = gson.toJson(t);
				System.out.print(JSONObject);
				out.print(JSONObject);				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else if(event.equals("viewAllTransactionByUserName")) {
			try {
				String userName= (String) request.getSession(false).getAttribute("name");
				TransactionDao td=new TransactionDao();
				List<Transaction> t = td.viewTransactionByUserEmail(userName);
				GsonBuilder gsonBuilder = new GsonBuilder();
				Gson  gson = gsonBuilder.create();
				String JSONObject = gson.toJson(t);
				System.out.print(JSONObject);
				out.print(JSONObject);				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else if(event.equals("fatchTransactionId")) {
			try {
				int tId=Integer.parseInt(request.getParameter("tId"));
				TransactionDao td=new TransactionDao();
				List<Transaction> t = td.viewTransactionByTid(tId);
				GsonBuilder gsonBuilder = new GsonBuilder();
				Gson  gson = gsonBuilder.create();
				String JSONObject = gson.toJson(t);
				System.out.print(JSONObject);
				out.print(JSONObject);				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(event.equals("updateTransation")){
			int tId=Integer.parseInt(request.getParameter("tId"));
			int status=Integer.parseInt(request.getParameter("Status"));
			int sQty=Integer.parseInt(request.getParameter("sQty"));
			int sId=Integer.parseInt(request.getParameter("sId"));
			int accId=Integer.parseInt(request.getParameter("accId"));
			int userId=Integer.parseInt(request.getParameter("userId"));
			System.out.println(accId+"  "+userId);
			TransactionDao td=new TransactionDao();
			int x=td.updateTransactionStatus(tId,status);
			if(x>0) {
				ShareDao sd=new ShareDao();
				sd.updateSQty(sQty,sId);
				AccountDao ad=new AccountDao();
				double oldBal=ad.getBalance(userId,accId);
				System.out.println(oldBal);
				
					double newBal=td.getTotalAmount(tId);
					double finalBal=oldBal-newBal;
					System.out.println(oldBal  +"      "+newBal+"     "+finalBal);
					ad.updateBalance(finalBal, accId, userId);
					out.print("done");
			
			}else {
				out.println("Failed");
			}	
		}
	}

}

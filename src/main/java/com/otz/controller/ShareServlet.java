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
import com.otz.bean.Share;
import com.otz.dao.AccountDao;
import com.otz.dao.ShareDao;

@WebServlet("/share")
public class ShareServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html"); 
		PrintWriter out=response.getWriter();
		String event=request.getParameter("event");
		
		if(event.equals("addShare")) {
			String sName=request.getParameter("sName");
			int sQty=Integer.parseInt(request.getParameter("sQty"));
			double sAmount=Double.parseDouble(request.getParameter("sAmount"));
			double sTotalAmt=sQty*sAmount;
			int userId=(int) request.getSession(false).getAttribute("id");
			int accId=Integer.parseInt(request.getParameter("accId"));
			Share share=new Share();
			share.setsAmount(sAmount);
			share.setUserId(userId);
			share.setsName(sName);
			share.setsTotalAmt(sTotalAmt);
			share.setsQty(sQty);
			AccountDao ad=new AccountDao();
			double balance=ad.getBalance(userId,accId);
			if (sTotalAmt<= balance) {
				ShareDao sd=new ShareDao();			
				int x=sd.addShare(share);
				if(x>0) {
					double finalBalance=balance-sTotalAmt;
					ad.updateBalance(finalBalance,accId,userId);
					out.print("done");
				}else {
					out.println("Failed");
				}		
			} else {
				out.println("insuficient");
			}	
		}else if(event.equals("viewShare")) {
			try {
				int userId=(int) request.getSession(false).getAttribute("id");
				ShareDao cd=new ShareDao();
				List<Share> share = cd.viewShare(userId);
				GsonBuilder gsonBuilder = new GsonBuilder();
				Gson  gson = gsonBuilder.create();
				String JSONObject = gson.toJson(share);
				System.out.print(JSONObject);
				out.print(JSONObject);				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else if(event.equals("fatchShareById")) {
			try {
				int sId=Integer.parseInt(request.getParameter("sId"));
				ShareDao cd=new ShareDao();
				List<Share> share = cd.viewShareByShareId(sId);
				GsonBuilder gsonBuilder = new GsonBuilder();
				Gson  gson = gsonBuilder.create();
				String JSONObject = gson.toJson(share);
				System.out.print(JSONObject);
				out.print(JSONObject);				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else if(event.equals("viewAllShare")) {
			try {
				ShareDao cd=new ShareDao();
				List<Share> share = cd.viewAllShare();
				GsonBuilder gsonBuilder = new GsonBuilder();
				Gson  gson = gsonBuilder.create();
				String JSONObject = gson.toJson(share);
				System.out.print(JSONObject);
				out.print(JSONObject);				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else if(event.equals("share_delete")){
			int sId=Integer.parseInt(request.getParameter("sId"));
			int status=ShareDao.deactivatedShare(sId);
			if(status>0) {
				out.print("done");
			}else {
				out.print("failed");
			}
		}
		else if(event.equals("updateShare")) {
			
			String sName=request.getParameter("sName");
			int sQty=Integer.parseInt(request.getParameter("sQty"));
			double sAmount=Double.parseDouble(request.getParameter("sAmount"));
			double sTotalAmt=sQty*sAmount;
			int sId=Integer.parseInt(request.getParameter("sId"));
			
			Share share=new Share();
			share.setsAmount(sAmount);
			share.setsId(sId);
			share.setsName(sName);
			share.setsTotalAmt(sTotalAmt);
			share.setsQty(sQty);
			
			ShareDao sd=new ShareDao();
			int x=sd.updateShare(share);
			if(x>0) {
				out.print("done");
			}else {
				out.println("Failed");
			}			
		}
		else if(event.equals("updateStatus")) {
			
			int sId=Integer.parseInt(request.getParameter("sId"));
			int status=Integer.parseInt(request.getParameter("Status"));
			ShareDao sd=new ShareDao();
			int x=sd.updateShareStatus(sId,status);
			if(x>0) {
				out.print("done");
			}else {
				out.println("Failed");
			}			
		}
	}

}

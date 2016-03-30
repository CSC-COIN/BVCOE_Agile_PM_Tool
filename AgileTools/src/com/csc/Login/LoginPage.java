package com.csc.Login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;

import javafx.stage.Stage;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class LoginPage
 */
@WebServlet("/LoginPage")
public class LoginPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
     ServletContext myStage; 
     ArrayList<String> al= new ArrayList<String>();
     ArrayList<String> all= new ArrayList<String>();
     LoginConnect lc= new LoginConnect();
    public LoginPage() {
    	super();
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session=request.getSession(false);
		String n,p;
		String type=request.getParameter("action");
		PrintWriter pw=response.getWriter();
		if("Login".equals(type)){
			n=request.getParameter("username");
			System.out.println(n);
			p=request.getParameter("password");
			System.out.println(p);
			boolean lb=lc.validate(n, p);
			if(lb){
				all=lc.determine(n);
				String uclass=all.get(0);
				System.out.println(uclass);
				String name=all.get(1);
				System.out.println(name);
				String project=all.get(2);
				System.out.println(project);
				if("ProductOwner".equals(uclass)){
				 RequestDispatcher requestDispatcher = request
		                    .getRequestDispatcher("OwnerDashBoard.jsp");
		            requestDispatcher.forward(request, response); 
				}
				else if("User".equals(uclass)){
					RequestDispatcher requestDispatcher = request
		                    .getRequestDispatcher("Dashboard.jsp");
		            requestDispatcher.forward(request, response);
				}
				session.setAttribute("userid", name);
				session.setAttribute("classid" , uclass);
				session.setAttribute("projectid", project);
			}
			else{
				pw.print("<p style=\"color:red\">Sorry username or password error</p>");
				RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
				rd.include(request, response);
			}
		}
		else if("SignUp".equals(type)){
			
			String fname=request.getParameter("fname");           al.add(fname);
			String lname=request.getParameter("lname");           al.add(lname);
			String uname=request.getParameter("username");        al.add(uname);
			String pswd=request.getParameter("password");         al.add(pswd);
			String mid=request.getParameter("mailid");            al.add(mid);
			String compname=request.getParameter("compname");     al.add(compname);
			String uclass=request.getParameter("userclass");      al.add(uclass);
			String loc=request.getParameter("location");	      al.add(loc);
			String mno=request.getParameter("mnumber");	          al.add(mno);
			String projn=request.getParameter("projectname");	  al.add(projn);
			int reg=lc.register(al);
			if(reg>0){
				RequestDispatcher requestDispatcher = request
	                    .getRequestDispatcher("RegisterSuccess.jsp");
	            requestDispatcher.forward(request, response);		
			}
			else{
				pw.print("<p style=\"color:red\">Not Registered</p>");
			}
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
      doGet(request,response);
	}

}

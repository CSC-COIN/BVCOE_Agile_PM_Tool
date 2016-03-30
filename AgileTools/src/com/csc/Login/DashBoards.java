package com.csc.Login;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.fabric.xmlrpc.base.Array;

/**
 * Servlet implementation class DashBoards
 */
@WebServlet("/DashBoards")
public class DashBoards extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DashBoards() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    HttpSession session=request.getSession(false);
		response.setContentType("text/html");
		LoginConnect lac=new LoginConnect();
		ArrayList<String> sl=new ArrayList<String>();
		PrintWriter pw=response.getWriter();
		int i=0;
		String butt=request.getParameter("action");
		String username=(String) session.getAttribute("userid");
		if("CreateTable".equals(butt)){
		  i=lac.addTable(username);
		  if(i==0){
			  RequestDispatcher requestDispatcher = request
	                    .getRequestDispatcher("DashTop.jsp");
	            requestDispatcher.forward(request, response);		
		  }
	    }
		else if("SubmitDetails".equals(butt)){
			String sno=request.getParameter("sprintno");          sl.add(sno);
			String sname=request.getParameter("sprintname");      sl.add(sname);
			String sstate=request.getParameter("sprintstate");    sl.add(sstate);
			String pro=request.getParameter("progress");		  sl.add(pro);
			String date=request.getParameter("dates");			  sl.add(date);  sl.add(username);
			int spr=lac.addSprintDetails(sl);
			if(spr>0){
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

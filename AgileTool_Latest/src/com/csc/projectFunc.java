package com.csc;

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
import javax.websocket.Session;

/**
 * Servlet implementation class projectFunc
 */
@WebServlet("/projectFunc")
public class projectFunc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       LoginConnect lc1=new LoginConnect();
       ArrayList<String> alt,att,atl= new ArrayList<String>();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public projectFunc() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		HttpSession session=request.getSession(true);
		String proc=request.getParameter("action");
		PrintWriter pw1=response.getWriter();
	
		if("CreateProject".equals(proc)){
			alt.clear();
			String projname=request.getParameter("projectname");       alt.add(projname);
			String prodesc= request.getParameter("projdesc");		   alt.add(prodesc);
			String cstate=request.getParameter("currstate");		   alt.add(cstate);
			String compname= request.getParameter("compname");		   alt.add(compname);
			String dur=request.getParameter("duration");			   alt.add(dur);
			int add=lc1.addProject(alt);
			if(add>0){
			RequestDispatcher requestDispatcher = request
                    .getRequestDispatcher("OwnerDashRight.jsp");
            requestDispatcher.forward(request, response); 
			}
			else{
				pw1.print("<p style=\"color:red\">Error</p>");
				RequestDispatcher rd=request.getRequestDispatcher("CreateNewProject.jsp");
				rd.include(request, response);
			}
		}
		else if("AssignTasks".equals(proc)){
			att.clear();
			String tname= request.getParameter("tname");            att.add(tname);
			String desc= request.getParameter("desc");			    att.add(desc);
			String allotto= request.getParameter("allotto");	    att.add(allotto);
			String durd= request.getParameter("durd");			    att.add(durd);
			String pname=(String) session.getAttribute("pname");	att.add(pname);
			String powner=(String) session.getAttribute("userid");	att.add(powner);
			int add=lc1.addTasks(att);
			if(add>0){
				RequestDispatcher requestDispatcher = request
	                    .getRequestDispatcher("ProjectWork.jsp");
	            requestDispatcher.forward(request, response); 
			}
			else{
				pw1.print("<p style=\"color:red\">Error</p>");
				RequestDispatcher rd=request.getRequestDispatcher("AssignTasks.jsp");
				rd.include(request, response);
			}
		}
		else if("CreateSprints".equals(proc)){
			atl.clear();
			String sname=request.getParameter("sname");      atl.add(sname);
			String desc=request.getParameter("desc");		 atl.add(desc);
			String sstate=request.getParameter("sstate");	 atl.add(sstate);
			String prog=request.getParameter("prog");		 atl.add(prog);
			String durr=request.getParameter("durr");		 atl.add(durr);
			String name=(String) session.getAttribute("userid");
			int sadd=lc1.addSprintDetails(atl,name);
			if(sadd>0){
				RequestDispatcher requestDispatcher = request
	                    .getRequestDispatcher("DeveloperDashRight.jsp");
	            requestDispatcher.forward(request, response); 
			}
			else{
				pw1.print("<p style=\"color:red\">Error</p>");
				RequestDispatcher rd=request.getRequestDispatcher("CreateNewSprint.jsp");
				rd.include(request, response);
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

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.util.ArrayList"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>Project Work</title>
</head>
<style>
#goback{
padding:2px 5px 5px 30px;
position:absolute;
top:15px;
left:20px;
}
#maincontent{
position:absolute;
left:50px;
top:80px;
height:500px;
width:1060px;
}
</style>
<body>
<%
String pname=request.getParameter("name");
session.setAttribute("pname", pname);
 %>
 <%
 Connection conn=null;
 ResultSet rs=null;
 String JDBC_DRIVER= "com.mysql.jdbc.Driver";
 String DR_URL = "jdbc:mysql://localhost:3306/agiletool";
 String USERNAME = "root";
 String PASSWORD = "rootpassword";
 String proname=(String)session.getAttribute("pname");
 %>
<div id="goback"><a href="OwnerDashRight.jsp" target="project" class="btn btn-default" role="button"><span class="glyphicon glyphicon-arrow-left"></span>&nbspProjects</a></div>
<div class="panel panel-primary" id="maincontent">
      <div class="panel-heading" style="font-size:20px; text-align:center;"><%=session.getAttribute("pname")%></div>
         <div class="panel-body">
	         <div class="container">
                 <ul class="nav nav-tabs">
                     <li class="active"><a data-toggle="tab" href="#tasks">Tasks</a></li>
                     <li><a data-toggle="tab" href="#teammem">Team Members</a></li>
                     <li><a data-toggle="tab" href="#files">Files</a></li>
					 <li><a data-toggle="tab" href="#notes">Notes</a></li>
					 <li><a data-toggle="tab" href="#roadmap">RoadMap</a></li>
                 </ul>
                  
                 <div class="tab-content">
                     <div id="tasks" class="tab-pane fade in active">
                         <div style="padding:10px;"><a href="AssignTasks.jsp" class="btn btn-success" role="button"><span class="glyphicon glyphicon-plus-sign"></span>&nbspAssign Tasks</a></div>
						 <table class="table table-hover table-striped">
						     <thead>
						         <th>Task Name</th>
								 <th>Description</th>
								 <th>Alloted to</th>
								 <th>Due Date</th>
						     </thead>
						     <% 
                         PreparedStatement pst1=null;  
                         String query="Select TaskName, Description, AllotedTo, DueDate from Tasks where ProjectName=? ";
                         try {
                        		Class.forName(JDBC_DRIVER);
                        		conn = DriverManager.getConnection(DR_URL, USERNAME, PASSWORD);	
                        		pst1=conn.prepareStatement(query);
                        		pst1.setString(1,proname);
                        	    rs = pst1.executeQuery();
                        	    while(rs.next())
                        	    { %>
							 <tbody>
				                 <tr>
							         <td> <%= rs.getString(1) %></td>
                				     <td> <%= rs.getString(2) %></td>
                				     <td> <%= rs.getString(3) %></td>
                				     <td> <%= rs.getString(4) %></td>
							     </tr>
							   
							 </tbody>
							 <% }%>
 <%
   }catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	finally{
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(pst1!=null){
			try {
				pst1.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
%>
						 </table>
                     </div>
                     <div id="files" class="tab-pane fade">
					     <div style="padding:10px;"><a href="#" class="btn btn-success" role="button"><span class="glyphicon glyphicon-plus-sign"></span>&nbspUpload files</a></div>
					 </div>
					  <div id="teammem" class="tab-pane fade">
					     <div style="padding:10px;"><a href="#" class="btn btn-success" role="button"><span class="glyphicon glyphicon-plus-sign"></span>&nbspInvite Members</a></div>
					     
                         <p style="font-size:15px;">Team Members available</p>
                         <table class="table table-hover table-stripped">
                         <thead>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Mail Id</th>
                         <thead>
                         <% 
                         PreparedStatement pst=null;  
                         String query1="Select FirstName, LastName, MailId from LoginDetails where ProjectName=? ";
                         try {
                        		Class.forName(JDBC_DRIVER);
                        		conn = DriverManager.getConnection(DR_URL, USERNAME, PASSWORD);	
                        		pst=conn.prepareStatement(query1);
                        		pst.setString(1,proname);
                        	    rs = pst.executeQuery();
                        	    while(rs.next())
                        	    { %>
                          <tbody>
                         <tr>
                				<td> <%= rs.getString(1) %></td>
                				<td> <%= rs.getString(2) %></td>
                				<td> <%= rs.getString(3) %></td>
                         </tr>
                         </tbody>
                         <% }%>
 <%
   }catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	finally{
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(pst!=null){
			try {
				pst.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
%>
                         </table>
					 </div>
					 <div id="notes" class="tab-pane fade">
						 <div style="padding:10px;"><a href="#" class="btn btn-success" role="button"><span class="glyphicon glyphicon-plus-sign"></span>&nbspCreate new note</a></div>
					 </div>
					 <div id="roadmap" class="tab-pane fade">
						 <div style="padding:10px;"><a href="#" class="btn btn-success" role="button"><span class="glyphicon glyphicon-plus-sign"></span>&nbspCreate RoadMap</a></div>
					 </div>
				 </div>
			 </div>
	 </div>
</div>

</body>
</html>
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
    <title>Scrum Team</title>
</head>
<style>
body{
background-color: #F8F8F8;
}
#heading{
font-size:25px;
font-weight:bold;
font-family=""Lucida Sans Unicode", "Lucida Grande", sans-serif";
}
#subheading{
font-weight:bold;
font-size:15px;
font-family=""Lucida Sans Unicode", "Lucida Grande", sans-serif";
}
hr{
border-color:black;
}
#help{
position:absolute;
right:10px;
top:60px;
}
#start-new-project{
position:absolute;
top:125px;
left:30px;
}
#projects{
text-decoration:none;
font-family:Verdana, Geneva, sans-serif;
font-size:15px;
font-weight:bold;
}
#projects:hover{
 background-color: #F8F8F8;
}
#projectarea{
padding:15px 5px 10px 30px;
}
.input-group{
 position:relative;
 width:600px;
 left:30px;
}
.dropdown {
    position: absolute;;
    display: inline-block;
	right:38px;
	top:15px;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	z-index:1;
}
a:hover{
background-color:#D0D0D0;
}
.dropdown:hover .dropdown-content {
    display: block;
}
.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}
div > a{
text-decoration:none;
color:black;
}
body::-webkit-scrollbar {
    width: 12px;
}
 
body::-webkit-scrollbar-track {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
    border-radius: 10px;
}
 
body::-webkit-scrollbar-thumb {
    border-radius: 10px;
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,1); 
}
</style>
<body>
<%
 Connection conn=null;
 ResultSet rs=null;
 String JDBC_DRIVER= "com.mysql.jdbc.Driver";
 String DR_URL = "jdbc:mysql://localhost:3306/agiletool";
 String USERNAME = "root";
 String PASSWORD = "rootpassword";
 String proname=(String)session.getAttribute("projectid");
 String name=(String)session.getAttribute("userid");
 %>
<div style="height:100%; width:100%; padding:15px 5px 10px 30px;" >
<p id="heading">Scrum Team</p>
<p id="subheading">Know your team members</p>
<hr />
</div>
<div class="dropdown">
<span style="font-size:20px;">Hello, Rohit</span>
<div class="dropdown-content">
<a href="#">My Account</a>
<a href="#">Team Chat Room</a>
<a href="#">Sign Out</a>
</div>
</div>
<button type="button" id="help" class="btn btn-primary">Help ?</button>
<br />
<br />

<div style="padding:2px 5px 5px 30px; position:absolute; left:880px; top:130px;"><a href="CreateNewSprint.html" target="project" class="btn btn-success" role="button"><span class="glyphicon glyphicon-plus-sign"></span>&nbspInvite New Members</a></div>
<div class="container" style="padding:15px;">
<table class="table table-hover">
<thead>
 <th>First Name</th>
 <th>Last Name</th>
 <th>Mail Id</th>
 <th>Mobile Number</th>
 <th>Role</th>
</thead>
<% 
            PreparedStatement pst1=null;  
            String query="Select FirstName, LastName, MailId, MobileNumber, UserClass from LoginDetails where ProjectName=? and FirstName!=? ";
              try {
                       Class.forName(JDBC_DRIVER);
                       conn = DriverManager.getConnection(DR_URL, USERNAME, PASSWORD);	
                       pst1=conn.prepareStatement(query);
                       pst1.setString(1,proname);
                       pst1.setString(2,name);
                       rs = pst1.executeQuery();
                       while(rs.next())
                       { %>
							<tbody>
								<tr>
									<td><%= rs.getString(1) %></td> 
									<td><%= rs.getString(2) %></td> 
									<td><%= rs.getString(3) %></td> 
									<td><%= rs.getString(4) %></td>
									<td><%= rs.getString(5) %></td>
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
</body>
</html>
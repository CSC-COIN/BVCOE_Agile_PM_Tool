<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="Dashboardcss.css">
</head>
<style>
.hvr:hover{
background-color:white;;
}
table{
background-color:#C8C8C8;
}
</style>

<body>
<%
ArrayList<String> a1=new ArrayList<String>();
String JDBC_DRIVER= "com.mysql.jdbc.Driver";
String DR_URL = "jdbc:mysql://localhost:3306/agiletool";
String USERNAME = "root";
String PASSWORD = "rootpassword";
Connection conn=null;
%>
<ul>
  <li><a class="active" href="#home">Report</a></li>
  <li><a class="active" href="#userguide">User Guide</a></li>
  <li><a class="active" href="#home">Report</a></li>
  <li class="dropdown">
     <a href="#" class="dropbtn">Hello <%=session.getAttribute("userid") %></a>
     <div class="dropdown-content">
         <a href="#" >My Account</a>
         <a href="Logout.jsp" target="_top" >Sign Out</a>
      </div>
  </li>
</ul>

<div style="height:130px; width:100%; padding:10px;">
<a href="#" class="buttonlink" id="assgtasks" >Assign Tasks</a>
<a href="#" class="buttonlink" id="addsprint" >Add new Sprint</a>
</div>

<div>
    <h1 style="font-size:30px; padding:8px; text-align:center;">Project Name: <%=session.getAttribute("projectid") %></h1><br>  
    <p style="font-size:20px; padding:6px;">Team Members</p>
<div style="padding:10px;">
<table id="tblMain" style="cursor:pointer;">
  <tr style="background-color:#606060;">
     <th>Member Name</th>
  </tr>
 <%
 
 ResultSet rs=null;
 PreparedStatement pst=null;
 String pname=(String)session.getAttribute("projectid");
   String query="select FirstName from LoginDetails where ProjectName=? ";
 try {
		Class.forName(JDBC_DRIVER);
		conn = DriverManager.getConnection(DR_URL, USERNAME, PASSWORD);	
		pst=conn.prepareStatement(query);
		pst.setString(1,pname);
		rs=pst.executeQuery();
		a1.clear();
	    while(rs.next())
	    {
	    	a1.add(rs.getString(1));
 %>
            <tr>
                <td> <%= rs.getString(1) %></td>
            </tr>
    	
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
				pst	.close();
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
<br /><br />
</div>
<br />
<br />
<h1></h1>
 <%
 ResultSet rst=null;
 Statement stmt=null;
 int size=a1.size();
 for(int i=0;i<size;i++){
	 String name1=a1.get(i);
    String query1="select * from " + name1;
    try{
    Class.forName(JDBC_DRIVER);
	conn = DriverManager.getConnection(DR_URL, USERNAME, PASSWORD);	
	stmt=conn.createStatement();
    rst = stmt.executeQuery(query1);
    while(rst.next()){
 %>
  <div style="height:100%; width:100%; background-color:white; padding:10px; background-color:#C8C8C8;">   
 <table style="paddin:10px;">
 <caption style="font-size:20px;"><%=name1 %></caption>
  <tr style="background-color:#606060;">
     <th>Sprint No</th>
	 <th>Sprint Name</th>
	 <th>Sprint State</th>
	 <th>Progress</th>
	 <th>Dates</th>
  </tr>
  <tr class="hvr">
  <td><%=rst.getString(1) %></td>
  <td><%=rst.getString(2) %></td>
  <td><%=rst.getString(3) %></td>
  <td><%=rst.getString(4) %></td>
  <td><%=rst.getString(5) %></td>
  </tr>
 </table>
 <br /><br />
</div>
<%} %>
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
		if(stmt!=null){
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(rst!=null){
			try {
				rst.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
%>
<%} %>
    <br /><br />
<p style="font-size:20px">
    Tasks Assigned 
    </p><br>  
    
<table>
  <tr style="background-color:#606060;">
     <th>Task</th>
	 <th>Team Member</th>
	 <th>Progress</th>
  </tr>
  <tr>
     <td>Documentation</td>
	 <td>Rohit</td>
	 <td>100 %</td>
  </tr>
  <tr>
     <td>Designing</td>
	 <td>Medha</td>
	 <td>80 %</td>
  </tr>
  <tr>
     <td>Development</td>
	 <td>Pooja</td>
	 <td>50 %</td>
  </tr>
  <tr>
     <td>Implementation</td>
	 <td>Ashna</td>
	 <td>--</td>
  </tr>    
  <tr >
     <td>Testing</td>
	 <td>Aditya</td>
	 <td>--</td>
  </tr>
</table>
</div>    
    <br>
    

</body>
</html>
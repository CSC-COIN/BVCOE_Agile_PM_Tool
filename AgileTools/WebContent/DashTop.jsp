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
.modalDialog{
 position: fixed;
	font-family: Arial, Helvetica, sans-serif;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background: rgba(0,0,0,1);
	z-index: 99999;
	opacity:0;
	webkit-transition: opacity 400ms ease-in;
	-moz-transition: opacity 400ms ease-in;
	transition: opacity 400ms ease-in;

	pointer-events: none;
    border-radius: 4px;

}


.modalDialog:target {
	opacity:0.9;
	pointer-events: auto;
}

.modalDialog > div {
	width: 50px;
	position: absolute;
	margin: 10% auto;
	top:0;
	left:340px;
	border-radius: 10px;
	background: #fff;
	background: -moz-linear-gradient(#fff, #999);
	background: -webkit-linear-gradient(#fff, #999);
	background: -o-linear-gradient(white, white);
}
.login{
padding:20px;
line-height:10px;
}
#add-sprint {
    width: 100%;
    background-color: #009900;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
#create-table{
    position:absolute;
    border: 2px solid #181818;
    border-radius: 5px;
    background-color: #808080;
    color: black;
    font-weight: bold;
    text-decoration: none;
    margin : 10px;
    padding: 10px 20px 10px 20px;
    top:68px;
    right:170px;
}
#create-table:hover{
background-color:#686868;
}
</style>

<body>


<ul>
  <li><a class="active" href="#home">Report</a></li>
  <li><a class="active" href="#userguide">User Guide</a></li>
  <li><a class="active" href="#home">Report</a></li>
  <li class="dropdown">
     <a href="#" class="dropbtn">Hello <%=session.getAttribute("userid") %></a>
     <div class="dropdown-content">
         <a href="#" >My Account</a>
         <a href="Logout.jsp" target="_top">Sign Out</a>
      </div>
  </li>
</ul>

<div style="height:130px; width:100%; padding:10px; ">
<form name="create-table" action="DashBoards" method="post">
<input type="submit" id="create-table" name="action" value="CreateTable">
</form>
<a href="#openModal" class="buttonlink" id="addsprint" >Add new Sprint</a>
</div>

<div>
    <h1 style="font-size:30px; padding:15px; text-align:center;">Project Name: <%=session.getAttribute("projectid") %></h1><br>  
<div>

<!-- Enter Sprint Data(Modal) -->
<div id="openModal" class="modalDialog">
<div style="height:450px; width:500px;">

<div style="height:90px; width:100%; background-color:#009900; border-radius: 4px 4px 4px 4px;">
<a href="#close" title="Close" class="close" style="position:absolute; right:12px; top:10px; color:black; text-decoration:none;">X</a>
<br />
<h2 style="position:absolute; top:20px; left:120px; font-size:30px;">Enter Sprint Details </h2>
</div>
<div class="login">
<form class="add-sprint-details" id="sprint-details" name="add-sprint-details" action="DashBoards" method="post">
	<label style="font-weight:bold;">Sprint No. </label><br /><br />
	<input type="text" placeholder="Sprint No" id="sprintno" name="sprintno" size="70" height="20px" align="center" required><br /><br />
	<label style="font-weight:bold;">Sprint Name </label><br /><br />
	<input type="text" placeholder="Sprint Name" id="sprintn" name="sprintname" height="20ox" align="center" size="70" required><br /><br />
	<label style="font-weight:bold;">Sprint State </label><br /><br />
	<input type="text" placeholder="Sprint State" id="sprints" name="sprintstate" height="20ox" align="center" size="70" required><br /><br />
	<label style="font-weight:bold;">Progress </label><br /><br />
	<input type="text" placeholder="Progress" id="prog" name="progress" height="20ox" align="center" size="70" required><br /><br />
	<label style="font-weight:bold;">Dates </label><br /><br />
	<input type="text" placeholder="Dates" id="dates" name="dates" height="20ox" align="center" size="70" required><br /><br />
	<br />
	<input type="submit" id="add-sprint" name="action" value="SubmitDetails">
	</form>
</div>
</div>
</div>
<!-- Till here -->

<div>
<table>
  <tr style="background-color:#606060;">
     <th>Sprint No</th>
	 <th>Sprint Name</th>
	 <th>Sprint State</th>
	 <th>Progress</th>
	 <th>Dates</th>
  </tr>
<%
Connection conn=null;
ResultSet rs=null;
Statement stmt=null;
String JDBC_DRIVER= "com.mysql.jdbc.Driver";
String DR_URL = "jdbc:mysql://localhost:3306/agiletool";
String USERNAME = "root";
String PASSWORD = "rootpassword";
String name=(String)session.getAttribute("userid");
String query="select * from "+ name;
try {
	Class.forName(JDBC_DRIVER);
	conn = DriverManager.getConnection(DR_URL, USERNAME, PASSWORD);	
	stmt = conn.createStatement();
    rs = stmt.executeQuery(query);
    while(rs.next())
    { %>
    	<tr>
                <td> <%= rs.getString(1) %></td>
                <td> <%= rs.getString(2) %></td>
                <td> <%= rs.getString(3) %></td>
                <td> <%= rs.getString(4) %></td>
                <td> <%= rs.getString(5) %></td>
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
		if(stmt!=null){
			try {
				stmt.close();
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
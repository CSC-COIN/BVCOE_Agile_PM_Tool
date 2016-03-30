<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="Dashboardcss.css">
</head>

<body>
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

<div style="height:130px; width:100%">

<a href="#" class="buttonlink" id="addsprint" >Add new Sprint</a>
</div>

<div>
    <h1 style="font-size:30px; padding:8px; text-align:center;">Project Name: <%=session.getAttribute("projectid") %></h1><br>  
    <p style="font-size:20px; padding:6px;">Team Members</p>
<div>
<table>
  <tr style="background-color:#606060;">
     <th>Member Name</th>
  </tr>
  <tr>
     <td>Aditya</td>
  </tr>
  <tr>
     <td>Ashna</td>
  </tr>
  <tr>
     <td>Medha</td>
  </tr>
  <tr>
     <td>Rohit</td>
  </tr>
  <tr>
     <td>Pooja</td>
  </tr>
</table>
</div>
    <br>
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
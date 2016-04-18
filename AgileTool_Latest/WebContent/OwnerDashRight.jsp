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
</head>
<script>
$(document).ready(function () {

    (function ($) {

        $('#filter').keyup(function () {

            var rex = new RegExp($(this).val(), 'i');
            $('.searchable tr').hide();
            $('.searchable tr').filter(function () {
                return rex.test($(this).text());
            }).show();

        })

    }(jQuery));

});

</script>
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
font-family:Verdana, Geneva, sans-serif;
font-size:15px;
font-weight:bold;
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
<div style="height:100%; width:100%; padding:15px 5px 10px 30px;" >
<p id="heading">Projects</p>
<p id="subheading">See everything that you and your team are working on.</p>
<hr />
</div>
<div class="dropdown">
<span style="font-size:20px;">Hello, <%=session.getAttribute("userid") %></span>
<div class="dropdown-content">
<a href="MyAccount.jsp" target="_top">My Account</a>
<a href="#">Team Chat Room</a>
<a href="Logout.jsp" target="_top">Sign Out</a>
</div>
</div>
<button type="button" id="help" class="btn btn-primary">Help ?</button>

<div class="input-group">
<input id="filter" type="text" class="form-control" placeholder="Search...">
<div class="input-group-btn">
<button type="submit" style="padding:9.05px;"class="btn btn-info"><span class="glyphicon glyphicon-search"></span></button>
</div>
</div>

<br />
<div style="padding:2px 5px 5px 30px; position:relative; left:880px;"><a href="CreateNewProject.jsp" target="project" class="btn btn-success" role="button"><span class="glyphicon glyphicon-plus-sign"></span>&nbspStart a new Project</a></div>
<div id="projectarea">
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/agiletool"
     user="root"  password="rootpassword"/>
     
<sql:query dataSource="${snapshot}" var="result">
SELECT * from Projects;
</sql:query>
     
<p id="projects">Active Projects</p>
<table id="myTable" class="table table-hover table-striped" style="cursor:pointer;">
<thead>
<tr>
<th>Project Name</th>
<th>Description</th>
<th>Company Name</th>
<th>Status</th>
<th>Duration</th>
</tr>
</thead>
<tbody class="searchable">
<c:forEach var="row" items="${result.rows}">
<tr>
  <td><c:out value="${row.ProjectName}"/></td>
  <td><c:out value="${row.ProjectDescription}"/></td>
  <td><c:out value="${row.State}"/></td>
  <td><c:out value="${row.CompanyName}"/></td>
  <td><c:out value="${row.Duration}"/></td>
</tr>
</c:forEach>
</tbody>
</table>
    <script language="javascript">
    var tbl = document.getElementById("myTable");
    if (tbl != null) {
        for (var i = 1; i < tbl.rows.length; i++) {
            for (var j = 0; j < tbl.rows[i].cells.length; j++)
                tbl.rows[i].cells[0].onclick = function () { getval(this); };
        }
    }

    function getval(cel) {
       var pname=cel.innerHTML;
       window.location.replace("ProjectWork.jsp?name=" + pname);
    }
     
    </script>
   
</div>

</body>
</html>
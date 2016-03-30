<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<style type="text/CSS">
li{
margin: 1em 3em;
padding:10px;
}
ul{
margin-left:0;
padding-left:0;
}
a{
color:black;
text-decoration:none;
}
.buttonlink{
    border: 2px solid #181818;
    border-radius: 5px;
    background-color: #808080;
    color: black;
    font-weight: bold;
    text-decoration: none;
    margin : 20px;
    padding: 10px 20px 10px 20px;
    display: inline-block;
}
.hoverable:hover{
    border: 2px solid #B8B8B8;
    border-radius: 5px;
    background-color: #B8B8B8;
    color: black;
    text-decoration: none;
    <!--padding: 5px 8px 5px 8px;-->
    display: inline-block;
}
body{
color: black;
background-color: #888888;
}
input:focus{
background-color:#383838;
color:white;
border-style:inset;
border-color:#585858;
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
.buttonlink:hover{
background-color:#686868;
}
</style>

<body>
<form action="abc.html" method="post">
  <input type="text" name="search" size="35" placeholder="Search"> <br>
</form>
<div id="scrumteam">
<hr>
<h3>Scrum Team</h3>
<hr>
</div>
<div id="list1">
<ul type="square">
<li><a href="abc.html" class="hoverable" target="_top">Backlog</a></li>
<li><a href="abc.html" class="hoverable" target="_top">Sprint Planning</a></li>
<li><a href="abc.html" class="hoverable" target="_top">Scrum Dashboard</a></li>
</ul>
</div>
<div id="project">
<hr>
<h3>Project</h3>
<hr>
</div>
<div id="list2">
<ul type="square">
<li><a href="abc.html" class="hoverable" target="_top">Release planning</a></li>
<li><a href="abc.html" class="hoverable" target="_top">Roadmap</a></li>
</ul>
</div>
<div id="bugsreport">
<hr>
<a href="abc.html" class="hoverable" target="_top"> Bugs Report </a>
<hr>
</div>
<div id="userprofiles">
<a href="abc.html" class="hoverable" target="_top"> User Profiles </a>
<hr>
</div>
<div id="cardview">
<a href="abc.html" class="hoverable" target="_top"> Card View </a>
<hr>
</div>
<div id="newdashboard">
<a class="buttonlink" href="abc.html" target="_top">New Dashboard</a>
</div>
</body>
</html>
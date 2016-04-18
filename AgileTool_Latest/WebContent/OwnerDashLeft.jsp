<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<style>
body{
background-image:url("backimg3.jpg");
}
.input-group{
padding:10px 10px 0px 10px;
}
hr{
border-color:white;
}
div > a{
text-decoration;none;
font-size:15px;
padding:10px;
line-height:40px;
color:white;
}
div > a:hover{
color:white;
font-size:16px;
}
div > a:active{
color:white;
text-decoration:underline;
}
div > a:visited{
color:white;
}
#logo{
font-family:"Arial Black", Gadget, sans-serif;
font-size:25px;
font-weight:bold;
color:white;
position:relative;
left:40px;
top:10px;
}
</style>

<body>
<form>
<div>
<p id="logo">Agile Tool</p>
</div>
<div style="padding:5px 10px 8px 10px;">
<hr />
</div>
<div style="padding:5px 10px 8px 20px;">
<a href="OwnerDashRight.jsp" target="project"><span class="glyphicon glyphicon-folder-open" style="padding-right:10px;"></span>Projects</a><br />
<a href="#"><span class="glyphicon glyphicon-user" style="padding-right:10px;"></span>Scrum Team</a><br />
<a href="#"><span class="glyphicon glyphicon-repeat" style="padding-right:10px;"></span>Backlog</a><br />
<a href="Calendar.jsp" target="project"><span class="glyphicon glyphicon-calendar" style="padding-right:10px;"></span>Calender</a><br />
<a href="#"><span class="glyphicon glyphicon-list-alt" style="padding-right:10px;"></span>Reports</a><br />
<a href="#"><span class="glyphicon glyphicon-file" style="padding-right:10px;"></span>Invoices</a><br />
<a href="#"><span class="glyphicon glyphicon-usd" style="padding-right:10px;"></span>Estimates</a><br />
<a href="#"><span class="glyphicon glyphicon-signal" style="padding-right:10px;"></span>Charts</a><br />
<a href="#"><span class="glyphicon glyphicon-share" style="padding-right:10px;"></span>Integration</a><br />
<hr />
<a href="#"><span class="glyphicon glyphicon-exclamation-sign" style="padding-right:10px;"></span>Bugs Report</a><br />
<a href="#"><span class="glyphicon glyphicon-trash" style="padding-right:10px;"></span>Trash</a><br />
<a href="#"><span class="glyphicon glyphicon-cog" style="padding-right:10px;"></span>System Settings</a><br />
</div>
  
</form>

</body>
</html>
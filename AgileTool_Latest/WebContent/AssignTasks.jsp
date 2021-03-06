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
<title>Assign Tasks</title>
</head>
<style>
#goback{
padding:2px 5px 5px 10px;
position:absolute;
top:15px;
left:250px;
}
#maincontent{
position:absolute;
left:250px;
top:80px;
height:550px;
width:800px;
z-index:1;
}
.form-group{
padding:15px;
}
</style>
<body>

<div><a role="button"  href="OwnerDashRight.jsp" id="goback" target="project" class="btn btn-default"><span class="glyphicon glyphicon-arrow-left"></span>&nbspGo Back</a></div>
<div class="panel panel-primary" id="maincontent">
      <div class="panel-heading" style="font-size:20px; text-align:center;"><%=session.getAttribute("pname") %></div>
         <div class="panel-body">
         <form  action="projectFunc" method="post">
		     <div class="form-group">
                 <label for="name">Task Name:</label>
                 <input type="text" class="form-control" id="tname" name="tname" placeholder="Enter Task name..." required>
             </div>
			  <div class="form-group">
                 <label for="description">Description:</label>
                 <input type="text" class="form-control" id="desc" name="desc" placeholder="Description..." required>
             </div>
			  <div class="form-group">
                 <label for="allotedto">Alloted To:</label>
                 <input type="text" class="form-control" id="allotto" name="allotto" placeholder="Assignee Name..." required>
             </div>
			  <div class="form-group">
                 <label for="duration">Duration:</label>
                 <input type="text" class="form-control" id="durd" name="durd" placeholder="Duration(in days)..." required>
             </div>
			 <button type="submit" name="action" value="AssignTasks" class="btn btn-success col-sm-6" style="position:relative; left:50%; left:180px;"><span class="glyphicon glyphicon-ok"></span>Add Task</button>
		   </form>
		 </div>
	  </div>
</body>
</html>
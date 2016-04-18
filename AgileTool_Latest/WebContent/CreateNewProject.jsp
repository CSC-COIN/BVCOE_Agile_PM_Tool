<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<style>
body{
background-color: #F8F8F8;
}
#maincontent{
position:absolute;
left:210px;
top:80px;
height:780px;
width:800px;
z-index:1;
}

#goback{
padding:2px 5px 5px 10px;
position:absolute;
top:15px;
left:210px;
}
#header p{
padding:10px 10px 10px 25px;
font-size:20px;
font-family:"Comic Sans MS", cursive, sans-serif;
}
.form-group{
padding:15px;
}
</style>
<body>
<div><a id="goback"href="OwnerDashRight.jsp" target="project" class="btn btn-default" role="button"><span class="glyphicon glyphicon-arrow-left"></span>&nbspProjects</a></div>
<div class="panel panel-primary" id="maincontent">
      <div class="panel-heading" style="font-size:20px; text-align:center;">New Project</div>
         <div class="panel-body">
         <form action="projectFunc" method="post">
		     <div class="form-group">
                 <label for="name">ProjectName:</label>
                 <input type="text" class="form-control" id="pname" name="projectname" placeholder="Enter Project name" required>
             </div>
			 <div class="form-group">
				 <label for="prodesc">ProjectDescription:</label>
				 <textarea type="text" class="form-control" id="pdesc" style="height:80px;" name="projdesc" placeholder="Describe the project"></textarea>
			 </div>
			 <div class="form-group">
				 <label for="state">State:</label><br/>
				 <select style="height:35px; width:735px;" name="currstate">
				     <option value="New">New</option>
					 <option value="Complete">Complete</option>
					 <option value="InProgress">InProgress</option>
					 <option value="Cancelled">Canceled</option>
				 </select>
			 </div>  
			 <div class="form-group">
				 <label for="comname">Company Name:</label>
				 <input type="text" class="form-control" id="pname" name="compname" placeholder="Enter Company name" required>
			 </div>
			 <div class="form-group">
				 <label for="npr">People required:</label>
				 <input type="text" class="form-control" id="pereq" name="duration" placeholder="No. of people required" required>
			 </div>
			 <div class="form-group">
				 <label for="duration">Duration:</label>
				 <input type="text" class="form-control" id="durtn" placeholder="Duration of project(in months)" required>
			 </div>
			 <button type="submit" name="action" value="CreateProject" class="btn btn-success col-sm-6" style="position:relative; left:50%; left:180px;;"><span class="glyphicon glyphicon-ok"></span>Create Project</button>

          </form>

		 </div>
</div>
</body>
</html>
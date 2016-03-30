<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
<link rel="stylesheet" type="text/css" href="login.css">
</head>
<style>
img{
position:absolute;
width:60px;
height:60px;
top:25px;
left:50px;
clip:rect(8px,56px,54px,4px);
}
</style>
<body>

<!--Top Heading-->
<div class="top" style="height:230px; width:100%">
<a href="http://www.csc.com/about_us/ds/29505-company_profile"><img src="csc.png" alt="Image Unavailable"></a>
<h1>CSC Agile</h1>
<pre>
<p id="toppara">We take inspiration from the World's best project management model, and create a unique experience. 
     Our smooth interface and simple design is enough to make Agile seem easy!</p></pre>
<a href="#openModal" id="loginlink">Log In / Sign Up</a>
</div>
<!--Ends Here-->

<!--Modal Part-->
<div id="openModal" class="modalDialog">
<div style="height:450px; width:500px;">

<div style="height:100px; width:100%; background-color:#009900; border-radius: 4px 4px 4px 4px;">
<a href="#close" title="Close" class="close" style="position:absolute; right:12px; top:10px; color:black; text-decoration:none;">X</a>
<br />
<h2 style="position:absolute; top:20px; left:190px; font-size:50px;"> Login </h2>
</div>
<div class="login">
<form action="LoginPage" method="post" name="login">
	<label style="font-weight:bold;"> Username </label><br /><br />
	<input type="text" placeholder="Enter E-Mail Id" id="username" name="username" size="70" height="20px" align="center"><br /><br />
	<label style="font-weight:bold;"> Password </label><br /><br />
	<input type="password" placeholder="Enter Password" id="pswd" name="password" height="20ox" align="center" size="70"><br />
	<br />
	<input type="checkbox" name="remembr" value="Remember Me" style="padding:15px;">Remember Me
	<input type="submit" name="action" value="Login">
	</form>
</div>
<div style="float:right; padding:10px;" >
<p> Not a member? <a href="SignUp.jsp">SignUp</a></p>
<br />
<a href=#>Forgot Password? </a>
</div>
</div>
</div>
<!--Till here-->

<!--Flip Box-->
<div class="content area" style="height:250px; width:100%">
<div class="flip3D" style="float:left;">
  <div class="back">Box 1 - Back</div>
  <div class="front">Box 1 - Front</div>
</div>
<div class="flip3D" style="position:absolute; left:550px;">
  <div class="back">Box 2 - Back</div>
  <div class="front">Box 2 - Front</div>
</div>
<div class="flip3D" style="float:right;">
  <div class="back">Box 3 - Back</div>
  <div class="front">Box 3 - Front</div>
</div>
</div>
<!--Ends Here-->

<div class="footer">
<p style="float:left;">Links</p><br />
<ul id="menu">
     <li><a href="#">Home |</a></li>
     <li><a href="#">Mail us |</a></li>
     <li><a href="#">CSC |</a></li>
     <li><a href="#">Contact</a></li>
</ul>
<div align="center" style="padding: 40px 400px;">
                        <a href="http://google.com/+">Google+ |</a>
                        <a href="http://www.facebook.com/profile.php?id=">Facebook |</a>
                        <a href="http://www.linkedin.com/in/">LinkedIn |</a>
                        <a href="http://twitter.com/">Twitter |</a>
                        <a href="http://youtube.com/">YouTube |</a>
                        <a href="mailto:">Mail</a>
						<p align="center" style="padding:5px;"><b>Â © Copyright 2016 CSC (Developed Under COIN Project)</b></p>
</div>
</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.io.*,java.util.*" %>
 <%@ page import="com.csc.Login.*"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign Up</title>
<link rel="stylesheet" type="text/css" href="signup.css">
</head>
<script>
function EnableSubmit(val){
  var sbmt=document.getElementById("submit-button");
  if(val.checked==true){
     sbmt.disabled=false;
   }
   else{
     sbmt.disabled=true;
   }
}
function check(){
	var x=document.getElementById("password");
	var y=document.getElementById("con-password");
	var z=document.getElementById("submit-button");
	if(x.value == y.value){
		document.getElementById("error").innerHTML=" ";
	}
	else{
	 z.disabled=true;
	 document.getElementById("error").innerHTML=" Passwords are not equal";	
	 document.getElementById("error").style.color="red";
	}
}
</script>
<body>
<div class="top" style="height:80px; width:100%">
<h1>CSC Agile</h1>
<button id="login">Login IN</button>
</div>
<!--Ends Here-->

<h2>Create your Account</h2>

<div class="sign-up">
     <form class="createaccount-form" id="createaccount" name="createaccount" action="LoginPage" method="post">
	     <div class="form-element multi-field name" id="name-form-element">
		     <fieldset>
			     <legend>
				     <strong>Name</strong>
				 </legend>
				 <input type="text" id="fname" placeholder="First" name="fname" size="30" required>
				 <input type="text" id="lname" placeholder="Last" name="lname" size="30" required>
			 </fieldset>
		 </div>
		 
		 <br />
		 
		 <div id="user-name-form-element">
             <fieldset>
                 <legend>
				     <strong>Choose your Username</strong>
                 </legend>				 
				 <input type="text" id="username" name="username" size="67" placeholder="Username" required>
             <fieldset>
		 </div>
	 
	     <div id="create-password">
		     <fieldset>
                 <legend>
				     <strong>Create a Password</strong>
                 </legend>				 
				 <input type="password" id="password" name="password" size="67" placeholder="Create Password" required>
             <fieldset>
		 </div>
		 
		  <div id="create-repassword">
		     <fieldset>
                 <legend>
				     <strong>Confirm your Password</strong>
                 </legend>				 
				 <input type="password" id="con-password" name="conpassword" size="67" placeholder="Confirm Password" required>
             <fieldse>
             <p id="error"></p>
		 </div>

		 <div id="login-as">
		     <fieldset>
                 <legend>
				     <strong>SignUp as Product Owner/User</strong>
                 </legend>				 
				 <select name="userclass" style="width:435px; height:28px;" onfocus="check()">
				     <option  value="ProductOwner" name="ProductOwner">Product Owner</option>
					 <option  value="User" name="ProductOwner">User</option>
				 </select>
             <fieldset>
		 </div>
		 
		 <div id="providing-number">
		     <fieldset>
                 <legend>
				     <strong>Mobile Number</strong>
                 </legend>				 
				 <input type="text" id="m-number" name="mnumber" size="67"  placeholder="Mobile Number" required>
             <fieldset>
		 </div>
		 
		 <div id="providing-mail-id">
		     <fieldset>
                 <legend>
				     <strong>Email Id</strong>
                 </legend>				 
				 <input type="text" id="mail-id" name="mailid" size="67"  placeholder="Email-Id" required>
             <fieldset>
		 </div>
		 
		 <div class="organization-name">
		     <fieldset>
                 <legend>
				     <strong>Organization/Company Name</strong>
                 </legend>				 
				 <input type="text" id="comp-name" name="compname" size="67" placeholder="Organization/Company Name" required>
             <fieldset>
		 </div>
		 
		 <div id="providing-project-name">
		     <fieldset>
                 <legend>
				     <strong>Project Name</strong>
                 </legend>				 
				 <input type="text" id="project-name" name="projectname" size="67"  placeholder="Project Name" required>
             <fieldset>
		 </div>
		 
		 <div class="location">
		     <fieldset style="padding-bottom:1px;">
                 <legend>
				     <strong>Location</strong>
                 </legend>				 
				 <input type="text" id="loc" name="location" size="67" placeholder="Location" required>
             <fieldset>
		 </div>
		 
		 <div class="terms-of-service">
		     <fieldset>				 
				 <input type="checkbox" name="TOS" value="termsofservice" id="TermsOfService" onClick="EnableSubmit(this)"> I agree to the CSC <a href="#">Terms of Service</a> and <a href="#">Privacy Policy</a>.
             <fieldset>
		 </div>
		 
		 <div>
		     <fieldset>
		         <input type="submit" name="action" value="SignUp"  id="submit-button">
			 </fieldset>	 
	     </div>
	 </form>
</div>


</body>
</html>
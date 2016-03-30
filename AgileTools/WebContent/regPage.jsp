<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
form{
  text-align: center;
  line-height: 200%
}
h1{
  text-align: center;
  color: maroon;
}
fieldset {
	border-color: maroon;
	border-style: groove;
	color: red;
}
body {
	background-image: url("loginpage.jpe");
	background-size: cover;
}

</style>
</head>
<body>
<h1>Registration Page</h1>
<form action="LoginPage" method="post">
   <fieldset>
   <legend>Register Here</legend>
   UserName:           <input type="text" name="username" value=" "><br>
   E-Mail:             <input type="text" name="email" value=" "><br>
   Password:           <input type="password" name="userpswd" ><br>
   Re-Enter Password:  <input type="password" name="repswd" ><br>
   <input type="submit" value="Submit">
   <input type="reset" value="Reset">
   </fieldset>
</form>
</body>
</html>
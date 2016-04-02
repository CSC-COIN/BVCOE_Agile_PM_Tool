<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logged Out</title>
</head>
<style>
body{
background-color:#C8C8C8;
}
a:hover{
text-decoration:underline;
}
</style>
<body>
<%
String str=(String)session.getAttribute("userid");
System.out.println(str);
session.removeAttribute("userid");
session.invalidate();
%>
<h1 style="text-align:center; color:green;">You have successfully logged out</h1>
<p style="text-align:center;">Go back to the&nbsp<a href="index.jsp" target="_top" style="text-decoration:none;">main</a> page</p>
	
</body>
</html>
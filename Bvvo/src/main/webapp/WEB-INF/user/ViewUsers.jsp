<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 
<title>Lawyer Home</title>
</head>
 <body style="background-color:white;">
	
        <table  width="100%" border="0" id="tab">

            <tr>
                <td align="center">
                    
                    <span style="font-family:Castellar;font-size:55px;">Bvvo</span>
                    &nbsp;
                   
                </td>
            </tr>
            <tr><td style="padding-left:50%;font-family:cursive;font-size:17px;">Justice is an essential human value</td></tr>
            <tr><td>&nbsp;</td></tr>
            <tr><td align="right">
           
            </td></tr></table>
            
<p><b>Welcome</b> </p>
<c:forEach items="${lawyers}" var="user">
		<table border="1">



  <tr><th>Id:</th><td>${user.id}</td></tr>
  <tr><th>Username:</th><td>${user.uname}</td></tr>
  <tr><th>Password:</th><td>${user.pwd}</td></tr>
  <tr><th>First Name:</th><td>${user.firstname}</td></tr>
  <tr><th>Last name:</th><td>${user.lastname}</td></tr>
  <tr><th>Street address:</th><td>${user.streetaddress}</td></tr>
  <tr><th>City:</th><td>${user.city}</td></tr>
  <tr><th>State:</th><td>${user.state}</td></tr>
  <tr><th>Zip code:</th><td>${user.zipcode}</td></tr>
  
</table>
</c:forEach>

</body>
</html>
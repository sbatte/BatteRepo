<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Reviews</title>
</head>
 <body style="background-color:white;">
	
        <table  width="100%" border="0" id="tab">

            <tr>
                <td align="center">
                    
                    <span style="font-family:Castellar;font-size:55px;">Bvvo</span>
                    &nbsp;
                    <img width="40px" height="40px" src="images/justice.jpg">
                </td>
            </tr>
            <tr><td style="padding-left:50%;font-family:cursive;font-size:17px;">Justice is an essential human value</td></tr>
            <tr><td>&nbsp;</td></tr>
            <tr><td align="right">
            <span style="border-right: #C8BBBE thin solid;"><a href="Index.html">Logout</a></span>
            <span style="border-right: #C8BBBE thin solid;" ><a  href="#">Sitemap</a></span>
            <span style="border-right: #C8BBBE thin solid;"><a href="#">Feedback</a></span>
            </td></tr></table>
 <br><br>
 <table  align="center" style="BORDER: #c6c6c6 1px solid;">           
<table>
  <tr><th>Email:</th><td>${rating.email}</td></tr>
  <tr><th>First Name:</th><td>${rating.firstname}</td></tr>
  <tr><th>Last name:</th><td>${rating.lastname}</td></tr>
  <tr><th>address:</th><td>${rating.address}</td></tr>
  <tr><th>City:</th><td>${rating.city}</td></tr>
  <tr><th>State:</th><td>${rating.state}</td></tr>
  <tr><th>Zip code:</th><td>${rating.zip}</td></tr>
  
  <tr><th>Image:</th>  <c:if test ="${not empty rating.image}">
  <img src = "/Bvvo/user/pic.html?id=${rating.id}"/></c:if>
  <c:if test = "${empty rating.image}">
  <img src = "http://t2.gstatic.com/images?q=tbn:ANd9GcQk4VxEs_VFzjFnl_-zLlkQlBHsuEjxUzJ9M46iifVgoTthKKxR" height = "149" width = "112"></c:if></tr>

</table>
	
	<c:forEach items="${searchstats}" var="s">
	<c:if test="${ stats.enable == true}">
	<ul>
	
<li><strong>Title:</strong> ${s.title}</li>
	<li><strong>Message:</strong> ${s.message}</li>
	<li><strong>Knowledge:</strong> ${s.knowledge}</li>
	<li><strong>OverAll:</strong> ${s.overall}</li>                                                    
	<li><strong>Service:</strong> ${s.rating}</li>
	
	</ul>
	<a href="EditReview.html?id=${s.id}">Edit </a> <br/>
	<a href="DeleteReview.html?id=${stats.id}">Delete </a> 
	</c:if>
	</c:forEach>
	
	<center><a href="/Bvvo/user/Index.html">Back to Home</a></center>
	
</td></tr></table>


</body>
</html>
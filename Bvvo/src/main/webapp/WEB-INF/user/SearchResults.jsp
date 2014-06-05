<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Results</title>
</head>
<body style="background-color:white;">
	
        <table  width="100%" border="0" id="tab">

            <tr>
               <td align="center">
                    
                    <span style="font-family:Castellar;font-size:55px;">Bvvo</span>
                    &nbsp;
                  <img width="40px" height="40px" src="http://www.clker.com/cliparts/y/x/Q/S/b/q/scales-of-justice-md.png">
                  
                </td>
            </tr>
            <tr><td style="padding-left:50%;font-family:cursive;font-size:17px;">Justice is an essential human value</td></tr>
            <tr><td>&nbsp;</td></tr>
             <tr><td align ="right"> &nbsp;
                     <a href="/Bvvo/user/Login.html"><img src="http://png-1.findicons.com/files/icons/1580/devine_icons_part_2/128/home.png" width="3%" height="3%" border="0"></a></span></td></tr>
            <tr><td align="right">
           
            <span style="border-right: #C8BBBE thin solid;" ><a  href="SearchLawyer.html">Search Lawyer</a></span>
            <span style="border-right: #C8BBBE thin solid;"><a href="SearchReview.html">Search Review</a></span>
            
             </td></tr>
            <tr><td>&nbsp;</td></tr>
            </table>

	
<c:if test = "${empty result}">
No results found.
</c:if>


<c:if test = "${not empty result}">
<c:forEach items="${result}" var="result">
<table border="1">
<!--  	<tr>	<th>Email: ${result.email} </th>
		<th>FirstName: ${result.firstname}</th>
		<th>LastName: ${result.lastname}</th>
		<th>City: ${result.city}</th>
		<th>State: ${result.state}</th>
		<th>Zip Code: ${result.zip}</th></tr>
		<th>
		
		-->
		
		<tr><th>Profile photo</th><th>E-Mail</th><th>First Name</th><th>Last name</th><th>Street address</th><th>City</th><th>State</th><th>Zip code</th><th>Area of expertise</th><th>Year</th><th>Review</th></tr>
 <td>
<c:if test="${not empty result.image}">
<img src="/Bvvo/user/pic1.html?id=${result.id}" />
</c:if> 
<c:if test="${empty result.image}">
<img
src="http://t2.gstatic.com/images?q=tbn:ANd9GcQk4VxEs_VFzjFnl_-zLlkQlBHsuEjxUzJ9M46iifVgoTthKKxR"
height="88" width="66" />
</c:if></td>
<!--  Review Now:<a href='/Bvvo/user/LawyerReview.html?id=${result.id}'>Review Now</a> <br/>
  Edit Review:<a href='/Bvvo/user/EditReview.html?id=${result.id}'>Edit Review</a> <br/>  -->
 <td><a href="LawyerProfile.html?id=${result.id}">${result.email}</a></td>
					<td>${result.firstname}</td>
					<td>${result.lastname}</td>
				    <td>${result.address}</td>
					<td>${result.city}</td>
					<td>${result.state}</td>
					<td>${result.zip}</td>
					<td>${result.expertize}</td>
					<td>${result.year}</td>
<td><a href="LawyerReview.html?id=${result.id}">Write Review</a></td></tr>
</table>

</c:forEach>

</c:if>

<br>

<center>
			<b><a href="SearchLawyer.html"> Search
						Again</a></font> </b>
		</center>
		<br /> <a href="Login.html"> Back to
					Home Page </a></font></b><br />
	<security:authorize access="hasRole('generaluser')"> 
<b><a href="<c:url value='/j_spring_security_logout' />">Logout user</a></font></b><br />
</security:authorize>
<security:authorize access="hasRole('admin')"> 
<b><a href="<c:url value='/j_spring_security_logout' />">Logout admin</a></font></b><br />
</security:authorize>
<security:authorize access="hasRole('lawyers')"> 
<b> <a href="<c:url value='/j_spring_security_logout' />">Logout lawyer</a></font></b><br />
</security:authorize>
	
	
</body>
</html>
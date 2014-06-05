<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
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
            <tr><td>&nbsp;
           
            </td></tr></table>
            


<form>

		<table border="1">


                <tr><th>Profile:</th>
						<td>
			<c:if test="${not empty lawyerdetails.image}">
						<img src="pic.html?id=${lawyerdetails.id}" />
					</c:if> <c:if test="${empty lawyerdetails.image}">
						<img
							src="http://t2.gstatic.com/images?q=tbn:ANd9GcQk4VxEs_VFzjFnl_-zLlkQlBHsuEjxUzJ9M46iifVgoTthKKxR"
							height="149" width="112" />
					</c:if> </td></tr>
			<tr>
				<th>User name:</th>
				<td>${lawyerdetails.email}</td>
			</tr>
			<tr>
				<th>First Name:</th>
				<td>${lawyerdetails.firstname}</td>
			</tr>
			<tr>
				<th>Last name:</th>
				<td>${lawyerdetails.lastname}</td>
			</tr>
			<tr>
				<th>Street address:</th>
				<td>${lawyerdetails.address}</td>
			</tr>
			<tr>
				<th>City:</th>
				<td>${lawyerdetails.city}</td>
			</tr>
			<tr>
				<th>State:</th>
				<td>${lawyerdetails.state}</td>
			</tr>
			<tr>
				<th>Zip code:</th>
				<td>${lawyerdetails.zip}</td>
			</tr>
			
			
		
		</table>
	</form>

	<form>

		<c:forEach items="${view}" var="rating">
		<c:if test="${rating.enable == true}">
        <b> User Reviews</b><br />
			Topic: ${rating.title}
			<br />
			Comments:${rating.message} 
			<br />
			Knowledge Scale: ${rating.knowledge} 
			<br />
			Service Scale: ${rating.service} 
			<br />
			Overall Scale: ${rating.overall} <br/>
			
			<security:authorize access="isAuthenticated() and principal.username=='${rating.email.email}'">
			
			<a href="EditReview.html?id=${rating.id}">Edit Review</a>
			</security:authorize>
			<security:authorize access="hasRole('admin')"> 
			<a href="DeleteReview.html?id=${rating.id}">Delete Review</a>
			</security:authorize>
			</c:if>				
		<br/>
			
		</c:forEach>
			<br /><br/><br/>
		<b><a href='SearchLawyer.html'>Search
					Again</a></b><br /> <b><a href="Login.html">
					Back to Home Page </a></b><br />
					<security:authorize access="hasRole('generaluser')"> 
<b> <a href="<c:url value='/j_spring_security_logout' />">Logout User</a></b><br />
</security:authorize>
<security:authorize access="hasRole('admin')"> 
<b> <a href="<c:url value='/j_spring_security_logout' />">Logout admin</a></b><br />
</security:authorize>
<security:authorize access="hasRole('lawyers')"> 
<b><a href="<c:url value='/j_spring_security_logout' />">Logout lawyer</a></b><br />
</security:authorize>
	</form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Review Result</title>
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
            </table>
             <br>
             <table  align="center" style="BORDER: #c6c6c6 1px solid;">           
<tr><td id="textstyle1">
<form>
<table border="1" align="center">
				<c:forEach items="${result}" var="lawyer">
				<tr><th>Lawyer</th><th>Reviewer</th><th>Title</th><th>Content</th></tr>
				<tr><td><a href="LawyerProfile.html?id=${lawyer.lawyername.id}">${lawyer.lawyername.firstname}</a></td><td>${lawyer.email.firstname}</td><td>${lawyer.title}</td><td>${lawyer.message}</td></tr>
			</c:forEach>
			</table>
			
			
			<b><a href="SearchReview.html"> Search
						Again</a> </b>
		
		<br /> <b><a href="Login.html"> Back to
					Home Page </a></b><br />
	<security:authorize access="hasRole('generaluser')"> 
<b> <a href="<c:url value='/j_spring_security_logout' />">Logout user</a></b><br />
</security:authorize>
<security:authorize access="hasRole('admin')"> 
<b> <a href="<c:url value='/j_spring_security_logout' />">Logout admin</a></b><br />
</security:authorize>
<security:authorize access="hasRole('lawyers')"> 
<b> <a href="<c:url value='/j_spring_security_logout' />">Logout lawyer</a></b><br />
</security:authorize>
	
	
		</form>
		</td></tr></table>
</body>
</html>
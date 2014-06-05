<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Get Lawyer</title>
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
            <span style="border-right: #C8BBBE thin solid;"><a href="Index.html">Logout</a></span>
            <span style="border-right: #C8BBBE thin solid;" ><a  href="#">Sitemap</a></span>
            <span style="border-right: #C8BBBE thin solid;"><a href="#">Feedback</a></span>
            </td></tr></table>
            <br><br>
           <p><b>Welcome</b></p>
 <table  align="center" style="BORDER: #c6c6c6 1px solid;">
  <tr><td><br><br></td></tr>
  <tr><td>
 <c:if test="${not empty lawy}"></c:if>
<c:forEach items="${lawy}" var="lawyer">
<b>Email</b> :${lawyer.email}<br/>
<b>First Name</b> :${lawyer.firstname}  <br/>
<b>Last Name</b> :${lawyer.lastname}<br/>
<b> Address</b> :${lawyer.address}<br/>  
<b>City</b> :${lawyer.city}  <br/> 
<b>State</b> :${lawyer.state}<br/>
<b>Expertise </b>:${lawyer.expertize}<br/> 
<b> Zip code</b> :${lawyer.zip}
<br/><br/>
<c:if test = "${not empty userid}">
<a href="AddReview?lid=${lawyer.id}&userid=${userid}" > Review Now</a>	
</c:if>
</c:forEach>
</td></tr></table>
</body>
</html>
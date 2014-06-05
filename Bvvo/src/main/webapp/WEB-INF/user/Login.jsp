<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <script type="text/javascript">
var timeout	= 500;
var closetimer	= 0;
var ddmenuitem	= 0;

// open hidden layer
function mopen(id)
{	
	// cancel close timer
	mcancelclosetime();

	// close old layer
	if(ddmenuitem) ddmenuitem.style.visibility = 'hidden';

	// get new layer and show it
	ddmenuitem = document.getElementById(id);
	ddmenuitem.style.visibility = 'visible';

}
// close showed layer
function mclose()
{
	if(ddmenuitem) ddmenuitem.style.visibility = 'hidden';
}

// go close timer
function mclosetime()
{
	closetimer = window.setTimeout(mclose, timeout);
}

// cancel close timer
function mcancelclosetime()
{
	if(closetimer)
	{
		window.clearTimeout(closetimer);
		closetimer = null;
	}
}

// close layer when click-out
document.onclick = mclose; 


</script>
    <style>
     #sddm
			{	margin: 0;
				padding-top:0 ;
				}
		   #sddm li
		    {	margin: 0;
				padding: 0;
             	list-style: none;
				float: left;
				font: bold 11px arial}
			
						
			#sddm li a
			{	display: block;
				margin: 0 1px 0 0;
				
				width: 20px;							
				color: black;
			    text-align: center;
				text-decoration: none}
						
			#sddm span
			{	position: absolute;
				visibility: hidden;
				margin: 0;
				padding: 0;
				background: white;
				border: 1px solid grey;
				}
						
			#sddm span a
			{	position: relative;
				display: block;
				margin: 0;
				padding: 2px 5px;
				width: auto;
				
				text-align: left;
				text-decoration: none;
				background: white;
				color: grey;
				font: 11px arial}
						
     </style>
<title>Login</title>
</head>

<body style="background-color:white;" >
	
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
                     <a href="/Bvvo/user/Index.html"><img src="http://png-1.findicons.com/files/icons/1580/devine_icons_part_2/128/home.png" width="3%" height="3%" border="0"></a></span></td></tr>
            <tr><td align="right">
           
            <span style="border-right: #C8BBBE thin solid;" ><a  href="SearchLawyer.html">Search Lawyer</a></span>
            <span style="border-right: #C8BBBE thin solid;"><a href="SearchReview.html">Search Review</a></span>
            
             </td></tr>
            <tr><td>&nbsp;</td></tr>
        <tr><td align="right">    
                    	<ul id="sddm" style="padding-left:88%;padding-top:1%;">
					    <li><a href="#" 
					        onmouseover="mopen('m1')" 
					        onmouseout="mclosetime()"><img src="http://www.verite.org/sites/default/files/images/register_now_g_large.png"  border="0"></a>
					        <span id="m1" 
					            onmouseover="mcancelclosetime()" 
					            onmouseout="mclosetime()">
					        <a href="/Bvvo/user/LawyerReg.html"><img src="http://www.iconshock.com/img_jpg/VISTA/jobs_icons/jpg/256/lawyer_icon.jpg" width="30px" height="30px" border="0"></a>
					        <a href="/Bvvo/user/UserReg.html"><img src="http://images.all-free-download.com/images/graphiclarge/black_officer_user_284.jpg" width="30px" height="30px" border="0"></a>
					       	<a href="/Bvvo/user/AdminReg.html"><img src="http://www.virtualdermpath.com/images/icon_Admin_black.gif" width="30px" height="30px" border="0"></a>				        
					        </span>
					    </li>
					    
					    
					  </ul>   </td></tr>
            
         </table>
  


<table style="border:grey 3px solid;position:absolute;left:40%;top:47%">
<tr><td>
<!--  <Form>
                
                 <span style="text-decoration:underline;font-weight:italic;"> <center> LOGIN</center></span><br>
                    <LABEL>Login As</LABEL>
                    <select style="width: auto" name="role" style="BORDER: #999999 1px solid;FONT: 13px verdana; ">

                        <option>--Select--</option>
                        <option value="law1">Lawyers</option>
                         <option value="user1">Users</option>
                         <option value="admin1">Admin</option>
                        
                        
                    </select>
                    <br><br>
                    <LABEL>Username</LABEL>&nbsp;<INPUT  id="inputsty" type="text" name="email" size="25" ><br><br>
                    <LABEL>Password</LABEL>&nbsp;<INPUT id="inputsty"  type="password" name="password" size="25" ><br>
                   
                   -->
                   
                    
                    &nbsp;&nbsp;
                    	
            
                   
                   <center><b><a href="/Bvvo/spring_security_login"><img src="http://www.mini-workers.com/images/login_icon.gif"></a></b></center> <br/>
 
<security:authorize access="hasRole('generaluser')"> 
<b><a href="<c:url value='/j_spring_security_logout' />">Logout user</a></font></b><br />
</security:authorize>
<security:authorize access="hasRole('admin')"> 
<b> <a href="<c:url value='/j_spring_security_logout' />">Logout admin</a></font></b><br />
</security:authorize>
<security:authorize access="hasRole('lawyers')"> 
<b> <a href="<c:url value='/j_spring_security_logout' />">Logout lawyer</a></font></b><br />
</security:authorize>
                   

                    
  
     </td></tr>
    </table>

</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
function validation() {
	if (document.getElementById("email").value == "") {
		document.getElementById("emsg").innerHTML= "<font color='red'>Please enter email</font>";
		return false;
	}
	if (document.getElementById("password").value == "") {
		document.getElementById("pmsg").innerHTML = "<font color='red'> Please enter Password</font>";
		return false;
	}if (document.getElementById("firstname").value == "") {
		document.getElementById("fmsg").innerHTML = "<font color='red'> Please enter First Name</font>";
		return false;
	}if (document.getElementById("lastname").value == "") {
		document.getElementById("lmsg").innerHTML = "<font color='red'> Please enter Last Name</font>";
		return false;
	}
    if (document.getElementById("city").value == "") {
		document.getElementById("cimsg").innerHTML = "<font color='red'> Please enter City</font>";
		return false;
	}if (document.getElementById("state").value == "") {
		document.getElementById("smsg").innerHTML = "<font color='red'> Please enter State</font>";
		return false;
	}
	if (document.getElementById("zip").value == "") {
		document.getElementById("zmsg").innerHTML = "<font color='red'> Please enter Zip</font>";
		return false;
	}
           
</script>
<title>User Registration</title>
</head>

<body style="background-color:white;" id="bodysty">

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

       

            <form:form modelAttribute="userdetails" >
             
               <table align="center" style="BORDER: #c6c6c6 1px solid;">
                
                <tr><th>  <b>User Account Information</b></th></tr>
                  <tr><td> Username:*</td><td><form:input path="email" type="text" size="25" onblur="validation(email)"/><span id="emsg" style="padding-left:55%;">  </span></td> </tr>
                  <tr><td>  Password:*</td><td><form:input path="password" type="password" size="25" onblur="validation(password)"/><span id="pmsg"></span> </td> </tr>
                  
                  <tr><th>  <b>Personal Information</b></th></tr>
                  <tr><td>  Firstname:*</td><td><form:input path="firstname" type="text" size="25" onblur="validation()"/><span id="fmsg"></span></td> </tr>
                  <tr><td>  Lastname:*</td><td><form:input path="lastname" type="text" size="25" onblur="validation()"/><span id="lmsg"></span></td> </tr>
                  <tr><td>  Address:</td><td><form:input path="address" type="text" size="50" onblur="validation()"/></td> </tr>
                  <tr><td>  City:*</td><td><form:input path="city"  type="text" size="25" onblur="validation()"/><span id="cimsg"></span></td> </tr>
                  <tr><td>  State:*</td><td><form:input path="state"  type="text" size="25" onblur="validation()"/><span id="smsg"></span></td> </tr>
                  <tr><td>Zipcode:*<td><form:input path="zip"  type="text" size="8" onblur="validation()"/><span id="zmsg" ></span></tr>
                      
                  <tr><td>
                  
                   <input style="margin-left:30%;"  type="submit" value="Register" onclick= "return validation()"></td><td><input type="reset" value="Reset">
				</td>
				</tr>
				</table>
                
            </form:form>

         

      </body>

</body>
</html>
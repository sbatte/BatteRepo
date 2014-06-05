<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Lawyer Registration</title>
<script type="text/javascript">

function year()
{
   for(i=2013;i>1900;i--)
   {
       document.write('<option value='+i+'>'+i+'</option>');
   }
}

function validate(theelement) {
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

	/*
	function validation() {
		if (document.getElementById("email").value == "") {
			alert("Please enter email address");
			document.getElementById("email").focus();
			return false;
		}
		if (document.getElementById("password").value == "") {
			alert("Please enter Password");
			document.getElementById("password").focus();
			return false;
		}if (document.getElementById("firstname").value == "") {
			alert("Please enter First Name");
			document.getElementById("firstname").focus();
			return false;
		}if (document.getElementById("lastname").value == "") {
			alert("Please enter Last Name");
			document.getElementById("lastname").focus();
			return false;
		}

		if (document.getElementById("address").value == "") {
			alert("Please enter address");
			document.getElementById("address").focus();
			return false;
		}if (document.getElementById("city").value == "") {
			alert("Please enter City");
			document.getElementById("city").focus();
			return false;
		}if (document.getElementById("state").value == "") {
			alert("Please enter State");
			document.getElementById("state").focus();
			return false;
		}
		if (document.getElementById("zip").value == "") {
			alert("Please enter Zip");
			document.getElementById("zip").focus();
			return false;
		}
	}

	var unameflag = false;
	var pflag = false;
	var firstflag = false;
	var lflag = false;
	var ciflag = false;
	var sflag = false;
	var zflag = false;
	var emailvalidated = false;
	var xmlhttp = false;
	 
	 try
	                 {
		                 //If the javascript version is greater than 5.
		                 xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");

	                 }
	                 catch (e)
	                 {
			//If not, then use the older active x object.
			 try
			 {
				//If we are using IE.
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			 }
			 catch (E)
			 {
				//Else we must be using a non-IE browser.
				xmlhttp = false;
			 }
		}

		//If we are using a non-IE browser, create a javascript instance of the object.
		if (!xmlhttp && typeof XMLHttpRequest != 'undefined')
		{
			xmlhttp = new XMLHttpRequest();
		}


	function validate(theelement)
	{
			switch (theelement)
		{
		
		case "zip":
							var ncheck=new RegExp("^[0-9]+$");
							exp=document.form.zip.value;
							var uflag=0;
				                        if(exp != "")
											{
												if(!exp.match(ncheck))
												{
													document.getElementById("zmsg").innerHTML = "<font color='red'>Only digits are allowed</font>";
													uflag = 1;
												}
												if(exp=="" || exp.length > 7)
												{
													document.getElementById("zmsg").innerHTML = "<font color='red'>Min 1 and Max 6 digits</font>";
													uflag = 1;
												}
												if(uflag == 0)
												{
													document.getElementById("zmsg").innerHTML=" ";
													expflag= true;
												}
											}
	                        break;
	      
	            
	            case "state":
							var ncheck=new RegExp("^[a-zA-Z ]+$");
							add=document.form.state.value;
							var uflag=0;
				                        if(add != "")
											{
												if(!add.match(ncheck))
												{
													document.getElementById("smsg").innerHTML = "<font color='red'>Contains only alphabets</font>";
													uflag = 1;
												}
												if(add.length<3 || add.length > 25)
												{
													document.getElementById("smsg").innerHTML = "<font color='red'> min 3 characters and max 25 characters </font>";
													uflag = 1;
												}
												if(uflag == 0)
												{
													document.getElementById("smsg").innerHTML=" ";
													sflag= true;
												}
											}
	                        break;
	             case "city":
							var ncheck=new RegExp("^[a-zA-Z ]+$");
							add=document.form.city.value;
							var uflag=0;
				                        if(add != "")
											{
												if(!add.match(ncheck))
												{
													document.getElementById("cimsg").innerHTML = "<font color='red'>Contains only alphabets</font>";
													uflag = 1;
												}
												if(add.length<3 || add.length > 25)
												{
													document.getElementById("cimsg").innerHTML = "<font color='red'> min 3 characters and max 25 characters </font>";
													uflag = 1;
												}
												if(uflag == 0)
												{
													document.getElementById("cimsg").innerHTML=" ";
													ciflag= true;
												}
											}
	                        break;
	         
	            
	            
	            case "email":
				emailid=document.form.email.value;
				var apos=document.form.email.value.indexOf("@");
				var dotpos=document.form.email.value.lastIndexOf(".");
				var eflag = 0;
				if(emailid !="")
				{
					if((apos<1)||((dotpos-apos)<2))
					{
						document.getElementById("emsg").innerHTML= "<font color='red'>Provide valid emailid</font>";
						eflag = 1;
					}
	                                if( eflag == 0)
	                                {
	                                    document.getElementById("emsg").innerHTML=" ";
	                                    
	                                    emailvalidated = true;
	                                }
	                        }
				break;
				
				case "lastname":
				var fnamecheck=new RegExp("^[a-zA-Z ]+$");
				fname=document.form.lastname.value;
				var fflag = 0;

				if(fname != "")
				{
					if(!fname.match(fnamecheck))
					{
						document.getElementById("lmsg").innerHTML = "<font color='red'> Only letters,spaces are allowed";
						fflag = 1;
					}
					if(fname.length < 3||fname.length > 25)
					{
						document.getElementById("lmsg").innerHTML = "<font color='red'> min 3 characters and max 25 characters</font>";
						fflag = 1;
					}

					if(fflag == 0)
	                                {
	                                        document.getElementById("lmsg").innerHTML=" ";
						lflag = true;
	                                }
				}
				break;
			
		     case "firstname":
				var fnamecheck=new RegExp("^[a-zA-Z ]+$");
				fname=document.form.firstname.value;
				var klflag = 0;

				if(fname != "")
				{
					if(!fname.match(fnamecheck))
					{
						document.getElementById("fmsg").innerHTML = "<font color='red'> Only letters,spaces are allowed";
						klflag = 1;
					}
					if(fname.length < 3||fname.length > 25)
					{
						document.getElementById("fmsg").innerHTML = "<font color='red'> min 3 characters and max 25 characters</font>";
						klflag = 1;
					}

					if(klflag == 0)
	                                {
	                                        document.getElementById("fmsg").innerHTML=" ";
											firstflag = true;
	                                }
				}
				break;
			
				
				case "password":
				var ncheck=new RegExp("^[A-Za-z0-9]+$");
				pw1=document.form.password.value;
				var pflag1 = 0;
				if(pw1 != "")
				{
					if(!pw1.match(ncheck))
					{
						document.getElementById("pwordmsg").innerHTML = "<font color='red'>no special characters are allowed </font>";
						pflag1 = 1;
					}
					
					
					if (pw1.length < 6||pw1.length > 25)
					{
						document.getElementById("pwordmsg").innerHTML = "<font color='red'> min 6 characters and max 25 characters</font>";
						pflag1 = 1;
					}
					
					if(pflag1 == 0)
					{
						document.getElementById("pwordmsg").innerHTML=" ";
						pwordflag = true;
					}
				}

				break;
		                 
	       }
	              */        

</script>
 
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

       

            <form:form modelAttribute="lawyers" id="formsty1" enctype="multipart/form-data">
            	
                <table align="center" style="BORDER: #c6c6c6 1px solid;">
                
               <tr><th> Lawyer Account Information</b></th></tr>
                  <tr><td> Username:*</td><td><form:input path="email" id="email" type="text" size="25" onfocus="validate(this.name)"/><span id="emsg" > </span></td> </tr>
                  <tr><td>  Password:*</td><td><form:input path="password" id="password" type="password" size="25" onblur="validate(this.name)"/><span id="pmsg" /> </td> </tr>
                  
                  <tr><th>  <b>Personal Information</b></th></tr>
                  <tr><td>  Firstname:*</td><td><form:input path="firstname" id="firstname" type="text" size="25" onblur="validate(this.name)"/><span id="fmsg"></span></td> </tr>
                  <tr><td>  Lastname:*</td><td><form:input path="lastname" type="text" size="25" onblur="validate(this.name)"/><span id="lmsg"></span></td> </tr>
                  <tr><td>  Address:</td><td><form:input path="address" type="text" size="50" onblur="validate(this.name)"/></td> </tr>
                  <tr><td>  City:*</td><td><form:input path="city"  type="text" size="25" onblur="validate(this.name)"/><span id="cmsg"></span></td> </tr>
                  <tr><td>  State:*</td><td><form:input path="state"  type="text" size="25" onFocus="validate(this.name)"/><span id="zmsg"></span></td> </tr>
                  <tr><td>Zipcode:*<td><form:input path="zip"  id="zip" type="text" size="8" value="1234" onFocus="if (value == '1234') {value=''}"/></span></tr>
                                                    
                   <tr><td>Area of Expertise : </td><td>
                        <form:radiobutton path='expertize' value="Criminal Law" checked="Criminal Law"/>Criminal Law</br>
                        <form:radiobutton path='expertize' value="Business Law"/>Business Law</br>
                        <form:radiobutton path='expertize' value="Family Law"/>Family Law</br>
                        <form:radiobutton path='expertize' value="Immigration Law"/>Immigration Law</br>
                     </td></tr>
                     
                     
                <tr><td>Start year of practice law:</td><td><form:input path="year"/></td></tr> 
                   <tr><td>Upload image:</td><td><form:label path="image"/><INPUT  id="image" type="file" name="file"></input></td></tr> 
                  <tr> &nbsp;&nbsp;&nbsp;</tr>
                  <tr>&nbsp;&nbsp;&nbsp;</tr>
                   
                   
                   <tr><td><input style="margin-left:30%;"  type="submit" value="Register" ></td><td><input type="reset" value="Reset"></td></tr>
                  </table>
                  
                   
				
                
            </form:form>

      </body>

</body>
</html>
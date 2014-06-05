<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<title>Home</title>

  
	    <style>
	     #nav{PADDING-RIGHT: 0px; PADDING-LEFT: 25px; BACKGROUND: url(http://myprofilebackgrounds.com/myspace-backgrounds/images/Colors%20~%20Grey/rainbg.gif) no-repeat; LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 122px; PADDING-TOP: 8px; LIST-STYLE-TYPE: none;font:15px Helvetica; text-color: white;}
        #nav li{padding-bottom:6px;}
        HTML #nav LI {HEIGHT: 1%}
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
     
     <script type="text/javascript">

     var image1=new Image()
     image1.src="http://us.123rf.com/400wm/400/400/andreyuu/andreyuu1209/andreyuu120900032/15407902-lawyer-in-court.jpg"
     var image2=new Image()
     image2.src="http://www.oregonscriminaldefenselawyers.com/Portals/125904/images/criminal%20court-resized-600.jpg"
     var image3=new Image()
     image3.src="http://www.coloradospringscriminallawyerblog.com/Defendant%20with%20Attorney%20In%20Court.jpg"
     var image4=new Image()
     image4.src="http://www.satherlaw.com/wp-content/uploads/2012/12/bankruptcy-lawyer.jpg"
     var image5=new Image()
     image5.src="http://4.bp.blogspot.com/_7V_j0R-6AD4/SZG8CD08DsI/AAAAAAAAAMo/PbVB5jw08aE/s400/59-supreme_court_reporter.jpg"
     var image6=new Image()
     image6.src="http://thakerlaw.com/wp-content/uploads/2012/02/Courtroom1.jpg"


     function validate(){
			var emailid=document.newslform.email.value;
			var apos=document.newslform.email.value.indexOf("@");
			var dotpos=document.newslform.email.value.lastIndexOf(".");
			if((apos<1)||((dotpos-apos)<2))
				{
					alert('Please Provide Valid Email ID');
                    
					document.newslform.email.value="";
					return false;
				}
	}
	
  </script>
     
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
            <tr><td align="right">
            <c:choose>
				<c:when test="${sessionuser == null}">
				<span style="border-right: #C8BBBE thin solid;"><a href="/Bvvo/user/Login.html">Home</a></span>
				
				</c:when>

				<c:otherwise>
				<span style="border-right: #C8BBBE thin solid;"><a href="/Bvvo/user/Logout.html">Logout</a></span>
					<br />
				</c:otherwise>
			</c:choose>
            
            <span style="border-right: #C8BBBE thin solid;" ><a  href="/Bvvo/user/SearchLawyer.html">SearchLawyer</a></span>
           
            
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
					    
					    
					  </ul>  
          
            </td></tr>
            <tr><td>&nbsp;</td></tr>
         </table>
         
          <table style="width:100%" border="0">
       <tr>
        <td>
            <table align="left" style="border-right: #C8BBBE thin solid;" border="0">
                <tr>
                   <td><a href="#"><img src="http://us.cdn4.123rf.com/168nwm/outstyle/outstyle1003/outstyle100300005/6730138-black-check-mark-isolated-on-white-part-of-a-series.jpg" width="30px" height="30px" border="0"></a>
                   Know about different cases we deal</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                   <td><a href="#"><img src="http://us.cdn4.123rf.com/168nwm/outstyle/outstyle1003/outstyle100300005/6730138-black-check-mark-isolated-on-white-part-of-a-series.jpg" width="30px" height="30px" border="0"></a>
                   Ask lawyers for help</td>
                </tr>
                 <tr><td>&nbsp;</td></tr>
                <tr>
                   <td><a href="#"><img src="http://us.cdn4.123rf.com/168nwm/outstyle/outstyle1003/outstyle100300005/6730138-black-check-mark-isolated-on-white-part-of-a-series.jpg" width="30px" height="30px" border="0"></a>
                   Know about our services</td>
                </tr>
                 <tr><td>&nbsp;</td></tr>
                 <tr>
                   <td><a href="#"><img src="http://us.cdn4.123rf.com/168nwm/outstyle/outstyle1003/outstyle100300005/6730138-black-check-mark-isolated-on-white-part-of-a-series.jpg" width="30px" height="30px" border="0"></a>
                   Know the news</td>
                </tr>
                 <tr><td>&nbsp;</td></tr>
                <tr>
                    <td><a href="#"><img  src="http://us.cdn4.123rf.com/168nwm/outstyle/outstyle1003/outstyle100300005/6730138-black-check-mark-isolated-on-white-part-of-a-series.jpg" width="30px" height="30px" border="0"></a>
                    Know our contact information</td>
                </tr>
                <tr><td>&nbsp;&nbsp;&nbsp;</td></tr>
               <tr>
                  
               </tr><tr><td>&nbsp;</td></tr>

               <tr align="left">
               
               </tr>
               
				<tr><td style="font:14px verdana;color:black;">
			
				</td></tr>
				
              </table>
          </td>
              
                <td>
                  <table border="0" width="100%">
                  <tr>
                  <td>
                  <table  border="0" cellpadding="0" cellspacing="0">
                  <tr>
                  <td>&nbsp;&nbsp;&nbsp;</td>

                  <td>

                     <UL id=nav>

                      <LI>&nbsp;</LI><LI>L-Loyal</LI>
                     <LI>A-Adherence</LI>
                     <LI>W-Wise</LI>
                     <LI>Y-Yearnful</LI>
                     <LI>E-Encourage</LI>
                     <LI>R-Revitalize</LI>
                     <LI>&nbsp;</LI></UL>
                   </td>

                     <td align="left">

                            <img src="http://us.123rf.com/400wm/400/400/andreyuu/andreyuu1209/andreyuu120900032/15407902-lawyer-in-court.jpg"" width="300px" height="190px" name="slide" > 
                           <script type="text/javascript">
                           var step=1
                           function slideit(){
                           if (!document.images)
                           return
                           document.images.slide.src=eval("image"+step+".src")
                           if (step<6)
                           step++
                           else
                           step=1
                           setTimeout("slideit()",3000)
                           }
                           slideit()
                           </script>

                     </td></tr>
                      </table></td>

                

                     </table>
         

</body>
</html>


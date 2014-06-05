<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 
<title>Lawyer Review</title>
<script  type="text/javascript" language="javascript" ">

var sMax;	// Isthe maximum number of stars
var holder; // Is the holding pattern for clicked state
var preSet; // Is the PreSet value onces a selection has been made
var rated;

// Rollover for image Stars //
function rating(num){
	sMax = 0;	// Isthe maximum number of stars
	for(n=0; n<num.parentNode.childNodes.length; n++){
		if(num.parentNode.childNodes[n].nodeName == "A"){
			sMax++;	
		}
	}
	
	if(!rated){
		s = num.id.replace("_", ''); // Get the selected star
		a = 0;
		for(i=1; i<=sMax; i++){		
			if(i<=s){
				document.getElementById("_"+i).className = "on";
				document.getElementById("rateStatus").innerHTML = num.title;	
				holder = a+1;
				a++;
			}else{
				document.getElementById("_"+i).className = "";
			}
		}
	}
}

// For when you roll out of the the whole thing //
function off(me){
	if(!rated){
		if(!preSet){	
			for(i=1; i<=sMax; i++){		
				document.getElementById("_"+i).className = "";
				document.getElementById("rateStatus").innerHTML = me.parentNode.title;
			}
		}else{
			rating(preSet);
			document.getElementById("rateStatus").innerHTML = document.getElementById("ratingSaved").innerHTML;
		}
	}
}

// When you actually rate something //
function rateIt(me){
	if(!rated){
		document.getElementById("rateStatus").innerHTML = document.getElementById("ratingSaved").innerHTML + " :: "+me.title;
		preSet = me;
		rated=1;
		sendRate(me);
		rating(me);
	}
}

// Send the rating information somewhere using Ajax or something like that.
function sendRate(sel){
	alert("Your rating was: "+sel.title);
}


</script>
<style type="text/css">

.rating:not(:checked) > input {
    position:absolute;
    top:-9999px;
    clip:rect(0,0,0,0);
}

.rating:not(:checked) > label {
    float:right;
    width:1em;
    padding:0 .1em;
    overflow:hidden;
    white-space:nowrap;
    cursor:pointer;
    font-size:200%;
    line-height:1.2;
    color:#ddd;
    text-shadow:1px 1px #bbb, 2px 2px #666, .1em .1em .2em rgba(0,0,0,.5);
}

.rating:not(:checked) > label:before {
    content: '★ ';
}

.rating > input:checked ~ label {
    color: #f70;
    text-shadow:1px 1px #c60, 2px 2px #940, .1em .1em .2em rgba(0,0,0,.5);
}

.rating:not(:checked) > label:hover,
.rating:not(:checked) > label:hover ~ label {
    color: gold;
    text-shadow:1px 1px goldenrod, 2px 2px #B57340, .1em .1em .2em rgba(0,0,0,.5);
}

.rating > input:checked + label:hover,
.rating > input:checked + label:hover ~ label,
.rating > input:checked ~ label:hover,
.rating > input:checked ~ label:hover ~ label,
.rating > label:hover ~ input:checked ~ label {
    color: #ea0;
    text-shadow:1px 1px goldenrod, 2px 2px #B57340, .1em .1em .2em rgba(0,0,0,.5);
}

.rating > label:active {
    position:relative;
    top:2px;
    left:2px;
}
  
  
 
     
}
    
</style>
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




                <br><br>
                 <form:form modelAttribute="reviews">

          
              <table>
          <tr><td>  You are welcome to give reviews,comments so that we can improve ourselves.<br/></td></tr>
           &nbsp;<br/>
         <tr><td>    Review:<br/></td><td> <form:input path="title" type="text" size="25" style=" width:150px;height:20px;border:1px solid #BEC0C2;font:15px verdana" /></td></tr> 
           <tr><td>Comment: <br/> </td><td> <form:textarea rows="7" cols="6"  path ="message" style=" width:150px;height:20px;border:1px solid #BEC0C2;font:15px verdana" /></td></tr>
             <tr><td>Rate according to different areas :</td></tr> 
       <tr><td> 
        <fieldset class="rating">
    Knowledge: 
    <form:radiobutton path ="knowledge" id="star5" name="rating" value="5" /><label for="star5" title="Freaking Awesome">5 stars</label>
    <form:radiobutton path ="knowledge" id="star4" name="rating" value="4" /><label for="star4" title="Outstanding">4 stars</label>
    <form:radiobutton path ="knowledge" id="star3" name="rating" value="3" /><label for="star3" title="Pretty Good">3 stars</label>
    <form:radiobutton path ="knowledge" id="star2" name="rating" value="2" /><label for="star2" title="Kinda bad">2 stars</label>
    <form:radiobutton path ="knowledge" id="star1" name="rating" value="1" /><label for="star1" title="ehh...">1 star</label><br>
</fieldset>
</td></tr>
<tr><td>
<fieldset class="rating">
    Service:
    <form:radiobutton path ="service" id="star15" name="rating" value="5" /><label for="star15" title="Freaking Awesome">5 stars</label>
    <form:radiobutton path ="service" id="star14" name="rating" value="4" /><label for="star14" title="Outstanding">4 stars</label>
    <form:radiobutton path ="service" id="star13" name="rating" value="3" /><label for="star13" title="Pretty Good">3 stars</label>
    <form:radiobutton path ="service" id="star12" name="rating" value="2" /><label for="star12" title="Kinda bad">2 stars</label>
    <form:radiobutton path ="service" id="star11" name="rating" value="1" /><label for="star11" title="ehh...">1 star</label><br>
</fieldset>
</td></tr>
<tr><td>
<fieldset class="rating">
    Overall:
    <form:radiobutton path ="overall" id="star25" name="rating" value="5" /><label for="star25" title="Freaking Awesome">5 stars</label>
    <form:radiobutton path ="overall" id="star24" name="rating" value="4" /><label for="star24" title="Outstanding">4 stars</label>
    <form:radiobutton path ="overall" id="star23" name="rating" value="3" /><label for="star23" title="Pretty Good">3 stars</label>
    <form:radiobutton path ="overall" id="star22" name="rating" value="2" /><label for="star22" title="Kinda bad">2 stars</label>
    <form:radiobutton path ="overall" id="star21" name="rating" value="1" /><label for="star21" title="ehh...">1 star</label>
</fieldset>
</td></tr>
 
     
 
<tr><td>

<form:hidden path="email.id" value="${ses}"/>
<form:hidden path="lawyername.id" value="${param.id}"/> </td></tr><br/><br/><br/>
</table>
 <input type="submit" name= "submit" value="Submit" value="Post"><input type="reset" value="Reset" >

</form:form>
</body>
</html>
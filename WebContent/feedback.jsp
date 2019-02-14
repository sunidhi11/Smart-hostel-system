<%@include file="header.jsp"%>
<%
studentLoginCheck=false;
if(session.getAttribute("studentLoginCheck")!=null){
 studentLoginCheck=(Boolean)session.getAttribute("studentLoginCheck");}
if(studentLoginCheck==false){
	response.sendRedirect("studentLogin.jsp");
}
%>



<style>

.rate {
  border: 1px solid #cccccc;
  float: left;
  height: 46px;
  padding: 0 10px;
}

.rate:not(:checked) > input {
  position: absolute;
  top: -9999px;
}

.rate:not(:checked) > label {
  float: right;
  width: 1em;
  overflow: hidden;
  white-space: nowrap;
  cursor: pointer;
  font-size: 30px;
  color: #ccc;
}

.rate:not(:checked) > label:before { content: '★ '; }

.rate > input:checked ~ label { color: #ffc700; }

.rate:not(:checked) > label:hover, .rate:not(:checked) > label:hover ~ label { color: #deb217; }

.rate > input:checked + label:hover, .rate > input:checked + label:hover ~ label, .rate > input:checked ~ label:hover, .rate > input:checked ~ label:hover ~ label, .rate > label:hover ~ input:checked ~ label { color: #c59b08; }	
	
  
</style>
<body>
 
    
    	
<div class="container container-sm border"> 
<div class="container">
	<header class="container announcement-sm" style="text-align: center;">
		<h1 style="font-family: 'Open Sans',sans-serif;">GIVE YOUR VALUABLE FEEDBACK</h1>
	</header><hr>
  <div class="panel-body" id="accordion">
    <div class="well">
    <%if(request.getAttribute("feedmsg")!=null) {
	 String feedMsg = (String)request.getAttribute("feedmsg");
  %> <div class="alert alert-success alert-dismissable">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
   <h5><%=feedMsg %></h5></div>
  <%	
}%>
<form action='feedbackController' method='post'>
<table style="width:80%">
  <tr>
  <td><b>FOOD Quality:</b></td>
  <td><img src="images\\excellent.png"><input type="radio" name="food" value="excellent"></td>
  <td><img src="images\\good.png"><input type="radio" name="food" value="Good"></td>
  <td><img src="images\\average.png"><input type="radio" name="food" value="Average"></td>
  <td><img src="images\\poor.png"><input type="radio" name="food" value="Poor"></td>
  <td><img src="images\\terrible.png"><input type="radio" name="food" value="Terrible"></td>
</tr><br><br>
<tr>
  <td><b>Cleanliness:</b></td>
   <td><img src="images\\excellent.png"><input type="radio" name="clean" value="excellent"></td>
  <td><img src="images\\good.png"><input type="radio" name="clean" value="Good"></td>
  <td><img src="images\\average.png"><input type="radio" name="clean" value="Average"></td>
  <td><img src="images\\poor.png"><input type="radio" name="clean" value="Poor"></td>
  <td><img src="images\\terrible.png"><input type="radio" name="clean" value="Terrible"></td>
</tr>
<tr>
  <td><b>Maintainance Service:</b></td>
    <td><img src="images\\excellent.png"><input type="radio" name="maintain" value="excellent"></td>
  <td><img src="images\\good.png"><input type="radio" name="maintain" value="Good"></td>
  <td><img src="images\\average.png"><input type="radio" name="maintain" value="Average"></td>
  <td><img src="images\\poor.png"><input type="radio" name="maintain" value="Poor"></td>
  <td><img src="images\\terrible.png"><input type="radio" name="maintain" value="Terrible"></td>
</tr>
<tr>
  <td><b>staff :</b></td>
    <td><img src="images\\excellent.png"><input type="radio" name="staff" value="excellent"></td>
  <td><img src="images\\good.png"><input type="radio" name="staff" value="Good"></td>
  <td><img src="images\\average.png"><input type="radio" name="staff" value="Average"></td>
  <td><img src="images\\poor.png"><input type="radio" name="staff" value="Poor"></td>
  <td><img src="images\\terrible.png"><input type="radio" name="staff" value="Terrible"></td>
</tr>

<tr>
  <td><b>Security:</b></td>
   <td><img src="images\\excellent.png"><input type="radio" name="security" value="excellent"></td>
  <td><img src="images\\good.png"><input type="radio" name="security" value="Good"></td>
  <td><img src="images\\average.png"><input type="radio" name="security" value="Average"></td>
  <td><img src="images\\poor.png"><input type="radio" name="security" value="Poor"></td>
  <td><img src="images\\terrible.png"><input type="radio" name="security" value="Terrible"></td>
</tr>
</table>


<table>
<tr>
 <td><b>how do u rate our hostel:</b></td>
 <td><div class="rate">
  <input type="radio" id="star5" name="hostel" value="5" />
  <label for="star5" title="text">5 stars</label>
  <input type="radio" id="star4" name="hostel" value="4" />
  <label for="star4" title="text">4 stars</label>
  <input type="radio" id="star3" name="hostel" value="3" />
  <label for="star3" title="text">3 stars</label>
  <input type="radio" id="star2" name="hostel" value="2" />
  <label for="star2" title="text">2 stars</label>
  <input type="radio" id="star1" name="hostel" value="1" />
  <label for="star1" title="text">1 star</label>
</div>

</td>

</tr>

 <br>
<tr>
<td><b>Suggestion or Comment:</b></td>
<td><br><textarea name="message" rows="4" cols="50"  class="form-control" placeholder="comment here"></textarea></td>
</tr>

<tr><td><br> <b>Name :</b> <input type="text" name="stu_name" value="<%=session.getAttribute("studentName")%>" required  class="form-control" placeholder="Name">   </td>
<td style="padding-left: 20px"><b><br>Hostel id 
<span style="color:red;">*</span>: </b><input type="text" name="stu_hos_id" value="<%=session.getAttribute("hostelId")%>"required  class="form-control" placeholder="Hostel id"> </td> </tr>
  
<tr>
<td><br><button class="button button btn btn-default" type="reset">Reset</button>

<button class="button btn btn-success" type="submit">Submit</button></td>
</tr> 
</table>
</form>
</div></div></div></div>
<%@include file="footer.jsp" %>

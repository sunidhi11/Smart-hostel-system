 <%@include file="commonHeader.jsp" %> 
  <title>student_form</title>
<style>

td{
 padding-left:100px;
}
</style>
<div class="container container-sm border" style="">
	 
	 
	  <div class="container" >
	  <header class="container announcement-sm" style="text-align: center;">
	  <h1>STUDENT FORM</h1>
	  </header>
 <hr>
 
<div class="panel-group" id="accordian">
<div class="well">

<fieldset><legend>

<p style="text-align:center;color:red;font-family:Lucida Calligraphy;font-size:25px;">
<b>Upload Document</b></p></legend>

<% 			
		 String roll=request.getParameter("stu_roll");  
		System.out.println("roll no in form3"+roll);
		 String	name=request.getParameter("stu_name");
		 String course=request.getParameter("course");
		 String branch =request.getParameter("branch");
		 String mobile=  request.getParameter("stu_mob");//parsing
		 String email=     request.getParameter("stu_email");
		 String sem=     request.getParameter("sem");
		 String cgpa=   request.getParameter("stu_cgpa");
		 String enroll=    request.getParameter("stu_enroll");
		 String hostel=request.getParameter("stu_hostel");
		 String category=  request.getParameter("category");
		 String gender=    request.getParameter("gender");
     	 String bday = request.getParameter("stu_birth");
     	 String address=request.getParameter("stu_address");
     	 String accno=request.getParameter("stu_accno");
     //=========father detail================================	 
     	 String fname=request.getParameter("father");  
     	
		 String	mname=request.getParameter("mother");
		
		 String fmobile=request.getParameter("f_no");
				 
		 String femail=  request.getParameter("f_email");
		 String faddress=  request.getParameter("f_address");
		
		  String lname=request.getParameter("l_name");
		
		 String lmobile=request.getParameter("l_no");
		
		
		%>
<form action="RegisterStudent" method="post" enctype="MULTIPART/FORM-DATA">
<table style="width:80%">


<tr><td><input type="hidden" name="stu_roll"  value='<%=roll%>' ></td>
 <td><input type="hidden" name="stu_name"  value='<%=name%>'></td></tr>
 
 	<tr><td><input type="hidden" name="course"  value='<%=course%>' ></td>
 <td><input type="hidden" name="branch"  value='<%=branch%>' ></td></tr>
 
 	<tr><td><input type="hidden" name="stu_mob"  value='<%=mobile%>' ></td>
 <td><input type="hidden" name="stu_email"  value='<%=email%>' ></td></tr>
 
 	<tr><td><input type="hidden" name="sem"  value='<%=sem%>'></td>
 <td><input type="hidden" name="stu_cgpa"  value='<%=cgpa%>' ></td></tr>
               
 	<tr><td><input type="hidden" name="stu_enroll"  value='<%=enroll%>'></td>
 <td><input type="hidden" name="stu_hostel"  value='<%=hostel%>' ></td></tr>
 	
 		<tr><td><input type="hidden" name="category"  value='<%=category%>'></td>
 <td><input type="hidden" name="gender"  value='<%=gender%>'></td></tr>
 
 	 	<tr><td><input type="hidden" name="stu_birth"  value='<%=bday%>'></td>
 <td><input type="hidden" name="stu_address"  value='<%=address%>'></td></tr>
 	
 	<tr> <td><input type="hidden" name="stu_accno"  value='<%=accno%>' ></td></tr> 
 <tr><td><input type="hidden" name="father"  value='<%=fname%>' ></td>
 <td><input type="hidden" name="mother"  value='<%=mname%>' ></td></tr>
 
 	<tr><td><input type="hidden" name="f_no"  value='<%=fmobile%>' ></td>
</tr>
 
 	<tr><td><input type="hidden" name="f_address"  value='<%=faddress%>' ></td>
 <td><input type="hidden" name="f_email"  value='<%=femail%>'></td></tr>
 
 	<tr><td><input type="hidden" name="l_name"  value='<%=lname%>'></td>
 <td><input type="hidden" name="l_no"  value='<%=lmobile%>'></td></tr>

 
<tr><td><br><b> Student image :</b> 
<input type="file" accept="image/*"  name="simg" onchange="showMyImage(this)" />
<!-- <img  id="thumbnil" style="width:10%; height=5%; margin-top:10px;"  src="" alt="image" ></td> -->

 <td><br><b> Student thunmb :</b> 
 
 <input type="file" accept="image/*"  name="s_timg" onchange="showMyImage(this)" />
<!-- <img  id="stu_timg" src="" style="height:5%;width:10%;border-width:0px;"></td></tr> -->

<tr><td><br><b> Student result :</b>
 
 <input type="file" accept="image/*"  name="s_res" onchange="showMyImage(this)" />
<!-- <img  id="stu_result" src="" style="width:10%;height:5%;border-width:0px;"></td> -->

<td><br><b> Category Certificate :</b> 

<input type="file" accept="image/*"  name="s_cat" onchange="showMyImage(this)" />
<!-- <img  id="stu_certi" src="" style="width:10%;height:5%;border-width:0px;"></td></tr> -->

<tr>
<td><br><b> Father image :</b> 
<input type="file" accept="image/*"  name="f_img" onchange="showMyImage(this)" />
<!-- <img id="stu_f_img" src="" style="width:10%;height:5%;border-width:0px;"></td></tr> -->

<tr>
  <td><a href="stuform2.jsp" class="btn btn-info" role="button">Back</a></td>
 <td><br><br><input type="submit" value="submit" onclick="myfunction();"></td></tr>


</table>
</form>
</fieldset>

</div>
</div>
</div>
</div>



<!-- <script type="text/javascript">
function showMyImage(fileInput) {
    var files = fileInput.files;
    for (var i = 0; i < files.length; i++) {           
        var file = files[i];
        var imageType = /image.*/;     
        if (!file.type.match(imageType)) {
            continue;
        }           
        var img=document.getElementById("thumbnil");            
        img.file = file;    
        var reader = new FileReader();
        reader.onload = (function(aImg) { 
            return function(e) { 
                aImg.src = e.target.result; 
            }; 
        })(img);
        reader.readAsDataURL(file);
    }    
}

function showMyImage(fileInput) {
    var files = fileInput.files;
    for (var i = 0; i < files.length; i++) {           
        var file = files[i];
        var imageType = /image.*/;     
        if (!file.type.match(imageType)) {
            continue;
        }           
        var img=document.getElementById("stu_timg");            
        img.file = file;    
        var reader = new FileReader();
        reader.onload = (function(aImg) { 
            return function(e) { 
                aImg.src = e.target.result; 
            }; 
        })(img);
        reader.readAsDataURL(file);
    }    
}

function showMyImage(fileInput) {
    var files = fileInput.files;
    for (var i = 0; i < files.length; i++) {           
        var file = files[i];
        var imageType = /image.*/;     
        if (!file.type.match(imageType)) {
            continue;
        }           
        var img=document.getElementById("stu_result");
        img.file = file;    
        var reader = new FileReader();
        reader.onload = (function(aImg) { 
            return function(e) { 
                aImg.src = e.target.result; 
            }; 
        })(img);
        reader.readAsDataURL(file);
    }    
}

function showMyImage(fileInput) {
    var files = fileInput.files;
    for (var i = 0; i < files.length; i++) {           
        var file = files[i];
        var imageType = /image.*/;     
        if (!file.type.match(imageType)) {
            continue;
        }           
        var img=document.getElementById("stu_certi");            
        img.file = file;    
        var reader = new FileReader();
        reader.onload = (function(aImg) { 
            return function(e) { 
                aImg.src = e.target.result; 
            }; 
        })(img);
        reader.readAsDataURL(file);
    }    
}

function showMyImage(fileInput) {
    var files = fileInput.files;
    for (var i = 0; i < files.length; i++) {           
        var file = files[i];
        var imageType = /image.*/;     
        if (!file.type.match(imageType)) {
            continue;
        }           
        var img=document.getElementById("stu_f_img");            
        img.file = file;    
        var reader = new FileReader();
        reader.onload = (function(aImg) { 
            return function(e) { 
                aImg.src = e.target.result; 
            }; 
        })(img);
        reader.readAsDataURL(file);
    }    
}
</script> -->

 <%@include file="footer.jsp" %>
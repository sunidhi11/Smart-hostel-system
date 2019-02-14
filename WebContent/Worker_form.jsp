<%@include file="adminHeader.jsp" %>
<div class="container container-sm border"> 
<div class="container">
	<header class="container announcement-sm" style="text-align: center;">
		<h1 style="font-family: 'Open Sans',sans-serif;">Worker Form</h1>
	</header><hr>
    <div class="panel-body" id="accordion">
    <div class="well"> 
    

<%if(session.getAttribute("confirm")!=null) {%>
<div class="alert alert-success alert-dismissable" style="text-align: center;">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong></strong> <%="Record inserted successfully" %>
  
</div>
<%session.removeAttribute("confirm"); %>


<%} %>
 


<form class="form-horizontal" action="AddWorkerController" style="margin-left: 150px;"  method="post">
  <table  >  <tr><td><div class="form-group">
      <label class="control-label col-sm-4" for="email">Date Of Joining :</label>
      <div class="col-sm-8">
        <input type="date" class="form-control" id="date" placeholder="Date Of Joining" name="join" style="width: 100%;">
      </div>
    </div></td>
    <td style="padding-left:30px"><div class="form-group">
      <label class="control-label col-sm-4" for="pwd">Name:</label>
      <div class="col-sm-8">          
        <input type="text" class="form-control" id="text" placeholder="Enter Name" name="name" style="width: 100%;">
      </div>
    </div>
    </td></tr>
    
   <tr><td> <div class="form-group">
      <label class="control-label col-sm-4" for="dob">Date Of Birth:</label>
      <div class="col-sm-8">          
        <input type="date" class="form-control" id="dob" placeholder="Enter Date Of Birth " name="birth" style="width: 100%;">
      </div>
    </div>
    </td>

    
   <td style="padding-left:30px"> <div class="form-group">
      <label class="control-label col-sm-4" for="name">Father's Name:</label>
      <div class="col-sm-8">          
        <input type="text" class="form-control" id="name" placeholder="Enter Father Name" name="father" style="width: 100%;">
      </div>
    </div>
    </td></tr>
    
     <tr> <td> <div class="form-group">
      <label class="control-label col-sm-4" for="name">Mother's Name:</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="name" placeholder="Enter mother name" name="mother" style="width: 100%;">
      </div>
    </div></td>
    
       <td style="padding-left:30px"><div class="form-group">
      <label class="control-label col-sm-4" for="No">Mobile No:</label>
      <div class="col-sm-8">          
        <input type="text" class="form-control" id="No" placeholder="Enter Mobile No" name="mobile" style="width: 100%;">
      </div>
      </div>
      </td></tr>
      <tr><td> <div class="form-group">
      <label class="control-label col-sm-4" for="gender">Gender:</label>
      <div class="col-sm-8">          
  
      <select class="selectpicker form-control"  name="gender"  style="width: 100%">
        <option value="male">Male</option>
        <option value="female">Female</option>
        <option value="other">Other</option>
      </select>

      </div>
      </div></td>
      
      <td style="padding-left:30px"> <div class="form-group">
      <label class="control-label col-sm-4" for="number">Aadhar card no:</label>
      <div class="col-sm-8">          
        <input type="text" class="form-control" id="number" placeholder="Enter AAdhar Number" name="aadhar" style="width: 100%;">
      </div>
      </div></td></tr>
      
     <tr><td> <div class="form-group">
      <label class="control-label col-sm-4" for="address">Address:</label>
      <div class="col-sm-8">          
        <input type="text" class="form-control" id="address" placeholder="Enter Your Address " name="address" style="width: 100%;">
      </div>
      </div></td>
      
      
      <td style="padding-left:30px"> <div class="form-group">
      <label class="control-label col-sm-4" >photo:</label>
      <div class="col-sm-8">          
               <input type="file" placeholder="uploadimage" name="my_document" >
<!--         <img  src="../showimage.aspx?id=9724&amp;type=student" style="height:50%;width:30%;border-width:0px;" >
 -->      </div>
      </div>
      </td>
      </tr>
    
   <tr><td></td ><td><div class="form-group">        
      <div class="col-sm-offset-4 col-sm-8">
        <button type="submit" class="btn btn-default">Submit</button>
      </div>
    </div></td></tr>
    </table>
  </form>

</div>
</div>

</div>
</div>


<%@include file="adminHeader.jsp" %>
<title>Admin Mess Menu</title>


 
 <%/* HttpSession session = request.getSession();  */

 System.out.println("(Boolean)session.getAttribute() "+(Boolean)session.getAttribute("result"));
 if(session.getAttribute("result")!=null){%>
	 <div class="alert alert-info alert-dismissable">
	    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
	 <%if((Boolean)session.getAttribute("result")==true){%>
		 <strong>Sucess!</strong>Updated Sucessfully. 
	<% }else{%>
		<strong>Ohh!</strong>Updation Failed .  
	 <% }%>
	 </div>
	 
 <%}
 session.removeAttribute("result");
 System.out.println("(Boolean)session.getAttribute() "+(Boolean)session.getAttribute("result"));

 %>
 
<div class="container container-sm border" style="">
	 
	 
	  <div class="container" >
	  <header class="container announcement-sm" style="text-align: center;">
	  <h1>Mess Menu</h1>
	  </header>
 <hr>
 
<div class="panel-group" id="accordian">
<div class="well">

     <div class="row" >
  <div class="col-sm-10">
     <!-- <b>Mess Menu</b> --></div>
  <div class="col-sm-2" style="padding-left: 70px;padding-top:1px"> 
      <button type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#myModal">Edit Menu</button>
	 <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg ">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="color:red;">Enter values to edit </h4>
        </div>
        <div class="modal-body">
         <form action="Mess_Menu_Update_Controller" method="post">
<table style="width:80%">
<tr>
<td><br><b style="padding-right: 52px;">Day:</b> <select onchange="myMenu(this.value)" name="day" style="" class="form-control">
   <option value="0">select</option> 
   <option value="1">Monday</option>
    <option value="2">Tuesday</option>
     <option value="3">Wednesday</option>
     <option value="4">Thursday</option>
     <option value="5">Friday</option>
     <option value="6">Saturday</option>
     <option value="7">Sunday</option>
</select>
</td>
    <td><br><b>Break fast: </b>
    <input style="" type="text" name="breakfast" class="form-control" value="" id="breakfast"/>
     </td>   
     </tr>
     <tr>
<td><br><b style="padding-right: 52px;">Lunch:</b> 
<input style="" type="text" name="lunch" class="form-control" value="" id="lunch" />
</td>
    <td><br><b>Snacks: </b>
<input style="" type="text" name="snacks" class="form-control" value="" id="snacks"/>
     </td>   
     </tr>
     <tr>
<td><br><b style="padding-right: 52px;">Dinner:</b> 
<input style="" type="text" name="dinner" class="form-control" value="" id="dinner" />
</td>
    <td><br><b> </b><input type="submit" value="update">
     </td>   
     </tr>

      
     
     </table>
     </form>
        </div>
        <div class="modal-footer">
           <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</div>
 </div>
  
     <!--  <form action="Admin_Mess_Menu_Controller" method="get">
    
    <button class="btn btn-default btn-md pull-left pad" type="submit" value="" >view Menu</button>
   </form> -->
   
<br>
  <table  id="mytable" class="table  table-hover  table-striped ">
    <thead>
      <tr>
      <th>Id</th>
        <th>Day</th>
        <th>Breakfast</th>
        <th>Lunch</th>
         <th>Snacks</th>
          <th>Dinner</th>
      </tr>
    </thead>
    <tbody>
     <%if(session.getAttribute("menu_list")!=null){
      List<Mess_Menu> menuList=(List<Mess_Menu>)session.getAttribute("menu_list");
      
      for(Mess_Menu menu:menuList){%>	
	        <tr>
	        <td><%=menu.getId()%></td>
	        <td><%=menu.getDay()%></td>
	        <td><%=menu.getBreakfast()%></td>
	        <td><%=menu.getLunch()%></td>
	        <td><%=menu.getSnacks()%></td> 
	         <td><%=menu.getDinner()%></td> 
      </tr> 
      <%}}%> 
         
    </tbody>
  </table>
<p style="font-size:15px;text-align: center;font-family:italics;text-decoration:underline;color:red"><b>Note:Green vegetable depend on season and availabilty in market</b> </p>
 
</div>
<script>
function myMenu(n) {

    var x = document.getElementById("mytable").rows[n].cells;
    document.getElementById("breakfast").value=x[2].innerHTML;
    document.getElementById("lunch").value=x[3].innerHTML;
    document.getElementById("snacks").value=x[4].innerHTML;
    document.getElementById("dinner").value=x[5].innerHTML;
 
}
</script>
</div>
</div>
</div>

<jsp:include page="footer.jsp" />


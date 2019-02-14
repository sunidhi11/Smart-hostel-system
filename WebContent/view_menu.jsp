<%@include file="header.jsp" %>
<title>Mess Menu</title>



 <div class="container container-sm border" style="">
	 
	 
	  <div class="container" >
	  <header class="container announcement-sm" style="text-align: center;">
	  <h1>Mess Menu</h1>
	  </header>
 <hr>
 
<div class="panel-group" id="accordian">
<div class="well">

  
    <!--   <form action="Admin_Mess_Menu_Controller" method="get">
      <input type="hidden" name="user" value="1">
    <input type="hidden" name="admin" value="0"> 
   
    <button class="btn btn-default btn-md pull-left pad" type="submit" value="" >view Menu</button>
   </form>
 -->
  

  <table class="table  table-hover  table-striped">
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
</div>
</div>
</div>
<jsp:include page="footer.jsp" />



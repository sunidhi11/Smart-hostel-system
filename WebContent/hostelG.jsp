<%@include file="header.jsp" %>
<title>hostel G</title>
<style>
.secTab{
    border: 2px solid black;
    border-collapse: collapse;
	 padding: 5px;
    text-align: left;   
}
</style>

    
    	
<div class="container container-sm border"> 
<div class="container">
	<header class=" announcement-sm" style="text-align: center;">
		<h1 style="font-family: 'Open Sans',sans-serif;">HOSTEL-G</h1>
	</header><hr>
    <div class="panel-body" id="accordion">
    <div class="well">
    <%@include file="sidebar.jsp"%> 
   <div><img src="images\\girlsh2.jpg" style="width:100%;"> <br><br></div></div>
  <div class="panel panel-default " style="text-align: center;">
 <div class="panel-heading panel-heading-sm" style="background-color:#18192f;color:white;"><h1>Staff Details</h1></div>
    <div class="panel-body">
                <hr style="width:5px;height:5px;">
        <p class="welcome-description" style="font-family: 'Roboto', sans-serif;font-size: 14px;"> 
	    <table class="table">
    <thead>
     <tr>
       <th>Name</th>
        <th>Designation</th>
        <th>Contact</th>
      </tr>
    </thead>
    <tbody>
      <tr class="warning">
        <td><img src="images\\15.jpg"  class="img-circle" width="70px" height="70px"><br>Dr. MOU DASGUPTA</td>
        <td>WARDEN (HOSTEL G)</td>
        <td>7772071592</td>
      </tr>      
      <tr class="success">
        <td><img src="images\\15.jpg"  class="img-circle" width="70px" height="70px"><br>Dr. DEEPMALA SHARMA</td>
        <td>WARDEN (HOSTEL-G)</td>
        <td>Mob: 7489465263 <br>deepsha.maths@nitrr.ac.in</td>
      </tr>
      <tr class="danger">
        <td><img src="images\\15.jpg"  class="img-circle" width="70px" height="70px"><br>DEEPIKA SHARMA</td>
        <td>MATRON (HOSTEL-G)</td>
        <td>Mob.966912549<br>deepikasharmarpr@gmail.com</td>
      </tr>
      <tr class="info">
        <td><img src="images\\15.jpg"  class="img-circle" width="70px" height="70px"><br>HARIPRIYA SAO</td>
        <td>MATRON (HOSTEL-G)</td>
        <td>7879857469<br>shivpriyasahoo107@gmail.com</td>
      </tr>
      </tbody>
  </table>
	
   </div>
  </div>
  
 <div class="panel panel-default " style="text-align: center;">
 <span  data-toggle="collapse" data-target="#demo"> 
 <div class="panel-heading panel-heading-sm" style="background-color:#18192f;color:white;"><h1>Room Details</h1></button></div>
  </span> <div class="panel-body">
      
        <hr style="width:5px;height:5px;">
        <table class="table secTab" >
   <tbody>
     <th rowspan="3" class="secTab">Types of Room</th>
    <td class="secTab">2-seater</td></tr>
    <tr><td class="secTab">DOM</td></tr>
    <tr><td class="secTab">Hobby</td></tr>
	
	<th rowspan="3" class="secTab">Total no of rooms</th>
    <td class="secTab">2-seater</td><td class="secTab">60</td></tr>
    <tr><td class="secTab">DOM</td><td class="secTab">2</td></tr>
    <tr><td class="secTab">Hobby</td><td class="secTab">1</td></tr>

    <th rowspan="4" class="secTab">no of person</th>
    <td class="secTab">2-seater</td><td class="secTab">2</td></tr>
    <tr><td class="secTab">DOM1</td><td class="secTab">10</td></tr>
    <tr><td class="secTab">DOM2</td><td class="secTab">8</td></tr>
    <tr><td class="secTab">Hobby</td><td class="secTab">8</td></tr>
  
    <tr>
	<th class="secTab">Total no of students residing</th>
	<td class="secTab">250</td>
	</tr>
       </tbody>
  </table>
  </div></div></div></div></div>
<%@include file="footer.jsp" %>




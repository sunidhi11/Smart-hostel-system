
  <%@ page import="java.io.*" %>
  <%@ page import="java.sql.*" %>   
   <%@ page import="java.util.*" %>  
   <%@include file="adminHeader.jsp" %> 
   

<style type="text/css">

   
.btn1{
     width:100px;
     float:right;
}
 body{
	background-color: white;
	/* padding-top: 70px; */
}


</style>
<body>
   
    	
<div class="container container-sm border"> 
<div class="container">
	<header class="container announcement-sm" style="text-align: center;">
		<h1 style="font-family: 'Open Sans',sans-serif;">ALL NOTICES</h1>
	</header><hr>
    <div class="panel-body" id="accordion">
    <div class="well"> 
   
  
  <!-- Trigger the modal with a button -->
  <button type="button" class=" btn1 btn btn-info btn-md" data-toggle="modal" data-target="#myModaladd">
   <span class="glyphicon glyphicon-plus"></span> ADD</button>

  <!-- Modal -->
  <div class="modal fade" id="myModaladd" role="dialog">
    <div class="modal-dialog modal-lg ">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Select a file to upload </h4>
        </div>
        <div class="modal-body">
         <form action='noticeController' method='post' enctype="MULTIPART/FORM-DATA">
                 	
                 	<input type="file" name='my_notice'> 
        
        <br>
        Add Description<span style="color:red;">*</span> : <textarea name="description" required></textarea><br>
        
        
        </div>
        <div class="modal-footer">
         <button type="submit" class="btn btn-success btn-md">Add</button>
         </form> </div>
        </div>
      </div>
    </div>
   

  
 <%
    String fileName=null;
  Properties prop = new Properties();
 	InputStream input = null;
 	input = new FileInputStream("E:\\my_notices.properties");
 	int count=0;
 	try{
 	 prop.load(input); 
	 Enumeration<?> e = prop.propertyNames();
	 %><br><hr><div  style="overflow-x:auto;">
	 <table class="table table-striped">
	     <thead>
      <tr>
        <th>SNO</th>
        <th>File name</th>
        <th>Description</th>
        <th>&nbsp;</th>
          </tr>
    </thead><tbody>
	 <%
		while (e.hasMoreElements()) {
			count++;
			String key = (String) e.nextElement();
			String value = prop.getProperty(key);
			%>			 
      <tr>
        <td><%=count%></td>
        <td><a href="noticeDownload?name=<%=key%>"><%=key %></a></td>
        <td><%=value %></td>
         <td><button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#myModaldelete">
           <span class="glyphicon glyphicon-trash"></span></a></button></td>
      </tr>
			<!-- Modal -->
  <div class="modal fade" id="myModaldelete" role="dialog">
    <div class="modal-dialog modal-lg ">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Are you sure want to delete?</h4>
        </div>
        <div class="modal-body">
     <a href="noticeDelete?name=<%=key%>"><button type="submit" class="btn btn-success btn-md">Delete</button> </a>
        </div>
        <div class="modal-footer">
         </div>
            </div>
      </div>
    </div>
	<%	}%>
        </tbody></table>
 	<%}catch(Exception e){
 		e.printStackTrace();
 	}finally{
 		input.close();
 	}
   
 %>
    
    
 </div>
         
    </tbody>

</table>
</div></div>
</div>
<%@include file="footer.jsp" %>
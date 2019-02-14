    <%@ page import="java.sql.*" %>
     <%@page import="sis.com.bo.*" %>
     <%@page import="sis.com.controller.*" %>
     <%@page import="sis.com.dao.*" %>
     <%@page import="sis.com.dao.impl.*" %>
     <%@page import="sis.com.util.*" %>
     <%@page import="java.io.*" %>
     <%@page import="java.util.*" %>
     <%@include file="adminHeader.jsp" %>
<div class="container container-sm border"> 
<div class="container">
	<header class="container announcement-sm" style="text-align: center;">
		<h1 style="font-family: 'Open Sans',sans-serif;">Attendence</h1>
	</header><hr>
    <div class="panel-body" id="accordion">
    <div class="well"> 
	
 <form action="WorkerAttendence">
  <table class="table table-bordered" >
    <thead>
      <tr>
        <th><b>ID</b></th>
        <th><b>NAME</b></th>
         <th><b><%=new java.sql.Date(System.currentTimeMillis()) %></b></th>
      </tr>
    </thead>
   <%
   
  
		 
		 
		 Connection con = null;
		  PreparedStatement pstmt = null;
		  ResultSet rs=null;
		  Worker w=new Worker();
		  ArrayList<Worker>l1=new ArrayList<Worker>();
	 try {
			con  = SisDbUtil.getConnection();
			String sql="select *from Worker";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				
             %>
             <tbody>
             <tr>
               <td><%=rs.getLong(1) %></td>
               <td><%=rs.getString(2) %></td>
               <td><select>
               <option value="present">P</option>
               <option value="absent">A</option>
               </select></td>
             </tr>
           </tbody>
             
<% 
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			
			try {
				SisDbUtil.closeConnection(con);
				System.out.println("connection");
			} catch (SQLException e) {
			
				e.printStackTrace();
			}
			
		} 
	 
   
   %>
   
  </table>
   <input type="submit" value="submit">
  </form>
</div>
</div></div></div>
<%@include file="footer.jsp"%>
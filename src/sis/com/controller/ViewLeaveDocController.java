package sis.com.controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.bo.Leave;
import sis.com.bo.Student;
import sis.com.dao.StudentDao;
import sis.com.daoFactory.DaoFactory;

/**
 * Servlet implementation class ViewLeaveDocController
 */
public class ViewLeaveDocController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   		response.reset();
		response.setContentType("image/jpeg");		
		InputStream is1=null;
		InputStream is2=null;
		
		Long id=Long.parseLong(request.getParameter("id"));
		String name= request.getParameter("name");
		
		if(name.equalsIgnoreCase("image1")){
			StudentDao dao=DaoFactory.getStudentDao();
			Leave leave= dao.showLeaveStuDocumentById(id);
				 is1 = leave.getLeaveundertaking();
				 if(is1!=null){
					 System.out.println("....................");
						byte[] byteArrayData = new byte[1024];
						int size=0;
						while((size=is1.read(byteArrayData))!= -1 ){
							
							response.getOutputStream().write(byteArrayData,0,size);
						}	
				 }
		}if(name.equalsIgnoreCase("image2")){
		
			StudentDao dao=DaoFactory.getStudentDao();
			Leave leave= dao.showLeaveStuDocumentById(id);
			
			is2=leave.getLeaveMediacal();
			if(is2!=null){
				System.out.println("......................");
				byte[] byteArrayData = new byte[1024];
				int size=0;
				while((size=is2.read(byteArrayData))!= -1 ){
					
					response.getOutputStream().write(byteArrayData,0,size);
				
				}	
			}
		}	
   	}

	
   	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}

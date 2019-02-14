package sis.com.controller;

import java.io.IOException;

import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.bo.RegStudent;
import sis.com.bo.Student;
import sis.com.dao.StudentDao;
import sis.com.daoFactory.DaoFactory;

/**
 * Servlet implementation class ViewImageController
 */
public class ViewImageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.reset();
		response.setContentType("image/jpeg");
		HttpSession session = request.getSession();
		Student stu_parent =null;
		InputStream is1=null;
		InputStream is2=null;
		InputStream is3=null;
		InputStream is4=null;
		InputStream is5=null;

		
		Long id=Long.parseLong(request.getParameter("id"));
		String name= request.getParameter("name");
		
		
		
		if(name.equalsIgnoreCase("image1")){
			StudentDao dao=DaoFactory.getStudentDao();
			Student studentdoc= dao.showStuDocumentById(id);
				 is1 = studentdoc.getStudentImage();
				 if(is1!=null){
					 System.out.println("....................");
						byte[] byteArrayData = new byte[1024];
						int size=0;
						while((size=is1.read(byteArrayData))!= -1 ){
							
							response.getOutputStream().write(byteArrayData,0,size);
						}	
				 }
		}if(name.equalsIgnoreCase("image2")){
			/*if(session.getAttribute("stuparent")!=null){ 
				 stu_parent= (Student)session.getAttribute("stuparent");*/
			StudentDao dao=DaoFactory.getStudentDao();
			Student parent= dao.ShowStuParentById(id);
			System.out.println("in father image out");
			System.out.println("in father image out"+parent.getFatherMobile());
			is2=parent.getFatherImage();
			if(is2!=null){
				System.out.println("......................");
				byte[] byteArrayData = new byte[1024];
				int size=0;
				while((size=is2.read(byteArrayData))!= -1 ){
					
					response.getOutputStream().write(byteArrayData,0,size);
				
				}	
			}
		}	if(name.equalsIgnoreCase("image3")){
			StudentDao dao=DaoFactory.getStudentDao();
			Student studentdoc= dao.showStuDocumentById(id);
				 is3 = studentdoc.getStudentResult();
				 if(is3!=null){
						byte[] byteArrayData = new byte[1024];
						int size=0;
						while((size=is3.read(byteArrayData))!= -1 ){
							
							response.getOutputStream().write(byteArrayData,0,size);
						}	
				 }
		}if(name.equalsIgnoreCase("image4")){
			StudentDao dao=DaoFactory.getStudentDao();
			Student studentdoc= dao.showStuDocumentById(id);
				 is4 = studentdoc.getStudentCategory();
				 if(is4!=null){
						byte[] byteArrayData = new byte[1024];
						int size=0;
						while((size=is4.read(byteArrayData))!= -1 ){
							
							response.getOutputStream().write(byteArrayData,0,size);
						}	
				 }
		}if(name.equalsIgnoreCase("image5")){
			StudentDao dao=DaoFactory.getStudentDao();
			Student studentdoc= dao.showStuDocumentById(id);
				 is5 = studentdoc.getStudentThumb();
				 if(is5!=null){
						byte[] byteArrayData = new byte[1024];
						int size=0;
						while((size=is5.read(byteArrayData))!= -1 ){
							
							response.getOutputStream().write(byteArrayData,0,size);
						}	
				 }
		}
	
	}   //get
}  //class


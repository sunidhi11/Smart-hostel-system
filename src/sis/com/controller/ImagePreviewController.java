package sis.com.controller;

import java.io.IOException;

import java.io.InputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.bo.RegStudent;

/**
 * Servlet implementation class ImagePreviewController
 */
public class ImagePreviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.reset();
		response.setContentType("image/jpeg");
		
		Long id=Long.parseLong(request.getParameter("id"));
		
		
		HttpSession session = request.getSession();
		if((RegStudent)session.getAttribute("regstuinfo")!=null){
			RegStudent regstudent=(RegStudent)session.getAttribute("regstuinfo");
			if(id==regstudent.getEnrollment()){
				InputStream is = regstudent.getSimage();
				System.out.println("##########iamge size in preview"+regstudent.getSimage().available());
				byte[] byteArrayData = new byte[1024];
				int size=0;
				//System.out.println(is.read(byteArrayData));
				
				while((size=is.read(byteArrayData))!= -1 ){
					
					response.getOutputStream().write(byteArrayData,0,size);
				}
				
				
			} //if
	}  //if
	}
}

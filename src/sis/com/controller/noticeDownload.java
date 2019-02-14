package sis.com.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class noticeDownload
 */
public class noticeDownload extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		File upload_path = new File("E:\\my_uploads\\"+name);

	  FileInputStream fis = new FileInputStream(upload_path);
		
		int buffer=0;
  	//  byte[] buffer = new byte[1024];
               while((buffer=fis.read()) != -1)
        {
            //fis.write(buffer);
            	   response.getWriter().write(buffer);
        }
        fis.close();
        
		
	}

}

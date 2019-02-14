package sis.com.controller;
import java.io.*;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;

/**
 * Servlet implementation class noticeDelete
 */
public class noticeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fileName = request.getParameter("name");
		
		File file = new File("E:\\my_uploads"+fileName);
		if(file.exists()){
			file.delete();
		}
		File file1=new File("E:\\my_notices.properties");
		Properties prop =new Properties();
		FileReader fr = new FileReader(file1);
		prop.load(fr);
		prop.remove(fileName);
		Writer out = new PrintWriter(file1);
		prop.store(out ,null);
		
		response.sendRedirect("adminNotice.jsp");
	}
       
}

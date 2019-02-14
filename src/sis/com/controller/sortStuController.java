package sis.com.controller;
 import java.util.*;

import sis.com.bo.*;

import java.io.IOException;
import java.util.List;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.bo.RegStudent;
import sis.com.dao.*;
import sis.com.daoFactory.DaoFactory;

/**
 * Servlet implementation class sortStuController
 */
public class sortStuController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RegStudentDao dao 	=DaoFactory.getRegStudentDao();
		    
		    String sort = request.getParameter("sortby");
			String course = request.getParameter("course");
			String branch = request.getParameter("branch");
			String semester = request.getParameter("sem");
			 HttpSession session = request.getSession();
			  if((sort!= null) && (course!=null) && (branch!=null)&& semester!=null){
				int sem = Integer.parseInt(semester);
				if(sort.equalsIgnoreCase("pointer")){
				List<RegStudent> getAllStudent = dao.getAllStuBy(course,branch,sem);
				session.setAttribute("sortStuList", getAllStudent);
				session.setAttribute("list",getAllStudent);
				//System.out.println(getAllStudent);
				response.sendRedirect("view_student1.jsp");
		       
				}
			 else if(sort.equalsIgnoreCase("category")){
				    if(request.getParameter("category") != null){
					String category = request.getParameter("category");
					System.out.println(category);
				    List<RegStudent> getAllStudent = dao.getAllByCategory(course,branch,sem,category);
				   // System.out.println(getAllStudent);
				    session.setAttribute("sortStuList",getAllStudent);
				    session.setAttribute("list", getAllStudent);
				    response.sendRedirect("view_student1.jsp");
			      }
			   } }
				else{	
				session.setAttribute("msg","Please fill the required field");
				response.sendRedirect("view_student1.jsp");
			    }
			  
}
}
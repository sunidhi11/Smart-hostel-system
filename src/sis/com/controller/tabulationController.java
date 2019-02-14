package sis.com.controller;

import java.util.*;
import java.io.IOException;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.dao.RegStudentDao;
import sis.com.daoFactory.DaoFactory;



public class tabulationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         
		String[] branches =null;
		String[] btech ={"Bio Medical","Bio tech","Chemical","Civil","Computer Science","Electrical","Electronics And Telecommunication","Information Technology",
				   "Mechanical","Mining","Metallurgical"};
		String[] mtech={"Geology","Bio Medical","Bio tech","Chemical","Civil","Computer Science","Electrical","Electronics And Telecommunication","Information Technology",
				   "Mechanical","Mining","Metallurgical"};
		String[] mca = {"MCA"};
		String[] barch = {"Architecture"};
         String course = request.getParameter("course");
         String sem = request.getParameter("sem");
         HttpSession session =request.getSession();
         
         if(course!=null && sem!=null){
        	 int semester = Integer.parseInt(sem);
        	 if(course.equalsIgnoreCase("b-tech")){
                branches = btech;
        	 }
        	 if(course.equalsIgnoreCase("m-tech")){
                 branches = mtech;
         	 }
        	 if(course.equalsIgnoreCase("mca")){
                 branches = mca;
         	 }
        	 if(course.equalsIgnoreCase("b-arch")){
                 branches = barch;
         	 }
        	 
    	 RegStudentDao dao = DaoFactory.getRegStudentDao();
		HashMap <String,Integer> selectedList = dao.getSelectedTabulation(course,semester,branches);
    	 HashMap <String,Integer> totalList = dao.getTotalTabulation(course, semester, branches);
    	        
    	         session.setAttribute("list", selectedList);
    	         session.setAttribute("list1", totalList);
    	         response.sendRedirect("view_tabulation.jsp");
         }
         else{	
				session.setAttribute("msg","Please fill options");
				response.sendRedirect("view_tabulation.jsp");
			    }
         
	}

}

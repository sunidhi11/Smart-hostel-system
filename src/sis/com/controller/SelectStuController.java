package sis.com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;
import sis.com.bo.RegStudent;
import sis.com.dao.RegStudentDao;
import sis.com.daoFactory.DaoFactory;

public class SelectStuController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no=0;
		HttpSession session = request.getSession();
		Integer semester =0;
		List<RegStudent> sortStuList = null;
		try{
			if( session.getAttribute("sortStuList")!=null){
			 sortStuList = (List<RegStudent>) session.getAttribute("sortStuList"); 
			}
		   no = Integer.parseInt(request.getParameter("number"));
		   System.out.println(no);
		   System.out.println(sortStuList);
		   String hostel = request.getParameter("hostel");
			System.out.println(hostel);
			RegStudentDao dao = DaoFactory.getRegStudentDao();
			
				  int number = dao.getSelectedStu(no,hostel,sortStuList);
				  request.setAttribute("number",number);
				  System.out.println(number);//1
				  request.getRequestDispatcher("view_student1.jsp").forward(request, response);
			  
		}catch(Exception e){
			//request.setAttribute("nuError", "please give proper number");
			//response.sendRedirect("view_student1.jsp");
			e.printStackTrace();
		}
		
		 		
		  
	}

}

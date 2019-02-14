package sis.com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sis.com.bo.RegStudent;
import sis.com.bo.Student;
import sis.com.dao.AllotStudentDao;
import sis.com.dao.StudentDao;
import sis.com.daoFactory.DaoFactory;

/**
 * Servlet implementation class AllotStudentController
 */
public class AllotStudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 AllotStudentDao dao=DaoFactory.getAllotedStudentDao();
		 List<RegStudent> selected_Student= dao.getAllSelectedStudents();
		 System.out.println("in controllet"+selected_Student);
			request.setAttribute("selected_Student",selected_Student);
			request.getRequestDispatcher("Confirm.jsp").forward(request, response);
	}

}

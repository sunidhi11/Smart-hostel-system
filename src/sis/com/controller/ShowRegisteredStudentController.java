package sis.com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.bo.RegStudent;
import sis.com.dao.RegStudentDao;
import sis.com.daoFactory.DaoFactory;


public class ShowRegisteredStudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RegStudentDao dao 	=DaoFactory.getRegStudentDao();
		List<RegStudent> getAllRegStudent=dao.getAllRegStudents();
		HttpSession session = request.getSession();
		session.setAttribute("list",getAllRegStudent);
		response.sendRedirect("view_student1.jsp");
	
	}
}

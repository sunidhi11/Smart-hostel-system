package sis.com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.dao.StudentDao;
import sis.com.daoFactory.DaoFactory;

/**
 * Servlet implementation class RestoreController
 */
public class RestoreController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Long id=Long.parseLong(request.getParameter("id"));
		System.out.println("id in permanent delete controlller.."+id);
		StudentDao dao=DaoFactory.getStudentDao();
		boolean isdelete= dao.restoreStudent(id);
		System.out.println("delete value iin permanent "+isdelete);
			session.setAttribute("isdelete",isdelete);
			response.sendRedirect("showAllDeleted.jsp");
	}

	
}

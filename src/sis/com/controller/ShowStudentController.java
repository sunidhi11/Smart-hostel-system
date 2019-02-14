package sis.com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.bo.SelectedStudent;
import sis.com.bo.Student;
import sis.com.dao.AllotStudentDao;
import sis.com.dao.StudentDao;
import sis.com.daoFactory.DaoFactory;

/**
 * Servlet implementation class ShowStudentController
 */
public class ShowStudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session= request.getSession();
		StudentDao dao=DaoFactory.getStudentDao();
		List<Student> stuList= dao.ShowAllStudent();
		if(stuList!=null){
			session.setAttribute("stulist",stuList);
		}
		response.sendRedirect("ShowAllStudent.jsp");
		/*request.getRequestDispatcher("ShowAllStudent.jsp").forward(request, response);*/
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
		if(session.getAttribute("isdelete")!=null){
			 boolean isdelete= (Boolean)session.getAttribute("isdelete");
			 session.setAttribute("isdelete",isdelete);
		 }
			 StudentDao dao=DaoFactory.getStudentDao();
				List<Student> stuList= dao.ShowAllStudent();
				if(stuList!=null){
					session.setAttribute("stulist",stuList);	
				}
				response.sendRedirect("ShowAllStudent.jsp");
				/*request.getRequestDispatcher("ShowAllStudent.jsp").forward(request, response);*/
		 }
	}


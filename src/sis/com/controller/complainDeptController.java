package sis.com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.bo.Complain;
import sis.com.dao.ComplainDao;
import sis.com.daoFactory.DaoFactory;

/**
 * Servlet implementation class complainDeptController
 */
public class complainDeptController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long id=Long.parseLong(request.getParameter("id"));
		ComplainDao dao=DaoFactory.getComplainDao();
		Complain complain=dao.getComplainbyId(id);
		System.out.println("null"+complain.getComplain());
		HttpSession session =request.getSession();
		request.setAttribute("complain",complain);
		request.getRequestDispatcher("email_dept_complain.jsp").forward(request, response);
	
		
		
	}


}

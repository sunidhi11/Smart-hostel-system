package sis.com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.bo.Complain;
import sis.com.dao.ComplainDao;
import sis.com.daoFactory.DaoFactory;

/**
 * Servlet implementation class ShowAllCleanliness
 */
public class ShowAllCleanliness extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ComplainDao dao =DaoFactory.getComplainDao();
		List<Complain> getAllStudent=dao.getAllClean();
		System.out.println("cont2");
		HttpSession session =request.getSession();
		session.setAttribute("list",getAllStudent);
		response.sendRedirect("view_complain.jsp");
	}

}

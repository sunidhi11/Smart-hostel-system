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
 * Servlet implementation class ShowComplainController
 */
public class ShowComplainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ComplainDao dao =DaoFactory.getComplainDao();
		List<Complain> getAllComplain=dao.getAllComplain();
		System.out.println("cont2");
		HttpSession session=request.getSession();
		session.setAttribute("list",getAllComplain);
		response.sendRedirect("view_complain.jsp");
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ComplainDao dao =DaoFactory.getComplainDao();
		List<Complain> getAllComplain=dao.getAllComplain();
		System.out.println("cont2");
		HttpSession session=request.getSession();
		session.setAttribute("list",getAllComplain);
		response.sendRedirect("view_complain.jsp");
	
	}

}

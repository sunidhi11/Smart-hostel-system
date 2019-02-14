package sis.com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sis.com.dao.ComplainDao;
import sis.com.daoFactory.DaoFactory;

/**
 * Servlet implementation class updateStatus
 */
public class updateStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id =Integer.parseInt(request.getParameter("id"));
		ComplainDao dao=DaoFactory.getComplainDao();
		boolean result=dao.updateStatus(id);
		response.sendRedirect("ShowComplainController");
	}


}

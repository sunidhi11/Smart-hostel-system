package sis.com.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.dao.RegStudentDao;
import sis.com.daoFactory.DaoFactory;
import sis.com.bo.RegStudent;;
/**
 * Servlet implementation class selectedStudentContoller
 */
public class selectedStudentContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String hostel=request.getParameter("hostel");
		RegStudentDao dao = DaoFactory.getRegStudentDao();
		List<RegStudent> selectedStu = dao.getAllSelectedStu(hostel);
		HttpSession  session = request.getSession();
		session.setAttribute("hostel", hostel);
		session.setAttribute("stuList", selectedStu);
		response.sendRedirect("view_Selected.jsp");
	}

}

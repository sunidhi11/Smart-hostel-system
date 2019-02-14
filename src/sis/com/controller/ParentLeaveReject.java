package sis.com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.dao.ParentDao;
import sis.com.daoFactory.DaoFactory;

public class ParentLeaveReject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ParentLeaveReject() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long leaveId=Long.parseLong(""+request.getParameter("id"));
		ParentDao p = DaoFactory.getParentDao();
		Boolean rejected=p.rejectLeave(leaveId);
		HttpSession session = request.getSession();
		if(rejected==true)
			session.setAttribute("leaveRejected", true);
		else
			session.setAttribute("leaveRejected", false);
		
		response.sendRedirect("parent_home.jsp");
		
	}//doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
package sis.com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.dao.ParentDao;
import sis.com.daoFactory.DaoFactory;

public class ParentLeaveDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ParentLeaveDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long leaveId=Long.parseLong(""+request.getParameter("id"));
		ParentDao p = DaoFactory.getParentDao();
		Boolean deleted=p.deleteLeave(leaveId);
		HttpSession session = request.getSession();
		if(deleted==true)
			session.setAttribute("leaveDeleted", true);
		else
			session.setAttribute("leaveDeleted", false);
		
		response.sendRedirect("parent_home.jsp");
		
	}//doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

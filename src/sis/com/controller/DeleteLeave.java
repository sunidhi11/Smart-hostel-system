package sis.com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.dao.AdminDao;
import sis.com.daoFactory.DaoFactory;

public class DeleteLeave extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteLeave() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession h = request.getSession();
		long leaveId = Long.parseLong(""+request.getParameter("leaveId"));
		AdminDao adminDao = DaoFactory.getAdminDao();
		boolean deleted=adminDao.deleteLeave(leaveId);
		if(deleted==true) {
			h.setAttribute("deleted", true);
			System.out.println("leave has been deleted");
		}else {
			h.setAttribute("deleted", true);
			System.out.println("leave doesn't deleted");
		}
		response.sendRedirect("AdminLeave.jsp");
	}//doGet

}


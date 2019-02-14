package sis.com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.dao.SuperAdminDao;
import sis.com.dao.impl.SuperAdminDaoImpl;

public class SuperAdminDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SuperAdminDeleteController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Long adminId = Long.parseLong(request.getParameter("adminId")+"");
		HttpSession session = request.getSession();
		SuperAdminDao superAdminDao = new SuperAdminDaoImpl();
		Boolean deleted = superAdminDao.deleteAdmin(adminId);
		session.setAttribute("deleted", deleted);
		superAdminDao.deleteAdmin(adminId);
		response.sendRedirect("SuperAdminCreaterController");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

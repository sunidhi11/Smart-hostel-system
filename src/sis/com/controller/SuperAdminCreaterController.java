package sis.com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.bo.Admin;
import sis.com.dao.SuperAdminDao;
import sis.com.dao.impl.SuperAdminDaoImpl;

public class SuperAdminCreaterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SuperAdminCreaterController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SuperAdminDao superAdminDao = new SuperAdminDaoImpl();
		List<Admin> allAdminList = superAdminDao.getAllAdmin();
		HttpSession session = request.getSession();
		session.setAttribute("allAdminList", allAdminList);
		response.sendRedirect("super_admin_creater.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

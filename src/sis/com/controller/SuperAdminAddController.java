package sis.com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.dao.SuperAdminDao;
import sis.com.dao.impl.SuperAdminDaoImpl;

public class SuperAdminAddController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SuperAdminAddController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username =null;
		String password =null;
		HttpSession session = request.getSession();
		System.out.println("username "+request.getParameter("username"));
		System.out.println("password "+request.getParameter("password"));
		if(request.getParameter("username")!=null && 
				request.getParameter("username").trim().equalsIgnoreCase("")!=true && 
				request.getParameter("password")!=null && 
				request.getParameter("password").trim().equalsIgnoreCase("")!=true) {
			username=request.getParameter("username");
			password=request.getParameter("password");
			SuperAdminDao superAdminDao = new SuperAdminDaoImpl();
			Boolean added = superAdminDao.addNewAdmin(username,password);
			session.setAttribute("added", true);
			response.sendRedirect("super_admin_creater.jsp");
		}else {
			session.setAttribute("errorInput", true);
			response.sendRedirect("super_admin_creater.jsp");
		}
	}

}

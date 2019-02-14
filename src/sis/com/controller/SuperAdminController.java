package sis.com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.dao.SuperAdminDao;
import sis.com.dao.impl.SuperAdminDaoImpl;

public class SuperAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SuperAdminController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = null;
		HttpSession session = request.getSession();
		SuperAdminDao superAdminDao = new SuperAdminDaoImpl();
		System.out.println("action is "+request.getParameter("action"));
		
		if(request.getParameter("action")!=null && request.getParameter("action").trim().equalsIgnoreCase("")) {
			action=request.getParameter("action");
		}
		
		if(action!=null && action.trim().equalsIgnoreCase("delete")) {
			Long adminId = Long.parseLong(request.getParameter("adminId")+"");
			superAdminDao.deleteAdmin(adminId);
			session.setAttribute("deleted", true);
		}//delete
		
		
		System.out.println("action.trim().equalsIgnoreCase(\"add\")"+action.trim().equalsIgnoreCase("add"));
		if(action!=null && action.trim().equalsIgnoreCase("add")) {
			System.out.println("inside action");
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			Boolean added=superAdminDao.addNewAdmin(username, password);
			System.out.println("added is "+added);
			session.setAttribute("added", added);
		}//add
		
		
		response.sendRedirect("super_admin_creater.jsp");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}//doPost

}

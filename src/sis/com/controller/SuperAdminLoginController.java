package sis.com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.bo.Admin;
import sis.com.bo.SuperAdmin;
import sis.com.dao.AdminDao;
import sis.com.dao.SuperAdminDao;
import sis.com.dao.impl.SuperAdminDaoImpl;
import sis.com.daoFactory.DaoFactory;
import sis.com.util.SisDbUtil;

public class SuperAdminLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;
	ResultSet rs=null;
       
    public SuperAdminLoginController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		
		Map<String,String> errorList = new HashMap<String,String>();
		
		String errorUsername=null;
		String errorPassword=null;

		if(username==null && username.trim().equals("")) {
			errorUsername="* invalid input";
			errorList.put("errorusername",errorUsername);
		}
		if(password==null && password.trim().equals("")) {
			errorUsername="* invalid password input";
			errorList.put("errorPassword",errorPassword);
		}
		if(errorUsername!=null || errorPassword!=null) {
			session.setAttribute("errorList", errorList);
			response.sendRedirect("super_admin_login.jsp");
		}
		//validation from database
		SuperAdminDao superAdminDao = new SuperAdminDaoImpl();
		SuperAdmin superAdmin= superAdminDao.validateSuperAdmin(username,password);
		System.out.println("superAdmin "+superAdmin.getUsername());
		if(superAdmin.getUsername()==null){
			String errorInvalidPassword="* invalid username and password";
			errorList.put("errorInvalidPassword",errorInvalidPassword);
			session.setAttribute("errorList", errorList);
			response.sendRedirect("super_admin_login.jsp");
		}else {
			//here is session
			session.setAttribute("username",superAdmin.getUsername());
			session.setAttribute("superAdminId",superAdmin.getSuperAdminId());
			session.setAttribute("superAdminLogin",true);
			response.sendRedirect("super_admin_home.jsp");
		}//else
	}//doPost
}//class

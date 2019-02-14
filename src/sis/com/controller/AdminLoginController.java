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
import sis.com.dao.AdminDao;
import sis.com.daoFactory.DaoFactory;
import sis.com.util.SisDbUtil;

public class AdminLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;
	ResultSet rs=null;
       
    public AdminLoginController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		
		Map<String,String> errorList = new HashMap<String,String>();
		
		String errorUsername=null;
		String errorPassword=null;

		if(userName==null && userName.trim().equals("")) {
			errorUsername="* invalid input";
			errorList.put("errorUsername",errorUsername);
		}
		if(password==null && password.trim().equals("")) {
			errorUsername="* invalid password input";
			errorList.put("errorPassword",errorPassword);
		}
		if(errorUsername!=null || errorPassword!=null) {
			session.setAttribute("error", errorList);
			response.sendRedirect("admin_login.jsp");
		}
		//validation from database
		Admin admin = null;
		AdminDao dao = DaoFactory.getAdminDao();
		
		boolean valid =false;
		valid = dao.validateLogin(userName, password);
		System.out.println("admin "+admin);
		
		if(valid==false) {
			System.out.println("admin is not valid=false");
			String errorInvalidPassword="* invalid username and password";
			errorList.put("errorInvalidPassword",errorInvalidPassword);
			session.setAttribute("error", errorList);
			response.sendRedirect("admin_login.jsp");
		}else {
			admin=dao.getByUsernamePassword(userName, password);
			//here is sesssion
			System.out.println("admin is true");
			session.setAttribute("username",admin.getUsername());
			session.setAttribute("adminId",admin.getAdminId());
			session.setAttribute("adminLogin",true);
			
			String jsessionid=session.getId();
			
			session.setAttribute("jsessionid",jsessionid);
			/*session.setMaxInactiveInterval(7200);//2h 2*60*60 setting max inactive time
*/			
			Long adminId = new Long(admin.getAdminId());
			System.out.println("admin.getAdminId()  "+admin.getAdminId());
			/*session.setAttribute("adminId", (Long)adminId);*/
			System.out.println("admin in controller"+session.getAttribute("adminId"));
			boolean firstTime = dao.checkFirstTime(admin.getAdminId());
			if(firstTime==true) {
				String url = "admin_registration.jsp";
				response.sendRedirect(url);
			}else {
				String url = "admin_home.jsp";
				response.sendRedirect(url);
			}//else
			
		}//else
	}//doPost
}//class

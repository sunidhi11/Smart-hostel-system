package sis.com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogOutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LogOutController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		long admin =Long.parseLong(request.getParameter("admin"));
		long student =Long.parseLong(request.getParameter("student"));
		long parent =Long.parseLong(request.getParameter("parent"));
		if(student==1){
		response.sendRedirect("Home.jsp");
		}if(admin==1){
			response.sendRedirect("admin_login.jsp");
			}
		if(parent==1){
			response.sendRedirect("parent_login.jsp");
			}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}

package sis.com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.bo.Mess_Menu;
import sis.com.dao.AdminDao;
import sis.com.daoFactory.DaoFactory;

/**
 * Servlet implementation class Admin_Mess_Menu_Controller
 */
public class Admin_Mess_Menu_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session= request.getSession();
		long admin=Long.parseLong(request.getParameter("admin"));
		long user1=Long.parseLong(request.getParameter("user"));
		request.getAttribute("user");
		AdminDao dao = DaoFactory.getAdminDao();
		List<Mess_Menu> menu_list= dao.ShowMessMenu();
		session.setAttribute("menu_list",menu_list);
		
		if(admin==1){
			session.setAttribute("admin",admin);
		response.sendRedirect("admin_mess_menu.jsp");}
		if(user1==1){
			session.setAttribute("user1",user1);
			response.sendRedirect("view_menu.jsp");}
			
		}
		
	
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	HttpSession session= request.getSession();
		AdminDao dao = DaoFactory.getAdminDao();
		List<Mess_Menu> menu_list= dao.ShowMessMenu();
		boolean result=(Boolean)request.getAttribute("result");
		session.setAttribute("result",result);
		session.setAttribute("menu_list",menu_list);
		response.sendRedirect("admin_mess_menu.jsp");
		
	}
}
	



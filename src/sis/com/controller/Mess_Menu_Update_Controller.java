package sis.com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.bo.Mess_Menu;
import sis.com.dao.AdminDao;
import sis.com.dao.StudentDao;
import sis.com.daoFactory.DaoFactory;

/**
 * Servlet implementation class Mess_Menu_Update_Controller
 */
public class Mess_Menu_Update_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean result= false;
		System.out.println("doPOst call");
		HttpSession session = request.getSession();
		Mess_Menu mess_menu = new Mess_Menu();
		int  day=Integer.parseInt(request.getParameter("day"));
		 switch(day){  
		    case 0:	mess_menu.setDay("monday");break;  
		    case 1: mess_menu.setDay("tuesday"); break;      
		    case 2 :mess_menu.setDay("wednesday");break;
		    case 3 :mess_menu.setDay("thursday");break;
		    case 4 :mess_menu.setDay("friday");break;
		    case 5 :mess_menu.setDay("saturday");break;
	    case 6 :mess_menu.setDay("sunday");break;
		    }  
		
		System.out.println("day in controller"+mess_menu.getDay());
		mess_menu.setBreakfast(request.getParameter("breakfast"));
		mess_menu.setLunch(request.getParameter("lunch"));
		mess_menu.setSnacks(request.getParameter("snacks"));
		mess_menu.setDinner(request.getParameter("dinner"));
		AdminDao dao=DaoFactory.getAdminDao();
		 result= dao.updateMenu(mess_menu);
		request.setAttribute("result",result);
		System.out.println("result mess menu"+result);
		 request.getRequestDispatcher("Admin_Mess_Menu_Controller").forward(request, response);
		 
		/*request.getRequestDispatcher("Admin_Mess_Menu_Controller").
		response.sendRedirect("Admin_Mess_Menu_Controller");*/

	}

}
package sis.com.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.bo.Complain;
import sis.com.dao.ComplainDao;
import sis.com.daoFactory.DaoFactory;
import sis.com.util.EmailSender;

/**
 * Servlet implementation class deptEmailController
 */
public class complainToStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email=request.getParameter("email");
		  int cid=Integer.parseInt(request.getParameter("c_id"));
		  int hid=Integer.parseInt(request.getParameter("h_id"));
		  String complain1=request.getParameter("complain");
		  String status=request.getParameter("status");
		  Date c_date=Date.valueOf(request.getParameter("c_date"));
		  Date s_date=Date.valueOf(request.getParameter("s_date"));
		  String mssg=request.getParameter("mssg");
		  String dept=request.getParameter("dept");
		  
		System.out.println(email);
		System.out.println(mssg);
		//long id=Long.parseLong(request.getParameter("id"));
		//int id1=Integer.parseInt(request.getParameter("id"));
		
	 boolean isFlag= EmailSender.sendEmail(email,mssg,"reply") ;
	 System.out.println(isFlag);
	  HttpSession session=request.getSession();

	 if(isFlag==true){
		ComplainDao dao=DaoFactory.getComplainDao();
		//Complain complain=dao.getComplainbyId(id);

		int sentEmail=dao.updateStatusStudent(cid);
		session.setAttribute("complain1","message send successfully");
		//response.sendRedirect("view_complain.jsp");
		response.sendRedirect("ShowComplainController");
	 }else{
			session.setAttribute("complain1","Check Your Internet Connection");

			//response.sendRedirect("view_complain.jsp");
			response.sendRedirect("ShowComplainController");

	 }
	
	}

}

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

/**
 * Servlet implementation class complainController
 */
public class complainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	Complain complain=new Complain();
	complain.setHostelId(Integer.parseInt(request.getParameter("stu_id")));
	complain.setComplainDate(Date.valueOf(request.getParameter("stu_date")));
	complain.setRoomNo(Integer.parseInt(request.getParameter("stu_room")));	
	complain.setDepartment(request.getParameter("department"));
	complain.setComplain(request.getParameter("complain"));
	complain.setEmail(request.getParameter("stu_email"));
	complain.setStatus("No");
	
	 System.out.println("complainController");
	 ComplainDao complainDao= DaoFactory.getComplainDao();
      Complain c=complainDao.insertComplain(complain);
      HttpSession session=request.getSession();
      session.setAttribute("confirm",c);
        response.sendRedirect("complain.jsp");
	}
}

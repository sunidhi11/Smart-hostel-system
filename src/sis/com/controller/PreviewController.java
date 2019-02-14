package sis.com.controller;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.bo.RegStudent;
import sis.com.dao.RegStudentDao;
import sis.com.daoFactory.DaoFactory;

/**
 * Servlet implementation class PreviewController
 */
public class PreviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		if((RegStudent)session.getAttribute("regstuinfo")!=null){
			RegStudent regstudent=(RegStudent)session.getAttribute("regstuinfo");
			System.out.println("image in preview controller"+regstudent.getSimage().available());
			System.out.println("thumb in preview controller"+regstudent.getSthumb().available());

		RegStudentDao dao=DaoFactory.getRegStudentDao();
        boolean result=dao.addStudent(regstudent);//function call
        
        session.setAttribute("result",result);
        response.sendRedirect("stuform1.jsp");
/*        request.getRequestDispatcher("stuform1.jsp").forward(request,response);
*/        
	}
	}
}

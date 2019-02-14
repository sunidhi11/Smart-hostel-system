package sis.com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.dao.WorkerDao;
import sis.com.daoFactory.DaoFactory;

/**
 * Servlet implementation class DeleteWorkerDetails
 */
public class DeleteWorkerDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long id= Long.parseLong(request.getParameter("id"));
		System.out.println(id);
	    		WorkerDao sd=DaoFactory.getWorkerDao();
	    		boolean worker=sd.deleteWorker(id);
    			HttpSession session=request.getSession();

	    		if(worker==true){
	    			System.out.println("deletion complete successfully");
	    			session.setAttribute("delete", "deletion complete successfully");
	    			response.sendRedirect("view_worker.jsp");
	    		}else{
	    			session.setAttribute("delete", "deletion failed");
	    			response.sendRedirect("view_worker.jsp");
	    		}

	}


}

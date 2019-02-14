package sis.com.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.bo.Worker;
import sis.com.dao.WorkerDao;
import sis.com.daoFactory.DaoFactory;

/**
 * Servlet implementation class UpdateWorkerDetails
 */
public class UpdateWorkerDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Worker worker=new Worker();
        String id=request.getParameter("id");
    	long sid=Long.parseLong(id) ;
    	worker.setId(sid);
    	
        worker.setName(request.getParameter("name"));
        worker.setFatherName(request.getParameter("father"));
        worker.setMotherName(request.getParameter("mother"));
        worker.setMobileno(Long.parseLong(request.getParameter("mobile")));
        worker.setAadharno(Long.parseLong(request.getParameter("aadhar")));
        worker.setAddress(request.getParameter("address"));
        worker.setGender(request.getParameter("gender"));
        String date1=request.getParameter("birth");
		Date dob=Date.valueOf(date1);
		worker.setDateofbirth(dob);
       WorkerDao dao=DaoFactory.getWorkerDao();
    		  boolean work=dao.updateWorker(worker);
    		  HttpSession session =request.getSession();
    		  if(work==true){
    			  session.setAttribute("update", "Details update succesfully");
    			  response.sendRedirect("view_worker.jsp");
    		  }else{
    			  session.setAttribute("update", "Updation is failed");
    			  response.sendRedirect("view_worker.jsp");
    		  }
    			  
    		 

	}

}

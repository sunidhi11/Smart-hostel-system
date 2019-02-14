package sis.com.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import sis.com.bo.Student;
import sis.com.bo.Worker;
import sis.com.dao.StudentDao;
import sis.com.dao.WorkerDao;
import sis.com.daoFactory.DaoFactory;

/**
 * Servlet implementation class WorkerController
 */
public class AddWorkerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//name,fatherName,motherName,address,mobile,gender,dob,doj
		
		String name=request.getParameter("name");
		System.out.println("name"+name);
		String fName=request.getParameter("father");
		String mName=request.getParameter("mother");
        String address=request.getParameter("address");
        String mono=request.getParameter("mobile");
        System.out.println(mono);
        long mobile=Long.parseLong(mono);
        String gender=request.getParameter("gender");
		String date1=request.getParameter("birth");
		Date dob=Date.valueOf(date1);
		String date=request.getParameter("join");
		Date doj=Date.valueOf(date);
		String aadhar=request.getParameter("aadhar");
        long aadharNo=Long.parseLong(aadhar); 
       Worker work=new Worker();
 
        work.setName(name);
        work.setFatherName(fName);
        work.setMotherName(mName);
        work.setAddress(address);
        work.setMobileno(mobile);
        work.setGender(gender);

        work.setDateofbirth(dob);
        work.setDateofjoinig(doj);
             
        work.setAadharno(aadharNo);

        
        
        WorkerDao dao=DaoFactory.getWorkerDao();
        
       /* List<Worker>s2=dao.getAllWorkers();
        for (Worker worker : s2) {
 		if(aadharNo==worker.getAadharno()){
 			request.setAttribute("error1", "please enter valid aadharno");
 			request.getRequestDispatcher("empForm.jsp").forward(request, response);
 		}
 		if(mobile==worker.getMobileno()){
 			request.setAttribute("error2", "please enter valid mobileno");
 			request.getRequestDispatcher("empForm.jsp").forward(request, response);
 		}
 		
 		
 	}*/
        Worker w=dao.addWorker(work);
        
       System.out.println(w);
       HttpSession session=request.getSession();
		session.setAttribute("confirm",w);
		
	    response.sendRedirect("Worker_form.jsp");
	}

}

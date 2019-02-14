package sis.com.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sis.com.bo.Student;
import sis.com.dao.StudentDao;
import sis.com.daoFactory.DaoFactory;

/**
 * Servlet implementation class ViewUpdateSubmitController
 */
public class ViewUpdateSubmitController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long flag=0;
		boolean result_student=false;
		boolean result_parent= false;
		boolean result_doc= false;
		Student student = new Student();
		student.setRollno(Long.parseLong(request.getParameter("stu_roll")));
		student.setName(request.getParameter("stu_name"));
		student.setCourse(request.getParameter("course"));
		student.setBranch(request.getParameter("branch"));
		student.setMobileno(request.getParameter("stu_mob"));
		student.setEmail(request.getParameter("stu_email"));
		student.setSemester(Integer.parseInt(request.getParameter("sem")));
		student.setCgpa(Float.parseFloat(request.getParameter("stu_cgpa")));
		student.setEnrollment(Long.parseLong(request.getParameter("stu_enroll")));
		student.setHostel(request.getParameter("stu_hostel"));
		student.setCategory(request.getParameter("category"));
		student.setGender(request.getParameter("gender"));
		student.setBirth(Date.valueOf(request.getParameter("stu_birth")));
		student.setAddress(request.getParameter("stu_address"));
		student.setAccno(request.getParameter("stu_accno"));
		Long hostelId=Long.parseLong(request.getParameter("stu_hostelId"));
		student.setHostelId(Long.parseLong(request.getParameter("stu_hostelId")));
		StudentDao dao=DaoFactory.getStudentDao();
		 result_student= dao.updatestudent(student);
		request.setAttribute("hostelId",hostelId);
		request.setAttribute("result_student",result_student);
		request.setAttribute("result_parent",result_parent);
		request.setAttribute("result_doc",result_doc);
		request.setAttribute("flag",flag);
		System.out.println("updation result"+result_student);
		System.out.println("updation result"+result_parent);
		request.getRequestDispatcher("ViewStudentController").forward(request, response);

	}  //post

}  //class

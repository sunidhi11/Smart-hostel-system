package sis.com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sis.com.bo.Student;
import sis.com.dao.StudentDao;
import sis.com.daoFactory.DaoFactory;

/**
 * Servlet implementation class ViewUpdateParentController
 */
public class ViewUpdateParentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean result_parent= false;
		boolean result_student= false;
		boolean result_doc= false;
		long flag=1;
	Long hostelId=Long.parseLong(request.getParameter("hostelId"));
	Student student = new Student();
	student.setFatherName(request.getParameter("father"));
	student.setMotherName(request.getParameter("mother"));
	student.setFatherMobile(request.getParameter("f_no"));
	student.setFatherAddress(request.getParameter("f_address"));
	student.setFatherEmail(request.getParameter("f_email"));
	student.setLocalGaurdianName(request.getParameter("l_name"));
	student.setLocalGaurdianMobile(request.getParameter("l_no"));
	student.setParentId(Long.parseLong(request.getParameter("hostelId")));
	StudentDao dao=DaoFactory.getStudentDao();
	 result_parent= dao.updateStuParent(student);
	
	request.setAttribute("hostelId",hostelId);
	request.setAttribute("result_student",result_student);
	request.setAttribute("result_parent",result_parent);

	request.setAttribute("result_doc",result_doc);
	request.setAttribute("flag",flag);
	System.out.println("updation result"+result_student);
	System.out.println("updation result"+result_parent);
	request.getRequestDispatcher("ViewStudentController").forward(request, response);
	
	}
}


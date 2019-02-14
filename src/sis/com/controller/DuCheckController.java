package sis.com.controller;

import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.bo.RegStudent;
import sis.com.bo.SelectedStudent;
import sis.com.bo.Student;
import sis.com.dao.AllotStudentDao;
import sis.com.dao.RegStudentDao;
import sis.com.dao.StudentDao;
import sis.com.dao.impl.StudentDaoImpl;
import sis.com.daoFactory.DaoFactory;
import sis.com.util.EmailSender;
import sis.com.util.PasswordGenerator;

/**
 * Servlet implementation class DuCheckController
 */
public class DuCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Random rand = new Random();	
	HttpSession session = request.getSession();
	String enrollment =	request.getParameter("h_enroll");
	Long enroll=Long.parseLong(enrollment);
	SelectedStudent s_student = new SelectedStudent();
	s_student.setEnrollment_no(enroll);
	System.out.println(enrollment);
	
	String duno = 	request.getParameter("duno");
	s_student.setDu_no(duno);
	System.out.println(duno);
	
	AllotStudentDao dao=DaoFactory.getAllotedStudentDao();
	SelectedStudent select_student= dao.checkDuNo(s_student);
	if(select_student.isUpdated_indb()==true){
		
		RegStudentDao rdao=DaoFactory.getRegStudentDao();
		RegStudent regstudentbyid =rdao.getRegStudentById(select_student.getEnrollment_no());
		// generate password
		String fname=regstudentbyid.getFname();
		String mname= regstudentbyid.getMname();
		String password= null;
		password= PasswordGenerator.generate(fname, mname);
		System.out.println("password in du check"+password);
		//father====================================================
		String no= "123456789026541865418645186547";
		int lengthno= rand.nextInt(20)+1;

		String father_username=regstudentbyid.getFname()+no.substring(lengthno,lengthno+2);
		String password_name1=regstudentbyid.getGender();
		String password_name2= regstudentbyid.getCategory();
		String password_father= null;
		password_father= PasswordGenerator.generate(password_name1,password_name2);
		System.out.println("password of father is"+password_father);
		if(password!= null){
		StudentDao sdao=  new StudentDaoImpl(request,response);
		long result=sdao.AddConfirmStudent(regstudentbyid,password,password_father,father_username);
		
		if(result<5){
			System.out.println("problm in adding student");
			String meassage="server problm try next time";
		
			session.setAttribute("hostelid",meassage);
		}else{
			
				String message_email= "ur seat is confirmed password is"+" "+password+" "+
						"hostel id is"+" "+result+"    "+"use ur id to confirm ur seat";
				String message_parent= "ur ward confirmation for hostel"+" "+password_father+" "+
						"username is"+" "+father_username+"    "+"use ur id for future use";
				boolean istrue= false;
				boolean istrueParent= false;
				istrue=EmailSender.sendEmail(regstudentbyid.getEmail(), message_email,"confirmation");
				istrueParent=EmailSender.sendEmail(regstudentbyid.getFemail(),message_parent,"confirmation");
				System.out.println("parent email status*******************"+istrueParent);
				if(istrue==true ){
					String message="sucessfully confirmed ur hostel id is"+result+"check ur email for password";
					System.out.println("ur password is messaged to u");
					session.setAttribute("hostelid",message);
				}//if
		}//else
			/*request.setAttribute("hostelid",message);*/
		}	
		
	}
	session.setAttribute("select_student",select_student);
	response.sendRedirect("Confirm.jsp");
	 	
	}   //post

}  //class












































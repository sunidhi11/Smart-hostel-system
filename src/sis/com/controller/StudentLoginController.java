package sis.com.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.bo.Student;
import sis.com.dao.StudentDao;
import sis.com.daoFactory.DaoFactory;

/**
 * Servlet implementation class StudentLoginController
 */
public class StudentLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String userName = request.getParameter("userName");
		String password = request.getParameter("Password");
		System.out.println("usernamein controller"+userName);
		System.out.println("password in controller"+password);
		Map<String,String> errorList = new HashMap<String,String>();
		String errorUsername=null;
		String errorPassword=null;
		//validation of input whether there is any wrong input 
		if(userName==null && userName.trim().equals("")) {
			//System.out.println("flag-2");
			errorUsername="* invalid input";
			errorList.put("errorUsername",errorUsername);
		}
		if(password==null && password.trim().equals("")) {
			errorUsername="* invalid password input";
			errorList.put("errorPassword",errorPassword);
			//System.out.println("flag-3");
		}
		if(errorUsername!=null || errorPassword!=null) {
			//System.out.println("flag-4");
			session.setAttribute("error", errorList);
			response.sendRedirect("studentLogin.jsp");
					}
		//validation from database
		StudentDao studao=DaoFactory.getStudentDao();
		Student student= studao.validateStudentLogin(userName,password);
		//System.out.println("student object have -->> "+student.getHostelId());
		if(student==null) {
			String errorInvalidPassword="* invalid username and password";
			errorList.put("errorInvalidPassword",errorInvalidPassword);
			response.sendRedirect("studentLogin.jsp");
			
		}
		//here is sesssion
		if(student!=null){
			
			session.setAttribute("studentLoginCheck",true);
			Long hostelId= (Long)student.getHostelId();
			/*session.setAttribute("hostelId",hostelId);*/
			Student studentInSession= studao.ShowStudentById(hostelId);
			session.setAttribute("studentName",studentInSession.getName());
			session.setAttribute("hostelId",studentInSession.getHostelId());
			session.setAttribute("hostel",studentInSession.getHostel());
			session.setAttribute("email",studentInSession.getEmail());
			System.out.println("student in login controller*******"+studentInSession.getEmail());
			String jsessionid=session.getId();
			session.setAttribute("jsessionid",jsessionid);
			/*session.setMaxInactiveInterval(7200);//2h 2*60*60 setting max inactive time
	*/		String url = "hostelG.jsp";
			response.sendRedirect(url);
		}
	}

}

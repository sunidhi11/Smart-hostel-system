package sis.com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.bo.Leave;
import sis.com.bo.Student;
import sis.com.dao.StudentDao;
import sis.com.daoFactory.DaoFactory;

/**
 * Servlet implementation class ViewStudentController
 */
public class ViewStudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		Student student=null;
		Student stuparent= null;
		Student studoc=null;
		Long hostelId=Long.parseLong(request.getParameter("id"));
		Long flag_admin=Long.parseLong(request.getParameter("flag_admin"));		
		Long flag_student1=Long.parseLong(request.getParameter("flag_student"));
		System.out.println("hostel id is"+hostelId);
		if(hostelId!=null){
			StudentDao dao=DaoFactory.getStudentDao();
			 student= dao.ShowStudentById(hostelId);
			 stuparent= dao.ShowStuParentById(hostelId);
			 studoc= dao.showStuDocumentById(hostelId);
			 if(student!=null){
					session.setAttribute("student",student);
				}
				if(stuparent!=null){
					session.setAttribute("stuparent",stuparent);
				}
				if(studoc!=null){
					session.setAttribute("studoc",studoc);
				}
				if(flag_admin==1&flag_student1==0){
			response.sendRedirect("viewStudent.jsp");
			}
		if(flag_admin==0&flag_student1==1){
			List<Leave> leave_list= dao.recieveMessage(hostelId);
			session.setAttribute("leave_list",leave_list);
			 long n= dao.newMessage(hostelId);
			 session.setAttribute("number",n);
			if(leave_list!=null){
		    	 dao.setSeen(leave_list);
		     }
			session.setAttribute("flag_student1",flag_student1);
			response.sendRedirect("ViewStudentByStudent.jsp");
		}
		}

	}//get
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println("in controler***************");
			HttpSession session=request.getSession();
			Student student=null;
			Student stuparent= null;
			Student studoc=null;
			Long id= (Long)request.getAttribute("hostelId");
			System.out.println("in view controller....");
		if(id!=null){
				boolean result_student= (Boolean)request.getAttribute("result_student");
				boolean result_parent= (Boolean)request.getAttribute("result_parent");
				boolean result_doc=(Boolean)request.getAttribute("result_doc");
				long flag = (Long)request.getAttribute("flag");
				StudentDao dao=DaoFactory.getStudentDao();
				 student= dao.ShowStudentById(id);
				 stuparent= dao.ShowStuParentById(id);
				 studoc= dao.showStuDocumentById(id);
				 session.setAttribute("flag",flag);
				session.setAttribute("result_student",result_student);
				session.setAttribute("result_parent",result_parent);
				session.setAttribute("result_doc",result_doc);
				 if(student!=null){
						session.setAttribute("student",student);
					}
					if(stuparent!=null){
						session.setAttribute("stuparent",stuparent);
					}
					if(studoc!=null){
						session.setAttribute("stuparent",stuparent);
					}
					response.sendRedirect("viewStudent.jsp");
					
				}
		}  //post
} //class

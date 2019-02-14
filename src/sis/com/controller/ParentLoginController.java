package sis.com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.bo.*;
import sis.com.dao.*;
import sis.com.daoFactory.*;
import sis.com.util.*;

public final class ParentLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		Map<String,String> errorList = new HashMap<String,String>();
		String errorUsername=null;
		String errorPassword=null;
		//validation of input whether there is any wrong input 
		if(userName==null && userName.trim().equals("")) {
			errorUsername="* invalid input";
			errorList.put("errorUsername",errorUsername);
		}
		if(password==null && password.trim().equals("")) {
			errorUsername="* invalid password input";
			errorList.put("errorPassword",errorPassword);
		}
		if(errorUsername!=null || errorPassword!=null) {
			session.setAttribute("error", errorList);
			response.sendRedirect("parent_login.jsp");
		}
		//validation from database
		Student student = DaoFactory.getStudent();
		ParentDao parentDao = DaoFactory.getParentDao();
		student = parentDao.validateParent(userName, password);
		if(student==null) {
			String errorInvalidPassword="* invalid username and password";
			errorList.put("errorInvalidPassword",errorInvalidPassword);
			session.setAttribute("error", errorList);
			
			response.sendRedirect("parent_login.jsp");
		}else {
			System.out.println("parentid>>>>"+student.getParentId());
			//here is sesssion
			session.setAttribute("parentLoginCheck",true);
			session.setAttribute("username", student.getParentUserName());
			session.setAttribute("parentId", student.getParentId());
			
			
			session.setAttribute("hostelId", student.getParentId());
			session.setAttribute("parentId", student.getParentId());
			//for next page
			
			String url = "parent_home.jsp";
			
			response.sendRedirect(url);
		}//else
	}//post
}//class

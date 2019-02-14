package sis.com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import sis.com.bo.Admin;
import sis.com.dao.AdminDao;
import sis.com.daoFactory.DaoFactory;
import sis.com.util.SisDbUtil;
import java.util.*;
public class AdminRegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;
	ResultSet rs=null;   
    public AdminRegistrationController() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		try {
			con=SisDbUtil.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("error in AdminLoginController init()");
		}
	}

	public void destroy() {
		try {
			SisDbUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("error in AdminLoginController destroy()");
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		Map<String,String> var = new HashMap<String,String>();
		Admin admin = DaoFactory.getAdmin();
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String mobileno = request.getParameter("mobileno");
		String fatherName = request.getParameter("father_name");
		String dateOfBirth = request.getParameter("dob");//2017-12-13
		String address = request.getParameter("address");
		String gender = request.getParameter("gender");
		
		long adminId=0L;
		try {
			//System.out.println("request.getParameter(\"adminId\")"+request.getParameter("adminId"));
			adminId = Long.parseLong(request.getParameter("adminId"));
		}catch(NumberFormatException n) {
			System.out.println("NumberFormatException at admin_registration.jsp");
		}
		//PageContext pc= request.
		request.setAttribute("adminId", adminId);
		
		
		System.out.println(">>>"+dateOfBirth);
		var.put("name", name);
		var.put("email", email);
		var.put("mobileno", mobileno);
		var.put("father_name", fatherName);
		var.put("dob", dateOfBirth);
		var.put("address", address);
		var.put("gender", gender);
		request.setAttribute("var", var);
		
		Map<String,String> errorList = new HashMap<String,String>();
		
		if(name==null && name.trim().equals("")) {
			errorList.put("errorName","* invalid input in name");
		}
		if(email==null && email.trim().equals("")) {
			errorList.put("errorEmail","* invalid input in email");
		}
		if(fatherName==null && fatherName.trim().equals("")) {
			errorList.put("errorFatherName","* invalid input in father name");
		}
		if(dateOfBirth==null && dateOfBirth.trim().equals("")) {
			errorList.put("errorDateOfBirth","* invalid input in date of birth");
		}
		if(address==null && address.trim().equals("")) {
			errorList.put("errorAddress","* invalid input in father name");
		}
		if(gender==null) {
			errorList.put("errorGender","* invalid input in error gender");
		}
		
		try {
			String mobile = mobileno;
			admin.setMobile(mobile);
		}catch(NumberFormatException n) {
			System.out.println("error in parseLong(mobileno) AdminRegistrationController.java");
			errorList.put("errorMobileNo", "* invalid input in mobile number");
			request.setAttribute("errorList", errorList);
			RequestDispatcher rd = request.getRequestDispatcher("admin_registration.jsp");
			rd.forward(request, response);
		}
		if(errorList.isEmpty()==false) {
			request.setAttribute("error", errorList);
			RequestDispatcher rd = request.getRequestDispatcher("admin_registration.jsp");
			rd.forward(request, response);
		}
		
		admin.setName(name);
		admin.setEmail(email);
		admin.setFatherName(fatherName);
		admin.setAddress(address);
		admin.setGender(gender);
		admin.setAdminId(adminId);
		
		
		Calendar cal = Calendar.getInstance();
		Date date = cal.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			date=sdf.parse(dateOfBirth);
		} catch (ParseException e) {
			System.out.println("error in sdf.parse() AdminRegistrationController");
			errorList.put("errorDateParse", "* error on parsing date");
			request.setAttribute("errorList", errorList);
			request.setAttribute("var", var);
			String url="admin_registration.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		}
		admin.setDateOfBirth(date);
		
		
		admin.setDateOfJoin(new Date());
		
		AdminDao dao = DaoFactory.getAdminDao();
		boolean added=dao.add(admin);
		
		if(added==false) {
			String errorOnAddingAdmin="* Registration Failed! Try again later";
			errorList.put("errorOnAddingAdmin", errorOnAddingAdmin);
			request.setAttribute("errorList", errorList);
			System.out.println("admin doen't added ->AdminRegistrationController ");
			String url="admin_registration.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
			/*response.sendRedirect(url);*/
		}else {
			response.sendRedirect("admin_home.jsp");
		}
		//doGet(request, response);
	}//doPost

	
}//class

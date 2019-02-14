package sis.com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.bo.ComplainQuery;
import sis.com.dao.ParentDao;
import sis.com.daoFactory.DaoFactory;
import sis.com.util.SisDbUtil;

public class ParentComplainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String parentEmail= request.getParameter("emailAddress");
		String category = request.getParameter("category");
		String complain = request.getParameter("complain");
		long parentId=0L;
		HttpSession  session = request.getSession();
		if(session.getAttribute("parentId")==null) {
			response.sendRedirect("ParentLogin.jsp");
		}else {
			parentId=(long)session.getAttribute("parentId");
		}
		Long destinationId = 1000L;
		Long sourceId=parentId;
		ComplainQuery c = DaoFactory.getComplainQuery();
		c.setParentId(parentId);
		c.setSourceId(sourceId);
		c.setDestinationId(destinationId);
		c.setCategory(category);
		c.setComplain(complain);
		c.setEmail(parentEmail);	
		
		ParentDao p = DaoFactory.getParentDao();
		
		//boolean send =p.insertQuery(c);
		Boolean send =p.insertQuery(c);
		if(send==false) {
			session.setAttribute("send", false);
		}else {
			session.setAttribute("send", true);
		}//else
		response.sendRedirect("parent_home.jsp");
	}//dopost
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
}//class

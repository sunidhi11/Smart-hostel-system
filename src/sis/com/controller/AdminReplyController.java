package sis.com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.bo.ComplainQuery;
import sis.com.dao.AdminDao;
import sis.com.daoFactory.DaoFactory;

/**
 * Servlet implementation class AdminReplyController
 */
public class AdminReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminReplyController() {
        super();
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long queryId;
		long sourceId;
		long destinationId;
		String  message;
		String subject;
		String seen="NO";
		
		queryId=Long.parseLong(""+request.getParameter("queryId"));
		sourceId=Long.parseLong(""+request.getParameter("sourceId"));
		destinationId=Long.parseLong(""+request.getParameter("destinationId"));
		message=request.getParameter("message");
		subject=request.getParameter("subject");
		//seen=request.getParameter("seen");
		
		ComplainQuery c = DaoFactory.getComplainQuery();
		c.setQueryId(queryId);
		c.setSourceId(sourceId);
		c.setDestinationId(destinationId);
		c.setMessage(message);
		c.setSubject(subject);
		c.setSeen(seen);
		
		AdminDao dao = DaoFactory.getAdminDao();
		boolean send=dao.send(c);
		//System.out.println("send ==52   "+send);
		HttpSession session = request.getSession();
		if(send==true) {
			session.setAttribute("send", "message has been send");
			response.sendRedirect("admin_parent_query.jsp"); 
		}else {
			session.setAttribute("send", "unable to send");
			response.sendRedirect("admin_parent_query.jsp");
		}//else
		
	}//dopost

}

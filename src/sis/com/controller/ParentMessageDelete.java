package sis.com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.dao.ParentDao;
import sis.com.daoFactory.DaoFactory;

public class ParentMessageDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ParentMessageDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long id=Long.parseLong(""+request.getParameter("id"));
		ParentDao p = DaoFactory.getParentDao();
		p.deleteMessage(id);
		HttpSession session= request.getSession();
		session.setAttribute("messageDeleted", true);
		response.sendRedirect("parent_home.jsp");
	}

}

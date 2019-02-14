package sis.com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.dao.AdminDao;
import sis.com.daoFactory.DaoFactory;
import sis.com.util.SisDbUtil;

public class AdminParentComplainQueryDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;
	ResultSet rs=null;
	
    public AdminParentComplainQueryDelete() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		try {
			con=SisDbUtil.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("error in AdminParentComplainQueryDelete init()");
		}
		super.init(config);
	}

	public void destroy() {
		try {
			SisDbUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("error in AdminParentComplainQueryDelete destroy()");
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		long queryId=0L;
		if(request.getParameter("queryId")==null) {
			response.sendRedirect("AdminParentQuery.jsp");;
		}//if
		queryId=Long.parseLong(""+request.getParameter("queryId"));
		
		
		
		
		AdminDao dao = DaoFactory.getAdminDao();
		boolean deleted = dao.deleteQuery(queryId);
		if(deleted==false) {
			session.setAttribute("deleted", "Query doen't deleted");
		}else {
			session.setAttribute("deleted", "Query has been deleted");
		}//else
		
		response.sendRedirect("AdminParentQuery.jsp");
		
	}//doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

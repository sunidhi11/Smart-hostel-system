package sis.com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.bo.Complain;
import sis.com.dao.ComplainDao;
import sis.com.daoFactory.DaoFactory;

/**
 * Servlet implementation class DeleteComplain
 */
public class DeleteComplain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteComplain() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ComplainDao dao=DaoFactory.getComplainDao();
		PrintWriter out=response.getWriter();
		List<Complain> getAllComplain=dao.getAllComplain();
		int result=dao.deleteComplain(getAllComplain);
		if(result>0){
			out.print("the deleated complain"+result);
			HttpSession session=request.getSession();
			session.setAttribute("result", result);
			response.sendRedirect("ShowComplainController");
			
		}else{
			response.sendRedirect("ShowComplainController");
		}
	}

}

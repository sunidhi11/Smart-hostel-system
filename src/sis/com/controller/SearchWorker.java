package sis.com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sis.com.bo.Worker;
import sis.com.dao.WorkerDao;
import sis.com.daoFactory.DaoFactory;

/**
 * Servlet implementation class SearchWorker
 */
public class SearchWorker extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name =request.getParameter("name");
		//long id=Long.parseLong(id1);
		//request.setAttribute("id", id1);
		WorkerDao dao=DaoFactory.getWorkerDao();
		List<Worker> getAllWorkerbyid=dao.getAllWorkersById(name);
		request.setAttribute("list",getAllWorkerbyid );
		request.getRequestDispatcher("view_worker.jsp").forward(request, response);
	}

	
}

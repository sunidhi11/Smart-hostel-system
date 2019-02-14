package sis.com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.bo.Worker;
import sis.com.dao.WorkerDao;
import sis.com.daoFactory.DaoFactory;

/**
 * Servlet implementation class ShowAllWorker
 */
public class ShowAllWorker extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		WorkerDao dao=DaoFactory.getWorkerDao();
		List<Worker> getAllWorkerbyid=dao.getAllWorkers();
		HttpSession session=request.getSession();
		session.setAttribute("list1",getAllWorkerbyid );
		response.sendRedirect("view_worker.jsp");
	}

}

package sis.com.controller;
import sis.com.bo.FeedBack;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sis.com.dao.FeedbackDao;
import sis.com.daoFactory.DaoFactory;
/**
 * Servlet implementation class feedbackController
 */
public class feedbackController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		FeedbackDao dao=DaoFactory.getFeedBackDao();
		FeedBack feedback = new FeedBack();
		feedback.setClean(request.getParameter("clean"));
		feedback.setFood(request.getParameter("food"));
		feedback.setMaintain(request.getParameter("maintain"));
		feedback.setSecurity(request.getParameter("security"));
		feedback.setStaff(request.getParameter("staff"));
		feedback.setRating(Integer.parseInt(request.getParameter("hostel")));
		feedback.setHostelId(Integer.parseInt(request.getParameter("stu_hos_id")));
		feedback.setName(request.getParameter("stu_name"));
		feedback.setMessage(request.getParameter("message"));
		
		boolean result = dao.add(feedback);
		if(result==true){
			request.setAttribute("feedmsg","Thank you for your valuable feedback");
			response.sendRedirect("feedback.jsp");
		}
	}

}

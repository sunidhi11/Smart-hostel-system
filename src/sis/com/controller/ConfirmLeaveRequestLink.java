package sis.com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import sis.com.bo.Leave;
import sis.com.dao.ParentDao;
import sis.com.dao.impl.ParentDaoImplement;

public class ConfirmLeaveRequestLink extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ConfirmLeaveRequestLink() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ParentDao parentDao = new ParentDaoImplement();
		long hostelId=0L; 
		if(request.getParameter("hostelId")!=null){
			try {
				hostelId = Long.parseLong(""+request.getParameter("hostelId"));
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
			List<Leave> allLeaveRequest = parentDao.getAllLeave(hostelId);
			Leave leave =new Leave();
			for(Leave l:allLeaveRequest){
				leave=l;
			}
			parentDao.approveLeave(leave.getLeaveId());
			response.sendRedirect("leave_approved_link.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}

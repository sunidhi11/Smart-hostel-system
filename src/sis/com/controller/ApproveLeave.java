package sis.com.controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sis.com.bo.Student;
import sis.com.dao.AdminDao;
import sis.com.dao.StudentDao;
import sis.com.daoFactory.DaoFactory;
import sis.com.util.EmailSender;

public class ApproveLeave extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ApproveLeave() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession h = request.getSession();
		boolean approved=false;
		Long leaveId=0L ;
		Long hostelId=0L ;
		String subject = "";
		String message = "";
		Boolean getParameterError=false;
		if(request.getParameter("leaveId")!=null ) {
			leaveId= Long.parseLong(""+request.getParameter("leaveId"));
		}else {
			getParameterError=true;
		}
		if(request.getParameter("hostelId")!=null ) {
			leaveId= Long.parseLong(""+request.getParameter("hostelId"));
			hostelId= Long.parseLong(""+request.getParameter("hostelId"));
		}else {
			getParameterError=true;
		}
		if(request.getParameter("subject")!=null ) {
			subject=""+request.getParameter("subject");
		}else {
			getParameterError=true;
		}
		if(request.getParameter("message")!=null ) {
			message=""+request.getParameter("message");
		}else {
			getParameterError=true;
		}
		
		if(getParameterError==true) {
			h.setAttribute("getParameterError", true);
			System.out.println("leave request denined");
		}
			
		AdminDao adminDao = DaoFactory.getAdminDao();
		approved=adminDao.approveLeave(leaveId);
		//get student details using hostelid
		//getting student data
		StudentDao dao=DaoFactory.getStudentDao();
		Student student= dao.ShowStudentById(hostelId);
		Student stuparent= dao.ShowStuParentById(hostelId);
		String studentEmail = student.getEmail();
		String parentEmail = stuparent.getFatherEmail();
		/*String studentEmail = "gargtwinkle11@gmail.com";
		String parentEmail = "gargtwinkle11@gmail.com";*/
		if(approved==true) {
			h.setAttribute("approved", true);
			System.out.println("leave has been approved");
			//sent mail to parent
			EmailSender.sendEmail(studentEmail, message, subject);//to student
			EmailSender.sendEmail(parentEmail, message, subject);//to parent
			
		}else {
			message="your leave request has been rejected. Contact admin";
			subject="Leave request rejected";
			
			//sent mail to parent
			EmailSender.sendEmail(studentEmail, message, subject);//to student
			EmailSender.sendEmail(parentEmail, message, subject);//to parent
			
			h.setAttribute("approved", false);
			System.out.println("leave request denined");
		}
		response.sendRedirect("admin_leave.jsp");
	}

}

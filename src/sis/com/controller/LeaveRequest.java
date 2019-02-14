package sis.com.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import sis.com.bo.Leave;
import sis.com.bo.Student;
import sis.com.dao.ParentDao;
import sis.com.dao.StudentDao;
import sis.com.daoFactory.DaoFactory;
import sis.com.util.SisDbUtil;
@MultipartConfig(maxFileSize = 16177215)
public class LeaveRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LeaveRequest() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		long hostelId=(Long)session.getAttribute("hostelId");
		String subject="";
		String reason="";
		String sDate=null;
		String eDate=null;
		Date startDate=null;
		Date endDate=null;
		Boolean errorInput = false;
		List<String> errorList = new ArrayList<String>();
		if(request.getParameter("start_date")==null || request.getParameter("start_date").trim().equalsIgnoreCase("")) {
			errorList.add("errorInStartDate");
		}else {
			sDate=""+request.getParameter("start_date");
		}//else
		
		if(request.getParameter("end_date")==null || request.getParameter("end_date").trim().equalsIgnoreCase("")) {
			errorList.add("errorInEndDate");
		}else {
			eDate=""+request.getParameter("end_date");
		}//else
		
		if(request.getParameter("subject")==null || request.getParameter("subject").trim().equalsIgnoreCase("")) {
			errorList.add("errorInSubject");
		}else {
			subject=""+request.getParameter("subject");
		}//else
		
		if(request.getParameter("reason")==null || request.getParameter("reason").trim().equalsIgnoreCase("")) {
			errorList.add("errorInReason");
		}else {
			reason=""+request.getParameter("reason");
		}//else
		
		if(errorList.isEmpty()!=true) {
			session.setAttribute("errorList", errorList);
			response.sendRedirect("StudentLeaveApplication.jsp");
		}//if
		else {
			System.out.println("inside the else");
			SimpleDateFormat formatter  = new SimpleDateFormat("yyyy-MM-dd");
			try {
				startDate = formatter.parse(sDate);
				endDate = formatter.parse(eDate);
				System.out.println("sDate:"+startDate.getTime()+"  "+sDate);
				System.out.println("eDate:"+endDate.getTime()+" "+eDate);
				
			} catch (ParseException e) {
				e.printStackTrace();
			}//try
			
			Date todayDate = new Date();
			Boolean errorDate=false;
			if(startDate.getTime()>endDate.getTime()) {
				errorDate=true;
			}else if(startDate.getTime()<=todayDate.getTime()) {
				errorDate=true;
			}else if(endDate.getTime()<todayDate.getTime()){
				errorDate=true;
			}
			if(errorDate==true) {
				session.setAttribute("errorDate",errorDate);
				response.sendRedirect("StudentLeaveApplication.jsp");
			}else {
				Leave l = DaoFactory.getLeave();
				l.setHostelId(hostelId);
				l.setFromDate(startDate);
				l.setToDate(endDate);
				l.setReason(reason);
				l.setSubject(subject);
				//errroDate
				StudentDao sd = DaoFactory.getStudentDao();
				boolean inserted=sd.insertLeave(l);
				if(inserted==true) {
					session.setAttribute("inserted", true);
				}else {
					session.setAttribute("inserted", false);
				}
				String email="gargtwinkle11@gmail.com";
				/*String emailOfParent="gargtwinkle11@gmail.com";*/
				/*String msgToStudent="your request has been sent to admin. Wait for admin to respond";*/
				String msgToParent="your ward wants to leave hostel. SUBJECT=< "+subject+" > and REASON < "+reason+" > . To confirm please click the link <a><a>http://localhost:8088/hostelmerge-22-feb//ConfirmLeaveRequestLink?hostelId="+hostelId+"</a></a>";
				InputStream inputStream = null;	
				InputStream inputStream1=null;
				Part filePart = request.getPart("photo1");
				System.out.println(filePart);
				Part filePart2 = request.getPart("photo2");
				if (filePart != null) {
					// prints out some information for debugging
					System.out.println(filePart.getName());
					System.out.println(filePart.getSize());
					System.out.println(filePart.getContentType());
					
					// obtains input stream of the upload file
					inputStream = filePart.getInputStream();
					inputStream1=filePart2.getInputStream();
					
				}
				Connection conn = null;	// connection to the database
				String message = null;	// message will be sent back to client
				
				try {
					// connects to the database
					conn = SisDbUtil.getConnection();

					// constructs SQL statement
					String sql = "INSERT INTO leave_file(photo1, photo2) values (?, ?)";
					PreparedStatement statement = conn.prepareStatement(sql);
					
					
					if (inputStream != null && inputStream1 !=null) {
						// fetches input stream of the upload file for the blob column
						statement.setBlob(1, inputStream);
						statement.setBlob(2, inputStream1);
					}

					// sends the statement to the database server
					int row = statement.executeUpdate();
					if (row > 0) {
						message = "File uploaded and saved into database";
					}
				} catch (SQLException ex) {
					message = "ERROR: " + ex.getMessage();
					ex.printStackTrace();
				} finally {
					if (conn != null) {
						// closes the database connection
						try {
							conn.close();
						} catch (SQLException ex) {
							ex.printStackTrace();
						}
					}
				}
				
				StudentDao dao=DaoFactory.getStudentDao();
				Student stuparent= dao.ShowStuParentById(hostelId);
				String emailOfParent=stuparent.getFatherEmail();
				System.out.println("parent mail"+stuparent.getFatherEmail());
				//sd.sendMsgToStudent(email, subject, msgToStudent);
				ParentDao parentDao = DaoFactory.getParentDao();
				
				//parentDao.sendMsgToParent(emailOfParent, subject, msgToParent);
				parentDao.sendMsgToParent("smanhar747@gmail.com", subject, msgToParent);
				response.sendRedirect("StudentLeaveApplication.jsp");
			}//else
		}//else
	}//dopost
}//class

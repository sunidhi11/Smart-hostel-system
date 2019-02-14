package sis.com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.bo.Student;
import sis.com.dao.StudentDao;
import sis.com.daoFactory.DaoFactory;
import sis.com.util.SisDbUtil;

public class AttendanceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;
	ResultSet rs=null;
    public AttendanceController() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		try {
			con=SisDbUtil.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//init

	public void destroy() {
		try {
			SisDbUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//destroy

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}//doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		long hostelId=0L;
		Calendar cal1 = Calendar.getInstance();
		Date today = cal1.getTime();
		java.sql.Date sqlToday = new java.sql.Date(today.getTime());
		
		Map<String,String> attendanceMap = new HashMap<String,String>();
		StudentDao sDao = DaoFactory.getStudentDao();
		List<Student> l = sDao.getAllStudent();
		boolean inserted=false;
		for(Student s:l) {
			hostelId=s.getHostelId();
			int status = Integer.parseInt(request.getParameter(""+hostelId));
			System.out.println("hostelId "+hostelId+"  status-"+status);
			inserted=sDao.insertAttendance(hostelId, status, sqlToday);
			if(!inserted)
				break;
			attendanceMap.put(hostelId+"", status+"");
		}//for
		if(!inserted) {
			session.setAttribute("alreadyFilled", true);
			response.sendRedirect("student_attendance.jsp");
		}else {
		try {
			//---getting absent leave and present, the sql part
			String presentSql ="select count(hostelId) as result from attendance where STATUS=1 and TODAY=?";
			int present = 0;
			PreparedStatement pstmtPresent = con.prepareStatement(presentSql);
			pstmtPresent.setDate(1,sqlToday);
			rs = pstmtPresent.executeQuery();
			while(rs.next())
				present = rs.getInt("result");
			
			
			rs=null;
			int absent = 1;
			String absentSql="select count(hostelId) as result from attendance where STATUS=0 and TODAY=?";
			PreparedStatement pstmtAbsent = con.prepareStatement(absentSql);
			pstmtAbsent.setDate(1,sqlToday);
			rs = pstmtAbsent.executeQuery();
			while(rs.next())
				absent = rs.getInt("result");
			
			
			rs=null;
			int leave = 0;
			String leaveSql="select count(hostelId) as result from attendance where STATUS=2 and TODAY=?";
			PreparedStatement pstmtLeave = con.prepareStatement(leaveSql);
			pstmtLeave.setDate(1,sqlToday);
			rs = pstmtLeave.executeQuery();
			while(rs.next())
				leave = rs.getInt("result");
			
			
			//---end----getting absent leave and present, the sql part
			session.setAttribute("present", present+"");
			session.setAttribute("absent", absent+"");
			session.setAttribute("leave", leave+"");
			
			session.setAttribute("attendanceList", l);
			session.setAttribute("attendanceMap", attendanceMap);
			
			String url="attendance_submitted.jsp";
			response.sendRedirect(url);
		}catch(Exception e) {
			e.printStackTrace();
			session.setAttribute("alreadyFilled", true);
			response.sendRedirect("student_attendance.jsp");
		}
		}
	}//dopost

}

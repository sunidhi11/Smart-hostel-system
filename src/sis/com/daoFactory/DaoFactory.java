package sis.com.daoFactory;

import java.util.List;

import sis.com.bo.Admin;
import sis.com.bo.ComplainQuery;
import sis.com.bo.Leave;
import sis.com.bo.Student;
import sis.com.dao.AdminDao;
import sis.com.dao.AllotStudentDao;
import sis.com.dao.ComplainDao;
import sis.com.dao.FeedbackDao;
import sis.com.dao.ParentDao;
import sis.com.dao.RegStudentDao;
import sis.com.dao.StudentDao;
import sis.com.dao.WorkerDao;
import sis.com.dao.impl.AdminDaoImplement;
import sis.com.dao.impl.AllotStudentDaoImpl;
import sis.com.dao.impl.FeedBackImpl;
import sis.com.dao.impl.ParentDaoImplement;
import sis.com.dao.impl.RegisterStudentImpl;
import sis.com.dao.impl.StudentDaoImpl;
import sis.com.dao.impl.WorkerImpl;
import sis.com.dao.impl.complainImpl;

public class DaoFactory {

	private static RegStudentDao 	regStudentDao;
	public static RegStudentDao getRegStudentDao(){
	
		System.out.println("hello3"); 
		
		if(regStudentDao==null){
		regStudentDao = new RegisterStudentImpl();
		}
		return regStudentDao;
	}
	
	//=========allot dao===================
		private static AllotStudentDao 	allotStudentDao;
		public static  AllotStudentDao getAllotedStudentDao(){
		
			
			if(allotStudentDao==null){
				allotStudentDao = new AllotStudentDaoImpl();
			}
			return allotStudentDao;
			
		}
//==================student dao===================
	private static StudentDao 	studentDao;
	public static StudentDao getStudentDao(){
	
		
		if(studentDao==null){
			studentDao = new StudentDaoImpl();
		}
		return studentDao;
		
	}
//======================shaurya==================
	static Admin admin=null;
	public static Admin getAdmin() {
		return admin = new Admin();
	}
	public static AdminDao getAdminDao() {
		AdminDao adminDao = new AdminDaoImplement();
		return adminDao;
	}
	
	public static Student getStudent() {
		Student student = new Student();
		return student;
	}
	
	public static ParentDao getParentDao() {
		ParentDao parentDao = new ParentDaoImplement();
		return parentDao;
	}
	public static ComplainQuery getComplainQuery() {
		ComplainQuery complainQuery = new ComplainQuery();
		return complainQuery;
	}
	
	public static Leave getLeave() {
		Leave leave = new Leave();
		return leave;
	}//leave
	
	/*//seema
*/	private static FeedbackDao feedbackdao;
	public static FeedbackDao getFeedBackDao(){
		if(feedbackdao==null){
			feedbackdao = new FeedBackImpl();
		}
		return feedbackdao;
	}
	//monika
	private static ComplainDao complainDao;
	public static ComplainDao getComplainDao(){
		if(complainDao==null){
			complainDao = new complainImpl();
		}
		return complainDao;
	}
	
	
		private static WorkerDao workerDao;
		public static WorkerDao getWorkerDao(){
			if(workerDao==null){
				workerDao = new WorkerImpl();
			}
			return workerDao;
		}
	
	
} //class
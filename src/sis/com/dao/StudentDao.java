/**


user sunidhi
 * 
 */
package sis.com.dao;

import java.util.Date;
import java.util.List;

import sis.com.bo.ComplainQuery;
import sis.com.bo.Leave;
import sis.com.bo.RegStudent;
import sis.com.bo.Student;

/**
 * @author hp
 *
 */
public interface StudentDao {
		
	long AddConfirmStudent(RegStudent regstudent,String password,String password_father,String father_username);
	List<Student> ShowAllStudent();
	Student ShowStudentById(long hostelId);
	Student ShowStuParentById(long hostelId);
	Student showStuDocumentById(long hostelId);
	Student validateStudentLogin(String userName, String password);
	boolean updatestudent(Student student);
	boolean updateStuParent(Student student);
	boolean updateStuDocument(Student student);
	boolean deleteStudent(Long id);
	//new......................
	
	List<Leave> recieveMessage(long hostelId);
	boolean setSeenByStudent(List<Leave> list);
	long newMessage(long hostelId);
	boolean deleteStudentpermanemt(long hostelId);
	List<Student> ShowAllDeletedByAdminStudent();
	boolean restoreStudent(long hostelId);

	//shaurya
	Student get(long hostelId);
	boolean insertLeave(Leave l);
	List<Long> getLeaveStudent();
	List<Student> getAllStudent();
	boolean insertAttendance(long hostelId,int status,Date date);
	List<Leave> approved();
	boolean setSeen(List<Leave> leaveList);
	boolean sendMsgToStudent(String email,String subject,String msg);
	boolean sendMsgToStudent(String email,String subject,String msg,Long hostelId,Long leaveId);
	
	Leave showLeaveStuDocumentById(long leaveId);
	//shaurya
}

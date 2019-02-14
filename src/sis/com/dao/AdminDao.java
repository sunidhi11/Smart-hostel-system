package sis.com.dao;

import java.util.List;
import java.util.Date;



import sis.com.bo.Admin;
import sis.com.bo.ComplainQuery;
import sis.com.bo.Leave;
import sis.com.bo.Mess_Menu;


public interface AdminDao {
	boolean add(Admin admin);
	Admin get(long adminId);
	Admin delete(long adminId);
	List<Admin> getAllAdmin();
	int getTotalCount();
	boolean validateLogin(String userName,String userPassword);
	Admin getByUsernamePassword(String username,String password);
	boolean checkFirstTime(long adminId);
	boolean deleteQuery(long queryId);
	boolean permanentDeleteQuery(long queryId);
	boolean send(ComplainQuery c);
	List<Leave> getAllLeave();
	boolean deleteLeave(Long leaveId);
	boolean approveLeave(Long leaveId);
	int[] getAttendance(Date date);
	List<ComplainQuery> getAllComplain(Long adminId);
	boolean updateAttendance(Long hostelId,Date date,String attendance);
	boolean setSent(Long hostelId, Long leaveId);
	//sunidhi
	List<Mess_Menu> ShowMessMenu();
	 boolean updateMenu(Mess_Menu mess_menu);
}

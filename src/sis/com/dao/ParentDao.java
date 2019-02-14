/**
 * 
 */
package sis.com.dao;

import java.util.List;

import sis.com.bo.*;

/**
 * @author shauryamanhar
 *
 */
public interface ParentDao {
	Student validateParent(String username,String password);
	int [] attendanceCount(long hostelId);
	List[] attendanceDetail(long hostelId);
	List recieveMessage(long hostelId);
	boolean setSeen(List<ComplainQuery> list);
	int newMessage(long hostelId);
	boolean send(ComplainQuery c);
	boolean deleteMessage(long id);
	boolean insertQuery(ComplainQuery c);
	boolean sendMsgToParent(String email,String subject,String msg);
	Boolean deleteLeave(long leaveId);
	Boolean approveLeave(long leaveId);
	Boolean rejectLeave(long leaveId);
	int newLeaveNotification(long hostelId);
	boolean setSeenForLeave(List<Leave> list);
	public List<Leave> getAllLeave(Long hostelId);
}

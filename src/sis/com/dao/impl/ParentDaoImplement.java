/**
 * 
 */
package sis.com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import sis.com.bo.*;
import sis.com.dao.ParentDao;
import sis.com.daoFactory.DaoFactory;
import sis.com.util.EmailSender;
import sis.com.util.SisDbUtil;

/**
 * @author shauryamanhar
 *
 */
public class ParentDaoImplement implements ParentDao {

	/* (non-Javadoc)
	 * @see sis.com.dao.ParentDao#validateParent(java.lang.String, java.lang.String)
	 */
	Connection con=null;
	ResultSet rs=null;
	
	
	@Override
	public Student validateParent(String username, String password) {
		PreparedStatement pstmt =null;
		Calendar cal = Calendar.getInstance();
		Date date = cal.getTime();
		Student student=null;
		try {
			con=SisDbUtil.getConnection();
			String sql ="select * from parent_login where userName=? and password=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			rs=pstmt.executeQuery();
			if(rs.next()){
				student = DaoFactory.getStudent();
				int parentId = rs.getInt("parentId");
				String parentUserName=rs.getString("username");
				student.setParentId(parentId);
				student.setParentUserName(parentUserName);
				System.out.println("student parent id inside implement "+student.getParentId());
				student.setHostelId(student.getParentId());
				Date date1 = new Date();
				Timestamp sqlTimestamp = new Timestamp(date1.getTime());
				sql="update parent_login set lastLogin=? where parentId=?";
				pstmt= con.prepareStatement(sql);
				pstmt.setTimestamp(1,sqlTimestamp);
				pstmt.setLong(2,parentId);
				//System.out.println(sql);
				int count = pstmt.executeUpdate();
				Boolean action = (count>0);
				if(action==false)
					return null;
			}//if
			else {
				System.out.println("parent validation failed for username::<"+username+">   password::<"+password+">");
			}//else
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return student;
	}
	
	@Override
	public int[] attendanceCount(long hostelId) {
		int attendance[] = new int[4];
		try{
        	con=SisDbUtil.getConnection();
        	String sql="select count(distinct today) as total_day from attendance";
        	PreparedStatement ps=con.prepareStatement(sql);
        	rs=ps.executeQuery();
        	while(rs.next()){
        		attendance[0]=rs.getInt("total_day");
        	}
        	rs=null;
        	
        	
        	sql="select count(*) as totalPresent from attendance where hostelId=? and status=1";
        	PreparedStatement ps1 = con.prepareStatement(sql);
        	ps1.setLong(1, hostelId);
        	rs=ps1.executeQuery();
        	while(rs.next()){	
        		attendance[1]=rs.getInt("totalPresent");
        	}
        	rs=null;
        	
        	sql="select count(*) as totalAbsent from attendance where hostelId=? and status=0";
        	PreparedStatement ps2 = con.prepareStatement(sql);
        	ps2.setLong(1, hostelId);
        	rs=ps2.executeQuery();
        	while(rs.next()){	
        		attendance[2]=rs.getInt("totalAbsent");
        	}
        	rs=null;

        	sql="select count(*) as totalLeave from attendance where hostelId=? and status=2";
        	PreparedStatement ps3 = con.prepareStatement(sql);
        	ps3.setLong(1, hostelId);
        	rs=ps3.executeQuery();
        	while(rs.next()){
        		attendance[3]=rs.getInt("totalLeave");
        	}
        	rs=null;
        	
        }catch(SQLException e){
        	System.out.println("error in ParentDaoImplement SQLException ");
        	e.printStackTrace();
        }finally{
        	try {
    			SisDbUtil.closeConnection(con);
    		} catch (SQLException e) {
    			e.printStackTrace();
    			System.out.println("error in ParentHome.jsp ");
    		}
        }//finally
		
		return attendance;
	}
	
	@Override
	public List[] attendanceDetail(long hostelId) {
		List []list =new List[2];
		List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
        List<Integer> statusList = new ArrayList<Integer>();
		try{
        	con=SisDbUtil.getConnection();
        	String sql="select distinct TODAY,status,hostelId from attendance where hostelId=? and status in (0,2)";
	        PreparedStatement ps4 = con.prepareStatement(sql);
	        ps4.setLong(1, hostelId);
	        rs=ps4.executeQuery();
	        while(rs.next()){
	        	  dateList.add(rs.getDate("TODAY"));
	        	  statusList.add(rs.getInt("status"));
	        }
        	rs=null;
        	
        }catch(SQLException e){
        	System.out.println("error in ParentDaoImplement SQLException ");
        	e.printStackTrace();
        }finally{
        	try {
    			SisDbUtil.closeConnection(con);
    		} catch (SQLException e) {
    			e.printStackTrace();
    			System.out.println("error in ParentDaoImplement ");
    		}
        }//finally
		list[0]=dateList;
		list[1]=statusList;
		return list;
	}

	@Override
	public List recieveMessage(long hostelId) {
		ComplainQuery c=null;
		ArrayList<ComplainQuery> list = new ArrayList<ComplainQuery>();
		try {
			con=SisDbUtil.getConnection();
			String sql="select * from query where destinationId=? and deletedForDestination=?";
			PreparedStatement p = con.prepareStatement(sql);
			/*p.setLong(1, hostelId);
			p.setString(2, "NO");*/
			p.setLong(1, hostelId);
			p.setString(2, "NO");
			rs = p.executeQuery();
			while(rs.next()) {
				c= DaoFactory.getComplainQuery();
				long queryId = rs.getLong("queryId");
				Date date=new Date(rs.getTimestamp("time").getTime());
				String subject = rs.getString("subject");
				long sourceId = rs.getLong("sourceId");
				long destinationId = rs.getLong("destinationId");
				String  message = rs.getString("message");
				String seen = rs.getString("seen");
				String deletedForSource = rs.getString("deletedForSource");
				String deletedForDestination = rs.getString("deletedForDestination");
				long id = rs.getLong("id");
 				
				c.setId(id);
				c.setQueryId(queryId);
				c.setSourceId(sourceId);
				c.setDestinationId(destinationId);
				c.setMessage(message);
				c.setSubject(subject);
				c.setSeen(seen);
				c.setDeletedForSource(deletedForSource);
				c.setDeletedForDestination(deletedForDestination);
				c.setDate(date);
				
				list.add(c);
				
			}//while
			
		}catch(Exception e) {
			e.printStackTrace();
			try {
    			SisDbUtil.closeConnection(con);
    		} catch (SQLException r) {
    			r.printStackTrace();
    			System.out.println("error in ParentDaoImplement ");
    		}
		}//catch
		return list;
	}

	@Override
	public boolean setSeen(List<ComplainQuery> list) {
		try {
			con=SisDbUtil.getConnection();
			String sql="update query set  seen=? where id=?";
			for(ComplainQuery c:list) {
				PreparedStatement p = con.prepareStatement(sql);
				p.setString(1, "YES");
				p.setLong(2, c.getId());
				p.execute();
			}//for
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}

	
	@Override
	public int newMessage(long hostelId) {
		int i=0;
		try {
			con=SisDbUtil.getConnection();
			String sql="select count(*) as r from query where seen=? and destinationId=?";
			PreparedStatement p = con.prepareStatement(sql);
			p.setString(1, "NO");
			p.setLong(2, hostelId);
			rs=p.executeQuery();
			while(rs.next()) {
				i=rs.getInt("r");
			}//while
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("new +++"+i);
		return i;
	}

	
	@Override
	public boolean send(ComplainQuery c) {
		try {
			con=SisDbUtil.getConnection();
			String sql="insert into query(queryId,sourceId,"
					+ "destinationId,message,"
					+ "subject,time)"
					+ "values(?,?,"
					+ "?,?,"
					+ "?,?)";
			PreparedStatement p = con.prepareStatement(sql);
			p.setLong(1, c.getQueryId());
			p.setLong(2, c.getSourceId());
			p.setLong(3, c.getDestinationId());
			p.setString(4, c.getMessage());
			p.setString(5, c.getSubject());
			Date date1 = new Date();
			Timestamp sqlTimestamp = new Timestamp(date1.getTime()); 
			p.setTimestamp(6, sqlTimestamp);
			
			int result =p.executeUpdate();
			if(result==0) {
				return false;
			}//if
			else {
				return true;
			}//else
			
		} catch (Exception e) {
			System.out.println("error in AdminDaoImplement SQLException");
			e.printStackTrace();
		}finally {
			try {
				SisDbUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}//finally
		return false;
	}//send

	@Override
	public boolean deleteMessage(long id) {
		try {
			con=SisDbUtil.getConnection();
			String sql="update query set  deletedForDestination=? where id=?  ";
			
			PreparedStatement p = con.prepareStatement(sql);
			p.setString(1, "YES");
			p.setLong(2, id);
			
			int result =p.executeUpdate();
			if(result==0) {
				return false;
			}//if
			else {
				return true;
			}//else
			
		} catch (Exception e) {
			System.out.println("error in AdminDaoImplement SQLException");
			e.printStackTrace();
		}finally {
			try {
				SisDbUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}//finally
		return false;
	}

	@Override
	public boolean insertQuery(ComplainQuery c) {
		try {
			con=SisDbUtil.getConnection();
			//String sql="insert into Parent_Query (parentId,subject,complain,date)values(?,?,?,?)";
			String sql="insert into query(id,queryId,sourceId,destinationId,message,subject,time)values(1,?,?,?,?,?,?)";
			//sql="insert into query				(queryId,sourceId,destinationId,message,subject,time)values(?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, c.getQueryId());
			pstmt.setLong(2, c.getSourceId());//long for source id parentId=sourceId
			pstmt.setLong(3, c.getDestinationId());//for admin id
			pstmt.setString(4, c.getComplain());
			pstmt.setString(5, c.getCategory());
			java.util.Date date = new java.util.Date();
			java.sql.Date now = new java.sql.Date(date.getTime());
			pstmt.setDate(6, now);
			pstmt.executeUpdate();
			
			EmailSender.sendEmail(c.getEmail(), c.getComplain(), c.getCategory());
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean sendMsgToParent(String email, String subject, String msg) {
		return EmailSender.sendEmail(email, msg, subject) ;
	}

	@Override
	public Boolean deleteLeave(long leaveId) {
		try {
			con=SisDbUtil.getConnection();
			String sql="update leave_request set  deletedByParent=? where leaveId=?  ";
			PreparedStatement p = con.prepareStatement(sql);
			p.setString(1, "YES");
			p.setLong(2, leaveId);
			int result =p.executeUpdate();
			if(result==0) {
				return false;
			}//if
			else {
				return true;
			}//else
			
		} catch (Exception e) {
			System.out.println("error in ParentDaoImplement SQLException");
			e.printStackTrace();
		}finally {
			try {
				SisDbUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}//finally
		return false;
	}

	@Override
	public Boolean approveLeave(long leaveId) {
		try {
			con=SisDbUtil.getConnection();
			String sql="update leave_request set  approvedByParent=? where leaveId=?  ";
			PreparedStatement p = con.prepareStatement(sql);
			p.setString(1, "YES");
			p.setLong(2, leaveId);
			int result =p.executeUpdate();
			if(result==0) {
				return false;
			}//if
			else {
				return true;
			}//else
			
		} catch (Exception e) {
			System.out.println("error in ParentDaoImplement SQLException");
			e.printStackTrace();
		}finally {
			try {
				SisDbUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}//finally
		return false;
	}

	@Override
	public Boolean rejectLeave(long leaveId) {
		try {
			con=SisDbUtil.getConnection();
			String sql="update leave_request set  approvedByParent=? where leaveId=?  ";
			PreparedStatement p = con.prepareStatement(sql);
			p.setString(1, "R");//R for reject
			p.setLong(2, leaveId);
			int result =p.executeUpdate();
			if(result==0) {
				return false;
			}//if
			else {
				return true;
			}//else
			
		} catch (Exception e) {
			System.out.println("error in ParentDaoImplement SQLException");
			e.printStackTrace();
		}finally {
			try {
				SisDbUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}//finally
		return false;
	}

	@Override
	public int newLeaveNotification(long hostelId) {
		int i=0;
		try {
			con=SisDbUtil.getConnection();
			String sql="select count(*) as r from leave_request where seenByParent=? and deletedByParent=? and hostelId=? ";
			PreparedStatement p = con.prepareStatement(sql);
			p.setString(1, "NO");
			p.setString(2, "NO");
			p.setLong(3, hostelId);
			rs=p.executeQuery();
			while(rs.next()) {
				i=rs.getInt("r");
			}//while
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("new +++"+i);
		return i;
	}

	@Override
	public boolean setSeenForLeave(List<Leave> list) {
		try {
			con=SisDbUtil.getConnection();
			String sql="update leave_request set  seenByParent=? where leaveId=?";
			for(Leave l:list) {
				System.out.println("leaveId >>"+ l.getLeaveId());
				PreparedStatement p = con.prepareStatement(sql);
				p.setString(1, "YES");
				p.setLong(2, l.getLeaveId());
				System.out.println("l.getLeaveId() "+l.getLeaveId());
				p.execute();
				
				return true;
			}//for
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<Leave> getAllLeave(Long hostelId) {
		List<Leave> list = new ArrayList<Leave>();
		Leave leave = null;
		try {
			con=SisDbUtil.getConnection();
			String sql="select * from leave_request where deletedByParent=? and hostelId=?";
			PreparedStatement p=con.prepareStatement(sql);
			p.setString(1, "NO");
			p.setLong(2, hostelId);
			rs=p.executeQuery();
			System.out.println("hostelId "+hostelId);
			while(rs.next()) {
				leave=DaoFactory.getLeave();
				leave.setLeaveId(rs.getLong("leaveId"));
				leave.setHostelId(rs.getLong("hostelId"));
				leave.setFromDate(rs.getDate("fromDate"));
				leave.setToDate(rs.getDate("toDate"));
				leave.setSubject(rs.getString("subject"));
				leave.setReason(rs.getString("reason"));
				leave.setEntryDate(rs.getDate("entryDate"));
				
				leave.setApprovedByAdmin(rs.getString("approvedByAdmin"));
				leave.setApprovedByParent(rs.getString("approvedByParent"));
				
				leave.setDeletedByAdmin(rs.getString("deletedByAdmin"));
				leave.setDeletedByParent(rs.getString("deletedByParent"));
				leave.setDeletedByStudent(rs.getString("deletedByStudent"));
				
				leave.setSendToStudentEmail(rs.getString("sendToStudentEmail")); //new 
				leave.setSendToStudentEmailTime(rs.getDate("sendToStudentEmailTime")); //new
				
				list.add(leave);
			}//while
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
}

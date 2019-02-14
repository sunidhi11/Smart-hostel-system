package sis.com.dao.impl;

import java.sql.*;
import java.util.*;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import sis.com.bo.Admin;
import sis.com.bo.ComplainQuery;
import sis.com.bo.Leave;
import sis.com.bo.Mess_Menu;
import sis.com.bo.Student;
import sis.com.dao.AdminDao;
import sis.com.daoFactory.DaoFactory;
import sis.com.util.SisDbUtil;

public class AdminDaoImplement implements AdminDao {
	Connection con=null;
	ResultSet rs=null;

	@Override
	public boolean add(Admin admin) {
		PreparedStatement pstmt=null;
		long adminId;
		try {
			con=SisDbUtil.getConnection();
			String sql="insert into Admin(adminId,name,address,email,mobile,gender,dob,doj,fatherName)"
					+ "values(?,?,?,?, ?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			System.out.println("admin.getAdminId()"+admin.getAdminId());
			pstmt.setLong(1, admin.getAdminId());//this must be handle
			pstmt.setString(2, admin.getName());
			pstmt.setString(3, admin.getAddress());
			pstmt.setString(4, admin.getEmail());
			pstmt.setString(5, admin.getMobile());
			pstmt.setString(6, admin.getGender());
			
			Date date = admin.getDateOfBirth();
			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			pstmt.setDate(7, sqlDate);
			
			Calendar cal1= Calendar.getInstance();
			Date doj = cal1.getTime();
			java.sql.Date sqlDoj = new java.sql.Date(doj.getTime());
			
			pstmt.setDate(8,sqlDoj);
			pstmt.setString(9,admin.getFatherName());
			
			int result =	pstmt.executeUpdate();
			
			//update registed column 0 to 1
			sql="update admin_login set registered = 1 where adminId=?";
			PreparedStatement pstmt1 = con.prepareStatement(sql);
			pstmt1.setLong(1, admin.getAdminId());
			pstmt1.executeUpdate();
			
			if(result==1) {
				System.out.println("admin added to database");
				return true;
			}
			else {
				System.out.println("admin doesn't added to database");
				return false;
			}//else
			
		}catch(SQLException e) {
			System.out.println("error in AdminDaoImplement SQLException inside add()");
			e.printStackTrace();
			return false;
		}finally {
			try {
				SisDbUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}//finally
	}//add

	@Override
	public Admin get(long adminId) {
		PreparedStatement pstmt=null;
		Admin admin=null;
		System.out.println("admin id is "+adminId);
		try {
			con=SisDbUtil.getConnection();
			String sql="select * from admin where adminId="+adminId+"";
			pstmt=con.prepareStatement(sql);
			/*pstmt.setInt(1,id);*/
			rs=pstmt.executeQuery(sql);
			
			if(rs.next()==true) {
				admin=new DaoFactory().getAdmin();;
				admin.setAdminId(adminId);
				/*admin.setUsername(rs.getString("username"));*/
				admin.setName(rs.getString("name"));
				admin.setEmail(rs.getString("email"));
				admin.setAddress(rs.getString("address"));
				admin.setMobile(rs.getString("mobile"));
				admin.setGender(rs.getString("gender"));
				admin.setDateOfBirth(rs.getDate("dob"));
				admin.setDateOfJoin(rs.getDate("doj"));
				admin.setFatherName(rs.getString("fatherName"));
			}//if
		}catch(Exception e) {
			System.out.println("error in AdminDaoImplement get() ");
			e.printStackTrace();
		}finally {
			try {
				SisDbUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}//finally
		System.out.println("admin.get() return type" + admin);
		return admin;
	}

	@Override
	public Admin delete(long adminId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Admin> getAllAdmin() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean validateLogin(String userName, String userPassword) {
		//System.out.println(userName+"  "+userPassword);//flag
		boolean valid = false;
		PreparedStatement pstmt =null;
		Admin admin=null;
		admin=DaoFactory.getAdmin();
		try {
			con=SisDbUtil.getConnection();
			String sql ="select * from admin_login where userName=? and password=? ";
			pstmt = con.prepareStatement(sql);
			//System.out.println(sql);
			pstmt.setString(1, userName);
			pstmt.setString(2, userPassword);

			rs=pstmt.executeQuery();
			
			if(rs.next()){
				valid = true;
				int adminId =rs.getInt("adminId");
				String username=rs.getString("userName");
				admin.setUsername(username);
				admin.setAdminId(adminId);
				Date date1 = new Date();
				Timestamp sqlTimestamp = new Timestamp(date1.getTime());
				sql="update admin_login set lastLogin=? where adminId=?";
				pstmt= con.prepareStatement(sql);
				pstmt.setTimestamp(1,sqlTimestamp);
				pstmt.setLong(2,adminId);
				//System.out.println(sql);
				int result = pstmt.executeUpdate();
				/*if(result==1)
					System.out.println("lastLogin time insertion successful");
				else
					System.out.println("lastLogin time insertion Failed");*/
				
	    	}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				SisDbUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}//finally
		System.out.println(admin);
		return valid;
	}

	@Override
	public Admin getByUsernamePassword(String username, String password) {
		
		PreparedStatement pstmt =null;
		Admin admin=null;
		admin=DaoFactory.getAdmin();
		try {
			con=SisDbUtil.getConnection();
			
			String sql ="select * from admin_login where userName=? and password=? ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				int adminId =rs.getInt("adminId");
				username=rs.getString("userName");
				
				admin.setUsername(username);
				admin.setAdminId(adminId);
	    	}//if
		} catch (Exception e) {
			e.printStackTrace();
		}//catch
		finally {
			try {
				SisDbUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}//finally
		
		return admin;
	}//getByusernamepassword()

	
	@Override
	public boolean checkFirstTime(long adminId) {
		boolean firstTime=false;
		PreparedStatement pstmt =null;
		try {
			con=SisDbUtil.getConnection();
			String sql ="select * from admin_login where adminId=? and registered=0 ";
			pstmt=con.prepareStatement(sql);
			pstmt.setLong(1, adminId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				firstTime=true;
			}//if
			
		}catch(SQLException e) {
			System.out.println("Exception in adminDaoImplement checkFirstTime() ");
			e.printStackTrace();
		}//catch
		finally {
			try {
				SisDbUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}//finally
		return firstTime;
	}

	@Override
	public boolean deleteQuery(long queryId) {
		try {
			con=SisDbUtil.getConnection();
			String sql="update  parent_query set deleted =? where queryId=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,"YES");
			ps.setLong(2,queryId);
			int result = ps.executeUpdate();
			if(result==1) {
				System.out.println("delete row from parent_query where queryId="+queryId);
				return true;
			}
			else {
				System.out.println("con't delete row from parent_query where queryId="+queryId);
				return false;
			}	
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				SisDbUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}//finally
		return true;
	}

	@Override
	public boolean permanentDeleteQuery(long queryId) {
		try {
			con=SisDbUtil.getConnection();
			String sql="delete from parent_query where queryId=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setLong(1,queryId);
			int result = ps.executeUpdate();
			if(result==1) {
				System.out.println("delete row from parent_query where queryId="+queryId);
				return true;
			}
			else {
				System.out.println("con't delete row from parent_query where queryId="+queryId);
				return false;
			}	
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				SisDbUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}//finally
		return true;
	}//permanentDelete

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
	public boolean deleteLeave(Long leaveId) {
		try {
			con=SisDbUtil.getConnection();
			String sql="update leave_request set deletedByAdmin=? where leaveId=?";
			PreparedStatement p = con.prepareStatement(sql);
			p.setString(1, "YES");
			p.setLong(2,leaveId);
			boolean deleted=p.execute();
			if(deleted==true)
				return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<Leave> getAllLeave() {
		List<Leave> list = new ArrayList<Leave>();
		Leave leave = null;
		try {
			con=SisDbUtil.getConnection();
			String sql="select * from leave_request where deletedByAdmin=?";
			PreparedStatement p=con.prepareStatement(sql);
			p.setString(1, "NO");
			rs=p.executeQuery();
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

	@Override
	public boolean approveLeave(Long leaveId) {
		try {
			con=SisDbUtil.getConnection();
			System.out.println("leaveID"+leaveId);
			String sql="update leave_request set approvedByAdmin='YES' where leaveId=?";
			PreparedStatement p = con.prepareStatement(sql);
			//p.setString(1, "YES");
			p.setLong(1,leaveId);
			int approved=p.executeUpdate();
			if(approved==1) {
				return true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				SisDbUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	@Override
	public int[] getAttendance(Date date) {
		int []attendance = new int[3];
		try {
			java.sql.Date _date = new java.sql.Date(date.getTime());
			con=SisDbUtil.getConnection();
			String sql="select count(hostelId) as absent from attendance where TODAY=? and status=0";
			PreparedStatement p = con.prepareStatement(sql);
			p.setDate(1, _date);
			rs=p.executeQuery();
			while(rs.next()) {
				attendance[0]=rs.getInt("absent");
			}
			
			sql="select count(hostelId) as present from attendance where TODAY=? and status=1";
			PreparedStatement p2 = con.prepareStatement(sql);
			p2.setDate(1, _date);
			rs=p2.executeQuery();
			while(rs.next()) {
				attendance[1]=rs.getInt("present");
			}
			
			sql="select count(hostelId) as _leave from attendance where TODAY=? and status=2";
			PreparedStatement p3 = con.prepareStatement(sql);
			p3.setDate(1, _date);
			rs=p3.executeQuery();
			while(rs.next()) {
				attendance[2]=rs.getInt("_leave");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				SisDbUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return attendance;
	}

	@Override
	public List<ComplainQuery> getAllComplain(Long adminId) {
		ComplainQuery c=null;
		ArrayList<ComplainQuery> list = new ArrayList<ComplainQuery>();
		try {
			con=SisDbUtil.getConnection();
			String sql="select * from query where destinationId=1000 and deletedForDestination='NO' ";
			PreparedStatement p = con.prepareStatement(sql);
			/*p.setLong(1, adminId);*/
			/*p.setString(1, "NO");*/
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
				System.out.println("id => "+id);
				System.out.println("Query id => "+queryId);
				System.out.println("source id => "+sourceId);
				System.out.println("Destination id => "+destinationId);
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
	public boolean updateAttendance(Long hostelId,Date date, String attendance) {
		try {
			con=SisDbUtil.getConnection();
			String sql="update attendance set status=? where TODAY=? and hostelId=?";
			PreparedStatement p = con.prepareStatement(sql);
			p.setString(1, attendance);
			p.setDate(2, new java.sql.Date(date.getTime()));
			p.setLong(3, hostelId);
			int count=p.executeUpdate();
			Boolean updated = count>0;
			if(updated) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				SisDbUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}//updateAttendance

	//sunidhi
	@Override
	public List<Mess_Menu> ShowMessMenu() {
		List<Mess_Menu>menu_list  =new ArrayList<Mess_Menu>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con = SisDbUtil.getConnection();
			String sql="select * from mess_menu";
			pstmt=con.prepareStatement(sql);
			 rs=pstmt.executeQuery();
			 while(rs.next()){
				
				 Mess_Menu mess_menu=new Mess_Menu(); 
				 mess_menu.setId(rs.getInt("id"));
				 mess_menu.setDay(rs.getString("day"));
				 mess_menu.setBreakfast(rs.getString("breakfast"));
				 mess_menu.setLunch(rs.getString("lunch"));
				 mess_menu.setSnacks(rs.getString("snacks"));
				 mess_menu.setDinner(rs.getString("dinner"));
	            menu_list.add(mess_menu);
			 }
		} catch (Exception e) {
	     e.printStackTrace();
		}
		return menu_list;
	}
	
	@Override
	public boolean updateMenu(Mess_Menu mess_menu) {
		Connection con=null;
		 PreparedStatement pstmt=null;
		 int result=0;
		
		try{
			con  = SisDbUtil.getConnection();
			System.out.println("connection");
			    
			String sql="update mess_menu set breakfast=?,lunch=?, snacks=?, dinner=? where day=?";
	pstmt=con.prepareStatement(sql);
	pstmt.setString(1,mess_menu.getBreakfast());
	pstmt.setString(2,mess_menu.getLunch());
	pstmt.setString(3,mess_menu.getSnacks());
	pstmt.setString(4,mess_menu.getDinner());
	pstmt.setString(5,mess_menu.getDay());
	 result= pstmt.executeUpdate();
		
		}catch (Exception e) {
		     e.printStackTrace();
			}
		if(result==1){
			return true;
		}
		return false;
		
		
	}

	@Override
	public boolean setSent(Long hostelId,Long leaveId) {
		try {
			con=SisDbUtil.getConnection();
			String sql = "update leave_request set sendToStudentEmail=?,sendToStudentEmailTime=? where leaveId=? and hostelId=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "YES");
			Date date =new Date();
			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			pstmt.setDate(2, sqlDate);
			pstmt.setLong(3, leaveId);
			pstmt.setLong(4, hostelId);
			int count = pstmt.executeUpdate();
			Boolean action = ( count > 0 ) ;
			if(action==false)
				return false;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	
	
	
	

}//class

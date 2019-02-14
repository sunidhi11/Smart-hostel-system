package sis.com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import sis.com.bo.Admin;
import sis.com.bo.SuperAdmin;
import sis.com.dao.SuperAdminDao;
import sis.com.daoFactory.DaoFactory;
import sis.com.util.SisDbUtil;

public class SuperAdminDaoImpl implements SuperAdminDao {
	Connection con =null;
	ResultSet rs=null;
	@Override
	public List<Admin> getAllRegisteredAdmin() {
		
		List<Admin> listOfAdmin = new ArrayList<Admin>();
		ResultSet rs1=null;
		try {
			con=SisDbUtil.getConnection();
			String sql="select * from admin_login ";
			PreparedStatement pstmt = con.prepareStatement(sql);
			//pstmt.setInt(1, 1);//1 for registered
			rs1=pstmt.executeQuery();
			while(rs1.next()) {
				Admin admin = DaoFactory.getAdmin();
				java.util.Date lastLogin=null;
				java.sql.Timestamp timestamp = rs1.getTimestamp("lastLogin");
				if(timestamp!=null) {
					lastLogin = new java.util.Date(timestamp.getTime());
				}
				admin.setUsername(rs1.getString("username"));
				admin.setPassword(rs1.getString("password"));
				admin.setLastLogIn(lastLogin);
				admin.setRegistered(rs1.getInt("registered"));
				
				String sql1 ="select * from admin where adminId=?";
				PreparedStatement pstmt1 = con.prepareStatement(sql);
				pstmt1 = con.prepareStatement(sql1);
				pstmt1.setLong(1, rs1.getLong("adminId"));
				rs=pstmt1.executeQuery();
				while(rs.next()) {
					admin.setAdminId(rs.getLong("adminId"));
					admin.setName(rs.getString("name"));
					admin.setAddress(rs.getString("address"));
					admin.setEmail(rs.getString("email"));
					admin.setMobile(rs.getString("mobile"));
					admin.setDateOfBirth(rs.getDate("dob"));
					admin.setDateOfJoin(rs.getDate("doj"));
					admin.setGender(rs.getString("gender"));
					admin.setFatherName(rs.getString("fatherName"));
					listOfAdmin.add(admin);
				}//while
			}//while
			
			return listOfAdmin;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
		}
		return null;
	}
	@Override
	public Boolean deleteAdmin(Long adminId) {
		try {
			String sql ="delete from admin_login where adminId=?";
			con=SisDbUtil.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, adminId);
			int count = pstmt.executeUpdate();
			Boolean deleted = (count > 0);
			if(deleted==true) {
				return true;
			}else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}//deleteAdmin
	@Override
	public Boolean addNewAdmin(String username, String password) {
		try {
			String sql ="insert into admin_login(username,password)values(?,?)";
			con=SisDbUtil.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			int count = pstmt.executeUpdate();
			Boolean created = (count > 0);
			if(created==true) {
				System.out.println("admin created");
				return true;
			}else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}//addNewAdmin
	@Override
	public List<Admin> getAllAdmin() {
		Admin admin = null;
		List<Admin> listOfAdmin = new ArrayList<Admin>();
		ResultSet rs1=null;
		try {
			con=SisDbUtil.getConnection();
			String sql="select * from admin_login ";
			PreparedStatement pstmt = con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				
				admin= DaoFactory.getAdmin();
				java.sql.Timestamp timestamp = rs.getTimestamp("lastLogin");
				java.util.Date lastLogin=null;
				if(rs.getTimestamp("lastLogin")!=null) {
					timestamp=rs.getTimestamp("lastLogin");
					 lastLogin = new java.util.Date(timestamp.getTime());
				}
				
				admin.setUsername(rs.getString("username"));
				admin.setPassword(rs.getString("password"));
				admin.setLastLogIn(lastLogin);
				admin.setRegistered(rs.getInt("registered"));
				admin.setAdminId(rs.getLong("adminId"));
				
				listOfAdmin.add(admin);
			}//while
			
			return listOfAdmin;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
		}
		return null;
	}
	@Override
	public SuperAdmin validateSuperAdmin(String username, String password) {
		try {
			con = SisDbUtil.getConnection();
			String sql="select * from super_admin where username=? and password=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			rs=pstmt.executeQuery();
			SuperAdmin superAdmin=new SuperAdmin();
			while(rs.next()) {
				superAdmin.setSuperAdminId(rs.getLong("superAdminId"));
				superAdmin.setUsername(rs.getString("username"));
				superAdmin.setPassword(rs.getString("password"));
				java.sql.Timestamp timestamp = rs.getTimestamp("lastLogin");
				superAdmin.setLastLogin(new Date(timestamp.getTime()));
			}//while
			
			return superAdmin;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}

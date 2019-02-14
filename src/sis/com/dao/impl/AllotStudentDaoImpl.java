/**

user sunidhi



 * 
 */
package sis.com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import sis.com.bo.RegStudent;
import sis.com.bo.SelectedStudent;
import sis.com.dao.AllotStudentDao;
import sis.com.util.SisDbUtil;

/**
 * @author hp
 *
 */
public class AllotStudentDaoImpl implements AllotStudentDao {
	
	public List<RegStudent> getAllSelectedStudents(){
		List<RegStudent> selected_stuList =new ArrayList<RegStudent>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con = SisDbUtil.getConnection();
			String sql="select * from register_student where selected=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,"yes");
			 rs=pstmt.executeQuery();
			 while(rs.next()){
				
				 RegStudent regstudent=new RegStudent(); 
	             regstudent.setName(rs.getString("name"));
	           //  System.out.println(regstudent.getName());
	             regstudent.setEnrollment(rs.getLong("enrollment"));
	             regstudent.setHostel(rs.getString("hostel"));
	             selected_stuList.add(regstudent);
			 }
		} catch (Exception e) {
	     e.printStackTrace();
		}
		return selected_stuList;
	}  //method 1
	
//=========================================================================
	public SelectedStudent checkDuNo(SelectedStudent s_student){
		Connection con=null;
		PreparedStatement pstmt=null;
		PreparedStatement pstmt_update=null;
		PreparedStatement pstmt_insert=null;

		ResultSet rs=null;
		try {
			con = SisDbUtil.getConnection();
			String sql="  select enrollment from du_no where du_no=? and enrollment=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,s_student.getDu_no());
			pstmt.setLong(2,s_student.getEnrollment_no());
			 rs=pstmt.executeQuery();
			 if(rs.next()){
				Long enroll= rs.getLong("enrollment");
				s_student.setEnrollment_no(enroll);
				s_student.setFound(true);
				 System.out.println("is present in impl"+s_student.isFound());
			 }   // if
				
			if(s_student.isFound()==true){
			String sql_upadte="update register_student set confirm=? where enrollment=?";
			 pstmt_update=con.prepareStatement(sql_upadte);
			 pstmt_update.setString(1,"yes");
			 pstmt_update.setLong(2,s_student.getEnrollment_no());
				 int status = pstmt_update.executeUpdate();
				 if(status==1){
					 s_student.setUpdated_indb(true);
					 System.out.println("is updated in db "+s_student.isUpdated_indb());
				 }  //if
				}    //if
	

			 
		} catch (Exception e) {
	     e.printStackTrace();
		}
		
		return s_student;
	}     // method2
	//======================================================================================
	public boolean  getConfirmStatus(long enrollment){
		boolean confirm=false;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con = SisDbUtil.getConnection();
			String sql="select confirm from register_student where enrollment=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setLong(1,enrollment);
			System.out.println(enrollment);
		//	System.out.println("in impl value of confirm 1");
			 rs=pstmt.executeQuery();
			 if(rs.next()){
				 if(rs.getString("confirm").equals("yes")){
					 System.out.println("yes");
				confirm=true;}
			 }
		} catch (Exception e) {
	     e.printStackTrace();
		}
		
		System.out.println("value of confirm in impl"+confirm);
		return confirm;
		
		
	}

	
	
}  // class

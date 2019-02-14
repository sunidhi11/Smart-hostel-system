package sis.com.dao.impl;
import java.sql.*;
import java.util.Date;

import sis.com.bo.FeedBack;
import sis.com.dao.FeedbackDao;
import sis.com.util.SisDbUtil;
public class FeedBackImpl implements FeedbackDao{

	public boolean add(FeedBack feedback){
		Connection con=null;
		PreparedStatement pstmt = null;
		int rs =0;
		try{
			 con=SisDbUtil.getConnection();
 String sql ="insert into feedback(hostelId, Stu_name, food, clean, maintain,staff, security, rating, message, dof)"
			 		+ "values(?,?,?,?,?,?,?,?,?,?)";
			    pstmt = con.prepareStatement(sql);
			    pstmt.setLong(1, feedback.getHostelId());
			    pstmt.setString(2, feedback.getName());
			    pstmt.setString(3,feedback.getFood());
				 pstmt.setString(4, feedback.getClean());
				 pstmt.setString(5, feedback.getMaintain());
				 pstmt.setString(6, feedback.getStaff());
				 pstmt.setString(7, feedback.getSecurity());
				 pstmt.setInt(8, feedback.getRating());
				pstmt.setString(9, feedback.getMessage());
				  Date dof = new Date();
				 Timestamp t = new Timestamp(dof.getTime()) ; 
				 pstmt.setTimestamp(10,t);
				 rs= pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		 if(rs==1){
			 return true;
		 }
		 else{
			return false;
		 }
	}
	
	
	
	
}

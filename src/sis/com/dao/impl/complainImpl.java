package sis.com.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import sis.com.bo.Complain;
import sis.com.dao.ComplainDao;
import sis.com.util.SisDbUtil;

import org.joda.time.*;

import com.sun.jmx.snmp.Timestamp;

public class complainImpl implements ComplainDao{
	public Complain insertComplain(Complain complain){
		Connection con = null;
		  PreparedStatement pstmt = null;
		  
		  try {
			con=SisDbUtil.getConnection();
			/*
			 *  complainId   | int(11)
 hostelId     | int(11)
 complainDate | date
 department   | varchar(45)
 complain     | varchar(45)
 status       | varchar(10)
 solveDate    | date
 email        | varchar(40)
			 * 
			 * */
String sql="insert into complain( hostelId,complainDate,department,complain "
		+ ",status,solveDate,email)"
					+ "values(?,?,?,?,?,?,? )";
long millis=System.currentTimeMillis();  
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, complain.getHostelId());
			pstmt.setDate(2, new Date(millis));
			pstmt.setString(3, complain.getDepartment());
			pstmt.setString(4, complain.getComplain());
			pstmt.setString(5, complain.getStatus());
			pstmt.setDate(6,null);
			pstmt.setString(7, complain.getEmail());
			int result=pstmt.executeUpdate();
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				SisDbUtil.closeConnection(con);
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}//finally
		return complain;
	}//insert
	
	
	public List<Complain> getAllComplain(){
		Connection con = null;
		  PreparedStatement pstmt = null;
		  ResultSet rs = null;
		List<Complain> show=new ArrayList<Complain>();
		try {
			con=SisDbUtil.getConnection();
			String sql="select *from complain";
			pstmt =con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				int complainId=rs.getInt(1);
				int hostelId = rs.getInt(2);
				Date complainDate=rs.getDate(3);
				String department= rs.getString(4);
				String stuComplain=rs.getString(5);
				String status=rs.getString(6);
				Date solveDate=rs.getDate(7);
				String email=rs.getString(8);
				String status2=rs.getString(9);
				
				Complain complain=new Complain();
				complain.setComplainId(complainId);
				complain.setHostelId(hostelId);
				complain.setComplainDate(complainDate);
				complain.setDepartment(department);
			    complain.setComplain(stuComplain);
			    complain.setStatus(status);
			    complain.setSolveDate(solveDate);
			    complain.setEmail(email);
			    complain.setSentStudent(status2);
				
				show.add(complain);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				SisDbUtil.closeConnection(con);
			} catch (SQLException e) {
			
				e.printStackTrace();
			}
			
		}
		return show;
	}
	
	public List<Complain> getAllEmail(){
		Connection con = null;
		  PreparedStatement pstmt = null;
		  ResultSet rs = null;
		List<Complain> show=new ArrayList<Complain>();
		try {
			con=SisDbUtil.getConnection();
			String sql="select *from complain";
			pstmt =con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				
				int complainId=rs.getInt(1);
				int hostelId = rs.getInt(2);
				Date complainDate=rs.getDate(3);
				String department= rs.getString(4);
				String stuComplain=rs.getString(6);
				String status=rs.getString(7);
				Date solveDate=rs.getDate(8);
				String email=rs.getString(9);
				
				Complain complain=new Complain();
				complain.setComplainId(complainId);
				complain.setHostelId(hostelId);
				complain.setComplainDate(complainDate);
				complain.setDepartment(department);
				 complain.setComplain(stuComplain);
			    complain.setStatus(status);
			    complain.setSolveDate(solveDate);
				show.add(complain);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				SisDbUtil.closeConnection(con);
			} catch (SQLException e) {
			
				e.printStackTrace();
			}
			
		}
		return show;
	}
	
	public Complain getComplainbyId(long id){
		Complain complain=new Complain();
		Connection con = null;
		  PreparedStatement pstmt = null;
		  ResultSet rs = null;
		
		try {
			con=SisDbUtil.getConnection();
			String sql="select *from complain where complainId="+id;
			pstmt =con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				int complainId=rs.getInt(1);
				int hostelId = rs.getInt(2);
				Date complainDate=rs.getDate(3);
				String department= rs.getString(4);
				String stuComplain=rs.getString(5);
				String status=rs.getString(6);
				Date solveDate=rs.getDate(7);
				String email=rs.getString(8);
				String status2=rs.getString(9);
				
				
				complain.setComplainId(complainId);
				complain.setHostelId(hostelId);;
				complain.setComplainDate(complainDate);
				complain.setDepartment(department);
				 complain.setComplain(stuComplain);
				    complain.setStatus(status);
				    complain.setSolveDate(solveDate);
				    complain.setEmail(email);
				    complain.setSentStudent(rs.getString(9));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				SisDbUtil.closeConnection(con);
			} catch (SQLException e) {
			
				e.printStackTrace();
			}
			
		}

		return complain;
	}
	
	public List<Complain> getAllMess(){
		
		Connection con = null;
		  PreparedStatement pstmt = null;
		  ResultSet rs = null;
		List<Complain> show=new ArrayList<Complain>();
		try {
			con=SisDbUtil.getConnection();
			String sql="select *from complain where department in('Mess')";
			pstmt =con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				int complainId=rs.getInt(1);
				int hostelId = rs.getInt(2);
				Date complainDate=rs.getDate(3);
				String department= rs.getString(4);
				String stuComplain=rs.getString(5);
				String status=rs.getString(6);
				Date solveDate=rs.getDate(7);
				String email=rs.getString(8);
				String status2=rs.getString(9);
				
		         Complain complain=new Complain();	
		         complain.setComplainId(complainId);
				complain.setHostelId(hostelId);	
			     complain.setComplainDate(complainDate);
				 complain.setDepartment(department);
				 complain.setComplain(stuComplain);
			     complain.setStatus(status);
				 complain.setSolveDate(solveDate);
				 complain.setEmail(email);
				 complain.setSentStudent(rs.getString(9));
				
			    show.add(complain);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				SisDbUtil.closeConnection(con);
			} catch (SQLException e) {
			
				e.printStackTrace();
			}
			
		}

		return show;
	}
	
	
 public List<Complain> getAllElectric(){
	
	Connection con = null;
	  PreparedStatement pstmt = null;
	  ResultSet rs = null;
	List<Complain> show=new ArrayList<Complain>();
	try {
		con=SisDbUtil.getConnection();
		String sql="select *from complain where department in('Electric')";
		pstmt =con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			int complainId=rs.getInt(1);
			int hostelId = rs.getInt(2);
			Date complainDate=rs.getDate(3);
			String department= rs.getString(4);
			String stuComplain=rs.getString(5);
			String status=rs.getString(6);
			Date solveDate=rs.getDate(7);
			String email=rs.getString(8);
			String status2=rs.getString(9);
			
	         Complain complain=new Complain();	
	         complain.setComplainId(complainId);
			 complain.setHostelId(hostelId);
				
			 complain.setComplainDate(complainDate);
			 complain.setDepartment(department);
			 complain.setComplain(stuComplain);
			 complain.setStatus(status);
			 complain.setSolveDate(solveDate);
			 complain.setEmail(email);
			 complain.setSentStudent(rs.getString(9));
			
		    show.add(complain);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}catch (Exception e) {
		e.printStackTrace();
	}finally{
		try {
			SisDbUtil.closeConnection(con);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
	}

	return show;
	
}
 public List<Complain> getAllClean(){
	
	
	Connection con = null;
	  PreparedStatement pstmt = null;
	  ResultSet rs = null;
	List<Complain> show=new ArrayList<Complain>();
	try {
		con=SisDbUtil.getConnection();
		String sql="select *from complain where department in('Cleanliness')";
		pstmt =con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			int complainId=rs.getInt(1);
			int hostelId = rs.getInt(2);
			Date complainDate=rs.getDate(3);
			String department= rs.getString(4);
			String stuComplain=rs.getString(5);
			String status=rs.getString(6);
			Date solveDate=rs.getDate(7);
			String email=rs.getString(8);
			
	         Complain complain=new Complain();	
	         complain.setComplainId(complainId);
			 complain.setHostelId(hostelId);;
				
			 complain.setComplainDate(complainDate);
			 complain.setDepartment(department);
			 complain.setComplain(stuComplain);
			 complain.setStatus(status);
			 complain.setSolveDate(solveDate);
			 complain.setEmail(email);
			 complain.setSentStudent(rs.getString(9));
		    show.add(complain);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}catch (Exception e) {
		e.printStackTrace();
	}finally{
		try {
			SisDbUtil.closeConnection(con);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
	}

	return show;
}

  public boolean deleteComplain(long id){
 	Connection con=null;
	 PreparedStatement pstmt=null;
	int result = 0;
	try {
		con = SisDbUtil.getConnection();
		String sql="DELETE FROM complain where hostelid="+id;
		pstmt=con.prepareStatement(sql);
		result=pstmt.executeUpdate();
	}catch(Exception e){
		e.printStackTrace();
	}
	System.out.println(result);
	if(result==0)
		return false;
	return true;
 }
  
  public boolean updateStatus(int id){
	 	Connection con=null;
		 PreparedStatement pstmt=null;
		int result = 0;
		try {
			con = SisDbUtil.getConnection();
			long millis=System.currentTimeMillis();
			String sql="Update complain set status=?, solveDate=? where complainId="+id;
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "Solved");
			pstmt.setDate(2, new Date(millis));
			result=pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		System.out.println(result);
		if(result==0)
			return false;
		return true;
	 }
 public int deleteComplain(List<Complain> getAllComplain){
	 Connection con=null;
	 PreparedStatement pstmt=null;
	int result = 0;
	int count=0;
	try {
		con = SisDbUtil.getConnection();
		long millis=System.currentTimeMillis();
		DateTime dt1=null;
		
		
		 Iterator itr=getAllComplain.iterator();  
		  while(itr.hasNext()){  
		   Complain comp=(Complain)itr.next(); 
		   try{
		   java.util.Date cDate=new java.util.Date();
		   if(comp.getStatus().equalsIgnoreCase("solved")){
		   Date d1=comp.getSolveDate();
		   System.out.println("date1"+d1);
		
		   java.util.Date solveDate=new Date(d1.getTime());
		   System.out.println("sDate"+solveDate);
		   
		   dt1=new DateTime(solveDate);
		   System.out.println("dt1"+dt1);
		   
		   DateTime dt2=new DateTime(cDate);
		   System.out.println("dt2"+dt2);
		   
		   if( (Days.daysBetween(dt1,dt2).getDays())>=1&&comp.getSentStudent().equalsIgnoreCase("sent") ){
			   String sql="Delete from complain where complainId="+comp.getComplainId();
			   System.out.println("complainId"+comp.getComplainId());			   
				pstmt=con.prepareStatement(sql);
			   result=pstmt.executeUpdate();
			   count++;
			   System.out.println(result+"result");
		   }}//if
		   }catch(Exception e){
			   e.printStackTrace();
		   }
		  } //while 
		
	}catch(Exception e){
		e.printStackTrace();
	}
	System.out.println(result);
	System.out.println(count);
	return count;
 }
 
 public boolean sendmssg(String mssg,String email){
	 //final String username = "smanhar747@gmail.com";
	 //final String password = "$1268cmd747netone123$";
	 final String username = "sunidhi10garg@gmail.com";
	 final String password = "sunidhigarg10";

	 Properties props = new Properties();
	 props.put("mail.smtp.auth", "true");
	 props.put("mail.smtp.starttls.enable", "true");
	 props.put("mail.smtp.host", "smtp.gmail.com");
	 props.put("mail.smtp.port", "587");

	 Session email_session = Session.getInstance(props,
	   new javax.mail.Authenticator() {
	 	protected PasswordAuthentication getPasswordAuthentication() {
	 		return new PasswordAuthentication(username, password);
	 	}
	   });

	 try {

	 	Message message = new MimeMessage(email_session);
	 	//message.setFrom(new InternetAddress("smanhar747@gmail.com"));
	 	message.setFrom(new InternetAddress("sunidhi10garg@gmail.com"));
	 	message.setRecipients(Message.RecipientType.TO,
	 	InternetAddress.parse(email));
	 	message.setSubject("Complain Status");
	 	message.setText(mssg);
	 	Transport.send(message);
       return true;
	 	
	 } catch (MessagingException e) {
	 	//throw new RuntimeException(e);
	 	System.out.print(e.getMessage());
	 }
	 return false;
	 
 }
 public boolean insert(Complain complain){
	 Connection con=null;
	 PreparedStatement pstmt=null;
	int result = 0;
	try {
		con = SisDbUtil.getConnection();
		long millis=System.currentTimeMillis();
		String sql="insert into repliedcomplain(complainId,adminId,hostelId,"
				+ "message,status,deletedforDestination,department,time1"
				+ ")values(?,?,?,?,?,?,?,?)";
		java.sql.Timestamp t = new java.sql.Timestamp(millis);
		
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, complain.getComplainId());
		pstmt.setInt(2, 0);
		pstmt.setInt(3, complain.getHostelId());
		pstmt.setString(4, complain.getStatus());
		pstmt.setString(5,"Yes");
		pstmt.setString(6, "no");
		pstmt.setString(7, complain.getDepartment());
		pstmt.setTimestamp(8, t);
		
		
		result=pstmt.executeUpdate();
	}catch(Exception e){
		e.printStackTrace();
	}
	System.out.println(result);
	if(result==0){
		return false;
	}
	return true;
 }
 
 
 public int updateStatusStudent(int id){
	 Connection con=null;
	 PreparedStatement pstmt=null;
	int result = 0;
	try {
		con = SisDbUtil.getConnection();
		long millis=System.currentTimeMillis();
		String sql="Update complain set sentstudent=? where complainId="+id;
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, "sent");
		result=pstmt.executeUpdate();
	}catch(Exception e){
		e.printStackTrace();
	}
	 return 0;
 }
 
 
 
	}



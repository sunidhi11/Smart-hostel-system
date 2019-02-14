package sis.com.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;

import sis.com.util.*;
import sis.com.bo.Worker;
import sis.com.dao.WorkerDao;

public class WorkerImpl implements WorkerDao {
	public List<Worker> getAllWorkers(){
		Connection con = null;
		  PreparedStatement pstmt = null;
		  ResultSet rs=null;
		
		  ArrayList<Worker>list=new ArrayList<Worker>();
	 try {
			con  = SisDbUtil.getConnection();
			String sql="select *from Worker";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Worker w=new Worker();
				w.setId(rs.getLong(1));
               System.out.println(rs.getLong(1));
                w.setName(rs.getString(2));
                w.setFatherName(rs.getString(3));
                w.setMotherName(rs.getString(4));
                w.setAddress(rs.getString(5));
                w.setMobileno(rs.getLong(6));
                w.setGender(rs.getString(7));
             
                w.setAadharno(rs.getLong(8));
                w.setDateofjoinig(rs.getDate(9));
                w.setDateofbirth(rs.getDate(10));	
                
                list.add(w);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			
			try {
				SisDbUtil.closeConnection(con);
				System.out.println("connection");
			} catch (SQLException e) {
			
				e.printStackTrace();
			}
			
		}//finally
		
		for(Worker work:list){
			System.out.println(work.getId());
		}
	 return list;
	}
	 public Worker addWorker(Worker worker){ 
		 

			  Connection con = null;
			  PreparedStatement pstmt = null;
			 		  
			  try {
				  
				con  = SisDbUtil.getConnection();
				String sql ="insert into worker(name,fatherName,motherName,"
						+ "address,mobile,gender,dob,doj,aadhar)"
						+ "values(?,?,?,?,?,?,?,?,?)";
				pstmt  = con.prepareStatement(sql);
				pstmt.setString(1, worker.getName());
				pstmt.setString(2, worker.getFatherName());
				pstmt.setString(3, worker.getMotherName());
				//pstmt.setBlob(5, worker.getPhoto());
				pstmt.setString(4, worker.getAddress());
				pstmt.setLong(5, worker.getMobileno());
				pstmt.setString(6, worker.getGender());
		    	pstmt.setDate(7, worker.getDateofbirth());
		    	pstmt.setDate(8, new Date(System.currentTimeMillis()));

				pstmt.setLong(9,worker.getAadharno());
		    	pstmt.executeUpdate();
		    	
				
			
			}
			  catch (SQLException e) {
				e.printStackTrace();
				}catch (Exception e2) {
					e2.printStackTrace();
				}finally{
					if(con!=null){
						try {
							con.close();
						} catch (Exception e3) {
							e3.printStackTrace();
						}//catch
					}//if
				}//finally
				
			
			
			return worker ;
		}

	 
	  
	 public boolean updateWorker(Worker worker){ 
		 Connection con = null;
		  PreparedStatement pstmt = null;
		  ResultSet rs = null;
		  
		  Worker worker1 = null;
		  
		  try {
			  //workerId name fatherName motherName address mobile gender dob  doj  aadhar
			con  = SisDbUtil.getConnection();
			String sql ="update worker set name=?,fatherName=?,"
					+ "motherName=?,address=?,mobile=?,gender=?,dob=?,aadhar=? where workerId=?"; 
			pstmt  = con.prepareStatement(sql);
			pstmt.setLong(9, worker.getId());
			System.out.println(worker.getName());
			pstmt.setString(1, worker.getName());
			pstmt.setString(2, worker.getFatherName());
			pstmt.setString(3, worker.getMotherName());
			//pstmt.setBinaryStream(5, worker.getPhoto());
			pstmt.setString(4, worker.getAddress());
			pstmt.setLong(5, worker.getMobileno());
			pstmt.setString(6, worker.getGender());
			pstmt.setDate(7,worker.getDateofbirth());
			pstmt.setLong(8, worker.getAadharno());
			pstmt.executeUpdate();
	    	
	    	if(pstmt.executeUpdate()>0){
	    		return true;
	    	}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			
			try {
				SisDbUtil.closeConnection(con);
				System.out.println("connection close");
			} catch (SQLException e) {
			
				e.printStackTrace();
			}
			
		}
		
	
		return false;
	 
	 }
	public boolean deleteWorker(long id){
		 Connection con = null;
		  PreparedStatement pstmt = null;
		  int result=0;
		  List<Worker>search=new ArrayList<Worker>();
		  try {
			con = SisDbUtil.getConnection();
			System.out.println("connection");
			String sql="delete from worker where workerId="+id;
			System.out.println("connection1");
			pstmt=con.prepareStatement(sql);
			System.out.println("connection2");
	result=pstmt.executeUpdate();
	
	if(result>0){
		return true;
	}
			}catch (SQLException e) {
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
		  return false;
	}
	 
	  public List<Worker> getAllWorkersById(String name1){
		  Connection con = null;
		  PreparedStatement pstmt = null;
		  ResultSet rs = null;
		  List<Worker>search=new ArrayList<Worker>();
		  try {
			con = SisDbUtil.getConnection();
			System.out.println("connection");
			String sql="select *from worker where name like('%"+name1+"%')";
			System.out.println("connection1");
			pstmt=con.prepareStatement(sql);
			System.out.println("connection2");
			rs=pstmt.executeQuery();
			while(rs.next()){
				long w_id=rs.getLong(1);
				String name=rs.getString(2);
				String f_name=rs.getString(3);
				String m_name=rs.getString(4);
				System.out.println("hello");
				//String name=rs.getBlob(5, worker.getPhoto());
				String address=rs.getString(5);
				long mono =rs.getLong(6);
				String gender=rs.getString(7);
				String religion=rs.getString(8);
				Long aadhar=rs.getLong(9);
				Date doj=rs.getDate(10);
				Date dob=rs.getDate(11);
				
				Worker w=new Worker();
				w.setId(w_id);
				w.setName(name);
				w.setFatherName(f_name);
				w.setMotherName(m_name);
				//pstmt.setBlob(5, worker.getPhoto());
				w.setAddress(address);
				w.setMobileno(mono);
				w.setGender(gender);
			
				w.setAadharno(aadhar);
		    	w.setDateofjoinig(doj);
		    	w.setDateofbirth(dob);
System.out.println(w_id);
		    	search.add(w);
			
			}//while
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
		  return search;
	  }
	  
	 public Worker getWorkerById(long id){
		 
		 
		 Connection con = null;
		  PreparedStatement pstmt = null;
		  ResultSet rs=null;
		  Worker w=new Worker();
		  ArrayList<Worker>l1=new ArrayList<Worker>();
	 try {
			con  = SisDbUtil.getConnection();
			String sql="select *from Worker where workerId="+id;
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				w.setId(rs.getLong(1));
               w.setName(rs.getString(2));
               w.setFatherName(rs.getString(3));
               w.setMotherName(rs.getString(4));
               w.setAddress(rs.getString(5));
               w.setMobileno(rs.getLong(6));
               w.setGender(rs.getString(7));
               w.setDateofjoinig(rs.getDate(8));
               w.setDateofbirth(rs.getDate(9));	
               w.setAadharno(rs.getLong(10));
               
  
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			
			try {
				SisDbUtil.closeConnection(con);
				System.out.println("connection");
			} catch (SQLException e) {
			
				e.printStackTrace();
			}
			
		} 
		 return w;
	 }
	  
	  private long getNextId(Connection con) throws SQLException {

			Statement stmt = con.createStatement();
			String sql="select nvl(max(id),500)+1 from Worker";
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				return rs.getLong(1);
			}
			
			return 0;
		}
}

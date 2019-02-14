package sis.com.dao.impl;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import sis.com.bo.RegStudent;
import sis.com.bo.Student;
import sis.com.dao.RegStudentDao;
import sis.com.util.SisDbUtil;

public class RegisterStudentImpl implements RegStudentDao {

public boolean  addStudent(RegStudent regstudent){
		
		Connection con=null;
		 PreparedStatement pstmt=null;
		 PreparedStatement pstmt_getid=null;
		 PreparedStatement pstmt_parent=null;
		 PreparedStatement pstmt_doc=null;
		 int result=0;
		 ResultSet rs= null;
		try{
			con  = SisDbUtil.getConnection();
		
		
String sql="insert into register_student(ROLLNO,NAME,COURSE,BRANCH,MOBILENO,"
		+ "EMAIL,SEMESTER,CGPA,ENROLLMENT,HOSTEL,gender,"
		+ "category,dob,ADDRESS,accno)"
		+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
 pstmt=con.prepareStatement(sql);
 //===============student details==========================
// pstmt.setLong(1,nextId);
 pstmt.setLong(1,regstudent.getRollno());
 pstmt.setString(2,regstudent.getName());
 pstmt.setString(3, regstudent.getCourse());
 pstmt.setString(4,regstudent.getBranch());
 pstmt.setString(5, regstudent.getMobileno());
 pstmt.setString(6, regstudent.getEmail());
 pstmt.setInt(7, regstudent.getSemester());
 pstmt.setFloat(8, regstudent.getCgpa());
 pstmt.setLong(9, regstudent.getEnrollment());
 pstmt.setString(10,regstudent.getHostel());
 pstmt.setString(11,regstudent.getGender());
 pstmt.setString(12, regstudent.getCategory());
 pstmt.setDate(13, regstudent.getBirth());
 pstmt.setString(14,regstudent.getAddress());
 pstmt.setString(15,regstudent.getAccno());
 
	 int result1=pstmt.executeUpdate();
	 System.out.println(" student table inserted"+result);
 
 
 //============fetching id================================
 String sql_getid= "select regno from register_student where regno = (select max(regno) from register_student)";
 pstmt_getid=con.prepareStatement(sql_getid);
 rs=pstmt_getid.executeQuery();
 if(rs.next()){
	
     regstudent.setFregno(rs.getInt(1));
     System.out.println("regno fetched"+regstudent.getFregno());
 }
 //parent details================================

  String sql_parent= "insert into Regstu_Parent(regno,fatherName,motherName,"
  		+ "fatherMobile,fatherAdress,fatherEmail,"
  		+ "fatherImage,localGaurdianName,localGaurdianMobile) "
  		+ "values(?,?,?,"
  		+ " ?,?,?,"
  		+ " ?,?,?)";
     pstmt_parent= con.prepareStatement(sql_parent);
     System.out.println("parent start");
 pstmt_parent.setInt(1,regstudent.getFregno());
 pstmt_parent.setString(2,regstudent.getFname());
 pstmt_parent.setString(3,regstudent.getMname());
 pstmt_parent.setString(4,regstudent.getFmobile());
 pstmt_parent.setString(5,regstudent.getFaddress());
 pstmt_parent.setString(6,regstudent.getFemail());
 pstmt_parent.setBinaryStream(7, regstudent.getFimage(),regstudent.getFimagesize());
 pstmt_parent.setString(8,regstudent.getLname());
 pstmt_parent.setString(9,regstudent.getLmobile());

 int result2=pstmt_parent.executeUpdate();
 System.out.println("parent end");
 System.out.println("parent table inserted"+result1);
 
 //===student doc================================

String sql_doc= "insert into Regstu_doc(regno,stuImage,stuThumb,stuResult,stuCategory) values(?,?,?,?,?)";
 pstmt_doc= con.prepareStatement(sql_doc);

 pstmt_doc.setInt(1,regstudent.getFregno());
 /*pstmt_doc.setBinaryStream(2,regstudent.getSthumb(),regstudent.getSthumbsize());*/
 pstmt_doc.setBinaryStream(2,regstudent.getSimage(),regstudent.getSimagesize());
 System.out.println("*******image size in impl"+regstudent.getSimagesize()+regstudent.getSimage().available());
 pstmt_doc.setBinaryStream(3,regstudent.getSthumb(),regstudent.getSthumbsize());
 System.out.println("*******thumb size in impl"+regstudent.getSthumbsize()+regstudent.getSthumb().available());
 pstmt_doc.setBinaryStream(4,regstudent.getSresult(),regstudent.getSresultsize());
 pstmt_doc.setBinaryStream(5,regstudent.getScategory(),regstudent.getScategorysize());
 int result3=pstmt_doc.executeUpdate();
 System.out.println("doc table inserted"+result3);
 
 result= result1+result2+result3;
 }catch (SQLException e) {
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try {
				if(con!=null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(result==3){
			return true;
		}else
			return false;
		
	}  // end of add student

//========to get all registered student====================
/*
public List<RegStudent> getAllRegStudents(){
	List<RegStudent> regstulist =new ArrayList<RegStudent>();
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	try {
		con = SisDbUtil.getConnection();
		String sql="select * from register_student";
		pstmt=con.prepareStatement(sql);
		System.out.println("stuimpl2");
		 rs=pstmt.executeQuery();
		 while(rs.next()){
			
			 RegStudent regstudent=new RegStudent(); 
             regstudent.setRollno(rs.getLong("rollno"));
           //  System.out.println("rollno from db is"+regstudent.getRollno());
             regstudent.setName(rs.getString("name"));
             regstudent.setCourse(rs.getString("course"));
             regstudent.setBranch(rs.getString("branch"));
             regstudent.setMobileno(rs.getString("mobileno"));
             regstudent.setEmail(rs.getString("email"));
             regstudent.setSemester(rs.getInt("semester"));
             regstudent.setCgpa(rs.getFloat("cgpa"));
             regstudent.setEnrollment(rs.getLong("enrollment"));
             regstudent.setHostel(rs.getString("hostel"));
             regstudent.setCategory(rs.getString("gender"));
             regstudent.setGender(rs.getString("category"));
             regstudent.setBirth(rs.getDate("dob"));
             regstudent.setAddress(rs.getString("address"));   
             regstudent.setAccno(rs.getString("accno"));
            regstulist.add(regstudent);
		 }
	} catch (Exception e) {
     e.printStackTrace();
	}
	return regstulist;
}*/
//=========================================================
public RegStudent getRegStudentById(long enrollment){
	RegStudent regstudent=new RegStudent();
	Connection con=null;
	ResultSet rs=null;
	ResultSet rs_parent= null;
	ResultSet rs_doc= null;
	 PreparedStatement pstmt=null;
	 PreparedStatement pstmt_parent=null;
	 PreparedStatement pstmt_doc=null;
	try{
		con  = SisDbUtil.getConnection();
		System.out.println("connection");
		String sql="select * from register_student where enrollment=?";
pstmt=con.prepareStatement(sql);
pstmt.setLong(1,enrollment);
System.out.println("=============enrollment"+enrollment);
	rs=pstmt.executeQuery();
	 if(rs.next()){
		 System.out.println("getting student by id"+rs.getLong("enrollment"));
		 regstudent.setId(rs.getLong("regno"));
		 regstudent.setRollno(rs.getLong("rollno"));
           regstudent.setName(rs.getString("name"));
           regstudent.setCourse(rs.getString("course"));
           regstudent.setBranch(rs.getString("branch"));
           regstudent.setMobileno(rs.getString("mobileno"));
           regstudent.setEmail(rs.getString("email"));
           regstudent.setSemester(rs.getInt("semester"));
           regstudent.setCgpa(rs.getFloat("cgpa"));
           regstudent.setEnrollment(rs.getLong("enrollment"));
           regstudent.setHostel(rs.getString("hostel"));
           regstudent.setCategory(rs.getString("gender"));
           regstudent.setGender(rs.getString("category"));
           regstudent.setBirth(rs.getDate("dob"));
           regstudent.setAddress(rs.getString("address"));   
           regstudent.setAccno(rs.getString("accno"));
	 }
	 

	 //==================parent=================================
	String sql_parent="select * from regstu_parent where regno=?";
	pstmt_parent=con.prepareStatement(sql_parent);
	pstmt_parent.setLong(1,regstudent.getId());
	System.out.println("=============fetching parent data"+regstudent.getId());
		rs_parent=pstmt_parent.executeQuery();
		if(rs_parent.next()){
			System.out.println("parent data fetched");								
			regstudent.setFregno(rs_parent.getInt("regno"));
			System.out.println("fregno fetched"+rs_parent.getInt("regno"));
			regstudent.setFname(rs_parent.getString("fatherName"));
			regstudent.setFmobile(rs_parent.getString("fathermobile"));
			regstudent.setFaddress(rs_parent.getString("fatherAdress"));
			regstudent.setFemail(rs_parent.getString("fatherEmail"));
			regstudent.setMname(rs_parent.getString("motherName"));
			regstudent.setLname(rs_parent.getString("localGaurdianName"));
			regstudent.setLmobile(rs_parent.getString("localGaurdianMobile"));
			regstudent.setFimage(rs_parent.getBinaryStream("fatherImage"));
			int length = (regstudent.getFimage()).available();
			System.out.println("size of father image by getting"+length);
			regstudent.setFimagesize(length);			
		}
	//=============student document=============================================
		
		
		String sql_doc="select * from regstu_doc where regno=?";
		pstmt_doc=con.prepareStatement(sql_doc);
		pstmt_doc.setLong(1,regstudent.getId());
		System.out.println("=============fetching doc data"+regstudent.getId());
			rs_doc=pstmt_doc.executeQuery();
			if(rs_doc.next()){
				
				System.out.println("doc data fetching startteg.............");	
				regstudent.setSimage(rs_doc.getBinaryStream("stuImage"));
				//int length1 = (regstudent.getFimage()).available();
				regstudent.setSimagesize((regstudent.getSimage()).available());	
				
				System.out.println("doc data fetching student image");
				regstudent.setSthumb(rs_doc.getBinaryStream("stuThumb"));
				regstudent.setSthumbsize((regstudent.getSthumb()).available());	
				

				regstudent.setSresult(rs_doc.getBinaryStream("stuResult"));
				regstudent.setSresultsize((regstudent.getSresult()).available());	

				regstudent.setScategory(rs_doc.getBinaryStream("stuCategory"));
				regstudent.setScategorysize((regstudent.getScategory()).available());	
				
				
			}
	
	}catch (SQLException e) {
		e.printStackTrace();
	}catch(Exception e){
		e.printStackTrace();
	}
	finally{
		try {
			if(con!=null)
				con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
return regstudent;
	}  //method3

//seema

public List<RegStudent> getAllRegStudents(){
	List<RegStudent> regstulist =new ArrayList<RegStudent>();
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	try {
		con = SisDbUtil.getConnection();
		String sql="select * from register_student where selected='NO'";
		pstmt=con.prepareStatement(sql);
		System.out.println("stuimpl2");
		 rs=pstmt.executeQuery();
		 while(rs.next()){
			
			 RegStudent regstudent=new RegStudent(); 
             regstudent.setRollno(rs.getLong("rollno"));
           //  System.out.println("rollno from db is"+regstudent.getRollno());
             regstudent.setName(rs.getString("name"));
             regstudent.setCourse(rs.getString("course"));
             regstudent.setBranch(rs.getString("branch"));
             regstudent.setMobileno(rs.getString("mobileno"));
             regstudent.setEmail(rs.getString("email"));
             regstudent.setSemester(rs.getInt("semester"));
             regstudent.setCgpa(rs.getFloat("cgpa"));
             regstudent.setEnrollment(rs.getLong("enrollment"));
             regstudent.setHostel(rs.getString("hostel"));
             regstudent.setCategory(rs.getString("gender"));
             regstudent.setGender(rs.getString("category"));
             regstudent.setBirth(rs.getDate("dob"));
             regstudent.setAddress(rs.getString("address"));   
             regstudent.setAccno(rs.getString("accno"));
            regstulist.add(regstudent);
		 }
	} catch (Exception e) {
     e.printStackTrace();
	}
	return regstulist;
}

public List<RegStudent> getAllStuBy(String course, String branch, int sem){
	List<RegStudent> stulist = new ArrayList<RegStudent>();
	
	   Connection con = null;
	   ResultSet rs = null;
	   PreparedStatement pstmt = null;
	try{
		con = SisDbUtil.getConnection();  
		String sql = "select * from register_student where COURSE=? and BRANCH=? and SEMESTER=? "
				+ " and selected='no' order by cgpa desc";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, course);
		pstmt.setString(2,branch);
		pstmt.setInt(3, sem);
		
		rs=pstmt.executeQuery();
		while(rs.next()){
			RegStudent stu = new RegStudent();
			stu.setId(rs.getInt(1));
			stu.setRollno(rs.getInt(2));
			stu.setName(rs.getString(3));
			stu.setCourse(rs.getString(4));
			stu.setBranch(rs.getString(5));
			stu.setMobileno(rs.getString(6));
			stu.setEmail(rs.getString(7));                                 
			stu.setSemester(rs.getInt(8));
			stu.setCgpa(rs.getFloat(9));
			stu.setEnrollment(rs.getInt(10));
			stu.setHostel(rs.getString(11));
			stu.setGender(rs.getString(12));
			stu.setCategory(rs.getString(13));
			stu.setBirth(rs.getDate(14));
			stu.setAddress(rs.getString(15));
			stu.setAccno(rs.getString(16));
			stu.setSelected(rs.getString(17));
			
			stulist.add(stu);
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	System.out.println(stulist);
	return stulist;
	
}

public int getSelectedStu(int number,String hostel,List<RegStudent> sortStuList){
	
	 Connection con = null;
	   int rs = 0;
	   PreparedStatement pstmt = null;
    
	   try{
			con = SisDbUtil.getConnection();
			
			if(sortStuList!=null && sortStuList.size()<number){
				number = sortStuList.size();
			}
			
			System.out.println("--------------------");
			
			String sql = "update register_student set selected =?,hostel = ? where ENROLLMENT =?";
			pstmt = con.prepareStatement(sql);
			Iterator<RegStudent> iterator = sortStuList.iterator();
			System.out.println("++++++++++++++++++++");
			int count=0;
			while(iterator.hasNext()){
				
				RegStudent student = iterator.next();
				 pstmt.setString(1,"YES");
				 pstmt.setString(2,hostel );
				 pstmt.setLong(3,student.getEnrollment());
				 rs = pstmt.executeUpdate();
				 count++;
				 if(count==number){
					 break;
				 }
			}
						
		}catch(Exception e){
		   System.out.println(">>>>>>>");
		   e.printStackTrace();
	   }
	return number;
}


public List<RegStudent> getAllByCategory(String course, String branch, int sem,String category){
	List<RegStudent> stulist = new ArrayList<RegStudent>();
	
	   Connection con = null;
	   ResultSet rs = null;
	   PreparedStatement pstmt = null;
	try{
		con = SisDbUtil.getConnection();  
		String sql = "select * from register_student where COURSE=? and BRANCH=? and SEMESTER=? "
				+ "and gender=? and selected='NO' order by cgpa desc";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, course);
		pstmt.setString(2,branch);
		pstmt.setInt(3, sem);
		pstmt.setString(4,category);
		rs=pstmt.executeQuery();
		
		while(rs.next()){
			RegStudent stu = new RegStudent();
			stu.setId(rs.getInt(1));
			stu.setRollno(rs.getInt(2));
			stu.setName(rs.getString(3));
			stu.setCourse(rs.getString(4));
			stu.setBranch(rs.getString(5));
			stu.setMobileno(rs.getString(6));
			stu.setEmail(rs.getString(7));                                 
			stu.setSemester(rs.getInt(8));
			stu.setCgpa(rs.getFloat(9));
			stu.setEnrollment(rs.getInt(10));
			stu.setHostel(rs.getString(11));
			stu.setGender(rs.getString(12));
			stu.setCategory(rs.getString(13));
			stu.setBirth(rs.getDate(14));
			stu.setAddress(rs.getString(15));
			stu.setAccno(rs.getString(16));
			stu.setSelected(rs.getString(17));
			
			stulist.add(stu);
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	//System.out.println(stulist);
	return stulist;
}

public HashMap<String, Integer> getSelectedTabulation(String course, int semester,String[] branches){	
	HashMap<String,Integer> selectedList =new HashMap<String,Integer>();
      Connection con = null;
      ResultSet rs = null;
	   PreparedStatement pstmt = null;
	   try{
			con = SisDbUtil.getConnection();  
			String sql = "select count(*) from register_student where COURSE=? and SEMESTER=? and BRANCH = ? and selected ='YES'";		
			
		for(String branch : branches){	
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, course);
			pstmt.setInt(2,semester);
			pstmt.setString(3,branch);
			rs=pstmt.executeQuery();
			int count =0;
			while(rs.next()){
				count = rs.getInt(1);
			}
			selectedList.put(branch, count);
		} 	
		}catch(Exception e){
				e.printStackTrace();
			}
	return selectedList;
}


public HashMap<String, Integer> getTotalTabulation(String course, int semester,String[] branches){
	
	HashMap<String,Integer> totalList = new HashMap<String, Integer>();
	
      Connection con = null;
      ResultSet rs = null;
	   PreparedStatement pstmt = null;
	   try{
			con = SisDbUtil.getConnection();  
			String sql = "select count(*) from register_student where COURSE=? and SEMESTER=? and BRANCH = ?";		
			
		for(String branch : branches){	
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, course);
			pstmt.setInt(2,semester);
			pstmt.setString(3,branch);
			rs=pstmt.executeQuery();
			int count =0;
			while(rs.next()){
				count = rs.getInt(1);
			}
			totalList.put(branch, count);
		} 	
		}catch(Exception e){
				e.printStackTrace();
			}
	return totalList;
}

public List<RegStudent> getAllSelectedStu(String hostel){
	List<RegStudent> selStulist =new ArrayList<RegStudent>();
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	try {
		con = SisDbUtil.getConnection();
		String sql="select * from register_student where selected='YES' and hostel=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1,hostel);
		 rs=pstmt.executeQuery();
		 while(rs.next()){
			
			 RegStudent regstudent=new RegStudent(); 
             regstudent.setRollno(rs.getLong("rollno"));
           //  System.out.println("rollno from db is"+regstudent.getRollno());
             regstudent.setName(rs.getString("name"));
             regstudent.setCourse(rs.getString("course"));
             regstudent.setBranch(rs.getString("branch"));
             regstudent.setMobileno(rs.getString("mobileno"));
             regstudent.setEmail(rs.getString("email"));
             regstudent.setSemester(rs.getInt("semester"));
             regstudent.setCgpa(rs.getFloat("cgpa"));
             regstudent.setEnrollment(rs.getLong("enrollment"));
             regstudent.setHostel(rs.getString("hostel"));
             regstudent.setCategory(rs.getString("gender"));
             regstudent.setGender(rs.getString("category"));
             regstudent.setBirth(rs.getDate("dob"));
             regstudent.setAddress(rs.getString("address"));   
             regstudent.setAccno(rs.getString("accno"));
             selStulist.add(regstudent);
		 }
	} catch (Exception e) {
     e.printStackTrace();
	}
	return selStulist;
}
}  //class

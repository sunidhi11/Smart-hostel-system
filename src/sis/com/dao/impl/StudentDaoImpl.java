/**

user sunidhi

 * 
 */
package sis.com.dao.impl;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sis.com.bo.Admin;
import sis.com.bo.ComplainQuery;
import sis.com.bo.Leave;
import sis.com.bo.RegStudent;
import sis.com.bo.Student;
import sis.com.dao.AdminDao;
import sis.com.dao.StudentDao;
import sis.com.daoFactory.DaoFactory;
import sis.com.util.EmailSender;
import sis.com.util.SisDbUtil;

/**
 * @author hp
 *
 */
public class StudentDaoImpl implements StudentDao {
	
	HttpServletRequest request=null;
	HttpServletResponse response=null;
	Connection con=null;
	ResultSet rs=null;
	public StudentDaoImpl(HttpServletRequest request,HttpServletResponse response){
		this.request=request;
		this.response=response;
	}
	public StudentDaoImpl(){
		
	}
	public long AddConfirmStudent(RegStudent regstudent,String password,String password_father,String father_username){
	
		Connection con=null;
		PreparedStatement pstmt_insert=null;
		PreparedStatement pstmt_hostelid=null;
		PreparedStatement pstmt_parent=null;
		PreparedStatement pstmt_doc=null;
		PreparedStatement pstmt_login= null;
		PreparedStatement pstmt_parentlogin= null;
		Student student = new Student();
		HttpSession session = request.getSession();
		ResultSet rs=null;
		int result1=0;
		int result2=0;
		int result3=0;
		int result4=0;
		int result5=0;
		try {
			con = SisDbUtil.getConnection();
			String sql_insert=	"insert into student(ROLLNO,NAME,COURSE,BRANCH,MOBILENO,"
					+ "EMAIL,SEMESTER,CGPA,ENROLLMENT,HOSTEL,GENDER,"
					+ "CATEGORY,DOB,ADDRESS,ACNO)"
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt_insert=con.prepareStatement(sql_insert);
			pstmt_insert.setLong(1,regstudent.getRollno());
			pstmt_insert.setString(2,regstudent.getName());
			pstmt_insert.setString(3, regstudent.getCourse());
			pstmt_insert.setString(4,regstudent.getBranch());
			pstmt_insert.setString(5, regstudent.getMobileno());
			pstmt_insert.setString(6, regstudent.getEmail());
			pstmt_insert.setInt(7, regstudent.getSemester());
			pstmt_insert.setFloat(8, regstudent.getCgpa());
			pstmt_insert.setLong(9, regstudent.getEnrollment());
			pstmt_insert.setString(10,regstudent.getHostel());
			pstmt_insert.setString(11, regstudent.getGender());
			pstmt_insert.setString(12,regstudent.getCategory());
			pstmt_insert.setDate(13, regstudent.getBirth());
			pstmt_insert.setString(14,regstudent.getAddress());
			pstmt_insert.setString(15,regstudent.getAccno());	
			
			  result1=pstmt_insert.executeUpdate();	
			  System.out.println(" row inserted");
			  
			  //============fetching hostel id======================
			  String sql_hostelid= "select hostelId from student where enrollment=?";
			  pstmt_hostelid=con.prepareStatement(sql_hostelid);
			  pstmt_hostelid.setLong(1,regstudent.getEnrollment());
			  	rs= pstmt_hostelid.executeQuery();
			  	if(rs.next()){
			  		student.setParentId(rs.getLong("hostelId"));
			  		student.setHostelId(rs.getLong("hostelId"));
			  	}
			  //==============inserting parent==================
			
			  String sql_parent=	"insert into stu_parent(hostelId,fatherName,motherName,fatherMobile,"
						+ "fatherAddress,fatherEmail,localGaurdianName,localGaurdianMobile,fatherImage)"
						+ "values(?,?,?,?,?,?,?,?,?)";
				pstmt_parent=con.prepareStatement(sql_parent);
				
				pstmt_parent.setLong(1,student.getParentId());
				pstmt_parent.setString(2,regstudent.getFname());
				pstmt_parent.setString(3,regstudent.getMname());
				pstmt_parent.setString(4,regstudent.getFmobile());
				pstmt_parent.setString(5,regstudent.getFaddress());
				pstmt_parent.setString(6,regstudent.getFemail());
				pstmt_parent.setString(7,regstudent.getLname());
				pstmt_parent.setString(8,regstudent.getLmobile());
				pstmt_parent.setBinaryStream(9, regstudent.getFimage(),regstudent.getFimagesize());
				result2=pstmt_parent.executeUpdate();
			//===================inserting document==================
			
				String sql_doc= "insert into stu_doc(hostelId,stuImage,stuThumb,stuResult,stuCategory)"
								+"values(?,?,?,?,?)";
				pstmt_doc= con.prepareStatement(sql_doc);
				
				pstmt_doc.setLong(1,student.getParentId());
				pstmt_doc.setBinaryStream(2, regstudent.getSimage(),regstudent.getSimagesize());
				pstmt_doc.setBinaryStream(3, regstudent.getSthumb(),regstudent.getSthumbsize());
				pstmt_doc.setBinaryStream(4, regstudent.getSresult(),regstudent.getSresultsize());
				pstmt_doc.setBinaryStream(5, regstudent.getScategory(),regstudent.getScategorysize());
				System.out.println("");
				result3=pstmt_doc.executeUpdate();
				System.out.println("doc data inserted sucessfully"+result3);
				
				String sql_login= "insert into student_login(hostelId,userName,password)"+
								"values(?,?,?)";
				pstmt_login= con.prepareStatement(sql_login);
				pstmt_login.setLong(1,student.getParentId());
				pstmt_login.setLong(2,regstudent.getEnrollment());
				pstmt_login.setString(3,password);
				 result4=pstmt_login.executeUpdate();
				System.out.println("login table inserted");
				
				//parent login====================================
				/*insert into parent_login(parentId,userName,password)values(1070,"ram343","fma18&FK")*/
				String parent_login= "insert into parent_login(parentId,userName,password)"+
						"values(?,?,?)";
		pstmt_parentlogin= con.prepareStatement(parent_login);
		pstmt_parentlogin.setLong(1,student.getParentId());
		pstmt_parentlogin.setString(2,father_username);
		pstmt_parentlogin.setString(3,password_father);
		 result5=pstmt_parentlogin.executeUpdate();
		System.out.println(" parent login table inserted");
		} catch (Exception e) {
			session.setAttribute("multipleupdate", "cant update"
					+ " multiple times");
			/*try {
				response.sendRedirect("Confirm.jsp");
			} catch (IOException e2) {
				e2.printStackTrace();
			}*/
			
		}
		if(result1+result2+result3+result4+result5==5){
			return student.getHostelId();
		}else 
			return result1+result2+result3+result4+result5;
		
	
	}  //method1r
	/* (non-Javadoc)
	 * @see sis.com.dao.StudentDao#ShowAllStudent()
	 */
	@Override
	public List<Student> ShowAllStudent() {
		List<Student> stulist =new ArrayList<Student>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con = SisDbUtil.getConnection();
			String sql="select * from student where isdeleted=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,"no");
			
			 rs=pstmt.executeQuery();
			 while(rs.next()){
				
				 Student student=new Student(); 
	             student.setHostelId(rs.getLong("hostelId"));
	             student.setName(rs.getString("name"));
	             student.setRoomno(rs.getString("roomno"));
	       
	            stulist.add(student);
			 }
		} catch (Exception e) {
	     e.printStackTrace();
		}
		return stulist;
	}   //method2
	/* (non-Javadoc)
	 * @see sis.com.dao.StudentDao#ShowStudentById(long)
	 */
	@Override
	public Student ShowStudentById(long hostelId) {
		Student student=new Student();
		Connection con=null;
		ResultSet rs=null;
		 PreparedStatement pstmt=null;
		
		try{
			con  = SisDbUtil.getConnection();
			System.out.println("connection");
			String sql="select * from student where hostelId=?";
	pstmt=con.prepareStatement(sql);
	pstmt.setLong(1,hostelId);
	System.out.println("=============enrollment"+hostelId);
		rs=pstmt.executeQuery();
		 if(rs.next()){
			 System.out.println("getting student by id"+rs.getLong("enrollment"));
			 student.setHostelId(rs.getLong("hostelId"));
			 student.setRollno(rs.getLong("rollno"));
			 student.setName(rs.getString("name"));
			 student.setCourse(rs.getString("course"));
			 student.setBranch(rs.getString("branch"));
			 student.setMobileno(rs.getString("mobileno"));
			 student.setEmail(rs.getString("email"));
			 student.setSemester(rs.getInt("semester"));
			 student.setCgpa(rs.getFloat("cgpa"));
			 student.setEnrollment(rs.getLong("enrollment"));
			 student.setHostel(rs.getString("hostel"));
			 student.setGender(rs.getString("gender"));
			 student.setCategory(rs.getString("category"));
			 student.setBirth(rs.getDate("dob"));
			 student.setAddress(rs.getString("address"));
			 student.setAccno(rs.getString("acno"));
			 student.setRoomno(rs.getString("roomno"));
		 }
		}catch (Exception e) {
		     e.printStackTrace();
			}
		 
		return student;
	}
	/* (non-Javadoc)
	 * @see sis.com.dao.StudentDao#ShowStuParentById(long)
	 */
	@Override
	public Student ShowStuParentById(long hostelId) {
		Student student=new Student();
		Connection con=null;
		ResultSet rs=null;
		 PreparedStatement pstmt=null;
		
		try{
			con  = SisDbUtil.getConnection();
			System.out.println("connection");
			String sql="select * from stu_parent where hostelId=?";
	pstmt=con.prepareStatement(sql);
	pstmt.setLong(1,hostelId);
	System.out.println("=============enrollment"+hostelId);
		rs=pstmt.executeQuery();
		 if(rs.next()){
			
			 student.setParentId(rs.getLong("hostelId"));
			 student.setFatherName(rs.getString("fatherName"));
			 student.setMotherName(rs.getString("motherName"));
			 student.setFatherMobile(rs.getString("fatherMobile"));
			 student.setFatherAddress(rs.getString("fatherAddress"));
			 student.setFatherEmail(rs.getString("fatherEmail"));
			 student.setFatherImage(rs.getBinaryStream("fatherImage"));
			 student.setLocalGaurdianName(rs.getString("localGaurdianName"));
			 student.setLocalGaurdianMobile(rs.getString("localGaurdianMobile"));
			
			 
		 }
		}catch (Exception e) {
		     e.printStackTrace();
			}
		 
		return student;
	}
	/* (non-Javadoc)
	 * @see sis.com.dao.StudentDao#showStuDocumentById(long)
	 */
	@Override
	public Student showStuDocumentById(long hostelId) {
		Student student=new Student();
		Connection con=null;
		ResultSet rs=null;
		 PreparedStatement pstmt=null;
		
		try{
			con  = SisDbUtil.getConnection();
			System.out.println("connection in doc");
			String sql="select * from stu_doc where hostelId=?";
	pstmt=con.prepareStatement(sql);
	pstmt.setLong(1,hostelId);
	
		rs=pstmt.executeQuery();
		 if(rs.next()){	
			 student.setStuDocId(rs.getLong("hostelId"));
			 System.out.println("hostel id........");
			 student.setStudentImage(rs.getBinaryStream("stuImage"));
				//int length1 = (regstudent.getFimage()).available();
			 student.setStudentImageSize((student.getStudentImage()).available());	
				
				System.out.println("doc data fetching student image");
				student.setStudentThumb(rs.getBinaryStream("stuThumb"));
				student.setStudentThumbSize((student.getStudentThumb()).available());
				System.out.println("stu thumb size"+student.getStudentThumbSize());
				

				student.setStudentResult(rs.getBinaryStream("stuResult"));
				student.setStudentResultSize((student.getStudentResult()).available());	

				student.setStudentCategory(rs.getBinaryStream("stuCategory"));
				student.setStudentCategorySize((student.getStudentCategory()).available());	
				System.out.println("in daoimpl");
	}

		 
	}catch (Exception e) {
	     e.printStackTrace();
		}
	 
	return student;
}   
	//method doc
	/* (non-Javadoc)
	 * @see sis.com.dao.StudentDao#validateStudentLogin(java.lang.String, java.lang.String)
	 */
	@Override
	public Student validateStudentLogin(String userName, String password) {
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement pstmt =null;
		Calendar cal = Calendar.getInstance();
		Date date = cal.getTime();
		Student student = null;
		try {
			System.out.println("username in dao"+userName);
			con=SisDbUtil.getConnection();
			String sql ="select * from student_login where userName='"+userName+"' and password='"+password+"' ";
			pstmt = con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				student = new Student();
				int hostelId =rs.getInt("hostelId");
				String username=rs.getString("userName");
				student.setHostelId(hostelId);
				Date date1 = new Date();
				Timestamp sqlTimestamp = new Timestamp(date1.getTime());
				sql="update student_login set lastLogin=? where hostelId=?";
				pstmt= con.prepareStatement(sql);
				pstmt.setTimestamp(1,sqlTimestamp);
				pstmt.setLong(2,hostelId);
				int result = pstmt.executeUpdate();
				if(result==1)
					System.out.println("lastLogin time insertion successful");
				else
					System.out.println("lastLogin time insertion Failed");
				
	    	}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return student;
		
	}
	/* (non-Javadoc)
	 * @see sis.com.dao.StudentDao#updatestudent(long)
	 */
	@Override
	public boolean updatestudent(Student student) {
		Connection con=null;
		 PreparedStatement pstmt=null;
		 int result=0;
		
		try{
			con  = SisDbUtil.getConnection();
			System.out.println("connection");
			    
			String sql="update  student set name=?,rollno=?,course=?,branch=?,"
					+ "mobileno=?,email=?,semester=?,cgpa=?,enrollment=?,hostel=?,"
					+ "gender=?,category=?,dob=?,address=?,acno=?,roomno=?"
					+ " where hostelId=?";
	pstmt=con.prepareStatement(sql);
	pstmt.setString(1,student.getName());
	pstmt.setLong(2,student.getRollno());
	pstmt.setString(3,student.getCourse());
	pstmt.setString(4,student.getBranch());
	pstmt.setString(5,student.getMobileno());
	pstmt.setString(6,student.getEmail());
	pstmt.setLong(7,student.getSemester());
	pstmt.setFloat(8,student.getCgpa());
	pstmt.setLong(9,student.getEnrollment());
	pstmt.setString(10,student.getHostel());
	pstmt.setString(11,student.getGender());
	pstmt.setString(12,student.getCategory());
	pstmt.setDate(13,student.getBirth());
	pstmt.setString(14,student.getAddress());
	pstmt.setString(15,student.getAccno());
	pstmt.setString(16,student.getRoomno());
	pstmt.setLong(17,student.getHostelId());
	 result= pstmt.executeUpdate();
		
		}catch (Exception e) {
		     e.printStackTrace();
			}
		if(result==1){
			return true;
		}
		return false;
	}
	/* (non-Javadoc)
	 * @see sis.com.dao.StudentDao#updateStuParent(sis.com.bo.Student)
	 */
	@Override
	public boolean updateStuParent(Student student) {
		Connection con=null;
		 PreparedStatement pstmt=null;
		 int result=0;
		
		try{
			con  = SisDbUtil.getConnection();
			System.out.println("connection in parent updation");
			
			String sql="update  stu_parent set fatherName=?,motherName=?,fatherMobile=?,fatherAddress=?,"
					+ "fatherEmail=?,localGaurdianName=?,localGaurdianMobile=?"
					+ " where hostelId=?";
	pstmt=con.prepareStatement(sql);
	pstmt.setString(1,student.getFatherName());
	pstmt.setString(2,student.getMotherName());
	pstmt.setString(3,student.getFatherMobile());
	pstmt.setString(4,student.getFatherAddress());
	pstmt.setString(5,student.getFatherEmail());
	pstmt.setString(6,student.getLocalGaurdianName());
	pstmt.setString(7,student.getLocalGaurdianMobile());
	pstmt.setLong(8,student.getParentId());
	 result= pstmt.executeUpdate();
		
		}catch (Exception e) {
		     e.printStackTrace();
			}
		if(result==1){
			System.out.println("in parent updation");
			return true;
		}
		return false;
	}
	/* (non-Javadoc)
	 * @see sis.com.dao.StudentDao#updateStuDocument(sis.com.bo.Student)
	 */
	@Override
	public boolean updateStuDocument(Student student) {
		Connection con=null;
		 PreparedStatement pstmt=null;
		 int result=0;
		 int result1=0;
		 int result2=0;
		 int result3=0;
		 int result4=0;
		 int result5=0;
		 int counter=0;
		 try{
				System.out.println("in doc updation");

				con  = SisDbUtil.getConnection();
				if(student.getStudentImageSize()!=0){
					counter=counter+1;
					String sql="update  stu_doc set stuImage=?"
							+ " where hostelId=?";	
					pstmt=con.prepareStatement(sql);
				 pstmt.setBinaryStream(1,student.getStudentImage(),(Long)student.getStudentImageSize());
				 pstmt.setLong(2,student.getStuDocId());
					 result1= pstmt.executeUpdate();
				}	
				if(student.getStudentThumbSize()!=0){
					counter=counter+1;
					String sql="update  stu_doc set stuThumb=?"
							+ " where hostelId=?";	
					pstmt=con.prepareStatement(sql);
				 pstmt.setBinaryStream(1,student.getStudentThumb(),(Long)student.getStudentThumbSize());
				 pstmt.setLong(2,student.getStuDocId());
					 result2= pstmt.executeUpdate();
				}	
				if(student.getStudentResultSize()!=0){
					counter=counter+1;
					String sql="update  stu_doc set stuResult=?"
							+ " where hostelId=?";	
					pstmt=con.prepareStatement(sql);
				 pstmt.setBinaryStream(1,student.getStudentResult(),(Long)student.getStudentResultSize());
				 pstmt.setLong(2,student.getStuDocId());
					 result3= pstmt.executeUpdate();
				}	
				if(student.getStudentCategorySize()!=0){
					counter=counter+1;
					String sql="update  stu_doc set stuCategory=?"
							+ " where hostelId=?";	
					pstmt=con.prepareStatement(sql);
				 pstmt.setBinaryStream(1,student.getStudentCategory(),(Long)student.getStudentCategorySize());
				 pstmt.setLong(2,student.getStuDocId());
					 result4= pstmt.executeUpdate();
				}	
				if(student.getFatherImageSize()!=0){
					counter=counter+1;
					String sql="update  stu_parent set fatherImage=?"
							+ " where hostelId=?";	
					pstmt=con.prepareStatement(sql);
				 pstmt.setBinaryStream(1,student.getFatherImage(),(Long)student.getFatherImageSize());
				 pstmt.setLong(2,student.getParentId());
					 result5= pstmt.executeUpdate();
				}	
				
          }catch (Exception e) {
        	  System.out.println(".................");
			     e.printStackTrace();
				}
		result=result1+result2+result3+result4+result5;
		if(result==counter){
			System.out.println("in doc updation true#############");
			return true;
		}
		System.out.println(" in doc updation false");
		return false;
	}
	/* (non-Javadoc)
	 * @see sis.com.dao.StudentDao#deleteStudent(sis.com.bo.Student)
	 */
	@Override
	public boolean deleteStudent(Long id) {
		Connection con=null;
		 PreparedStatement pstmt=null;
		 int result1=0;
		 int result2=0;
		 int result3=0;
		 int result=3;
		 int counter=0;
		 
		try{
			con  = SisDbUtil.getConnection();
			System.out.println("connection in delete");
			    
			String sql1="update  student set isdeleted=?"
					+ " where hostelId=?";
	pstmt=con.prepareStatement(sql1);
	pstmt.setString(1,"yes");
	pstmt.setLong(2,id);
	 result1= pstmt.executeUpdate();
	 if(result1==1){
		 counter= counter+1;
		}
	 
	 String sql2="update  stu_parent set isdeleted=?"
				+ " where hostelId=?";
pstmt=con.prepareStatement(sql2);
pstmt.setString(1,"yes");
pstmt.setLong(2,id);
result2= pstmt.executeUpdate();
if(result2==1){
	 counter= counter+1;
	}

String sql3="update stu_doc set isdeleted=?"
		+ " where hostelId=?";
pstmt=con.prepareStatement(sql3);
pstmt.setString(1,"yes");
pstmt.setLong(2,id);
result3= pstmt.executeUpdate();
if(result3==1){
counter= counter+1;
} 
result= result1+result2+result3;
		}catch (Exception e) {
		     e.printStackTrace();
			}
		if(result==counter){
			return true;
		}	
		
		return false;
	}
	
	@Override
	public boolean deleteStudentpermanemt(long hostelId) {
		Connection con=null;
		 PreparedStatement pstmt1=null;
		 PreparedStatement pstmt2=null;
		 PreparedStatement pstmt3=null;
		 int result1=0;
		 int result2=0;
		 int result3=0;
		 int result=3;
		 int counter=0;
		 
		try{
			con  = SisDbUtil.getConnection();
			System.out.println("connection in delete");
			    
			String sql1="delete from student"
					+ " where hostelId=?";
	pstmt1=con.prepareStatement(sql1);
	pstmt1.setLong(1,hostelId);
	 result1= pstmt1.executeUpdate();
	 if(result1==1){
		 counter= counter+1;
		}
	 String sql2="delete from stu_parent"
				+ " where hostelId=?";
pstmt2=con.prepareStatement(sql2);
pstmt2.setLong(1,hostelId);
result2= pstmt2.executeUpdate();
if(result2==1){
	 counter= counter+1;
	}
String sql3="delete from stu_doc"
		+ " where hostelId=?";
pstmt3=con.prepareStatement(sql3);
pstmt3.setLong(1,hostelId);
result3= pstmt3.executeUpdate();
if(result3==1){
counter= counter+1;
}
result= result1+result2+result3;
		}catch (Exception e) {
		     e.printStackTrace();
			}
		if(result==counter){
			return true;
		}	
		
		return false;

	}
	
	@Override
	public List<Student> ShowAllDeletedByAdminStudent() {
		List<Student> deletestulist =new ArrayList<Student>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con = SisDbUtil.getConnection();
			String sql="select * from student where isdeleted=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,"yes");
			
			 rs=pstmt.executeQuery();
			 while(rs.next()){
				
				 Student student=new Student(); 
	             student.setHostelId(rs.getLong("hostelId"));
	             student.setName(rs.getString("name"));
	             student.setRoomno(rs.getString("roomno"));
	       
	             deletestulist.add(student);
			 }
		} catch (Exception e) {
	     e.printStackTrace();
		}
		return deletestulist;
	}
	@Override
	public boolean restoreStudent(long hostelId) {
		Connection con=null;
		 PreparedStatement pstmt1=null;
		 PreparedStatement pstmt2=null;
		 PreparedStatement pstmt3=null;
		 int result1=0;
		 int result2=0;
		 int result3=0;
		 int result=3;
		 int counter=0;
		 
		try{
			con  = SisDbUtil.getConnection();
			System.out.println("connection in delete");
			    
			String sql1="update  student set isdeleted=?"
					+ " where hostelId=?";
	pstmt1=con.prepareStatement(sql1);
	pstmt1.setString(1,"no");
	pstmt1.setLong(2,hostelId);
	 result1= pstmt1.executeUpdate();
	 if(result1==1){
		 counter= counter+1;
		}
	 
	 String sql2="update  stu_parent set isdeleted=?"
				+ " where hostelId=?";
pstmt2=con.prepareStatement(sql2);
pstmt2.setString(1,"no");
pstmt2.setLong(2,hostelId);
result2= pstmt2.executeUpdate();
if(result2==1){
	 counter= counter+1;
	}

String sql3="update stu_doc set isdeleted=?"
		+ " where hostelId=?";
pstmt3=con.prepareStatement(sql3);
pstmt3.setString(1,"no");
pstmt3.setLong(2,hostelId);
result3= pstmt3.executeUpdate();
if(result3==1){
counter= counter+1;
} 
result= result1+result2+result3;
		}catch (Exception e) {
		     e.printStackTrace();
			}
		if(result==counter){
			return true;
		}	
		
		return false;	
		
	}
	
//shaurya=============================================
	/*Connection con=null;
	ResultSet rs=null;
	
	public Student get(long hostelId) {
		Student student = DaoFactory.getStudent();
		try {
		con=SisDbUtil.getConnection();
		String sql="select * from student where HOSTEL_ID=?";
		PreparedStatement p = con.prepareStatement(sql);
		p.setLong(1,hostelId );
		rs=p.executeQuery();
		while(rs.next()) {
			student.setName(rs.getString("name"));
			student.setHostelId(hostelId);
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
		return student;
	}

	@Override
	public boolean insertLeave(Leave l) {
		try {
			con=SisDbUtil.getConnection();
			String sql="insert into leave_request(hostelId,fromDate,toDate,reason,entryDate)values(?,?,?,?,?)  ";
			PreparedStatement p = con.prepareStatement(sql);
			p.setLong(1, l.getHostelId());
			p.setDate(2, new java.sql.Date(l.getFromDate().getTime()));
			p.setDate(3, new java.sql.Date(l.getToDate().getTime()));
			p.setString(4, l.getReason());
			Date date = new Date();
			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			p.setDate(5, sqlDate);
			int r=p.executeUpdate();
			if(r==0)
				return false;
			else
				return true;
		} catch (SQLException e) {
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
	public List<Long> getLeaveStudent() {
		List<Long> l = new ArrayList<Long>();
		try {
		con=SisDbUtil.getConnection();
		Date date = new Date();
		java.sql.Date d = new java.sql.Date(date.getTime());
		String sql="select * from leave_request where fromDate <= ? and toDate >= ? and approved=\"YES\" ";
		PreparedStatement p = con.prepareStatement(sql);
		p.setDate(1,d );
		p.setDate(2,d );
		rs=p.executeQuery();
		while(rs.next()) {
			l.add((Long)rs.getLong("hostelId"));
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
		return l;
	}

	@Override
	public List<Student> getAllStudent() {
		Student s = null;
		List<Student> l = new ArrayList<Student>();
		try {
			con=SisDbUtil.getConnection();
			String sql="select * from student";
			PreparedStatement p = con.prepareStatement(sql);
			rs=p.executeQuery();
			while(rs.next()) {
				s=DaoFactory.getStudent();
				s.setHostelId(rs.getLong("HOSTEL_ID"));
				s.setName(""+rs.getString("NAME"));
				l.add(s);
			}//while
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				SisDbUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return l;
	}//getAllStudent

	@Override
	public boolean insertAttendance(long hostelId, int status, Date date) {
		try {
			con=SisDbUtil.getConnection();
			String sql="insert into attendance (TODAY,HOSTEL_ID,STATUS)values(?,?,?)";
			PreparedStatement p = con.prepareStatement(sql);
			p.setDate(1, new java.sql.Date(date.getTime()));
			p.setLong(2, hostelId);
			p.setInt(3, status);
			p.execute();
			return true;
		} catch (Exception e) {
			System.out.println("dublicate error in insertAttendance() in studentDaoImplement ");
			return false;
		}finally {
			try {
				SisDbUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}//insertAttendance

	@Override
	public List<Leave> approved() {
		List<Leave> leaveList = new ArrayList<Leave>();
		Leave leave = null;
		try {
			con=SisDbUtil.getConnection();
			String sql="select * from leave_request ";
			PreparedStatement p = con.prepareStatement(sql);
			rs=p.executeQuery();
			while(rs.next()) {
				leave=DaoFactory.getLeave();
				leave.setLeaveId(rs.getLong("leaveId"));
				leave.setHostelId(rs.getLong("hostelId"));
				leave.setFromDate(rs.getDate("fromDate"));
				leave.setToDate(rs.getDate("toDate"));
				leave.setReason(rs.getString("reason"));
				//leave.setDeleted(rs.getString("deleted"));
				leave.setEntryDate(rs.getDate("entryDate"));
				//leave.setApproved(rs.getString("approved"));
				leave.setSeenByStudent(rs.getString("seenByStudent"));
				leave.setSeenByAdmin(rs.getString("seenByAdmin"));
				
				leaveList.add(leave);
			}
			return leaveList;
		} catch (Exception e) {
			System.out.println("error in StudentDaoImplement approved() ");
			return null;
		}finally {
			try {
				SisDbUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}//finally
	}//approved

	@Override
	public boolean setSeen(List<Leave> leaveList) {
		try {
			con=SisDbUtil.getConnection();
			String sql="update leave_request set  seenByStudent=? where leaveId=?";
			for(Leave l:leaveList) {
				PreparedStatement p = con.prepareStatement(sql);
				p.setString(1, "YES");
				p.setLong(2, l.getLeaveId());
				p.execute();
				System.out.println("leave id to be seen-> "+l.getLeaveId());
			}//for
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			try {
				SisDbUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}//finally
	}//setSeen
	*/
	@Override
	public List<Leave> recieveMessage(long hostelId) {
		ArrayList<Leave> list_leave = new ArrayList<Leave>();
		Leave leave=null;
		System.out.println("in notification impl*********************************");
		try {
			con=SisDbUtil.getConnection();
			String sql="select sendToStudentEmailTime,leaveId from leave_request where  hostelId=? and sendToStudentEmail=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setLong(1,1067);
			pstmt.setString(2,"yes");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				leave = new Leave();
				leave.setSendToStudentEmailTime(rs.getDate("sendToStudentEmailTime"));
				leave.setLeaveId(rs.getLong("leaveId"));
				list_leave.add(leave);
				System.out.println("leave send time----------> "+leave.getSendToStudentEmailTime());
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
		return list_leave;
	}
	@Override
	public boolean setSeenByStudent(List<Leave> list) {
		try {
			con=SisDbUtil.getConnection();
			String sql="update leave_request set  seenByStudent=? where  leaveId=?";
			for(Leave leave:list) {
				PreparedStatement p = con.prepareStatement(sql);
				p.setString(1, "YES");
				p.setLong(2, leave.getLeaveId());
				p.executeUpdate();
			}//for
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}
	
	public long newMessage(long hostelId) {
		int i=0;
		try {
			con=SisDbUtil.getConnection();
			String sql="select count(*) as r from leave_request where seenByStudent=? and hostelId=?";
			PreparedStatement p = con.prepareStatement(sql);
			p.setString(1, "NO");
			p.setLong(2, hostelId);
			rs=p.executeQuery();
			if(rs.next()) {
				i=rs.getInt("r");
			}//while
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&**************new +++"+i);
		return i;
	}


	
	
	//shaurya
	@Override
	public Student get(long hostelId) {
		Student student = DaoFactory.getStudent();
		try {
		con=SisDbUtil.getConnection();
		String sql="select * from student where hostelId=?";
		PreparedStatement p = con.prepareStatement(sql);
		p.setLong(1,hostelId );
		rs=p.executeQuery();
		while(rs.next()) {
			student.setName(rs.getString("name"));
			student.setHostelId(hostelId);
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
		return student;
	}

	@Override
	public boolean insertLeave(Leave l) {
		try {
			con=SisDbUtil.getConnection();
			String sql="insert into leave_request(hostelId,fromDate,toDate,subject,reason,entryDate)values(?,?,?,?,?,?)  ";
			PreparedStatement p = con.prepareStatement(sql);
			p.setLong(1, l.getHostelId());
			p.setDate(2, new java.sql.Date(l.getFromDate().getTime()));
			p.setDate(3, new java.sql.Date(l.getToDate().getTime()));
			p.setString(4, l.getSubject());
			p.setString(5, l.getReason());
			Date date = new Date();
			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			p.setDate(6, sqlDate);
			int r=p.executeUpdate();
			if(r==0)
				return false;
			else
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("error is from here");
		}finally {
			try {
				SisDbUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return false;
	}//insert

	@Override
	public List<Long> getLeaveStudent() {
		List<Long> leaveList = new ArrayList<Long>();
		try {
		con=SisDbUtil.getConnection();
		Date date = new Date();
		java.sql.Date d = new java.sql.Date(date.getTime());
		String sql="select * from leave_request where fromDate <= ? and toDate >= ? and approvedByAdmin=\"YES\" ";
		PreparedStatement p = con.prepareStatement(sql);
		p.setDate(1,d );
		p.setDate(2,d );
		rs=p.executeQuery();
		while(rs.next()) {
			leaveList.add((Long)rs.getLong("hostelId"));
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
		return leaveList;
	}//getLeaveStudent

	@Override
	public List<Student> getAllStudent() {
		Student s = null;
		List<Student> l = new ArrayList<Student>();
		try {
			con=SisDbUtil.getConnection();
			String sql="select * from student";
			PreparedStatement p = con.prepareStatement(sql);
			rs=p.executeQuery();
			while(rs.next()) {
				s=DaoFactory.getStudent();
				s.setHostelId(rs.getLong("hostelId"));
				s.setName(""+rs.getString("name"));
				l.add(s);
			}//while
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				SisDbUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return l;
	}//getAllStudent

	@Override
	public boolean insertAttendance(long hostelId, int status, Date date) {
		try {
			con=SisDbUtil.getConnection();
			String sql="insert into attendance (TODAY,hostelId,STATUS)values(?,?,?)";
			PreparedStatement p = con.prepareStatement(sql);
			p.setDate(1, new java.sql.Date(date.getTime()));
			p.setLong(2, hostelId);
			p.setInt(3, status);
			p.execute();
			return true;
		} catch (Exception e) {
			System.out.println("dublicate error in insertAttendance() in studentDaoImplement ");
			return false;
		}finally {
			try {
				SisDbUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}//insertAttendance

	@Override
	public List<Leave> approved() {
		List<Leave> leaveList = new ArrayList<Leave>();
		Leave leave = null;
		try {
			con=SisDbUtil.getConnection();
			String sql="select * from leave_request ";
			PreparedStatement p = con.prepareStatement(sql);
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
				
				leave.setSeenByStudent(rs.getString("seenByStudent"));
				leave.setSeenByAdmin(rs.getString("seenByAdmin"));
				leave.setSeenByParent(rs.getString("seenByParent"));
				
				leave.setApprovedByAdmin(rs.getString("approvedByAdmin"));
				leave.setApprovedByParent(rs.getString("approvedByParent"));
				
				leave.setDeletedByAdmin(rs.getString("deletedByAdmin"));
				leave.setDeletedByStudent(rs.getString("deletedByStudent"));
				leave.setDeletedByParent(rs.getString("deletedByParent"));
				
				leave.setSendToStudentEmail(rs.getString("sendToStudentEmail")); //new 
				leave.setSendToStudentEmailTime(rs.getDate("sendToStudentEmailTime")); //new 
				
				leaveList.add(leave);
			}
			return leaveList;
		} catch (Exception e) {
			System.out.println("error in StudentDaoImplement approved() ");
			return null;
		}finally {
			try {
				SisDbUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}//finally
	}//approved

	@Override
	public boolean setSeen(List<Leave> leaveList) {
		try {
			con=SisDbUtil.getConnection();
			String sql="update leave_query set  seenByStudent=? where leaveId=? and seenByStudent=? ";
			for(Leave l:leaveList) {
				PreparedStatement p = con.prepareStatement(sql);
				p.setString(1, "YES");
				p.setLong(2, l.getLeaveId());
				p.setString(3, "NO");
				p.execute();
			}//for
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			try {
				SisDbUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}//finally
	}//setSeen

	@Override
	public boolean sendMsgToStudent(String email, String subject, String msg) {
		return EmailSender.sendEmail(email, msg, subject);
	}
	@Override
	public boolean sendMsgToStudent(String email, String subject, String msg,Long hostelId,Long leaveId) {
		AdminDao adminDao = DaoFactory.getAdminDao();
		adminDao.setSent(hostelId, leaveId);
		return EmailSender.sendEmail(email, msg, subject);
	}
	@Override
	public Leave showLeaveStuDocumentById(long leaveId) {

		 Leave leave=new Leave();
		    Connection con=null;
		    ResultSet rs=null;
		     PreparedStatement pstmt=null;
		    
		    try{
		      con  = SisDbUtil.getConnection();
		      System.out.println("connection in doc");
		      String sql="select * from leave_file where leaveId=?";
		  pstmt=con.prepareStatement(sql);
		  pstmt.setLong(1,leaveId);
		  
		    rs=pstmt.executeQuery();
		     if(rs.next()){ 
		       leave.setLeaveundertaking(rs.getBinaryStream("photo1"));
		       leave.setLeaveundertakingSize((leave.getLeaveundertaking()).available());  
		        
		        System.out.println("doc data fetching student image");
		        leave.setLeaveMediacal(rs.getBinaryStream("photo2"));
			       leave.setLeaveMediacalSize((leave.getLeaveMediacal()).available());  
		    
		        System.out.println("in daoimpl");
		  }

		     
		  }catch (Exception e) {
		       e.printStackTrace();
		    }
		   
		return leave;
	}
	
	

	
	
}   //class

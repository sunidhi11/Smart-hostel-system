package sis.com.bo;
import java.io.InputStream;
import java.sql.*;

import javafx.scene.input.InputEvent;

public class Student {
	private long hostelId ;
	private String  roomno;
	private long id ;
	private Long stuDocId;
	private long rollno ;
	private String name ;
	private String course ;
	private String branch ;
	private String mobileno;
	private String email ;
	private int semester ;
	private float cgpa;
	private long enrollment;
	private String hostel;
	private String category; 
	private String gender ;
	private Date birth ;
	private String address ;
	private String accno;
	private String fatherName;
	private String fatherEmail;
	private String fatherAddress;
	private String fatherMobile;
	private String motherName;
	private String localGaurdianName;
	private String localGaurdianMobile;
	private InputStream fatherImage;
	private String fatherImageFileName;
	private long fatherImageSize;
	private long parentId;
	private String parentPassword;
	private String parentUserName;
	private String userName;
	private String stu_password;
	private InputStream studentImage;
	private String studentImageFileName;
	private long studentImageSize;
	private InputStream studentThumb;
	private String studentThumbFileName;
	private long studentThumbSize;
	private InputStream studentResult;
	private String studentResultFileName;
	private long studentResultSize;
	private InputStream studentCategory;
	private String studentCategoryFileName;
	private long studentCategorySize;
	
	public long getHostelId() {
		return hostelId;
	}
	public void setHostelId(long hostelId) {
		this.hostelId = hostelId;
	}
	public String getRoomno() {
		return roomno;
	}
	public void setRoomno(String roomno) {
		this.roomno = roomno;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public Long getStuDocId() {
		return stuDocId;
	}
	public void setStuDocId(Long stuDocId) {
		this.stuDocId = stuDocId;
	}
	public long getRollno() {
		return rollno;
	}
	public void setRollno(long rollno) {
		this.rollno = rollno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getMobileno() {
		return mobileno;
	}
	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	public float getCgpa() {
		return cgpa;
	}
	public void setCgpa(float cgpa) {
		this.cgpa = cgpa;
	}
	public long getEnrollment() {
		return enrollment;
	}
	public void setEnrollment(long enrollment) {
		this.enrollment = enrollment;
	}
	public String getHostel() {
		return hostel;
	}
	public void setHostel(String hostel) {
		this.hostel = hostel;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAccno() {
		return accno;
	}
	public void setAccno(String accno) {
		this.accno = accno;
	}
	public String getFatherName() {
		return fatherName;
	}
	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}
	public String getFatherEmail() {
		return fatherEmail;
	}
	public void setFatherEmail(String fatherEmail) {
		this.fatherEmail = fatherEmail;
	}
	public String getFatherAddress() {
		return fatherAddress;
	}
	public void setFatherAddress(String fatherAddress) {
		this.fatherAddress = fatherAddress;
	}
	public String getFatherMobile() {
		return fatherMobile;
	}
	public void setFatherMobile(String fatherMobile) {
		this.fatherMobile = fatherMobile;
	}
	public String getMotherName() {
		return motherName;
	}
	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}
	public String getLocalGaurdianName() {
		return localGaurdianName;
	}
	public void setLocalGaurdianName(String localGaurdianName) {
		this.localGaurdianName = localGaurdianName;
	}
	public String getLocalGaurdianMobile() {
		return localGaurdianMobile;
	}
	public void setLocalGaurdianMobile(String localGaurdianMobile) {
		this.localGaurdianMobile = localGaurdianMobile;
	}
	public InputStream getFatherImage() {
		return fatherImage;
	}
	public void setFatherImage(InputStream fatherImage) {
		this.fatherImage = fatherImage;
	}
	public String getFatherImageFileName() {
		return fatherImageFileName;
	}
	public void setFatherImageFileName(String fatherImageFileName) {
		this.fatherImageFileName = fatherImageFileName;
	}
	public long getFatherImageSize() {
		return fatherImageSize;
	}
	public void setFatherImageSize(long fatherImageSize) {
		this.fatherImageSize = fatherImageSize;
	}
	public long getParentId() {
		return parentId;
	}
	public void setParentId(long parentId) {
		this.parentId = parentId;
	}
	public String getParentPassword() {
		return parentPassword;
	}
	public void setParentPassword(String parentPassword) {
		this.parentPassword = parentPassword;
	}
	public String getParentUserName() {
		return parentUserName;
	}
	public void setParentUserName(String parentUserName) {
		this.parentUserName = parentUserName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getStu_password() {
		return stu_password;
	}
	public void setStu_password(String stu_password) {
		this.stu_password = stu_password;
	}
	public InputStream getStudentImage() {
		return studentImage;
	}
	public void setStudentImage(InputStream studentImage) {
		this.studentImage = studentImage;
	}
	public String getStudentImageFileName() {
		return studentImageFileName;
	}
	public void setStudentImageFileName(String studentImageFileName) {
		this.studentImageFileName = studentImageFileName;
	}
	public long getStudentImageSize() {
		return studentImageSize;
	}
	public void setStudentImageSize(long studentImageSize) {
		this.studentImageSize = studentImageSize;
	}
	public InputStream getStudentThumb() {
		return studentThumb;
	}
	public void setStudentThumb(InputStream studentThumb) {
		this.studentThumb = studentThumb;
	}
	public String getStudentThumbFileName() {
		return studentThumbFileName;
	}
	public void setStudentThumbFileName(String studentThumbFileName) {
		this.studentThumbFileName = studentThumbFileName;
	}
	public long getStudentThumbSize() {
		return studentThumbSize;
	}
	public void setStudentThumbSize(long studentThumbSize) {
		this.studentThumbSize = studentThumbSize;
	}
	public InputStream getStudentResult() {
		return studentResult;
	}
	public void setStudentResult(InputStream studentResult) {
		this.studentResult = studentResult;
	}
	public String getStudentResultFileName() {
		return studentResultFileName;
	}
	public void setStudentResultFileName(String studentResultFileName) {
		this.studentResultFileName = studentResultFileName;
	}
	public long getStudentResultSize() {
		return studentResultSize;
	}
	public void setStudentResultSize(long studentResultSize) {
		this.studentResultSize = studentResultSize;
	}
	public InputStream getStudentCategory() {
		return studentCategory;
	}
	public void setStudentCategory(InputStream studentCategory) {
		this.studentCategory = studentCategory;
	}
	public String getStudentCategoryFileName() {
		return studentCategoryFileName;
	}
	public void setStudentCategoryFileName(String studentCategoryFileName) {
		this.studentCategoryFileName = studentCategoryFileName;
	}
	public long getStudentCategorySize() {
		return studentCategorySize;
	}
	public void setStudentCategorySize(long studentCategorySize) {
		this.studentCategorySize = studentCategorySize;
	}
	
	
	
}//class

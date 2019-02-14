package sis.com.bo;

import java.io.InputStream;
import java.sql.Date;

import com.mysql.jdbc.Blob;

public class RegStudent {
	
	
	private long id ;
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
	private String accno ;
	private int fregno;
	private String selected;
	public String getSelected() {
		return selected;
	}
	public void setSelected(String selected) {
		this.selected = selected;
	}
	private String confirm;
	
	public int getFregno() {
		return fregno;
	}
	public void setFregno(int fregno) {
		this.fregno = fregno;
	}
	private String fname;
	private String mname;
	public InputStream getSimage() {
		return simage;
	}
	public InputStream getSthumb() {
		return sthumb;
	}
	public InputStream getSresult() {
		return sresult;
	}
	public InputStream getFimage() {
		return fimage;
	}
	private String fmobile;
	//private String fimage;
	private String faddress;
	private String femail;
	private String lname;
	private String lmobile;
//	private long studocid;
	
	private InputStream simage;
	private InputStream sthumb;
	private InputStream sresult;
	private InputStream scategory;
	private InputStream fimage;
	private int simagesize;
	private int sthumbsize;
	private int sresultsize;
	private int scategorysize;
	private int fimagesize;
	private String simagename;
	private String sthumbname;
	private String sresultname;
	private String scategoryname;
	private String	fimagename;
	private String scertificate;
	
	
	public InputStream getScategory() {
		return scategory;
	}
	public void setScategory(InputStream scategory) {
		this.scategory = scategory;
	}
	public int getSimagesize() {
		return simagesize;
	}
	public void setSimagesize(int simagesize) {
		this.simagesize = simagesize;
	}
	public int getSthumbsize() {
		return sthumbsize;
	}
	public void setSthumbsize(int sthumbsize) {
		this.sthumbsize = sthumbsize;
	}
	public int getSresultsize() {
		return sresultsize;
	}
	public void setSresultsize(int sresultsize) {
		this.sresultsize = sresultsize;
	}
	public int getScategorysize() {
		return scategorysize;
	}
	public void setScategorysize(int scategorysize) {
		this.scategorysize = scategorysize;
	}
	public int getFimagesize() {
		return fimagesize;
	}
	public void setFimagesize(int fimagesize) {
		this.fimagesize = fimagesize;
	}
	public String getSimagename() {
		return simagename;
	}
	public void setSimagename(String simagename) {
		this.simagename = simagename;
	}
	public String getSthumbname() {
		return sthumbname;
	}
	public void setSthumbname(String sthumbname) {
		this.sthumbname = sthumbname;
	}
	public String getSresultname() {
		return sresultname;
	}
	public void setSresultname(String sresultname) {
		this.sresultname = sresultname;
	}
	public String getScategoryname() {
		return scategoryname;
	}
	public void setScategoryname(String scategoryname) {
		this.scategoryname = scategoryname;
	}
	public String getFimagename() {
		return fimagename;
	}
	public void setFimagename(String fimagename) {
		this.fimagename = fimagename;
	}
	public void setSimage(InputStream simage) {
		this.simage = simage;
	}
	public void setSthumb(InputStream sthumb) {
		this.sthumb = sthumb;
	}
	public void setSresult(InputStream sresult) {
		this.sresult = sresult;
	}
	public void setFimage(InputStream fimage) {
		this.fimage = fimage;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
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
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getFmobile() {
		return fmobile;
	}
	public void setFmobile(String fmobile) {
		this.fmobile = fmobile;
	}
	
	public String getFaddress() {
		return faddress;
	}
	public void setFaddress(String faddress) {
		this.faddress = faddress;
	}
	public String getFemail() {
		return femail;
	}
	public void setFemail(String femail) {
		this.femail = femail;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getLmobile() {
		return lmobile;
	}
	public void setLmobile(String lmobile) {
		this.lmobile = lmobile;
	}

	public String getScertificate() {
		return scertificate;
	}
	public void setScertificate(String scertificate) {
		this.scertificate = scertificate;
	}

	public String getAccno() {
		return accno;
	}
	public void setAccno(String accno) {
		this.accno = accno;
	}
	
}

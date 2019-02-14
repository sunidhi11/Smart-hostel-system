package sis.com.bo;

import java.util.Calendar;
import java.util.Date;

public class Admin {
	private String username=null;
	private String password=null;
	private long adminId;
	private String name=null;
	private String address=null;
	private String email=null;
	private String mobile;
	private Date dateOfBirth=null;
	private Date dateOfJoin=null;
	private String gender=null;
	private String fatherName=null;
	
	//new 1.4
		private Date lastLogIn=null;
		private int registered;
		public Date getLastLogIn() {
			return lastLogIn;
		}
		public void setLastLogIn(Date lastLogIn) {
			this.lastLogIn = lastLogIn;
		}
		
		
		public int getRegistered() {
			return registered;
		}
		public void setRegistered(int registered) {
			this.registered = registered;
		}
		//new 1.4
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public long getAdminId() {
		return adminId;
	}
	public void setAdminId(long adminId) {
		this.adminId = adminId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getFatherName() {
		return fatherName;
	}
	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}
	public Date getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public Date getDateOfJoin() {
		return dateOfJoin;
	}
	public void setDateOfJoin(Date dateOfJoin) {
		this.dateOfJoin = dateOfJoin;
	}
	
}

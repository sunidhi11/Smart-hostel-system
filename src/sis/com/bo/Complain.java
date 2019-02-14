/**

user sunidhi
 * 
 */
package sis.com.bo;

import java.sql.Date;


public class Complain {
	private int complainId;
	private int hostelId  ;
	private Date complainDate;
	private String department;
	private String Complain;
    private int roomNo ;
    private String status;
    private Date solveDate;
    private String email;
    private String sentStudent; 
    
    
	public int getComplainId() {
		return complainId;
	}
	public void setComplainId(int complainId) {
		this.complainId = complainId;
	}
	
	public int getHostelId() {
		return hostelId;
	}
	/**
	 * @param hostelId the hostelId to set
	 */
	public void setHostelId(int hostelId) {
		this.hostelId = hostelId;
	}
	/**
	 * @return the complainDate
	 */
	public Date getComplainDate() {
		return complainDate;
	}
	/**
	 * @param complainDate the complainDate to set
	 */
	public void setComplainDate(Date complainDate) {
		this.complainDate = complainDate;
	}
	/**
	 * @return the department
	 */
	public String getDepartment() {
		return department;
	}
	/**
	 * @param department the department to set
	 */
	public void setDepartment(String department) {
		this.department = department;
	}
		/**
	 * @return the complain
	 */
	public String getComplain() {
		return Complain;
	}
	/**
	 * @param complain the complain to set
	 */
	public void setComplain(String complain) {
		Complain = complain;
	}
	/**
	 * @return the roomNo
	 */
	public long getRoomNo() {
		return roomNo;
	}
	/**
	 * @param roomNo the roomNo to set
	 */
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}
	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}
	/**
	 * @return the solveDate
	 */
	public Date getSolveDate() {
		return solveDate;
	}
	/**
	 * @param solveDate the solveDate to set
	 */
	public void setSolveDate(Date solveDate) {
		this.solveDate = solveDate;
	}
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the sentStudent
	 */
	public String getSentStudent() {
		return sentStudent;
	}
	/**
	 * @param sentStudent the sentStudent to set
	 */
	public void setSentStudent(String sentStudent) {
		this.sentStudent = sentStudent;
	}
    
    
}

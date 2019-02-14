package sis.com.bo;

import java.util.Date;

public class SuperAdmin {
	private String username;
	private String password;
	private Date lastLogin;
	private Long superAdminId;
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
	public Date getLastLogin() {
		return lastLogin;
	}
	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}
	public Long getSuperAdminId() {
		return superAdminId;
	}
	public void setSuperAdminId(Long superAdminId) {
		this.superAdminId = superAdminId;
	}
	
	
}//class

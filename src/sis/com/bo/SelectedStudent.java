/**

user sunidhi

 * 
 */
package sis.com.bo;

/**
 * @author hp
 *
 */
public class SelectedStudent {

	private long enrollment_no;
	private String du_no;
	private boolean found= false;
	public boolean isUpdated_indb() {
		return updated_indb;
	}
	public void setUpdated_indb(boolean updated_indb) {
		this.updated_indb = updated_indb;
	}
	private boolean updated_indb=false;	
	public boolean isFound() {
		return found;
	}
	public void setFound(boolean found) {
		this.found = found;
	}
	
	public long getEnrollment_no() {
		return enrollment_no;
	}
	public void setEnrollment_no(long enrollment_no) {
		this.enrollment_no = enrollment_no;
	}
	public String getDu_no() {
		return du_no;
	}
	public void setDu_no(String du_no) {
		this.du_no = du_no;
	}
	
	
}

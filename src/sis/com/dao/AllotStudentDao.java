/**

user sunidhi

 * 
 */
package sis.com.dao;

import java.util.List;
import sis.com.bo.RegStudent;
import sis.com.bo.SelectedStudent;

/**
 * @author hp
 *
 */
public interface AllotStudentDao {

	List<RegStudent> getAllSelectedStudents();
	SelectedStudent checkDuNo(SelectedStudent s_student);
	boolean  getConfirmStatus(long enrollment);
	
}

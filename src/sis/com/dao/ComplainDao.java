package sis.com.dao;

import java.util.List;

import sis.com.bo.Complain;

public interface ComplainDao {
 Complain insertComplain(Complain complain);
List<Complain> getAllComplain();
	List<Complain> getAllEmail();
	Complain getComplainbyId(long id);
	boolean deleteComplain(long id);
	int deleteComplain(List<Complain> getAllComplain);
	boolean updateStatus(int id);
	List<Complain> getAllMess();
	List<Complain> getAllElectric();
	List<Complain> getAllClean();
	boolean sendmssg(String mssg,String email);
	boolean insert(Complain complain);
	int updateStatusStudent(int id);
}

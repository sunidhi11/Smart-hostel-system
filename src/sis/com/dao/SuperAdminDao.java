package sis.com.dao;
import java.util.List;

import sis.com.bo.*;

public interface SuperAdminDao {
	List<Admin> getAllAdmin();
	List<Admin> getAllRegisteredAdmin();
	Boolean deleteAdmin(Long adminId);
	Boolean addNewAdmin(String username, String password);
	SuperAdmin validateSuperAdmin(String username, String password);
}


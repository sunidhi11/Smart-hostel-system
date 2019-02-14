package sis.com.bo;

import sis.com.dao.AdminDao;
import sis.com.daoFactory.DaoFactory;

public class delete {

	public static void main(String[] args) {
		AdminDao adminDao = DaoFactory.getAdminDao();
		Admin admin=adminDao.get(1000);
		System.out.println("===>"+admin.getFatherName());
	}

}

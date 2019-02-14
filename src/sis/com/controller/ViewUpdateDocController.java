package sis.com.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import sis.com.bo.Student;
import sis.com.dao.StudentDao;
import sis.com.daoFactory.DaoFactory;

/**
 * Servlet implementation class ViewUpdateDocController
 */
public class ViewUpdateDocController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean result_parent= false;
		boolean result_student= false;	
		boolean result_doc =false;
		long flag=2;
	Student student = new Student();
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	Long hostelId=null;
	
	if(isMultipart){
		
		// Create a factory for disk-based file items
		FileItemFactory factory = new DiskFileItemFactory();

		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		
		try {
			// Parse the request
			List<FileItem> allMultipartsData = upload.parseRequest(request);
				
			List<FileItem> allNonFileData = new ArrayList<FileItem>();
			List<FileItem> allFileItemsList = new ArrayList<FileItem>();
			
			for (FileItem item : allMultipartsData) {
				if (item.isFormField()) {
					allNonFileData.add(item);
				}else if (!item.isFormField()) {
					allFileItemsList.add(item);
				}
			}
		     for (FileItem paramItem : allNonFileData) {
					 if("hostelId".equalsIgnoreCase(paramItem.getFieldName())){
						   hostelId=Long.parseLong(paramItem.getString());
							    student.setStuDocId(hostelId);
							    student.setParentId(hostelId);
						 }
				             
				  }//data extraction end
			
	for (FileItem fileItem : allFileItemsList) {
	System.out.println("inside file processing*****************************");
		if("simg".equalsIgnoreCase(fileItem.getFieldName())){
			System.out.println("file found student image processing+++++++*******");
			student.setStudentImage(fileItem.getInputStream());
			student.setStudentImageFileName(fileItem.getName());
			student.setStudentImageSize((int)fileItem.getSize());
			System.out.println("&&&student image size"+student.getStudentImageSize()+student.getStudentImage().available());
			}//if
		if("s_timg".equalsIgnoreCase(fileItem.getFieldName())){
			System.out.println("file found file processing+++++++*******");
			student.setStudentThumb(fileItem.getInputStream());
			student.setStudentThumbFileName(fileItem.getName());
			student.setStudentThumbSize((int)fileItem.getSize());
			}
		if("s_res".equalsIgnoreCase(fileItem.getFieldName())){
			System.out.println("file found file processing+++++++*******");
			student.setStudentResult(fileItem.getInputStream());
			student.setStudentResultFileName(fileItem.getName());
			student.setStudentResultSize((int)fileItem.getSize());
			}
		if("s_cat".equalsIgnoreCase(fileItem.getFieldName())){
			System.out.println("file found file processing+++++++*******");
			student.setStudentCategory(fileItem.getInputStream());
			student.setStudentCategoryFileName(fileItem.getName());
			student.setStudentCategorySize((int)fileItem.getSize());
			}
		if("f_img".equalsIgnoreCase(fileItem.getFieldName())){
			System.out.println("file found file processing+++++++*******");
			student.setFatherImage(fileItem.getInputStream());
			student.setFatherImageFileName(fileItem.getName());
			student.setFatherImageSize((int)fileItem.getSize());
			} 
	
	}
	}catch(Exception e){
		e.printStackTrace();
		 System.out.println("File upload failed"+e.getMessage());
	    } 
		
		StudentDao dao=DaoFactory.getStudentDao();
		 result_doc= dao.updateStuDocument(student);
		request.setAttribute("hostelId",hostelId);
		request.setAttribute("result_student",result_student);
		request.setAttribute("result_parent",result_parent);
		request.setAttribute("result_doc",result_doc);
		request.setAttribute("flag",flag);
		
		System.out.println("updation result"+result_doc);
		request.getRequestDispatcher("ViewStudentController").forward(request, response);
		
	}  //if
	
}  //post
}   //class

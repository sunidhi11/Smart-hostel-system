package sis.com.controller;
import java.io.IOException;

import java.io.InputStream;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import sis.com.bo.RegStudent;
import sis.com.dao.RegStudentDao;
import sis.com.daoFactory.DaoFactory;

import java.util.List;
/**
 * Servlet implementation class RegisterStudent
 */
public class RegisterStudent extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		RegStudent regstudent=new RegStudent();
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		
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
						//extract data
						if("stu_name".equalsIgnoreCase(paramItem.getFieldName())){
							regstudent.setName(paramItem.getString());
						}else if("course".equalsIgnoreCase(paramItem.getFieldName())){
						    regstudent.setCourse(paramItem.getString());
					        
						}else if("branch".equalsIgnoreCase(paramItem.getFieldName())){
						     regstudent.setBranch(paramItem.getString());
						}
						//try{
							 else if("stu_roll".equalsIgnoreCase(paramItem.getFieldName())){
								    regstudent.setRollno (Long.parseLong(paramItem.getString()));
								    System.out.println("roll no in controller1"+regstudent.getRollno());
							 }
					             else if("stu_enroll".equalsIgnoreCase(paramItem.getFieldName())){
									    regstudent.setEnrollment(Long.parseLong(paramItem.getString()));
					             }
					            else if("stu_mob".equalsIgnoreCase(paramItem.getFieldName())){
								    regstudent.setMobileno(paramItem.getString());
					            }
					        	 else if("sem".equalsIgnoreCase(paramItem.getFieldName())){
									    regstudent.setSemester (Integer.parseInt(paramItem.getString()));
					        	 }
					        	  else if("stu_cgpa".equalsIgnoreCase(paramItem.getFieldName())){
									    regstudent.setCgpa (Float.parseFloat(paramItem.getString()));
					        	  }
					              else if("stu_accno".equalsIgnoreCase(paramItem.getFieldName())){
									    regstudent.setAccno(paramItem.getString());
					              }
					            
					              else if("f_no".equalsIgnoreCase(paramItem.getFieldName())){
					            	  regstudent.setFmobile(paramItem.getString());
					              }
									    
					              else if("l_no".equalsIgnoreCase(paramItem.getFieldName())){
					            	  regstudent.setLmobile(paramItem.getString());

					              }
					      	
					//        }catch(NumberFormatException n){
					 //       	System.out.println("number format ex");
					//        }
					              else if("stu_email".equalsIgnoreCase(paramItem.getFieldName())){
					            	  regstudent.setEmail(paramItem.getString());
					              }
						 else if("stu_hostel".equalsIgnoreCase(paramItem.getFieldName())){
			            	  regstudent.setHostel(paramItem.getString());
			              } 
				        else if("category".equalsIgnoreCase(paramItem.getFieldName())){
			            	  regstudent.setCategory(paramItem.getString());
			            	  System.out.println("in controller category"+regstudent.getCategory());
			              }
				        else if("gender".equalsIgnoreCase(paramItem.getFieldName())){
			            	  regstudent.setGender(paramItem.getString());
			            	  System.out.println("in controller gender"+regstudent.getGender());

			              }
				    //   try{
				        	 else if("stu_birth".equalsIgnoreCase(paramItem.getFieldName())){
				            	  regstudent.setBirth(Date.valueOf(paramItem.getString()));
				              }
				     //  }
				        	
				      /*  }catch(IllegalArgumentException e){
				        	System.out.println("illegeal format ex");
				        }*/
				        else if("stu_address".equalsIgnoreCase(paramItem.getFieldName())){
			            	  regstudent.setAddress(paramItem.getString());
			              }
				        else if("father".equalsIgnoreCase(paramItem.getFieldName())){
			            	  regstudent.setFname(paramItem.getString());
			              }
				       
				        else if("mother".equalsIgnoreCase(paramItem.getFieldName())){
			            	  regstudent.setMname(paramItem.getString());
			              }
				        
				       
				        else if("f_address".equalsIgnoreCase(paramItem.getFieldName())){
			            	  regstudent.setFaddress(paramItem.getString());
			              }
				        else if("f_email".equalsIgnoreCase(paramItem.getFieldName())){
			            	  regstudent.setFemail(paramItem.getString());
			              }
				        else if("l_name".equalsIgnoreCase(paramItem.getFieldName())){
			            	  regstudent.setLname(paramItem.getString());
			              }
					  }//data extraction end
				//file data process
	//========================================================
			     
		for (FileItem fileItem : allFileItemsList) {
		System.out.println("inside file processing*****************************");
			if("simg".equalsIgnoreCase(fileItem.getFieldName())){
				System.out.println("file found student image processing+++++++*******");
				regstudent.setSimage(fileItem.getInputStream());
				regstudent.setSimagename(fileItem.getName());
				regstudent.setSimagesize((int)fileItem.getSize());
				System.out.println("size of image in controller"+regstudent.getSimagesize()+"  regstudent.getSimage().available() "+regstudent.getSimage().available());
				
				}//if
			if("s_timg".equalsIgnoreCase(fileItem.getFieldName())){
				System.out.println("file found file processing+++++++*******");
				regstudent.setSthumb(fileItem.getInputStream());
				regstudent.setSthumbname(fileItem.getName());
				regstudent.setSthumbsize((int)fileItem.getSize());
				System.out.println("size of thumb in controller"+regstudent.getSthumbsize()+regstudent.getSthumb().available());
				}
			if("s_res".equalsIgnoreCase(fileItem.getFieldName())){
				System.out.println("file found file processing+++++++*******");
				regstudent.setSresult(fileItem.getInputStream());
				regstudent.setSresultname(fileItem.getName());
				regstudent.setSresultsize((int)fileItem.getSize());
				}
			if("s_cat".equalsIgnoreCase(fileItem.getFieldName())){
				System.out.println("file found file processing+++++++*******");
				regstudent.setScategory(fileItem.getInputStream());
				regstudent.setScategoryname(fileItem.getName());
				regstudent.setScategorysize((int)fileItem.getSize());
				}
			if("f_img".equalsIgnoreCase(fileItem.getFieldName())){
				System.out.println("file found file processing+++++++*******");
				regstudent.setFimage(fileItem.getInputStream());
				regstudent.setFimagename(fileItem.getName());
				regstudent.setFimagesize((int)fileItem.getSize());
				System.out.println("father iamge size in controller"+(int)fileItem.getSize());
				} 
		
		}
		}catch(Exception e){
			e.printStackTrace();
			 System.out.println("File upload failed"+e.getMessage());
			 
		} 
			HttpSession session = request.getSession();
		if(regstudent!=null){
			System.out.println("session regstudent image size regstudent.getSimage().available()"+regstudent.getSimage().available());
			session.setAttribute("regstuinfo",regstudent);
			System.out.println("page forwarding");
		        request.getRequestDispatcher("PreviewReg.jsp").forward(request,response);	
		        System.out.println("end.............");
			
		}	
			
}   //end of if
        
}
}


package sis.com.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;



public class noticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fileName=null;
		long length = 0;
		InputStream docInputStream = null;
		String desc =null;
		
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);

		  if(isMultipart){
			  ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory());
			  try{
					List<FileItem> allMultipartsData = upload.parseRequest(request);
					//List<FileItem> allNonFileData = new ArrayList<FileItem>();
					//List<FileItem> allFileItemsList = new ArrayList<FileItem>();
		   for(FileItem item : allMultipartsData) {
			   if(item.isFormField()){
				   if("description".equalsIgnoreCase(item.getFieldName())){
					  desc = item.getString();
					 // System.out.println(desc);
				   }
			   }
			   else{
				 if("my_notice".equalsIgnoreCase(item.getFieldName())){
						  fileName  = item.getName();
						  length = item.getSize();
						  docInputStream  = item.getInputStream();
						//get done
				  }
			  }
		   }
		  }catch(Exception e){
			  e.printStackTrace();
			  }
		  }

		  //TODO 
		 
		 // final String UPLOAD_FOLDER = getServletContext().getRealPath("Notice_Uploads");
		  final String UPLOAD_FOLDER ="E:\\my_uploads";
		  File file = new File(UPLOAD_FOLDER);
		  if(!file.exists()){
			  file.mkdir();
			 }
		  System.out.println(UPLOAD_FOLDER);
		  //sis.txt    sis_123434354.txt
		  		
		  if(fileName.contains(" ")){
			  fileName.replace(" ", "_");
		  }
		  //String extension = fileName.substring(fileName.indexOf('.'), fileName.length());
		 //String newFile = fileName.substring(0,fileName.indexOf('.'))+"_"+System.currentTimeMillis()+extension;
          String savePath_file  = UPLOAD_FOLDER+"\\"+fileName;
		  FileOutputStream fos =null;
		  //read and write
		  try{
				fos  = new FileOutputStream(savePath_file);
			  byte[] data = new byte[1024];
			  while( docInputStream.read(data)!=-1){
				  fos.write(data);
			  }
			  
			//  final String propPath = getServletContext().getRealPath("\\my_notices.properties");
			  final String propPath = "E:\\my_notices.properties";
			    File file1 = new File(propPath);
			  if(!file1.exists()){
				  file.createNewFile();
				 }
			 
	
			  OutputStream out = null;
			  out=new FileOutputStream(file1,true);
			  FileReader fr =new FileReader(file1);
			 try{
			  Properties prop = new Properties();
			  prop.load(fr);
			  prop.setProperty(fileName,desc);
			  prop.store(out,"");
			  out.close();
			  
			 }catch(Exception e){
				e.printStackTrace();
			}
			  
		 //	System.out.println(savePath_file);
		//	System.out.println(fileName);
			
			response.sendRedirect("adminNotice.jsp");
		  }catch(Exception e){
			  
		  }finally{
		    try{
			 docInputStream.close();
		     fos.close();
		    // ("file saved");
		    }catch(Exception e){
		    	e.printStackTrace();
		 //    out.print("file saved problem  "+ e.getMessage());
		    }
			  
		  }
		
	

	}

}

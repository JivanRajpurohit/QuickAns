package quickans;


import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import user.DBConnection;
/**
 * Servlet implementation class AddCategory
 */
@WebServlet("/AddCategory")
public class AddCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		 String ctname="",photopath="";
		   
		   String filePath;
		    File file ;
		    DiskFileItemFactory factory = new DiskFileItemFactory();
		    ServletFileUpload upload = new ServletFileUpload(factory);
		    filePath = "D:\\Servlet\\userdemo\\src\\main\\webapp\\photo"; 
		
		    System.out.println(filePath);
		
		  try
		  {
		   List fileItems = upload.parseRequest(request);
	      
		   Iterator i = fileItems.iterator();
		   while(i.hasNext())
		   {
			   FileItem fi = (FileItem)i.next();   
		      if(fi.isFormField())
		      {
		    	  System.out.println(fi.getFieldName());
		    	  System.out.println(fi.getString());
		    	  
		    	  if(fi.getFieldName().equals("t1"))
		    	  {
		    		  ctname=fi.getString();
		    	  }
		    	  
		    	  
		    	  
		    	  
		      }
		      else
		      { 
		    	 if(fi.getName().equals(""))
		    	 {
		    		 
		    	 }
		    	 else
		    	 {
		    		 file=new File(filePath+"\\"+fi.getName());
			    	 fi.write(file);
			    	 photopath="../photo/"+fi.getName();
			    	 
		    	 }
		    	  }
		   }
		   
		 if(photopath.equals(""))
		 {
			// DBConnection.query("update user set user_name='"+ name +"',user_phno='"+phone+"',profile_crd='"+profile_crd +"',user_bio='"+ bio+"',employment_crd='"+ emp_crd+"',education_crd='"+edu_crd+"' where user_id='"+ id +"'");
			 DBConnection.query("insert into category(ct_name) values('"+ctname+"')");
			    
		 }
		 else
		 {
			 //DBConnection.query("update user set user_name='"+ name +"',user_phno='"+phone+"',photo='"+ photopath +"',profile_crd='"+profile_crd +"',user_bio='"+ bio+"',employment_crd='"+ emp_crd+"',education_crd='"+edu_crd+"' where user_id='"+ id +"'");
			 DBConnection.query("insert into category(ct_name,ct_photo) values('"+ctname+"','"+ photopath+"')");		    	 
			 
		
		 }
	       response.sendRedirect("admin/qlificategory.jsp");
		  }
		  catch(Exception ex)
		  {
			System.out.println(ex.toString());  
		  }
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		/*String photopath="", filePath;
		File file ;
		String name=request.getParameter("t1");
		
		response.sendRedirect("qlificategory.jsp");
		 DiskFileItemFactory factory = new DiskFileItemFactory();
		 ServletFileUpload upload = new ServletFileUpload(factory);
		    filePath = "D:\\Servlet\\userdemo\\src\\main\\webapp\\photo";
		    System.out.println(filePath);
		    try {
		    	List fileItems = upload.parseRequest(request);
			      
				   Iterator i = fileItems.iterator();
				   while(i.hasNext())
				   {
					   FileItem fi = (FileItem)i.next();   
				      if(fi.isFormField())
				      {
				    	  if(fi.getFieldName().equals("t1"))
				    	  {
				    		  name=fi.getString();
				    	  }
				      }
				      else
				      { 
				    	 if(fi.getName().equals(""))
				    	 {
				    		 
				    	 }
				    	 else
				    	 {
				    		 file=new File(filePath+"\\"+fi.getName());
					    	 fi.write(file);
					    	 photopath="photo/"+fi.getName();
					    	 
				    	 }
				    	 }
				   }
				   if(photopath.equals(""))
					 {
					   DBConnection.query("insert into category(ct_name) values('"+name+"')");
					   
					 }
					 else
					 {
						 DBConnection.query("insert into category(ct_name,ct_photo) values('"+name+"','"+ photopath+"')");		    	 
						 
					 }
				   
				   response.sendRedirect("admin/qlificategory.jsp");
		    }
		    
		    catch(Exception ex)
			  {
				ex.printStackTrace(); 
			  }
	*/
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

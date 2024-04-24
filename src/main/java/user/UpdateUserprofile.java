package user;

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

/**
 * Servlet implementation class UpdateAdmin
 */
@WebServlet("/UpdateUserprofile")
public class UpdateUserprofile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserprofile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		   String name="",phone="",photopath="";
		   String profile_crd="",bio="",emp_crd="",edu_crd="";
		   String filePath;
		    File file ;
		    DiskFileItemFactory factory = new DiskFileItemFactory();
		    ServletFileUpload upload = new ServletFileUpload(factory);
		    filePath = "D:\\Servlet\\userdemo\\src\\main\\webapp\\photo"; 
		
		    System.out.println(filePath);
		HttpSession h=request.getSession();
		   
		   String id=h.getAttribute("user_id").toString();
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
		    	  
		    	  if(fi.getFieldName().equals("name"))
		    	  {
		    		  name=fi.getString();
		    	  }
		    	  else if(fi.getFieldName().equals("phone"))
		    	  {
		    		  phone=fi.getString();
		    	  }
		    	  else if(fi.getFieldName().equals("profile_crd"))
		    	  {
		    		  profile_crd=fi.getString();
		    	  }
		    	  else if(fi.getFieldName().equals("bio"))
		    	  {
		    		  bio=fi.getString();
		    	  }
		    	  else if(fi.getFieldName().equals("emp_crd"))
		    	  {
		    		  emp_crd=fi.getString();
		    	  }
		    	  else if(fi.getFieldName().equals("profile_crd"))
		    	  {
		    		  edu_crd=fi.getString();
		    	  }
		    	  else if(fi.getFieldName().equals("edu_crd"))
		    	  {
		    		  edu_crd=fi.getString();
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
			 DBConnection.query("update user set user_name='"+ name +"',user_phno='"+phone+"',profile_crd='"+profile_crd +"',user_bio='"+ bio+"',employment_crd='"+ emp_crd+"',education_crd='"+edu_crd+"' where user_id='"+ id +"'");
			    
		 }
		 else
		 {
			 DBConnection.query("update user set user_name='"+ name +"',user_phno='"+phone+"',photo='"+ photopath +"',profile_crd='"+profile_crd +"',user_bio='"+ bio+"',employment_crd='"+ emp_crd+"',education_crd='"+edu_crd+"' where user_id='"+ id +"'");
			    	 
		 }
	       response.sendRedirect("usereditprofile.jsp");
		  }
		  catch(Exception ex)
		  {
			System.out.println(ex.toString());  
		  }
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
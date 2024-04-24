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

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class EditProfile
 */
@WebServlet("/EditProfile")
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String photopath="", filePath,skill="",work="",city="",name="";
		File file ;
		String id="";
	       
	 
	      // response.sendRedirect("qlificategory.jsp");
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
					    	  if(fi.getFieldName().equals("name"))
					    	  {
					    		  name=fi.getString();
					    	  }
					    	  else if(fi.getFieldName().equals("skill"))
					    	  {
					    		  skill=fi.getString();
					    	  }
					    	  else if(fi.getFieldName().equals("work"))
					    	  {
					    		  work=fi.getString();
					    	  }
					    	  else if(fi.getFieldName().equals("city"))
					    	  {
					    		  city=fi.getString();
					    	  }
					    	  else if(fi.getFieldName().equals("id"))
					    	  {
					    		  id=fi.getString();
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
						     // DBConnection.query("update admin set aname='"+name+"' , skill='"+skill+"' , from='"+city+"' , work='"+work+"' where aid='"+id+"'");
						      DBConnection.query("update admin set aname='"+ name +"',skill='"+skill+"',city='"+city+"',work='"+work+"' where aid='"+ id +"'");
						       
						 }
						 else
						 {
							 DBConnection.query("update admin set aname='"+ name +"' , skill='"+skill+"' , city='"+ city+"' , work='"+work+"',photo='"+ photopath+"' where aid='"+ id +"'");
							 
						 }
					   System.out.println("name"+name);
					   System.out.println("id"+id);
					 response.sendRedirect("admin/profile.jsp");
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

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
 * Servlet implementation class EditQlfiCategory
 */
@WebServlet("/EditQlfiCategory")
public class EditQlfiCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditQlfiCategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String photopath="", filePath;
		File file ;
		String id="";
	       String name="";
	 
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
					    	  if(fi.getFieldName().equals("t1"))
					    	  {
					    		  name=fi.getString();
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
						      DBConnection.query("update category set ct_name='"+ name +"' where ct_id='"+ id +"'");
						 }
						 else
						 {
						      DBConnection.query("update category set ct_name='"+ name +"',ct_photo='"+ photopath+"' where ct_id='"+ id +"'");	
						     }
					   System.out.println("name"+name);
					   System.out.println("id"+id);
					 response.sendRedirect("admin/qlificategory.jsp");
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

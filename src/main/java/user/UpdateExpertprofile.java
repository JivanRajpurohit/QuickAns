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
 * Servlet implementation class UpdateExpertprofile
 */
@WebServlet("/UpdateExpertprofile")
public class UpdateExpertprofile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateExpertprofile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		   String name="",phone="",photopath="",qlfi="",about="",ctid="",ytlink="",ldlink="";
		   String profile_crd="",emp_crd="",edu_crd="";
		   String filePath;
		    File file ;
		    DiskFileItemFactory factory = new DiskFileItemFactory();
		    ServletFileUpload upload = new ServletFileUpload(factory);
		    filePath = "D:\\Servlet\\userdemo\\src\\main\\webapp\\photo"; 
		
		    System.out.println(filePath);
		    HttpSession h=request.getSession();
			   
			String id=h.getAttribute("author_id").toString();
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
		    	  else if(fi.getFieldName().equals("about"))
		    	  {
		    		  about=fi.getString();
		    	  }
		    	  else if(fi.getFieldName().equals("ctid"))
		    	  {
		    		  ctid=fi.getString();
		    	  }
		    	  else if(fi.getFieldName().equals("ytlink"))
		    	  {
		    		  ytlink=fi.getString();
		    	  }
		    	  else if(fi.getFieldName().equals("ldlink"))
		    	  {
		    		  ldlink=fi.getString();
		    	  }
		    	  else if(fi.getFieldName().equals("emp_crd"))
		    	  {
		    		  emp_crd=fi.getString();
		    	  }
		    	  else if(fi.getFieldName().equals("profile_crd"))
		    	  {
		    		  profile_crd=fi.getString();
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
			   DBConnection.query("update expertuser set exp_name='"+ name +"',about='"+ about +"',exp_phno='"+phone+"',exp_youtube_link='"+ytlink+"',exp_linkdin_link='"+ldlink+"',profile_crd='"+profile_crd +"',employment_crd='"+ emp_crd+"',education_crd='"+edu_crd+"' where exp_id='"+ id +"'");
			         
		   }
		   else
		   {
			   DBConnection.query("update expertuser set exp_name='"+ name +"',exp_phno='"+phone+"',exp_youtube_link='"+ytlink+"',exp_linkdin_link='"+ldlink+"',photo='"+ photopath +"',profile_crd='"+profile_crd +"',employment_crd='"+ emp_crd+"',education_crd='"+edu_crd+"' where exp_id='"+ id +"'");
			         
		   }
		   response.sendRedirect("expertprofile.jsp");
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








































package user;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.CachedRowSet;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class AskQuestion
 */
@WebServlet("/AskQuestion")
public class AskQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AskQuestion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		/*String ctid=request.getParameter("t1");
		String que=request.getParameter("t2");
		String atc=request.getParameter("photo");
		
		 CachedRowSet rs=DBConnection.selectquery("select *from user");
		  
		 String user_id = null;
		try {
			user_id = rs.getString(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 HttpSession s=request.getSession();
		 s.setAttribute("user_id",user_id );
		 
		 
		
		DBConnection.query("insert into question(que,ct_id,user_id,attachment) values('"+que+"','"+ctid+"','"+user_id+"','"+atc+"')");
		response.sendRedirect("userlogin.jsp");*/
		
		
		 String que="",ctid="",photopath="";
		   String filePath;
		    File file ;
		    DiskFileItemFactory factory = new DiskFileItemFactory();
		    ServletFileUpload upload = new ServletFileUpload(factory);
		    filePath = "D:\\Servlet\\userdemo\\src\\main\\webapp\\attachment"; 
		
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
		    	  
		    	  if(fi.getFieldName().equals("t1"))
		    	  {
		    		  ctid=fi.getString();
		    	  }
		    	  else if(fi.getFieldName().equals("t2"))
		    	  {
		    		  que=fi.getString();
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
				    	 photopath="attachment/"+fi.getName();
				    	 
			    	 }
		    	
		    	
		      }
		   }
		   
		   if(photopath.equals(""))
			 {
				 //DBConnection.query("update user set user_name='"+ name +"',user_phno='"+phone+"',profile_crd='"+profile_crd +"',user_bio='"+ bio+"',employment_crd='"+ emp_crd+"',education_crd='"+edu_crd+"' where user_id='"+ id +"'");
				if(que.equals(""))
				{
					response.sendRedirect("useraskquestion.jsp?ta=1");
				}
				else
				{
					DBConnection.query("insert into question(que,ct_id,user_id) values('"+que+"','"+ctid+"','"+id+"')");
					  
					
				}
			       
			 }
			 else
			 {
				// DBConnection.query("update user set user_name='"+ name +"',user_phno='"+phone+"',photo='"+ photopath +"',profile_crd='"+profile_crd +"',user_bio='"+ bio+"',employment_crd='"+ emp_crd+"',education_crd='"+edu_crd+"' where user_id='"+ id +"'");
				 if(que.equals(""))
				 {
					 response.sendRedirect("useraskquestion.jsp?ta=1");
				 }
				 else
				 {
					 DBConnection.query("insert into question(que,ct_id,user_id,attachment) values('"+que+"','"+ctid+"','"+id+"','"+photopath+"')");
					
				 }
				 	 
			 }
	     response.sendRedirect("useraskquestion.jsp");
		  }
		  catch(Exception ex)
		  {
			System.out.println(ex.toString());  
		  }
		  
		  System.out.println("que : "+que);
		  System.out.println("ctid : "+ctid);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

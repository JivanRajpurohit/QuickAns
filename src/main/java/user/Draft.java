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
 * Servlet implementation class Draft
 */
@WebServlet("/Draft")
public class Draft extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Draft() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	
		String ans="",photopath="",qid="",ei="",uid="",ctid="";
		   String filePath;
		    File file ;
		    DiskFileItemFactory factory = new DiskFileItemFactory();
		    ServletFileUpload upload = new ServletFileUpload(factory);
		    filePath = "D:\\Servlet\\userdemo\\src\\main\\webapp\\attachment"; 
		
		    System.out.println(filePath);
			HttpSession h=request.getSession();
		
			String expertname=h.getAttribute("author_name").toString();
		   
		  try
		  {
		   List fileItems = upload.parseRequest(request);
	      
		   Iterator i = fileItems.iterator();
		   while(i.hasNext())
		   {
			   FileItem fi = (FileItem)i.next();   
		      if(fi.isFormField())
		      {
		    	  
		    	  if(fi.getFieldName().equals("t2"))
		    	  {
		    		  ans=fi.getString();
		    	  }
		    	  else if(fi.getFieldName().equals("qid"))
		    	  {
		    		  qid=fi.getString();
		    	  }
		    	  else if(fi.getFieldName().equals("eid"))
		    	  {
		    		  ei=fi.getString();
		    	  }
		    	  else if(fi.getFieldName().equals("userid"))
		    	  {
		    		  uid=fi.getString();
		    	  }
		    	  else if(fi.getFieldName().equals("ctid"))
		    	  {
		    		  ctid=fi.getString();
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
					 DBConnection.query("insert into draft(draft,q_id,ct_id,exp_id,user_id) values('"+ans+"','"+qid+"','"+ctid+"','"+ei+"','"+uid+"')");
				         
			}
			 else
			 {
				// DBConnection.query("update user set user_name='"+ name +"',user_phno='"+phone+"',photo='"+ photopath +"',profile_crd='"+profile_crd +"',user_bio='"+ bio+"',employment_crd='"+ emp_crd+"',education_crd='"+edu_crd+"' where user_id='"+ id +"'");
				 DBConnection.query("insert into draft(draft,q_id,ct_id,exp_id,user_id,attachment) values('"+ans+"','"+qid+"','"+ctid+"','"+uid+"','"+ei+"','"+photopath+"')");
			        	 
			 }
		  
		// DBConnection.sendmail("salaliyakrupali@gmail.com", "hello ", "hello world");
		   
			
		    
	     response.sendRedirect("draft.jsp?x="+qid);
		  }
		  catch(Exception ex)
		  {
			ex.printStackTrace();  
		  }
		  
		  System.out.println("qid : "+qid);
		 System.out.println("eid : "+ei);
		 System.out.println("ans : "+ans);
		
		
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

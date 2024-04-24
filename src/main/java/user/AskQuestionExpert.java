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
 * Servlet implementation class AskQuestionExpert
 */
@WebServlet("/AskQuestionExpert")
public class AskQuestionExpert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AskQuestionExpert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		 String que="",ctid="",photopath="",ei="";
		 String exmail="",exname="";
		   String filePath;
		    File file ;
		    DiskFileItemFactory factory = new DiskFileItemFactory();
		    ServletFileUpload upload = new ServletFileUpload(factory);
		    filePath = "D:\\Servlet\\userdemo\\src\\main\\webapp\\attachment"; 
		
		    System.out.println(filePath);
		HttpSession h=request.getSession();
		   
		
		
		   String id=h.getAttribute("user_id").toString();
		   String uname=h.getAttribute("user_name").toString();
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
		    	  else if(fi.getFieldName().equals("eid"))
		    	  {
		    		  ei=fi.getString();
		    	  }
		    	  else if(fi.getFieldName().equals("exmail"))
		    	  {
		    		  exmail=fi.getString();
		    	  }
		    	  else if(fi.getFieldName().equals("exname"))
		    	  {
		    		  exname=fi.getString();
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
					response.sendRedirect("useraskquestionexpert.jsp?ta=1&x="+ei);
				}
				else
				{
					 DBConnection.query("insert into question(que,ct_id,user_id,exp_id) values('"+que+"','"+ctid+"','"+id+"','"+ei+"')");
					    
				}
			       
			 }
			 else
			 {
				// DBConnection.query("update user set user_name='"+ name +"',user_phno='"+phone+"',photo='"+ photopath +"',profile_crd='"+profile_crd +"',user_bio='"+ bio+"',employment_crd='"+ emp_crd+"',education_crd='"+edu_crd+"' where user_id='"+ id +"'");
				 if(que.equals(""))
					{
						response.sendRedirect("useraskquestionexpert.jsp?ta=1&x="+ei);
					}
					else
					{
						DBConnection.query("insert into question(que,ct_id,user_id,attachment,exp_id) values('"+que+"','"+ctid+"','"+id+"','"+photopath+"','"+ei+"')");
				            
					}
				 	 
			 }
		   
		   System.out.println("mail : "+exmail);
		   DBConnection.sendmail(exmail, "Dear "+exname+" You Got A Question From "+uname , que);
		   DBConnection.query("insert into notification(notification,exp_id) values('"+"You Got A Question From "+uname+"','"+ei+"')");
		    
	     response.sendRedirect("useraskquestionexpert.jsp?x="+ei);
		  }
		  catch(Exception ex)
		  {
			System.out.println(ex.toString());  
		  }
		  
		  System.out.println("que : "+que);
		  System.out.println("ctid : "+ctid);
		  System.out.println("eid : "+ei);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

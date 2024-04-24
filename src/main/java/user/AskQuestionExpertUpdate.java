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

import user.DBConnection;

/**
 * Servlet implementation class AskQuestionExpertUpdate
 */
@WebServlet("/AskQuestionExpertUpdate")
public class AskQuestionExpertUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AskQuestionExpertUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		String qid="";
	       
	       String que="",ctid="",photopath="",ei="";
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
		    	  if(fi.getFieldName().equals("qid"))
		    	  {
		    		  qid=fi.getString();
		    	  }
		    	  
		    	  else if(fi.getFieldName().equals("t1"))
		    	  {
		    		  ctid=fi.getString();
		    	  }
		    	  else if(fi.getFieldName().equals("eid"))
		    	  {
		    		  ei=fi.getString();
		    	  }
		    	  else
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
		
		   
	   // DBConnection.query("insert into question(que,ct_id,user_id,attachment) values('"+que+"','"+ctid+"','"+id+"','"+photopath+"')");
	    if(photopath.equals(""))
	    {
		   DBConnection.query("update question set que='"+ que +"',ct_id='"+ ctid +"' where q_id='"+ qid +"'");
	    }
	    else
	    {
	    	   DBConnection.query("update question set que='"+ que +"',ct_id='"+ ctid +"',attachment='"+ photopath +"' where q_id='"+ qid +"'");
	   	    	
	    }
	    response.sendRedirect("useraskquestionexpert.jsp?x="+ei);
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

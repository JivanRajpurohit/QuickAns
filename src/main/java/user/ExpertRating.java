package user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ExpertRating
 */
@WebServlet("/ExpertRating")
public class ExpertRating extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExpertRating() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String qid=request.getParameter("z");
		String aid=request.getParameter("x");
		String w=request.getParameter("w");
		String s=request.getParameter("y");
		String update=request.getParameter("u");
		
		
		String eid=request.getParameter("eid");
	 /*DBConnection.query("insert into like_dislike(like_status,user_id,exp_id,ans_id) values('"+ s +"','"+ uid +"','0','"+aid+"')");
	 response.sendRedirect("userpostanswer.jsp?x="+qid);*/
	 
		System.out.println("eid"+eid);
	 	if(w==null)
	    {
	    	System.out.println("insert");
	    	DBConnection.query("insert into expertrating(ld_status,exp_id,ans_id) values('"+ s +"','"+ eid +"','"+aid+"')");
	    	response.sendRedirect("useraskquestionexpertanswer.jsp?x="+qid+"&y="+eid);
	    }
	 	else if(update.equals("update"))
	    {
	    	System.out.println("up");
	    	DBConnection.query("update expertrating set ld_status='"+ s +"' WHERE exp_id='"+eid+"' and ans_id='"+aid+"'");
	    	response.sendRedirect("useraskquestionexpertanswer.jsp?x="+qid+"&y="+eid);
	    	
	    	
	    }
	    else
	    {
	    	System.out.println("da");
	    	DBConnection.query("DELETE FROM expertrating WHERE exp_id='"+eid+"' and ans_id='"+aid+"'");
	    	response.sendRedirect("useraskquestionexpertanswer.jsp?x="+qid+"&y="+eid);
	    	
	    	
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

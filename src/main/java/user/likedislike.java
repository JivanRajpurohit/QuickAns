package user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class likedislike
 */
@WebServlet("/likedislike")
public class likedislike extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public likedislike() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		///response.getWriter().append("Served at: ").append(request.getContextPath());
	 
		String qid=request.getParameter("z");
		String aid=request.getParameter("x");
		String w=request.getParameter("w");
		String s=request.getParameter("y");
		String update=request.getParameter("u");
		
		HttpSession h=request.getSession();
		String uid=h.getAttribute("user_id").toString();
	 /*DBConnection.query("insert into like_dislike(like_status,user_id,exp_id,ans_id) values('"+ s +"','"+ uid +"','0','"+aid+"')");
	 response.sendRedirect("userpostanswer.jsp?x="+qid);*/
	 
	 	if(w==null)
	    {
	    	System.out.println("sa");
	    	DBConnection.query("insert into like_dislike(like_status,user_id,exp_id,ans_id) values('"+ s +"','"+ uid +"','0','"+aid+"')");
	    	response.sendRedirect("userpostanswer.jsp?x="+qid);
	    }
	 	else if(update.equals("update"))
	    {
	    	System.out.println("up");
	    	DBConnection.query("update like_dislike set like_status='"+ s +"' WHERE user_id='"+uid+"' and ans_id='"+aid+"'");
	    	response.sendRedirect("userpostanswer.jsp?x="+qid);
	    	
	    	
	    }
	    else
	    {
	    	System.out.println("da");
	    	DBConnection.query("DELETE FROM like_dislike WHERE user_id='"+uid+"' and ans_id='"+aid+"'");
	    	response.sendRedirect("userpostanswer.jsp?x="+qid);
	    	
	    	
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

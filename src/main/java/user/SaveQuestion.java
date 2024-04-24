package user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SaveQuestion
 */
@WebServlet("/SaveQuestion")
public class SaveQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveQuestion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String qid=request.getParameter("x");
		String cid=request.getParameter("y");
		String z=request.getParameter("z");
		
		
	    HttpSession h=request.getSession();
	    String uid=h.getAttribute("user_id").toString();
	    
	    if(z==null)
	    {
	    	System.out.println("sa");
	    	DBConnection.query("insert into save_question(q_id,user_id,status,ct_id) values('"+ qid +"','"+ uid +"','1','"+ cid +"')");
	    	response.sendRedirect("userhome.jsp");
	    }
	    else
	    {
	    	System.out.println("da");
	    	DBConnection.query("DELETE FROM save_question WHERE user_id='"+uid+"' and q_id='"+qid+"'");
	    	response.sendRedirect("userhome.jsp");
	    	
	    	
	    }
	    System.out.println("qid: "+qid);
	    System.out.println("uid: "+uid);
	    System.out.println("z : "+z);
	    System.out.println("cat id: "+cid);
	   
		
	  //  response.sendRedirect("userhome.jsp?x="+uid);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

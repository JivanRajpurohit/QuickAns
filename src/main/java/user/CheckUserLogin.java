package user;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.CachedRowSet;



/**
 * Servlet implementation class CheckUserLogin
 */
@WebServlet("/CheckUserLogin")
public class CheckUserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckUserLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String l=request.getParameter("t1");
	    String p=request.getParameter("t2");
	    
	    CachedRowSet rs=DBConnection.selectquery("select *from user where user_email='"+ l +"' and user_pwd='"+ p +"' and status='1'");
	    CachedRowSet rsa=DBConnection.selectquery("select *from expertuser where exp_email='"+ l +"' and exp_pswd='"+ p +"' and status='1'");
		
	    try 
	    {
			if(rs.next())
             {
				 String user_name=rs.getString(2);
				 String user_id=rs.getString(1);
				 String photo=rs.getString(8);
				 HttpSession s=request.getSession();
				 s.setAttribute("user_name",user_name );
				 s.setAttribute("user_id",user_id );
				 s.setAttribute("photo",photo);
				 response.sendRedirect("userhome.jsp");
				                }
			else if(rsa.next())
			{
				
				    
				    	HttpSession s=request.getSession();
						 s.setAttribute("author_name",rsa.getString(2));
						 s.setAttribute("author_id",rsa.getString(1));
						 s.setAttribute("photo",rsa.getString(12));
						 System.out.println(s.getAttribute("author_name").toString());
						 response.sendRedirect("experthome.jsp");
						    	
				   
			}
			else
			{
				response.sendRedirect("userlogin.jsp?p=1");
			}
		} 
	    catch (Exception e)
	    {
			e.printStackTrace();
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

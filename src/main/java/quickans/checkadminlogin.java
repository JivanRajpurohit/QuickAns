package quickans;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.CachedRowSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class checkadminlogin
 */
@WebServlet("/checkadminlogin")
public class checkadminlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkadminlogin() {
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
	    
	    CachedRowSet rs=DBConnection.selectquery("select *from admin where emailid='"+ l +"' and password='"+ p +"'");
	    try 
	    {
			if(rs.next())
             {
				 String name=rs.getString(2);
				 String aid=rs.getString(1);
				 String photo=rs.getString(8);
				 HttpSession s=request.getSession();
				 s.setAttribute("name", name);
				 s.setAttribute("aid", aid);
				 s.setAttribute("photo", photo);
				 response.sendRedirect("admin/home.jsp");
				                }
			else
				{
				 
				  response.sendRedirect("admin/login.jsp?x=1");

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

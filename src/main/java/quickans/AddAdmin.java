package quickans;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.DBConnection;

/**
 * Servlet implementation class AddAdmin
 */
@WebServlet("/AddAdmin")
public class AddAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String name=request.getParameter("t1");
		String eid=request.getParameter("t2");
		String pass=request.getParameter("t3");
		String sotp=request.getParameter("otp");	
		String uotp=request.getParameter("t4");
		
		if(uotp.equals(sotp))
		{
			DBConnection.query("insert into admin(aname,emailid,password) values('"+name+"','"+eid+"','"+pass+"')");
			
			response.sendRedirect("admin/login.jsp");
		}
		else
		{
			response.sendRedirect("admin/registrationotp.jsp?z=1");
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

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

/**
 * Servlet implementation class UpdatePassword
 */
@WebServlet("/UpdatePassword")
public class UpdatePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String oldpass=request.getParameter("t1");
		String newpass=request.getParameter("t2");
		HttpSession h=request.getSession();
		String aid=h.getAttribute("aid").toString();
		CachedRowSet rs=DBConnection.selectquery("select *from admin where aid='"+ aid +"' and password='"+oldpass+"'");
		try {
			if(rs.next())
			{
				DBConnection.query("update admin set password='"+ newpass +"' where aid='"+ aid +"'");
				response.sendRedirect("adminchangepassword.jsp?x=1");
			}
			else
			{
				response.sendRedirect("adminchangepassword.jsp?x=0");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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

package quickans;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.DBConnection;

/**
 * Servlet implementation class ResetPasswordAdmin
 */
@WebServlet("/ResetPasswordAdmin")
public class ResetPasswordAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetPasswordAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String newpass=request.getParameter("t1");
		String cnfmpass=request.getParameter("t2");
		String adminemail=request.getParameter("adminemail");
		//HttpSession h=request.getSession();
		//String user_id=h.getAttribute("user_id").toString();
	//	CachedRowSet rs=DBConnection.selectquery("select *from user where user_id='"+ user_id +"' and user_pwd='"+oldpass+"'");
		try {
			if(newpass.equals(cnfmpass))
			{
				DBConnection.query("update admin set password='"+ newpass +"' where emailid='"+ adminemail +"'");
				DBConnection.sendmail(adminemail,"Reset Your Password","\n\nYour Password Has Been Changed Successfully...");
	              
				response.sendRedirect("admin/login.jsp");
			}
			else
			{
				response.sendRedirect("admin/resetpassword.jsp?x=1");
			}
		} catch (Exception e) {
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

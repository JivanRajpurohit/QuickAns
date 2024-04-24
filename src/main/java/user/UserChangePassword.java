package user;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.CachedRowSet;

import user.DBConnection;

/**
 * Servlet implementation class UserChangePassword
 */
@WebServlet("/UserChangePassword")
public class UserChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserChangePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String oldpass=request.getParameter("t1");
		String newpass=request.getParameter("t2");
		String cnfmpass=request.getParameter("t3");
		
		HttpSession h=request.getSession();
		String user_id=h.getAttribute("user_id").toString();
		CachedRowSet rs=DBConnection.selectquery("select *from user where user_id='"+ user_id +"' and user_pwd='"+oldpass+"'");
		try {
			if(rs.next())
			{
				
				if(newpass.equals(cnfmpass))
				{
					
					int pcount=0,pflag=0;
		            
					for(int i = 0; i < newpass.length(); i++)
					{    
			            if(newpass.charAt(i) == ' ')
			            {
			            	pflag=1;
			            	break;
			            }
			            else
			            {
			            	pcount++; 
			            }
			                   
			        }
					
					if(pflag==1)
					{
						response.sendRedirect("usereditprofile.jsp?sp=1");
					}
					else if(pcount!=8)
					{
						response.sendRedirect("usereditprofile.jsp?p=1");
						
					}
					else
					{
						DBConnection.query("update user set user_pwd='"+ newpass +"' where user_id='"+ user_id +"'");
						response.sendRedirect("usereditprofile.jsp?x=1");
					}
					
					
					
					
				}
				else
				{
					response.sendRedirect("usereditprofile.jsp?ns=1");
				}
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				//DBConnection.query("update user set user_pwd='"+ newpass +"' where user_id='"+ user_id +"'");
				//response.sendRedirect("usereditprofile.jsp?x=1");
			}
			else
			{
				response.sendRedirect("usereditprofile.jsp?x=0");
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

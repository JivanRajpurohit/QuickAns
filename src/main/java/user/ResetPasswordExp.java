package user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ResetPasswordExp
 */
@WebServlet("/ResetPasswordExp")
public class ResetPasswordExp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetPasswordExp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	
		String newpass=request.getParameter("t2");
		String cnfmpass=request.getParameter("t3");
		String expemail=request.getParameter("expemail");
		//HttpSession h=request.getSession();
		//String user_id=h.getAttribute("user_id").toString();
	//	CachedRowSet rs=DBConnection.selectquery("select *from user where user_id='"+ user_id +"' and user_pwd='"+oldpass+"'");
		try {
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
					response.sendRedirect("resetpasswordexp.jsp?sp=1");
				}
				else if(pcount!=8)
				{
					response.sendRedirect("resetpasswordexp.jsp?p=1");
					
				}
				
				
				
				DBConnection.query("update expertuser set exp_pswd='"+ newpass +"' where exp_email='"+ expemail +"'");
				DBConnection.sendmail(expemail,"Reset Your Password","\n\nYour Password Has Been Changed Successfully");
	             
				response.sendRedirect("userlogin.jsp");
			}
			else
			{
				response.sendRedirect("resetpasswordexp.jsp?x=1");
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

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

/**
 * Servlet implementation class ExpertChangePassword
 */
@WebServlet("/ExpertChangePassword")
public class ExpertChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExpertChangePassword() {
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
		String exp_id=h.getAttribute("author_id").toString();
		CachedRowSet rs=DBConnection.selectquery("select *from expertuser where exp_id='"+ exp_id +"' and exp_pswd='"+oldpass+"'");
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
						response.sendRedirect("experteditprofile.jsp?sp=1");
					}
					else if(pcount!=8)
					{
						response.sendRedirect("experteditprofile.jsp?p=1");
						
					}
					else
					{
						DBConnection.query("update expertuser set exp_pswd='"+ newpass +"' where exp_id='"+ exp_id +"'");
						
						response.sendRedirect("experteditprofile.jsp?x=1");
					}
					
					
					
					
				}
				else
				{
					response.sendRedirect("experteditprofile.jsp?ns=1");
				}
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
			}
			else
			{
				response.sendRedirect("experteditprofile.jsp?x=0");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("expid : "+exp_id);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

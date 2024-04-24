package quickans;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.CachedRowSet;

import user.DBConnection;

/**
 * Servlet implementation class SignUpOTP
 */
@WebServlet("/SignUpOTP")
public class SignUpOTP extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpOTP() {
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
		
		CachedRowSet rs=	DBConnection.selectquery("select *from admin where emailid='"+ eid +"'");
		
		try
		{
			if(rs.next())
			{
				response.sendRedirect("admin/registration.jsp?x=1");
			}
			
			else
			{
			HttpSession d=request.getSession();
			
			d.setAttribute("aname",name);
			d.setAttribute("aeid",eid);
			d.setAttribute("apass",pass);
            int count=0,flag=0;
            
			for(int i = 0; i < pass.length(); i++)
			{    
	            if(pass.charAt(i) == ' ')
	            {
	            	flag=1;
	            	break;
	            }
	            else
	            {
	            	count++; 
	            }
	                   
	        }    
			
			if(flag==1)
			{
				response.sendRedirect("admin/registration.jsp?s=1");
			}
			else if(count!=8)
			{
				response.sendRedirect("admin/registration.jsp?p=1");
				
			}
			else
			{
				   String otp=generateOTP(5);
		           d.setAttribute("sotp", otp);
	               DBConnection.sendmail(eid,"QuickAns","Your OTP is "+ otp);
	               System.out.println("mailid"+eid);
	   			
	               System.out.println("Generated OTP : "+otp);
	               response.sendRedirect("admin/registrationotp.jsp");
				
			}
			
            }
			
		}
		catch(Exception ex)
		{
			  // response.sendRedirect("usersignup.jsp?x=1");
			  ex.printStackTrace(); 
				
		}
	
	}
	
	public static String generateOTP(int otpLength)
	{
		Random random=new Random();
		
		StringBuilder sb=new StringBuilder();
		
		for(int i=0 ; i< otpLength ; i++)
		{
			sb.append(random.nextInt(10));
		}
		
		String otp=sb.toString();
		
		return otp;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

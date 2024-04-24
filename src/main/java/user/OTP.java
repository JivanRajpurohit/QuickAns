package user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.CachedRowSet;

import java.util.Random;


/**
 * Servlet implementation class OTP
 */
@WebServlet("/OTP")
public class OTP extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OTP() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
				String un=request.getParameter("t1");
				String phn=request.getParameter("t2");
				String mailid=request.getParameter("t3");
				String pass=request.getParameter("t4");
				
			CachedRowSet rs=	DBConnection.selectquery("select *from user where user_email='"+ mailid +"'");
			CachedRowSet rse=	DBConnection.selectquery("select *from expertuser where exp_email='"+ mailid +"'");
		    
			try
			{
				if(rs.next())
				{
					response.sendRedirect("usersignup.jsp?x=1");
				}
				else if(rse.next())
				{
					response.sendRedirect("usersignup.jsp?x=1");
				}
				else
				{
					CachedRowSet rsp=	DBConnection.selectquery("select *from user where user_phno='"+ phn +"'");
					if(rsp.next())
					{
						response.sendRedirect("usersignup.jsp?eph=1");
					}
					else
					{
						int count=0,flag=0;
			            
						for(int i = 0; i < phn.length(); i++)
						{    
				            if(phn.charAt(i) == ' ')
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
							response.sendRedirect("usersignup.jsp?sph=1");
						}
						else if(count!=10)
						{
							response.sendRedirect("usersignup.jsp?ph=1");
							
						}
					}
					
					int pcount=0,pflag=0;
		            
					for(int i = 0; i < pass.length(); i++)
					{    
			            if(pass.charAt(i) == ' ')
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
						response.sendRedirect("usersignup.jsp?sp=1");
					}
					else if(pcount!=8)
					{
						response.sendRedirect("usersignup.jsp?p=1");
						
					}
					else
					{
						HttpSession d=request.getSession();
						
						d.setAttribute("uname",un);
						d.setAttribute("uphn",phn);
						d.setAttribute("umi",mailid);
						d.setAttribute("upass",pass);
					
					
	                
			           String otp=generateOTP(5);
			           d.setAttribute("uotp", otp);
		               DBConnection.sendmail(mailid,"QuickAns","Your OTP is "+ otp);
		               System.out.println("mailid"+mailid);
		   			
		               System.out.println("Generated OTP : "+otp);
		               response.sendRedirect("otp.jsp");
					}
					
					
					
					
				}
				
			}
			catch(Exception ex)
			{
				  
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

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
 * Servlet implementation class ForgotPassSendOTP
 */
@WebServlet("/ForgotPassSendOTP")
public class ForgotPassSendOTP extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPassSendOTP() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String eid=request.getParameter("t1");
		CachedRowSet rs=	DBConnection.selectquery("select *from admin where emailid='"+ eid +"'");
		
		try
		{
			if(rs.next())
			{
				String name=rs.getString(2);
				HttpSession d=request.getSession();
				d.setAttribute("adminemail", eid);
				/*d.setAttribute("uname",un);
				d.setAttribute("uphn",phn);
				d.setAttribute("umi",mailid);
				d.setAttribute("upass",pass);*/
	            
	            String otp=generateOTP(5);
	            d.setAttribute("sotp", otp);
	            
	               DBConnection.sendmail(eid,"Reset Your Password","Hi "+name+","+"\nWe got a request to reset your QuickAns password. \n\nYour OTP is "+ otp);
	               System.out.println("mailid"+eid);
	   			
	               System.out.println("Generated OTP : "+otp);
	               response.sendRedirect("admin/forgotpassotp.jsp");
			}
			
			else
			{
				response.sendRedirect("admin/forgotpassword.jsp?x=1");
			
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

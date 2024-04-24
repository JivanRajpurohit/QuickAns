package user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ForgotPassOTPExp
 */
@WebServlet("/ForgotPassOTPExp")
public class ForgotPassOTPExp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPassOTPExp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String uotp=request.getParameter("t3");
		String sotp=request.getParameter("otp");
		
		if(uotp.equals(sotp))
		{
			//DBConnection.query("insert into user(user_name,user_phno,user_email,user_pwd,status,photo,) values('"+name+"','"+ph+"','"+email+"','"+pass+"','1','')");
			//DBConnection.query("insert into user(user_name,user_phno,user_email,user_pwd,status,photo,profile_crd,user_bio,employment_crd,education_crd) values('"+name+"','"+ph+"','"+email+"','"+pass+"','1','','','','','')");
			response.sendRedirect("resetpasswordexp.jsp");
		}
		else
		{
			response.sendRedirect("forgotpassotpexp.jsp?z=1");
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

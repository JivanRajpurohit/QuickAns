package quickans;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ForgotPassCheckOTP
 */
@WebServlet("/ForgotPassCheckOTP")
public class ForgotPassCheckOTP extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPassCheckOTP() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String uotp=request.getParameter("t1");
		String sotp=request.getParameter("sotp");
		
		if(uotp.equals(sotp))
		{
			//DBConnection.query("insert into user(user_name,user_phno,user_email,user_pwd,status,photo,) values('"+name+"','"+ph+"','"+email+"','"+pass+"','1','')");
			//DBConnection.query("insert into user(user_name,user_phno,user_email,user_pwd,status,photo,profile_crd,user_bio,employment_crd,education_crd) values('"+name+"','"+ph+"','"+email+"','"+pass+"','1','','','','','')");
			response.sendRedirect("admin/resetpassword.jsp");
		}
		else
		{
			response.sendRedirect("admin/forgotpassotp.jsp?z=1");
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

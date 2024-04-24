package user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.DBConnection;

/**
 * Servlet implementation class UserSignUp
 */
@WebServlet("/UserSignUp")
public class UserSignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserSignUp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String name=request.getParameter("username");
		String ph=request.getParameter("phn");
		String email=request.getParameter("emailid");
		String pass=request.getParameter("pass");
		System.out.println("name : "+name);
		
		String uotp=request.getParameter("t3");
		String sotp=request.getParameter("otp");
		
		if(uotp.equals(sotp))
		{
			//DBConnection.query("insert into user(user_name,user_phno,user_email,user_pwd,status,photo,) values('"+name+"','"+ph+"','"+email+"','"+pass+"','1','')");
			DBConnection.query("insert into user(user_name,user_phno,user_email,user_pwd,status,photo,profile_crd,user_bio,employment_crd,education_crd) values('"+name+"','"+ph+"','"+email+"','"+pass+"','1','','','','','')");
			DBConnection.sendmail(email, "Welcome to the QuickAns  ", "HELLO "+name+"\n\nThank you for being a member of the QuickAns community!\n\nYou are at the right place to gather information.\n\nOur aim is to build a strong team which has the mission of helping others by sharing their knowledge. If you would like to be part of this team, please get in touch with us.\n\nThank You,\n\nThe QuickAns Team");
			 
			response.sendRedirect("userregsuss.jsp");
		}
		else
		{
			response.sendRedirect("otp.jsp?z=1");
		}
		//DBConnection.query("insert into user(user_name,user_phno,user_email,user_pwd,status,photo) values('"+name+"','"+ph+"','"+email+"','"+pass+"','1','')");
		//response.sendRedirect("userlogin.jsp");
		
		
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ExpertSignUp
 */
@WebServlet("/ExpertSignUp")
public class ExpertSignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExpertSignUp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		String name=request.getParameter("ename");
		String ph=request.getParameter("eph");
		String email=request.getParameter("eemail");
		String pass=request.getParameter("epass");
		String qua=request.getParameter("eq");
		String fb=request.getParameter("efb");
		String ll=request.getParameter("ell");
		String cat=request.getParameter("ect");
		System.out.println("name : "+name);
		
		
		
		String uotp=request.getParameter("t3");
		String sotp=request.getParameter("otp");
		
		if(uotp.equals(sotp))
		{
			//DBConnection.query("insert into user(user_name,user_phno,user_email,user_pwd,status,photo,) values('"+name+"','"+ph+"','"+email+"','"+pass+"','1','')");
			DBConnection.query("insert into expertuser(exp_name,exp_phno,exp_email,exp_pswd,exp_youtube_link,exp_linkdin_link,exp_qlfi,about,ct_id,status,photo,profile_crd,employment_crd,education_crd) values('"+name+"','"+ph+"','"+email+"','"+pass+"','"+fb+"','"+ll+"','"+qua+"','','"+cat+"','2','','','','')");
			DBConnection.sendmail(email, "Sent Request  ", "HELLO "+name+"\n\nYour Request Has Been Sent Successfully.\n\nThank You,\n\nThe QuickAns Team");
			   
			response.sendRedirect("expertsentreq.jsp");
		}
		else
		{
			response.sendRedirect("otpexpert.jsp?z=1");
		}
		//DBConnection.query("insert into user(user_name,user_phno,user_email,user_pwd,status,photo) values('"+name+"','"+ph+"','"+email+"','"+pass+"','1','')");
		//response.sendRedirect("userlogin.jsp");
		
		System.out.println("name : "+name);
		System.out.println("cat : "+cat);
		
		

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.time.Duration;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
 
/**
 * Servlet implementation class AddSubscription
 */
@WebServlet("/AddSubscription")
public class AddSubscription extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSubscription() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		 
		  String pid=request.getParameter("pid");
		 String amount=request.getParameter("amount");
		 String uid=request.getParameter("uid");
		 String name=request.getParameter("name");
		 String phone=request.getParameter("phone");
		 String emailid=request.getParameter("emailid");
		 String d=request.getParameter("duration");
		 
		 System.out.println(pid);
		 System.out.println(amount);
		 System.out.println(uid);
		 System.out.println(name);
		 System.out.println(phone);
		 System.out.println(emailid);
		 
		 System.out.println(d);
		 
		 
		 
		 LocalDate dateObj = LocalDate.now();
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	        String date = dateObj.format(formatter);
	
	        LocalDate futureDate = LocalDate.now().plusMonths(Integer.parseInt(d));
	        String lastdate = futureDate.format(formatter);
	        
	        DBConnection.query("insert into subscription_payment(user_id,s_package_id,s_amount,s_date,end_date,payment_status) values('"+ uid +"','"+pid +"','"+ amount +"','"+ date +"','"+ lastdate +"','Paid')");
	    	
	        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

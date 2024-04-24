package quickans;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;





/**
 * Servlet implementation class ApproveExpert
 */
@WebServlet("/ApproveExpert")
public class ApproveExpert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApproveExpert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String id=request.getParameter("x");
		String emailid=request.getParameter("y");
		String name=request.getParameter("z");
		
		DBConnection.query("update expertuser set status='1'where exp_id='"+ id +"'");
		System.out.println("id : "+id);
		System.out.println("eid : "+emailid);
		DBConnection.sendmail(emailid, "QuickAns-being a member of the QuickAns community!", "HELLO "+name+"\n\nThank you for being a member of the QuickAns community! \n\n Now You can become one of our experts too!\n\n"
				+ "Our aim is to build a strong team of experts with vast expertise in as many fields as possible. This team has the mission of helping others by sharing their knowledge. If you would like to be part of this team, please get in touch with us. \n\n\n Thank you, \n\nThe QuickAns Team");
		
		response.sendRedirect("admin/expertuser.jsp");
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

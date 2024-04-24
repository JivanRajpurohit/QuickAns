<%@ include file="header.jsp"%>
<%@page import="quickans.DBConnection"%>
<%@ page import="javax.sql.rowset.*"%>

<main class="content">
	<div class="container-fluid p-0">

		<div class="mb-3">
			<h1 class="h3 d-inline align-middle">Change Password</h1>
		</div>

		<div class="row">
			<div class="col-12 col-lg-12">
				<div class="card">
					<div class="card-header">
						<h5 class="card-title mb-0">Chanage Password</h5>
					</div>

					<div class="card-body">
						<form method="post" action="../UpdatePassword">

							<dt>Old Password :</dt>
							<input type="password" class="form-control"
								placeholder="Old Password" name="t1"><br>
							<dt>New Password :</dt>
							<input type="password" class="form-control"
								placeholder="New Password" name="t2"><br>
							<dt>Confirm Password:</dt>
							<input type="password" class="form-control"
								placeholder="Confirm Password" name="t3"><br>
							<br>
							<button type="submit" class="btn btn-primary me-2">Submit</button>
							<button class="btn btn-light">Cancel</button>
						</form>
						<br>
                        
                        
                        <%
                           if(request.getParameter("x")!=null)
                           {
                        	   if(request.getParameter("x").equals("0"))
                        	   {
                        		  out.print("<font color='red'>Invalid Old Password</font>");
                        	   }
                        	   else{
                        		   out.print("Your password updated successfully.");
                        	   }
                        		   
                           }
                        	   
                        %>
                        
                        
					</div>
				</div>

		</div>
	</div>

</main>




<%@ include file="footer.jsp"%>

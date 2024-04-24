<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ include file="homeheader.jsp"%>
    <%@page import="javax.sql.rowset.CachedRowSet"%>

   
    <%@page import="user.DBConnection"%>
	<%
      CachedRowSet rs=DBConnection.selectquery("select *from category");
     
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Start Page title Area -->
		<div class="page-title-area ptb-100">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-6 col-md-4">
						<div class="page-title-content">
							<h2>Sign up</h2>
							<h4><i>as an Expert</i></h4>							
					</div>
					</div>

					<div class="col-lg-6 col-md-8">
						<div class="page-title-list">
							<ul>
								<li>
									<a href="userhome.jsp">Home</a>
								</li>
								<li class="active">
									Register as Expert
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Page title Area -->

		<div class="sign-up-area ptb-100">
			<div class="container">
				<form class="user-form" action="OTPExpert" method="post">
					<div class="row">
						
						<div class="col-12">
							<div class="form-group">
								<label>Name</label>
								<input class="form-control" type="text" name="t1" required="required">
							</div>
						</div>
						
						<div class="col-12">
							<div class="form-group">
								<label>Phone Number</label>
								<input class="form-control" type="number" name="t2" required="required">
								<%
								  if(request.getParameter("eph")!=null)
								  {
									  %>
									  <span style="color:red">This Mobile Number Already Exist.</span>
									  <% 
								  }
								%>
								<%
						  if(request.getParameter("sph")!=null)
						  {
							  %>
							  <span style="color:red">Space Is Not Allowed.</span>
							  <% 
						  }
						%>
							<%
						  if(request.getParameter("ph")!=null)
						  {
							  %>
							  <span style="color:red">Mobile Number Must Be 10 Digit.</span>
							  <% 
						  }
						%>
								
								
							</div>
						</div>

						<div class="col-12">
							<div class="form-group">
								<label>Email</label>
								<input class="form-control" type="email" name="t3"required="required">
								
									<%
					  if(request.getParameter("x")!=null)
					  {
						  %>
						  <span style="color:red">This Email ID Already Exist.</span>
						  <% 
					  }
					%>
						<%
					  if(request.getParameter("u")!=null)
					  {
						  %>
						  <span style="color:red">This Email ID Already Register As An User.</span>
						  <% 
					  }
					%>
								
							</div>
							
						</div>
						
						<div class="col-12">
							<div class="form-group">
								<label>Password</label>
								<input class="form-control" type="password" name="t4" required="required">
								<%
						  if(request.getParameter("sp")!=null)
						  {
							  %>
							  <span style="color:red">Space Is Not Allowed.</span>
							  <% 
						  }
						%>
							<%
						  if(request.getParameter("p")!=null)
						  {
							  %>
							  <span style="color:red">Password Must Be 10 Digit.</span>
							  <% 
						  }
						%>
							</div>
						</div>
							
						<div class="col-12">
							<div class="form-group">
								<label>Qualification</label>
								<input class="form-control" type="text" name="t5" required="required">
							</div>
						</div>
						
						<div class="col-12">
							<div class="form-group">
								<label>Facebook Link</label>
								<input class="form-control" type="url" name="t6" required="required">
							</div>
						</div>
						
						<div class="col-12">
							<div class="form-group">
								<label>LinkedIn Link</label>
								<input class="form-control" type="url" name="t7" required="required">
							</div>
						</div>
						
						<div class="form-group">
									<label>Category</label>

									<select class="form-select form-control" aria-label="Default select example" name="t8">
										 <%
										    while(rs.next())
										    {
										  %>
										    <option value='<%= rs.getString(1) %>'><%= rs.getString(2) %></option>
										  <%
										    }
										  %>	
									</select>
								</div>
					
						

						<div class="col-12">
							<div class="login-action">
								<div class="form-check">
									<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" required="required">
									<label class="form-check-label" for="flexCheckDefault">
										I agree to the <a href="hometerm.jsp">Terms of Use</a> and <a href="homeprivacypolicy.jsp">Privacy Policy</a>
									</label>
								</div>
							</div>
						</div>

						<div class="col-12">
							<button class="default-btn" type="submit">
								Send Request
							</button>
						</div>

						<div class="col-12">
							<p class="create"> <a href="expertsignup.jsp">Forget password?</a></p>  
							<p class="create">Already on disilab?  <a href="userlogin.jsp">Log in</a></p> 
						
						</div>
					</div>
				</form>
			</div>
		</div>
</body>
</html>
<%@ include file="homefooter.jsp"%>
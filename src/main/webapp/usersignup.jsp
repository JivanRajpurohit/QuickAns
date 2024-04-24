<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="homeheader.jsp"%>

<!-- Start Page title Area -->
		<div class="page-title-area ptb-100">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-6 col-md-4">
						<div class="page-title-content">
							<h2>Sign up</h2>
						</div>
					</div>

					<div class="col-lg-6 col-md-8">
						<div class="page-title-list">
							<ul>
								<li>
									<a href="home.jsp">Home</a>
								</li>
								<li class="active">
									Sign up
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
				<!-- <form class="user-form" action="UserSignUp" method="post"> -->
				<form class="user-form" action="OTP" method="post"> 
					<div class="row">
						
						<div class="col-12">
							<div class="form-group">
								<label>User name</label>
								<input class="form-control" type="text" name="t1">
							</div>
						</div>
						<style>
						input::-webkit-outer-spin-button,
						input::-webkit-inner-spin-button {
						  -webkit-appearance: none;
						  margin: 0;
						}
						</style>
							<div class="col-12">
							<div class="form-group">
								<label>Phone Number</label>
								<input class="form-control" type="number" name="t2">
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
								<input class="form-control" type="email" name="t3" required>
								<%
								  if(request.getParameter("x")!=null)
								  {
									  %>
									  <span style="color:red">This Email ID Already Exist.</span>
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
									  <span style="color:red">Password Must Be 8 Digit.</span>
									  <% 
								  }
								%>
							</div>
						</div>

						

						<div class="col-12">
							<button class="default-btn" type="submit">
								Sign up
							</button>
						</div>

						<div class="col-12">
							<p class="create">Already on disilab?  <a href="userlogin.jsp">Log in</a></p> 
							<p class="create">Register As An Author?  <a href="expertsignup.jsp">Click Here</a></p>  
						</div>
						
					</div>
					
					
				</form>
				
			</div>
		</div>

<%@ include file="homefooter.jsp"%>
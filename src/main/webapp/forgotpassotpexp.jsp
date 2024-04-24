<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="homeheader.jsp"%>

<!-- Start Page title Area -->
		<div class="page-title-area ptb-100">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-6 col-md-4">
						<div class="page-title-content">
							<h2>Email Verification</h2>
						</div>
					</div>

					<div class="col-lg-6 col-md-8">
						<div class="page-title-list">
							<ul>
								<li>
									<a href="home.jsp">Home</a>
								</li>
								<li class="active">
									Email Verification
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
				<form class="user-form" action="ForgotPassOTPExp" method="post">
					<div class="row">
						
						
						
						<div class="col-12">
							<div class="form-group">
								<label>Enter OTP</label>
								<input class="form-control" type="text" name="t3" required>
									<%
								  if(request.getParameter("z")!=null)
								  {
									  %>
									  <span style="color:red">Please Enter Valid OTP.</span>
									  <% 
								  }
									%>
							</div>
						</div>

						
						
						<input type="hidden" name="otp" value=<%= session.getAttribute("uotp") %>> 
						
						

						<div class="col-12">
							<button class="default-btn" type="submit">
								Verify
							</button>
						</div>

						<div class="col-12">
							<p class="create">Resend OTP  <a href="OTP">Resend</a></p> 
							</div>
					</div>
				</form>
			</div>
		</div>

<%@ include file="homefooter.jsp"%>
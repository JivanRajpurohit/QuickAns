<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="homeheader.jsp"%>

<!-- Start Page title Area -->
		<div class="page-title-area ptb-100">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-6 col-md-4">
						<div class="page-title-content">
							<h2>Reset Password</h2>
						</div>
					</div>

					<div class="col-lg-6 col-md-8">
						<div class="page-title-list">
							<ul>
								<li>
									<a href="home.jsp">Home</a>
								</li>
								<li class="active">
									Reset Password
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
				<form class="user-form" action="ResetPassword" method="post"> 
					<div class="row">
						
						<input class="form-control" type="hidden" name="useremail" value=<%= session.getAttribute("useremail") %>>
						
						<div class="col-12">
							<div class="form-group">
								<label>New Password</label>
								<input class="form-control" type="password" name="t2">
							</div>
						</div>

						<div class="col-12">
							<div class="form-group">
								<label>Confirm Password</label>
								<input class="form-control" type="text" name="t3" required>
							
							</div>
							
						</div>

						
						

						<div class="col-12">
							<button class="default-btn" type="submit">
								Reset
							</button>
						</div>

								<%
                           if(request.getParameter("x")!=null)
                           {
                        	   out.print("<font color='red'>New Password & Confirm Password Doesn't Match</font>");
                         	  
                        		   
                           }
								
                        	   
                        %>
						
								<%
                           if(request.getParameter("p")!=null)
                           {
                        	   out.print("<font color='red'>Password Must Be 8 Digit.</font>");
                         	  
                        		   
                           }
								
                        	   
                        %>
						
						
								<%
                           if(request.getParameter("sp")!=null)
                           {
                        	   out.print("<font color='red'>Space Is Not Allowed</font>");
                         	  
                        		   
                           }
								
                        	   
                        %>
						
						
					</div>
					
					
				</form>
				
			</div>
		</div>

<%@ include file="homefooter.jsp"%>
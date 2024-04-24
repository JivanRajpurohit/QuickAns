<%@ include file="homeheader.jsp"%>

<body>

<!-- Start Page title Area -->
		<div class="page-title-area ptb-100">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-6 col-md-4">
						<div class="page-title-content">
							<h2>Login</h2>
						</div>
					</div>

					<div class="col-lg-6 col-md-8">
						<div class="page-title-list">
							<ul>
								<li>
									<a href="home.jsp">Home</a>
								</li>
								<li class="active">
									Login
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Page title Area -->

		<div class="login-area ptb-100">
			<div class="container">
					 <form action="CheckUserLogin" method="post" class="user-form">
					<div class="row">
						
		
						<div class="col-12">
						 <%
								  if(request.getParameter("p")!=null)
								  {
									  %>
									  <span style="color:red">Incorrect login credentials i.e. userHandle/email or password!.</span><br><br>
									  <% 
								  }
									%>
							<div class="form-group">
								<label>User name or email</label>
								<input class="form-control" type="email" name="t1" required="required">
							</div>
						</div>
		
						<div class="col-12">
							<div class="form-group">
								<label>Password</label>
								<input class="form-control" type="password" name="t2" required="required">
							</div>
						</div>
		
						<div class="col-12">
							<div class="login-action">
								<span class="forgot-login">
									<a href="forgotpassword.jsp">Forgot Password?</a>
								</span>
							</div>
						</div>
		
						<div class="col-12">
							<button class="default-btn" type="submit">
								Log In
							</button>
						</div>
		
						<div class="col-12">
							<p class="create">Don't have an account? <a href="usersignup.jsp">Sign Up</a></p>  
						</div>
					</div>
				</form>
			</div>
		</div>
		</body>
<%@ include file="homefooter.jsp"%>

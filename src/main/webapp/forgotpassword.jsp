<%@ include file="homeheader.jsp"%>

<body>

<!-- Start Page title Area -->
		<div class="page-title-area ptb-100">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-6 col-md-4">
						<div class="page-title-content">
							<h2>Login Help</h2>
						</div>
					</div>

					<div class="col-lg-6 col-md-8">
						<div class="page-title-list">
							<ul>
								<li>
									<a href="home.jsp">Home</a>
								</li>
								<li class="active">
									Login Help
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
					 <form action="ForgotPassword" method="post" class="user-form">
					<div class="row">
						
		
						<div class="col-12">
							<div class="form-group">
								<label>User Email</label>
								<input class="form-control" type="text" name="eid" placeholder="Enter Valid Email Address">
							
							<%
					  if(request.getParameter("x")!=null)
					  {
						  %>
						  <span style="color:red">Please Enter Valid Email Address.</span>
						  <% 
					  }
					%>
					</div>
						</div>
		
						
		<br><br><br><br>
		<br><br>
						<div class="col-12">
							<button class="default-btn" type="submit">
								Next
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

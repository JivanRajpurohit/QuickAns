<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- <form action="checkadminlogin" method="post"> -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
<meta name="author" content="AdminKit">
<meta name="keywords"
	content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="shortcut icon" href="fevicon.png" />

<link rel="canonical"
	href="https://demo-basic.adminkit.io/pages-sign-in.html" />

<!--<link rel="icon" href="fevicon.png" sizes="96x96" type="image/png">-->
<title>QuickAns</title>

<link href="css/app.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">
</head>

<body>
	<main class="d-flex w-100">
		<div class="container d-flex flex-column">
			<div class="row vh-100">
				<div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
					<div class="d-table-cell align-middle">

						<div class="text-center mt-4">
							<h1 class="h2">Welcome to the QuickAns</h1>
							<p class="lead">You are at the right place to gather
								information</p>
						</div>

						<div class="card">
							<div class="card-body">
								<div class="m-sm-4">
									<div class="text-center">
										<img src="fevicon.png" alt="QuickAns"
											class="img-fluid rounded-circle" width="132" height="132" />
									</div>
									<form action="../SignUpOTP" method="post" class="bounce">

										<div class="mb-3">
											<label class="form-label">Name</label> <input
												class="form-control form-control-lg" type="text" name="t1"
												placeholder="Enter your name" required="required"/>
										</div>

										<div class="mb-3">
											<label class="form-label">Email</label> <input
												class="form-control form-control-lg" type="email" name="t2"
												placeholder="Enter your email" required="required"/>
												<%
					  if(request.getParameter("x")!=null)
					  {
						  %>
						  <span style="color:red">This Email ID Already Exist.</span>
						  <% 
					  }
					%>
										</div>
										<div class="mb-3">
											<label class="form-label">Password</label> <input
												class="form-control form-control-lg" type="password"
												name="t3" placeholder="Enter your password" /> 
										<%
										  if(request.getParameter("s")!=null)
										  {
											  %>
											  <span style="color:red">Space Not Allowed In Password.</span>
											  <% 
										  }
										%>
										
										<%
										  if(request.getParameter("p")!=null)
										  {
											  %>
											  <span style="color:red">Password Length Must Be 8 Character.</span>
											  <% 
										  }
										%>
										
										</div>
										<div class="text-center mt-3">
											<!-- <a href="checkadminlogin" class="btn btn-lg btn-primary">Sign in</a> -->
											<button type="submit" class="form-control form-control-lg" style="background-color:#3b7ddd; color: white;">Sign Up</button>
										</div>
										<br>
								
										<p style="position: relative; text-align: right;">Already have an account?<a href="login.jsp">Sign In</a></p>
									
										</form>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</main>

	<script src="js/app.js"></script>

</body>

</html>
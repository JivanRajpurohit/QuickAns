<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<!-- <form action="checkadminlogin" method="post"> -->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
	<meta name="author" content="AdminKit">
	<meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

	<!--  <link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="shortcut icon" href="img/icons/icon-48x48.png" />

	<link rel="canonical" href="https://demo-basic.adminkit.io/pages-sign-in.html" />-->
	<link rel="icon" href="fevicon.png" sizes="96x96" type="image/png">
		<!-- Title -->
	
	
	<title>QuickAns</title>

	

	<link href="css/app.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
</head>

<body>
	<main class="d-flex w-100">
		<div class="container d-flex flex-column">
			<div class="row vh-100">
				<div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
					<div class="d-table-cell align-middle">
																		
						<div class="text-center mt-4">
							<h1 class="h2">Welcome back</h1>
							<p class="lead">
								Sign in to your account to continue
							</p>
						</div>

						<div class="card">
						 <%
								  if(request.getParameter("x")!=null)
								  {
									  %>
									  &nbsp;<span style="color:red; font-weight:bold;" >Incorrect login credentials i.e. userHandle/email or password!.</span><br><br>
									  <% 
								  }
									%>
							<div class="card-body">
								<div class="m-sm-4">
									<div class="text-center">
											<img src="fevicon.png" alt="QuickAns"
											class="img-fluid rounded-circle" width="132" height="132" />
									</div>
									<form action="../checkadminlogin" method="post" class="bounce">
              
									
									
										<div class="mb-3">
											<label class="form-label">Email</label>
											<input class="form-control form-control-lg" type="email" name="t1" placeholder="Enter your email" required="required"/>
										</div>
										<div class="mb-3">
											<label class="form-label">Password</label>
											<input class="form-control form-control-lg" type="password" name="t2" placeholder="Enter your password" required="required"/>
											<br><p style="position: relative; text-align: right;"><a href="forgotpassword.jsp">Forgot Password?</a></p>
									
										</div>
										<div>
											</div>
										<div class="text-center mt-3">
											<!-- <a href="checkadminlogin" class="btn btn-lg btn-primary">Sign in</a> -->
											 <button type="submit" class="form-control form-control-lg" style="background-color:#3b7ddd; color: white;">Sign In</button>
										</div>
										
										<br>
										<p style="position: relative; text-align: right;">Don't have an account?<a href="registration.jsp">Sign Up</a></p>
									
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
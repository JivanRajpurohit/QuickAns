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
							<h1 class="h2">Reset Your Password</h1>
							<p class="lead">
								
							</p>
						</div>

						<div class="card">
							<div class="card-body">
								<div class="m-sm-4">
									<div class="text-center">
										
									</div>
									<form action="../ResetPasswordAdmin" method="post" class="bounce">
              
									
									<input type="hidden" name="adminemail" value=<%=session.getAttribute("adminemail") %>>
										<div class="mb-3">
											<label class="form-label">New Password</label>
											<input class="form-control form-control-lg" type="password" name="t1" placeholder="Enter your New Password" />
										</div>
										<div class="mb-3">
											<label class="form-label">Confirm Password</label>
											<input class="form-control form-control-lg" type="text" name="t2" placeholder="Enter Confirm password" />
												<% if(request.getParameter("x")!=null)
					  {
						  %>
						  <span style="color:red">New Password & Confirm Password Doesn't Match</span>
						  <% 
					  }
					%>
											
										</div>
										
										<div class="text-center mt-3">
											<!-- <a href="checkadminlogin" class="btn btn-lg btn-primary">Sign in</a> -->
											 <button type="submit" class="btn btn-lg btn-primary">Reset</button>
										</div>
										
										
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
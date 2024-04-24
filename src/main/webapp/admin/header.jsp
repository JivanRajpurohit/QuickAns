<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
	<meta name="author" content="AdminKit">
	<meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

    <link rel="preconnect" href="https://fonts.gstatic.com">
	<!-- <link rel="shortcut icon" href="fevicon.png" />   -->

	<link rel="canonical" href="https://demo-basic.adminkit.io/ui-forms.html" /> 
	
	<link rel="icon" href="fevicon.png" sizes="96x96" type="image/png">
		<!-- Title -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css">
	
	
	<title>QuickAns</title>

	<link href="css/app.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<body>
	<div class="wrapper">
		<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="index.html">
          <span class="align-middle"></span>
          <a href="#">
								
									<img src="logo.png" alt="logo" style="position: absolute;top: -65px; left:20px;width: 170px; height: 200px;">
						
							</a>
        </a>

				<br>
				<ul class="sidebar-nav">
					<li class="sidebar-header" style="font-size: 15px;">
						Manage
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="home.jsp">
              <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Dashboard</span>
            </a>
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="profile.jsp">
              <i class="align-middle" data-feather="user"></i> <span class="align-middle">Profile</span>
            </a>
					</li>

					 <li class="sidebar-item">
						<a class="sidebar-link" href="request.jsp">
              <i class="align-middle" data-feather="check-square"></i> <span class="align-middle">Requset</span>
            </a>
					</li> 
					
					
					<li class="sidebar-item">
						<a class="sidebar-link" href="feedback.jsp">
              <i class="align-middle" data-feather="message-square"></i> <span class="align-middle">Feedback</span>
            </a>
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="spackage.jsp">
              <i class="align-middle" data-feather="dollar-sign"></i> <span class="align-middle">Subscription</span>
            </a>
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="qlificategory.jsp">
              <i class="align-middle" data-feather="grid"></i> <span class="align-middle">Category</span>
            </a>
					</li>
					
					<li class="sidebar-item">
						<a class="sidebar-link" href="reportquestion.jsp">
              <i class="bi-exclamation-triangle"></i> <span class="align-middle">Report</span>
            </a>
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="contact.jsp">
              <i class="align-middle" data-feather="user"></i> <span class="align-middle">Contact</span>
            </a>
					</li>
					
					

					<li class="sidebar-header"style="font-size: 15px;">
						Reports
					</li>

					

					
					
					<li class="sidebar-item">
						<a class="sidebar-link" href="user.jsp">
              <i class="align-middle" data-feather="users"></i> <span class="align-middle">User</span>
            </a>
					</li>
					
					<li class="sidebar-item">
						<a class="sidebar-link" href="expertuser.jsp">
              <i class="align-middle" data-feather="grid"></i> <span class="align-middle">Expert User</span>
            </a>
					</li>
					
					<li class="sidebar-item">
						<a class="sidebar-link" href="catque.jsp">
              <i class="align-middle" data-feather="user-check"></i> <span class="align-middle">Questions</span>
            </a>
					</li>
					
					
					<li class="sidebar-item">
						<a class="sidebar-link" href="payment.jsp">
              <i class="align-middle" data-feather="user-check"></i> <span class="align-middle">Payment</span>
            </a>
					</li>
					
					</ul>

				</div>
		</nav>

		<div class="main">
			<nav class="navbar navbar-expand navbar-light navbar-bg">
				<a class="sidebar-toggle js-sidebar-toggle">
          <i class="hamburger align-self-center"></i>
        </a>

				<div class="navbar-collapse collapse">
					<ul class="navbar-nav navbar-align">
						<li class="nav-item dropdown">
							<a class="nav-icon dropdown-toggle" href="#" id="alertsDropdown" data-bs-toggle="dropdown">
						</li>
						<li class="nav-item dropdown">
							<a class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#" data-bs-toggle="dropdown">
                <i class="align-middle" data-feather="settings"></i>
              </a>

							<a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-bs-toggle="dropdown">
                <img src="<%=session.getAttribute("photo") %>" class="avatar img-fluid rounded me-1" alt="Charles Hall" /> <span class="text-dark"><%= session.getAttribute("name").toString() %></span>
              </a>
							<div class="dropdown-menu dropdown-menu-end">
								<a class="dropdown-item" href="adminchangepassword.jsp"><i class="align-middle me-1" data-feather="settings"></i>Change Password</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="editprofile.jsp"><i class="align-middle me-1" data-feather="settings"></i>&nbsp;Edit Profile</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="login.jsp"><i class="bi-box-arrow-in-right" style="font-size: 20px;"></i> &nbsp; Log out</a>
							</div>
						</li>
					</ul>
				</div>
			</nav>
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
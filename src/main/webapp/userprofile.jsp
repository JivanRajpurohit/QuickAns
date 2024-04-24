<%@page import="user.DBConnection"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>

<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
</head>
<!-- Start Mail Content Area -->
  <%
      CachedRowSet rs=DBConnection.selectquery("select *from user where user_id='"+ session.getAttribute("user_id").toString() +"'");
      rs.next();
    %>
    <%@ include file="userheader.jsp"%>
		<div class="main-content-area ptb-100">
			<div class="container">
				<div class="row">
					<div class="col-lg-3">
						<div class="sidebar-menu-wrap">
							<div class="sidemenu-wrap d-flex justify-content-between align-items-center">
								<h3>Pify Sidebar Menu</h3>
								<button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
									<i class="ri-menu-line"></i>
								</button>
							</div>
							  
							<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
								<div class="offcanvas-header">
									<h5 class="offcanvas-title" id="offcanvasExampleLabel">Menu</h5>
									<button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
								</div>
								<div class="offcanvas-body">
							<div class="left-sidebar">
								<nav class="sidebar-nav" data-simplebar>
									<ul id="sidebar-menu" class="sidebar-menu">
										<li><a href="userhome.jsp" class="box-style"> <span
												class="menu-title"> <i class="ri-home-8-line"></i>
													Home
											</span>
										</a></li>
										<li><a href="#" class="has-arrow box-style"> <i
												class="ri-question-line"></i> <span class="menu-title">
													Questions </span>
										</a>
											<ul class="sidemenu-nav-second-level">
												<li><a href="useraskquestion.jsp"> <span
														class="menu-title">Ask questions</span>
												</a></li>
												<li><a href="userhome.jsp"> <span
														class="menu-title">Questions details</span>
												</a></li>
											</ul></li>


										<li><a href="unansweredforuser.jsp" class="box-style">
												<span class="menu-title"> <i
													class="ri-checkbox-circle-line"></i> Unanswered
											</span>
										</a></li>

										<li><a href="userfaq.jsp" class="box-style"> <span
												class="menu-title"> <i class="ri-hq-line"></i> FAQs
											</span>
										</a></li>
										<li><a href="categoryforuser.jsp" class="box-style"> <span
												class="menu-title"> <i class="ri-group-2-line"></i>
													Categories
											</span>
										</a></li>


										<li><a href="expertsdetailsforuser.jsp" class="box-style">
												<span class="menu-title"> <i
													class="ri-checkbox-circle-line"></i> Experts
											</span>
										</a></li>

										<li><a href="#" class="has-arrow box-style"> <i
												class="ri-user-line"></i> <span class="menu-title">
													User </span>
										</a>
											<ul class="sidemenu-nav-second-level">

												<li><a href="userprofile.jsp"> <span
														class="menu-title">User profile</span>
												</a></li>
												<li><a href="usereditprofile.jsp"> <span
														class="menu-title">Edit Profile</span>
												</a></li>
											</ul></li>
											
											<li><a href="userfeedback.jsp" class="box-style">
												<span class="menu-title"> <i
													class="ri-checkbox-circle-line"></i> FeedBack
											</span>
										</a></li>


									</ul>
								</nav>
							</div>
						</div>
					
								</div>
						</div>
					</div>

					<div class="col-lg-9">
						<div class="summary-area">
							<div class="profile-content d-flex justify-content-between align-items-center">
								<div class="profile-img">
									<img src="assets/images/user/profile-img.jpg" alt="Image">
									<img src="<%= rs.getString(8) %>" width="150" height="150" alt="Image">
									<h3><%= rs.getString(2)%></h3>
										<span><%= rs.getString(9) %></span>
										<p>Member since <%=rs.getString(6) %></p>
									
								</div>

								<div class="edit-btn">
									<a href="usereditprofile.jsp" class="default-btn">Edit profile</a>
								</div>
							</div>
							
							<br><br><br>
							<div class="col-lg-6 col-md-6">
							<div class="single-summary">
							<h3>
							<i class="bi bi-alexa"></i>							
															Bio
														</h3>
							
							<p><%=rs.getString(10) %></p>
							</div>
							</div>

							
											<div class="col-lg-6 col-md-6">
												<div class="single-summary">
													<h3>Credential & Highlights</h3>
													<span>
													<i class="bi-briefcase-fill"></i>
													&nbsp;
													<%= rs.getString(11) %>
																										
													</span>
													<br><br>
													<span>
													<i class="bi-book-half"></i>
													&nbsp;
													<%= rs.getString(12) %>
																										
													</span>
													<br><br>
													<span>
													<i class="bi-calendar-date-fill" ></i>
													&nbsp;
													<%= rs.getString(6) %>
																										
													</span>
												</div>
											</div>
											
													<div class="col-lg-6 col-md-6">
												<div class="single-summary">
													<h3>Contact Information</h3>
													<a href="https://mail.google.com/mail/u/1/?view=cm&fs=1&to=userid@gmail.com&tf=1">
													<span>
													<i class="bi-envelope-fill"></i>
													&nbsp;
													<%= rs.getString(4) %>
																										
													</span>
													</a>
												</div>
											</div>
											

										</div>
										
											
				
						
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Mail Content Area -->
<%@ include file="userfooter.jsp"%>
<%@page import="user.DBConnection"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>

<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
</head>
<!-- Start Mail Content Area -->
  <%
      CachedRowSet rs=DBConnection.selectquery("select *from expertuser where exp_id='"+ session.getAttribute("author_id").toString() +"'");
      rs.next();
    %>
    <%@ include file="expertheader.jsp"%>
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
											<li><a href="experthome.jsp" class="box-style"> <span
													class="menu-title"> <i class="ri-home-8-line"></i>
														Home
												</span>
											</a></li>
											<li ><a href="#"
												class="has-arrow box-style"> <i class="ri-question-line"></i>
													<span class="menu-title"> Questions </span>
											</a>
												<ul class="sidemenu-nav-second-level">
													<li><a href="experthome.jsp"> <span
															class="menu-title">Asked questions</span>
													</a></li>
													<li><a href="experthome.jsp"> <span
															class="menu-title">Questions details</span>
													</a></li>
												</ul></li>
											
											
											<li><a href="unansweredforexpert.jsp" class="box-style"> <span
													class="menu-title"> <i
														class="ri-checkbox-circle-line"></i> Unanswered
												</span>
											</a></li>
											
											<li><a href="expertfaq.jsp" class="box-style"> <span
													class="menu-title"> <i class="ri-hq-line"></i> FAQs
												</span>
											</a></li>
											<li><a href="categoryforexpert.jsp" class="box-style"> <span
													class="menu-title"> <i class="ri-group-2-line"></i>
														Categories
												</span>
											</a></li>
											

											<li><a href="expertprofile.jsp" class="box-style"> <span
													class="menu-title"> <i
														class="ri-checkbox-circle-line"></i> Experts
												</span>
											</a></li>
											
											<li><a href="expertfeedback.jsp" class="box-style"> <span
													class="menu-title"> <i
														class="ri-checkbox-circle-line"></i> Feedback
												</span>
											</a></li>										</ul>
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
									<img src="<%= rs.getString(12) %>" width="150" height="150" alt="Image">
									<h3><%= rs.getString(2)%></h3>
										<span><%= rs.getString(13) %></span>
										
								</div>

								<div class="edit-btn">
									<a href="experteditprofile.jsp" class="default-btn">Edit profile</a>
								</div>
							</div>
							
							<br><br><br>
							<div class="col-lg-6 col-md-6">
							<div class="single-summary">
							<h3>
							<i class="bi bi-alexa"></i>
															About
														</h3>
							
							<p><%=rs.getString(9) %></p>
							</div>
							</div>
							
							<div class="col-lg-6 col-md-6">
												<div class="single-summary">
													<h3>Credential & Highlights</h3>
													<span>
													<i class="bi-briefcase-fill"></i>
													&nbsp;
													<%= rs.getString(13) %>
																										
													</span>
													<br><br>
													<span>
													<i class="bi-book-half"></i>
													&nbsp;
													<%= rs.getString(14) %>
																										
													</span>
													<br><br>
													<span>
													<i class="bi-calendar-date-fill" ></i>
													&nbsp;
													<%= rs.getString(15) %>
																										
													</span>
												</div>
											</div>
											

							
											<div class="col-lg-6 col-md-6">
												<div class="single-summary">
													<h3>Social Media Links</h3>
													<span>
													<i class="bi-briefcase-fill"></i>
													&nbsp;
													<%= rs.getString(6) %>
																										
													</span>
													<br><br>
													<span>
													<i class="bi-book-half"></i>
													&nbsp;
													<%= rs.getString(7) %>
																										
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
<%@ include file="expertfooter.jsp"%>
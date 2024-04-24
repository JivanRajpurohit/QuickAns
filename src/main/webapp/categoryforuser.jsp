<%@page import="user.DBConnection"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
					CachedRowSet rs=null;					
					if(request.getParameter("Search")==null)
					{
						rs=DBConnection.selectquery("select *from category");
					}
					else
					{
						 rs = DBConnection.selectquery("select * from category where ct_name like '%"+request.getParameter("Search")+"%'");
						
					}
     
%>

     <%@ include file="userheader.jsp"%>
		
		
		<!-- Start Mail Content Area -->
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
						<div class="middull-content">
							<ul class="page-nish">
								<li>
									<a href="index.html">
										<i class="ri-home-8-line"></i>
										Home
									</a>
								</li>
								<li class="active">
									Category
								</li>
							</ul>
							
							<form class="aq-form" action="categoryforuser.jsp">
								<i class="ri-search-line"></i>
								<input type="text" class="form-control" name="Search" placeholder="Have a question? Ask or enter a search">
								
								<button class="aq-btn">
									Ask Question
								</button>
							</form>

							
							<div class="wew-user-area">
							
								<div class="row">
									<%
							while (rs.next()) {
							%>
									<div class="col-lg-6 col-sm-6">
								
										<div class="single-new-user">
											<div class="d-flex align-items-center">
												<div class="flex-shrink-0">
													
													
												</div>
												
												<div class="flex-grow-1 ms-3">
												  <h3>
													  <a href="groupforuser.jsp"><%= rs.getString(2)%></a>
												  </h3>
												 
												</div>
											</div>
											
											<ul class="d-flex justify-content-between align-items-center">
												<li style="position:relative; left:170px; top:9px;">
													<a href="categoryquestionforuser.jsp?x=<%= rs.getString(1) %>" class="default-btn">See Question</a>
												</li>
											</ul>
										</div>
								
												
						
									</div>

											<%
					}
					%>
								</div>
								
								
							</div>
						
					
						
						</div>
					</div>

					
				</div>
			</div>
		</div>
		<!-- End Mail Content Area -->
		
		
		
		
		
		
<%@ include file="userfooter.jsp"%>
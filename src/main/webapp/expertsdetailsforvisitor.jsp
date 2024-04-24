<%@page import="user.DBConnection"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ include file="homeheader.jsp"%>
		
		
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
											<li><a href="home.jsp" class="box-style"> <span
													class="menu-title"> <i class="ri-home-8-line"></i>
														Home
												</span>
											</a></li>
											<li ><a href="#"
												class="has-arrow box-style"> <i class="ri-question-line"></i>
													<span class="menu-title"> Questions </span>
											</a>
												<ul class="sidemenu-nav-second-level">
													<li><a href="userlogin.jsp"> <span
															class="menu-title">Asked questions</span>
													</a></li>
													<li><a href="home.jsp"> <span
															class="menu-title">Questions details</span>
													</a></li>
												</ul></li>
											
											
											<li><a href="unansweredforvisitor.jsp" class="box-style"> <span
													class="menu-title"> <i class="bi-x-circle"></i> Unanswered
												</span>
											</a></li>
											
											<li><a href="homefaq.jsp" class="box-style"> <span
													class="menu-title"> <i class="ri-hq-line"></i> FAQs
												</span>
											</a></li>
											<li><a href="categoryforvisitor.jsp" class="box-style"> <span
													class="menu-title"> <i class="ri-group-2-line"></i>
														Categories
												</span>
											</a></li>
											
											
											
											<li><a href="userlogin.jsp" class="box-style"> <span
													class="menu-title"> 
													<i class="bi-currency-dollar"></i>
													
														Subscription
												</span>
											</a></li>

											<li><a href="expertsdetailsforvisitor.jsp" class="box-style"> <span
													class="menu-title"> <i
														class="ri-checkbox-circle-line"></i> Experts
												</span>
											</a></li>										</ul>
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
									<a href="home.jsp">
										<i class="ri-home-8-line"></i>
										Home
									</a>
								</li>
								<li class="active">
									Experts
								</li>
							</ul>
							
							<form class="aq-form">
								<i class="ri-search-line"></i>
								<input type="text" class="form-control" placeholder="Search An Expert" name="Search">
								
								<button class="aq-btn">
									Search
								</button>
							</form>
							
							<%
							CachedRowSet rs=null;					
							if(request.getParameter("Search")==null)
							{
		 						 rs=DBConnection.selectquery("select *from expertuser");
		 					     
							}
							else
							{
								rs=DBConnection.selectquery("select *from expertuser where exp_name like '%"+request.getParameter("Search")+"%'");
								 
							}
		     
							%>
							
							<div class="wew-user-area">
							
								<div class="row">
									<%
							while (rs.next()) {
							%>
									<div class="col-lg-6 col-sm-6">
								
										<div class="single-new-user">
											<div class="d-flex align-items-center">
												<div class="flex-shrink-0">
													
													
													<%if(rs.getString(12).equals(""))
													{%>
														<img src="images/up.jpg" width="40" height="40" alt="Image">
													<%}
													else
													{ %>
														<img src="<%=rs.getString(12)%>" width="40" height="40" alt="Image">
														
													<%} %>
												</div>
												
												<div class="flex-grow-1 ms-3">
												  <h3>
													  <a href="user-profile.html"><%= rs.getString(2)%></a>
												  </h3>
												  <p><%= rs.getString(13)%></p>
												</div>
											</div>

											<ul class="d-flex justify-content-between align-items-center">
												<li>
													<p><span></span> </p>
												</li>
												<li>
													<a href="expertprofileforvisitor.jsp?x=<%= rs.getString(1) %>" class="default-btn">See Profile</a>
												
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

					<div class="col-lg-3">
						<div class="right-siderbar">
							<div class="right-siderbar-common">
								<a href="userlogin.jsp" class="default-btn">
									Ask a question
								</a>
							</div>

							</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Mail Content Area -->
		
		
		
		
		
		
<%@ include file="homefooter.jsp"%>
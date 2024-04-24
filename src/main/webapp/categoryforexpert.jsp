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

     <%@ include file="expertheader.jsp"%>
		
		
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
						<div class="middull-content">
							<ul class="page-nish">
								<li>
									<a href="experthome.jsp">
										<i class="ri-home-8-line"></i>
										Home
									</a>
								</li>
								<li class="active">
									Category
								</li>
							</ul>
							
							<form class="aq-form" action="categoryforexpert.jsp">
								<i class="ri-search-line"></i>
								<input type="text" class="form-control" name="Search" placeholder="Have a question? Ask or enter a search">
								
								<button class="aq-btn">
									Search
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
		
		
		
		
		
		
<%@ include file="expertfooter.jsp"%>
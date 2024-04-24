<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    <%@ include file="expertheader.jsp"%>
    <%@page import="user.DBConnection"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>

	
    
     <%
	CachedRowSet rs = DBConnection.selectquery("select *from question");
     rs.next();
	CachedRowSet rsu = DBConnection.selectquery("select *from user");
	CachedRowSet rse = DBConnection.selectquery("select *from category");
%>
		
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

	
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
											<li ><a href="#"
												class="has-arrow box-style"> <i class="ri-question-line"></i>
													<span class="menu-title"> Questions </span>
											</a>
												<ul class="sidemenu-nav-second-level">
													<li><a href="useraskquestion.jsp"> <span
															class="menu-title">Ask questions</span>
													</a></li>
													<li><a href="userhome.jsp"> <span
															class="menu-title">Questions details</span>
													</a></li>
												</ul></li>
											
											
											<li><a href="unansweredforuser.jsp" class="box-style"> <span
													class="menu-title"> <i
														class="ri-checkbox-circle-line"></i> Unanswered
												</span>
											</a></li>
											
											<li><a href="userfaq.jsp" class="box-style"> <span
													class="menu-title"> <i class="ri-hq-line"></i> FAQs
												</span>
											</a></li>
											<li><a href="userfaq.jsp" class="box-style"> <span
													class="menu-title"> <i class="ri-group-2-line"></i>
													 categories
												</span>
											</a></li>
											
											
											
											<li><a href="badges.html" class="box-style"> <span
													class="menu-title"> 
													<i class="bi-currency-dollar"></i>
													
														Subscription
												</span>
											</a></li>
											
											<li><a href="expertsdetailsforuser.jsp" class="box-style"> <span
													class="menu-title"> 
													<i
														class="ri-checkbox-circle-line"></i>
													
														Experts
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
												</ul>
												
												
												
												</li>
												
												
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
									<a href="home.jsp">
										<i class="ri-home-8-line"></i>
										Home
									</a>
								</li>
								
								<li class="active">
									Categorized Question
								</li>
							</ul>
							
							<form class="aq-form" action="categoryquestionforuser.jsp">
								<i class="ri-search-line"></i>
								<input type="text" class="form-control" name="Search" placeholder="Have a question? Ask or enter a search">
								<button class="aq-btn">
									Ask Question
								</button>
								
							</form>
							
						
							
							
			<%
					CachedRowSet rst=null;					
					if(request.getParameter("Search")==null)
					{
						rst = DBConnection.selectquery("select * from question q JOIN category c ON q.ct_id=c.ct_id JOIN user u ON q.user_id=u.user_id where q.ct_id='"+ request.getParameter("x") +"'");
					}
					else
					{
						rst = DBConnection.selectquery("select * from question q JOIN category c ON q.ct_id=c.ct_id JOIN user u ON q.user_id=u.user_id where q.ct_id='"+ request.getParameter("x") +"' and q.que like '%"+request.getParameter("Search")+"%'");
					}
     
%>
		
		
		
								
								
     
							<%
					while (rst.next()) {
					%>
					
							<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade show active" id="recent-questions" role="tabpanel" aria-labelledby="recent-questions-tab">
								<div class="single-qa-box like-dislike">
									<div class="d-flex">
										<div class="link-unlike flex-shrink-0">
											<a href="user.html">
												<img src=<%= rst.getString(18)%> width="30" height="30" alt="Image">
						
											</a>

										</div>

										<div class="flex-grow-1 ms-3">
											<ul class="graphic-design">
												
												<li>
												<a href="#"><%= rst.getString(12)%></a>
												</li>
												
												<li style="position:relative; left:700px; top:1px; font-size: 18px;">
												<span class="graphic-design">In:</span>
												<span style="color: #f48225;"class="graphic-design"> <%= rst.getString(9)%></span>
												
											</li>
											</ul>

											<h3>
											<a href="queations-details.html">
											 <%= rst.getString(2)%>
											</a>
										</h3>

											

											<div class="d-flex justify-content-between align-items-center">
												<ul class="anser-list">
													
													
															<%
															
															String c= rst.getString(1);
															CachedRowSet rsy = DBConnection.selectquery("select *from answer a,user u where a.user_id=u.user_id and q_id='"+c+"'");
															
															rsy.next();
															
															  %> 
														
														  
																				</ul>

												
											</div>
										</div>
									</div>
								</div>

								
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
		<!-- End Mail Content Area -->

<%@ include file="expertfooter.jsp"%>
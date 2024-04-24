<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    <%@ include file="userheader.jsp"%>
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
									<a href="home.jsp">
										<i class="ri-home-8-line"></i>
										Home
									</a>
								</li>
								
								<li class="active">
									UnAnswered Question
								</li>
							</ul>
							
							<form class="aq-form" action="unansweredforuser.jsp">
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
						rst = DBConnection.selectquery("select * from question q JOIN user u ON q.user_id=u.user_id JOIN category c ON q.ct_id=c.ct_id");
					}
					else
					{
						rst = DBConnection.selectquery("select * from question q JOIN user u ON q.user_id=u.user_id JOIN category c ON q.ct_id=c.ct_id where q.que like '%"+request.getParameter("Search")+"%'");
						
					}
     
%>
		
		
		
								
								
     
							<%
					while (rst.next()) {
					%>
					<%
															
						String d= rst.getString(1);
						//CachedRowSet rsy = DBConnection.selectquery("select * from answer where q_id='"+c+"'");
						CachedRowSet rscc = DBConnection.selectquery("select *from answer a,user u where a.user_id=u.user_id and q_id='"+d+"'");
															
															
						rscc.next();
						
						if(rscc.size()==0)
						 {%>
							<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade show active" id="recent-questions" role="tabpanel" aria-labelledby="recent-questions-tab">
								<div class="single-qa-box like-dislike">
									<div class="d-flex">
										<div class="link-unlike flex-shrink-0">
											
												<img src=<%= rst.getString(15)%> width="30" height="30" alt="Image">
						
										

										</div>

										<div class="flex-grow-1 ms-3">
											<ul class="graphic-design">
												
												<li>
												<p><%= rst.getString(9)%></p>
												</li>
												
												<li style="position:relative; left:700px; top:1px; font-size: 18px;">
												<span class="graphic-design">In:</span>
												<span style="color: #f48225;"class="graphic-design"> <%= rst.getString(21)%></span>
												
											</li>
											</ul>

											<h3>
											<p>
											 <%= rst.getString(2)%>
											</p>
										</h3>

											

											<div class="d-flex justify-content-between align-items-center">
												<ul class="anser-list">
													
													<li>
														<p>
															<%
														
														String c= rst.getString(1);
														//CachedRowSet rsy = DBConnection.selectquery("select * from answer where q_id='"+c+"'");
														CachedRowSet rsy = DBConnection.selectquery("select *from answer a,user u where a.user_id=u.user_id and q_id='"+c+"'");
														
														
														rsy.next();
														
														  %> 
														
														  
														 <%= rsy.size() %> Answers
														</p>
													</li>
													
													<li>
														
													</li>
												</ul>

													<% 
									
											if(rst.getString(6)==null )
												{
												}
											else
											{
												%>
												<a href=<%= rst.getString(6)%> style="position:relative; left:200px; top:1px;" class="default-btn">See Attachment</a>
												 <%
											}
											 %>
												<a href="userpostanswer.jsp?x=<%= rst.getString(1) %>" class="default-btn">Answer</a>
							
												
											</div>
										</div>
									</div>
								</div>

								
								</div>

								</div>
					
						
															
															  
				
					
						<%
						 }
					}
					%>
						</div>
					</div>

					
				</div>
			</div>
		</div>
		<!-- End Mail Content Area -->

<%@ include file="userfooter.jsp"%>
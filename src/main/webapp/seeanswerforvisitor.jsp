<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.DBConnection"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>

    <%@ include file="homeheader.jsp"%>
	<%
      CachedRowSet rsc=DBConnection.selectquery("select *from category");
	CachedRowSet rsq=DBConnection.selectquery("select *from question");
	rsq.next();
	CachedRowSet rsu=DBConnection.selectquery("select *from user");
     
    %>
    
    
    
   
		
	
	<!-- Start Mail Content Area -->
		<div class="main-content-area ptb-100">
			<div class="container">
				<div class="row">
					<div class="col-lg-3">
						<div class="sidebar-menu-wrap">
							<div class="sidemenu-wrap d-flex justify-content-between align-items-center">
								<h3>QuickAns Sidebar Menu</h3>
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
													class="menu-title"> <i
														class="ri-checkbox-circle-line"></i> Unanswered
												</span>
											</a></li>
											
											<li><a href="userfaq.jsp" class="box-style"> <span
													class="menu-title"> <i class="ri-hq-line"></i> FAQs
												</span>
											</a></li>
											<li><a href="groups.html" class="box-style"> <span
													class="menu-title"> <i class="ri-group-2-line"></i>
														Groups
												</span>
											</a></li>
											
											
											
											<li><a href="badges.html" class="box-style"> <span
													class="menu-title"> 
													<i class="bi-currency-dollar"></i>
													
														Subscription
												</span>
											</a></li>

											<li><a href="#" class="has-arrow box-style"> <i
													class="ri-user-line"></i> <span class="menu-title">
														User </span>
											</a>
												<ul class="sidemenu-nav-second-level">
													<li><a href="user.html"> <span class="menu-title">User</span>
													</a></li>
													<li><a href="userprofile.jsp"> <span
															class="menu-title">User profile</span>
													</a></li>
													<li><a href="useraskquestion.jsp"> <span
															class="menu-title">Ask a questions</span>
													</a></li>
												</ul></li>
										</ul>
									</nav>
								</div>
								</div>
							</div>
						</div>
					</div>

					 <%
	CachedRowSet rsd = DBConnection.selectquery("select * from question q JOIN user u ON q.user_id=u.user_id JOIN category c ON q.ct_id=c.ct_id where q_id='"+ request.getParameter("x").toString() +"'");
					 rsd.next();
	
%>
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
									Answer
								</li>
							</ul>
							<form class="your-answer-form" enctype = "multipart/form-data" action="PostAnswer" method="post">
								<div class="form-group">
									
								</div>
								
							<div class="row">
							<div class="single-summary">
							<h3>
							<i class="bi bi-alexa"></i>
																						
												<img src="<%= rsd.getString(15) %>" width="40" height="40" alt="Image">
									
												
												
												&nbsp;<a href="#"><%= rsd.getString(9) %></a>
												<span style="position:relative; left:700px; top:2px;"class="graphic-design">In : </span>
													<span style="color: #f48225; position:relative; left:700px; top:1px;"class="graphic-design"> <%= rsd.getString(21)%></span>
													</h3>
													<span style="font-size: 20px; color: #000000; font-weight: bold;" class="graphic-design"><%=rsd.getString(2)%></span>
							
														</div>
							
							</div>
								
								<div class="form-group">
								<input type="hidden" value='<%=rsd.getString(1)%>' name="qid">
								
									<!-- <textarea name="t2" class="form-control"></textarea> -->
								</div>
								
								
									
									
								
							</form>
							
							
							<div class="main-content-text">
									<h2>Answers : </h2>
									</div>
							<br>
							<%
							
							 CachedRowSet rsans= DBConnection.selectquery("select *from answer a,user u where a.user_id=u.user_id and q_id='"+ request.getParameter("x") +"'");
												%>
								
							
							<%
							 while(rsans.next())
							 {
							%>
							
							<%
												
												   CachedRowSet rsl=DBConnection.selectquery("select *From like_dislike where like_status='1'  and ans_id='"+ rsans.getString(1) +"'");
												   CachedRowSet rsdisl=DBConnection.selectquery("select *From like_dislike where like_status='0' and ans_id='"+ rsans.getString(1) +"'");
													%>
						<div class="single-qa-box like-dislike">
										<div class="d-flex">
											<div class="link-unlike flex-shrink-0">
												<a href="user.html">
													<img src=<%= rsans.getString(15)%>	 width="30" height="30" alt="Image">
							
												</a>

												<div class="donet-like-list">
													<button class="like-unlink-count like" style="color:gray">
														<i class="ri-thumb-up-fill"></i>
														<span><%= rsl.size() %></span>
													</button>
												</div>

												<div class="donet-like-list">
													<button class="like-unlink-count dislike" style="color:gray">
													<i class="ri-thumb-down-fill"></i>
														<span><%= rsdisl.size() %></span>
													</button>
												</div>
											</div>

											<div class="flex-grow-1 ms-3">
												<ul class="graphic-design">
													
													<li>
													
													<a href="#"><%= rsans.getString(9)%></a>
													</li>
													
													<li style="position:relative; left:700px; top:1px; font-size: 18px;">
													
													<p style="color: gray;font-size:15px;"class="graphic-design"><%= rsans.getString(3) %> </p>
													
												</li>
												</ul>

												<h3>
												<a href="#">
												<p>Answer : <%= rsans.getString(2)%></p>
												</a>
												
													<% 
										
												if(rsans.getString(7)==null )
													{
													}
												else
												{
													%>
													<a href=<%= rsans.getString(7)%> class="default-btn" style="position:relative; left:700px; top:1px;color:white;" >See Attachment</a>
													 <%
												}
												 %>
												 
												 
							
											</h3>
								
												
											
													
					

												<div class="d-flex justify-content-between align-items-center">
													<ul class="anser-list">
														
														
														<li>
															<ul class="qa-share">
																<li class="share-option">
																	<span>
																		<i class="ri-share-fill"></i>
																	</span>
																	
																	<ul class="social-icon">
																		<li>
																			<a href="https://www.facebook.com/" target="_blank">
																				<i class="ri-facebook-fill"></i>
																			</a>
																		</li>
																		<li>
																			<a href="https://www.twitter.com/" target="_blank">
																				<i class="ri-twitter-line"></i>
																			</a>
																		</li>
																		<li>
																			<a href="https://www.linkedin.com/" target="_blank">
																				<i class="ri-linkedin-fill"></i>
																			</a>
																		</li>
																		<li>
																			<a href="https://www.instagram.com/" target="_blank">
																				<i class="ri-instagram-line"></i>
																			</a>
																		</li>
																	</ul>
																</li>
															</ul>
														</li>
													</ul>
													
												
													
												</div>
											</div>
										</div>
									

									
									</div>

									
						
							
							
							<%
							 }
							%>
							
							
							
							<a href="userlogin.jsp" class="default-btn" style="position:relative; left:700px; top:30px;color:white;" >Post Your Answer</a>
													
							
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
									
					
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- End Mail Content Area -->
		
		

		
		
        
 
<%@ include file="homefooter.jsp"%>
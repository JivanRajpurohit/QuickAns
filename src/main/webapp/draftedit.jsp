<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.DBConnection"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>
<script src="ckeditor/ckeditor.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

    <%@ include file="expertheader.jsp"%>
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
															class="menu-title">Asked questions</span>
													</a></li>
													<li><a href="queations-details.html"> <span
															class="menu-title">Questions details</span>
													</a></li>
												</ul></li>
											
											
											<li><a href="unanswered.html" class="box-style"> <span
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
							
							 CachedRowSet rsd= DBConnection.selectquery("select * from draft d JOIN user u ON d.user_id=u.user_id JOIN category c ON d.ct_id=c.ct_id JOIN question q ON d.q_id=q.q_id where d.d_id='"+ request.getParameter("d") +"'");
					rsd.next();
					%>
					<div class="col-lg-9">
						<div class="middull-content">
						<ul class="page-nish">
								<li>
									<a href="userhome.jsp">
										<i class="ri-home-8-line"></i>
										Home
									</a>
								</li>
								
								<li class="active">
									Answer
								</li>
							</ul>
							<form class="your-answer-form" enctype = "multipart/form-data" action="PostAnswerExpert" method="post">
								<div class="form-group">
									
								</div>
								
							<div class="row">
							<div class="single-summary">
							<h3>
							<i class="bi bi-alexa"></i>
												<img src="<%= session.getAttribute("photo") %>" width="40" height="40" alt="Image">
									
												
												&nbsp;<a href="#"><%= session.getAttribute("author_name") %></a>
												<span style="position:relative; left:700px; top:1px;"class="graphic-design">In : </span>
													<span style="color: #f48225; position:relative; left:700px; top:1px;"class="graphic-design"> <%= rsd.getString(21) %></span>
													</h3>
														<span style="font-size: 20px; color: #000000; font-weight: bold;" class="graphic-design"><%= rsd.getString(24) %></span>
							</div>
							
							</div>
								
								<div class="form-group">
								
								<!-- <textarea name="t2" class="form-control"></textarea> -->
									
									
									<textarea class="form-control" name="t2"><%= rsd.getString(2) %></textarea>
														<script>
										                        CKEDITOR.replace('t2');
										                </script>
									
								<input type="hidden" value=<%=request.getParameter("x") %> name="qid">
								<input type="hidden" value='<%= session.getAttribute("author_id")%>' name="eid">
								<input type="hidden" value='<%=rsd.getString(11)%>' name="useremail">
								<input type="hidden" value='<%=rsd.getString(9)%>' name="username">
								<input type="hidden" value='<%=rsd.getString(8)%>' name="userid">
								<input type="hidden" value="draft" name="draft">
								<input type="hidden" value=<%= request.getParameter("d") %> name="draftid">
									
									
														
																				
								</div>
								
								<div class="form-group">
									<div class="file-upload-account-info">
										<label class="upload">
											<i class="ri-link"></i>Upload Photo
											<input type="file" name="file">
										</label>
									</div>
									</div>
									
									
								<div class="form-group">
									<button type="submit" class="default-btn">Post your answer</button>
									
								</div>
								<div class="form-group">
									<a href="draftedit2.jsp?d=<%= rsd.getString(1) %>&x=<%= rsd.getString(3) %>" class="default-btn">Update Draft</a>
									
								</div>
								
							</form>
							<br><br>
							
							<div class="main-content-text">
									<h2>Drafted Answers : </h2>
									</div>
							<br>
							<%
							
							 CachedRowSet rsdans= DBConnection.selectquery("select * from draft d JOIN user u ON d.user_id=u.user_id JOIN category c ON d.ct_id=c.ct_id JOIN question q ON d.q_id=q.q_id where d.q_id='"+ request.getParameter("x") +"'");
					%>
							
							
							<%
							 while(rsdans.next())
							 {
							%>
							
							
						<div class="single-qa-box like-dislike">
										<div class="d-flex">
											<div class="link-unlike flex-shrink-0">
												<a href="user.html">
													<img src="<%=rsdans.getString(15) %>"	 width="30" height="30" alt="Image">	
							
												</a>
												       
	                                                        
	                                          </div>

											<div class="flex-grow-1 ms-3">
												<ul class="graphic-design">
													
													<li>
													
													<a href="#"><%=rsdans.getString(9) %></a>
													</li>
													
													<li style="position:relative; left:700px; top:1px; font-size: 18px;">
													<span class="graphic-design">In:</span>
													<span style="color: #f48225;"class="graphic-design"> <%= rsdans.getString(21)%></span>
													
												</li>
												</ul>

												
												<p style="font-weight: bold; font-size: medium;">Question : <%=rsdans.getString(24)%></p>
													
												
													
												<p style="font-weight: bold; font-size: medium;"><%=rsdans.getString(2)%></p>
												
												
												
							
											
								
												
											
													
					

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
							
							
							
							
							
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
									
					
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- End Mail Content Area -->
		
		

		
		
        
 
<%@ include file="expertfooter.jsp"%>
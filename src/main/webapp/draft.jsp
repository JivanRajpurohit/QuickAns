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
	CachedRowSet rsd = DBConnection.selectquery("select * from question q JOIN user u ON q.user_id=u.user_id JOIN category c ON q.ct_id=c.ct_id where q_id='"+ request.getParameter("x").toString() +"'");
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
							<form class="your-answer-form" enctype = "multipart/form-data" action="Draft" method="post">
								<div class="form-group">
									
								</div>
								
							<div class="row">
							<div class="single-summary">
							<h3>
							<i class="bi bi-alexa"></i>
												<img src="<%=session.getAttribute("photo") %>" width="40" height="40" alt="Image">
									
												<input type="hidden" value='<%=rsd.getString(8)%>' name="userid">
												<input type="hidden" value='<%=rsd.getString(9)%>' name="username">
												<input type="hidden" value='<%=rsd.getString(3)%>' name="ctid">
												
												&nbsp;<a href="#"><%=session.getAttribute("author_name") %></a>
												<span style="position:relative; left:700px; top:1px;"class="graphic-design">In : </span>
													<span style="color: #f48225; position:relative; left:700px; top:1px;"class="graphic-design"> <%= rsd.getString(21)%></span>
													</h3>
														<span style="font-size: 20px; color: #000000; font-weight: bold;" class="graphic-design"><%=rsd.getString(2)%></span>
							</div>
							
							</div>
								
								<div class="form-group">
								
								<input type="hidden" value='<%=rsd.getString(1)%>' name="qid">
								<input type="hidden" value='<%= session.getAttribute("author_id")%>' name="eid">
								<input type="hidden" value='<%=rsd.getString(11)%>' name="useremail">
									<!-- <textarea name="t2" class="form-control"></textarea> -->
									<textarea name="t2" class="form-control" placeholder="Write Your Answer..." required="required"></textarea>	
									<script>
									
			                        CKEDITOR.replace('t2');
			                
									</script>							
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
									<button type="submit" class="default-btn">Post your answer As A Draft</button>
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
												
												
												
												<% 
												if(rsdans.getString(15).equals(""))
											{%>
													<img src="images/up.jpg" width="30" height="30" alt="Image">
											<%}
												else
												{
											%>
													<img src="<%=rsdans.getString(15) %>"	 width="30" height="30" alt="Image">	
							
											<%} %>
												
												
												
												       
	                                                        
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
													
												<p style="font-weight: bold; font-size: medium;">Drafted Answer: </p>
													
												<p style="font-weight: bold; font-size: medium;"><%=rsdans.getString(2)%></p>
												
												
												
							
											
								
												
											
													
					

												<div class="d-flex justify-content-between align-items-center">
													<ul class="anser-list">
														
														
														<li>
														</li>
													</ul>
													
													
													
													
													<ul class="tag-list">
												
												<li>
												<a href="draftedit.jsp?d=<%= rsdans.getString(1) %>&x=<%= rsd.getString(1) %>" class="default-btn">EDIT</a>
												</li>
												<li>
												<a href="DraftDelete?d=<%= rsdans.getString(1) %>&x=<%= rsd.getString(1) %>" class="default-btn">DELETE</a>
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
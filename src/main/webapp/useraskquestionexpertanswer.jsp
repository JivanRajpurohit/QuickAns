<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.DBConnection"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>

    <%@ include file="userheader.jsp"%>
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
														Groups
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
							<form class="your-answer-form" enctype = "multipart/form-data" action="PostAnswer" method="post">
								<div class="form-group">
									
								</div>
								
							<div class="row">
							<div class="single-summary">
							<h3>
							<i class="bi bi-alexa"></i>
												
											<%
											if (session.getAttribute("photo").equals("")) {
											%>
											
											<img src="images/up.jpg" width="40" height="40" alt="Image">
							
											<%
											}

											else {
											%>
											<img src="<%= session.getAttribute("photo").toString() %>" width="40" height="40" alt="Image">
											<%
											}
											%>
												
												&nbsp;<a href="#"><%= session.getAttribute("user_name") %></a>
												<span style="position:relative; left:700px; top:1px;"class="graphic-design">In : </span>
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
							<br><br>
							
							<div class="main-content-text">
									<h2>Answers : </h2>
									</div>
							<br>
							
							<%
							
							CachedRowSet rsans=DBConnection.selectquery("select * from question q JOIN answer a JOIN expertuser e where a.q_id='"+ request.getParameter("x") +"' and q.q_id='"+ request.getParameter("x") +"' and q.user_id='"+ session.getAttribute("user_id") +"' and q.exp_id='"+ request.getParameter("y") +"' and a.exp_id='"+ request.getParameter("y") +"' and e.exp_id='"+ request.getParameter("y") +"'");
							   
							%>
								
							
							<%
							 while(rsans.next())
							 {
							%>
							
							
						<div class="single-qa-box like-dislike">
										<div class="d-flex">
											<div class="link-unlike flex-shrink-0">
											<input type="hidden" name="eid" value=<%=request.getParameter("y")%>>
													
													<%
												if (rsans.getString(26).equals("")) {
												%>
												
												<img src="images/up.jpg" width="30" height="30" alt="Image">
								
												<%
												}
	
												else {
												%>
												<img src=<%= rsans.getString(26)%> width="30" height="30" alt="Image">
												<%
												}
												%>
												<%
												
												   CachedRowSet rslike=DBConnection.selectquery("select *From expertrating where ans_id='"+ rsans.getString(8) +"'");
												   CachedRowSet rsl=DBConnection.selectquery("select *From expertrating where ld_status='1'  and ans_id='"+ rsans.getString(8) +"'");
												   CachedRowSet rsdisl=DBConnection.selectquery("select *From expertrating where ld_status='0' and ans_id='"+ rsans.getString(8) +"'");
													
												   if(rslike.next())
												   {
												         
													    if(rslike.getString(2).equals("true"))
													    {
                                                        %>
                                                        
                                                        <div class="donet-like-list">
													<a href="ExpertRating?x=<%= rsans.getString(8) %>&eid=<%= request.getParameter("y") %>&y=1&z=<%= request.getParameter("x") %>&w=zzz&u=qwe" class="like-unlink-count like" title="GOOD">
														<i class="ri-thumb-up-fill" style="color:#f48225;"></i>
														<span><%= rsl.size() %></span>
													</a>
												</div>
												
                                                        

												<div class="donet-like-list">
													<a href="ExpertRating?x=<%= rsans.getString(8) %>&eid=<%= request.getParameter("y") %>&y=0&z=<%= request.getParameter("x") %>&w=zzz&u=update" class="like-unlink-count dislike" title="BAD">
													<i class="ri-thumb-down-fill"></i>
														<span><%= rsdisl.size() %></span>
													</a>
												</div>
                                                        
                                                        
                                                        <%
													    }
													    else
													    {
													    	%>
	                                                        
	                                                        <div class="donet-like-list">
														<a href="ExpertRating?x=<%= rsans.getString(8) %>&eid=<%= request.getParameter("y") %>&y=1&z=<%= request.getParameter("x") %>&w=zzz&u=update" class="like-unlink-count like" title="GOOD">
														<i class="ri-thumb-up-fill" ></i>
															<span><%= rsl.size() %></span>
														</a>
													</div>

													<div class="donet-like-list">
													<a href="ExpertRating?x=<%= rsans.getString(8) %>&eid=<%= request.getParameter("y") %>&y=0&z=<%= request.getParameter("x") %>&w=zzz&u=qwe" class="like-unlink-count dislike" title="BAD">
													<i class="ri-thumb-down-fill" style="color:#f48225;"></i>
														<span><%= rsdisl.size() %></span>
													</a>
												</div>
	                                                        
	                                                        
	                                                        <%
													    	
													    }
												   }
												   else
												   {
												%>

												<div class="donet-like-list">
													<a href="ExpertRating?x=<%= rsans.getString(8) %>&eid=<%= request.getParameter("y") %>&y=1&z=<%= request.getParameter("x") %>" class="like-unlink-count like" title="GOOD">
														<i class="ri-thumb-up-fill"></i>
														<span><%= rsl.size() %></span>
													</a>
												</div>

												<div class="donet-like-list">
													<a href="ExpertRating?x=<%= rsans.getString(8) %>&eid=<%= request.getParameter("y") %>&y=0&z=<%= request.getParameter("x") %>" class="like-unlink-count dislike" title="BAD">
													<i class="ri-thumb-down-fill"></i>
														<span><%= rsdisl.size() %></span>
													</a>
												</div>
												  <%
												   }
												   %>
											</div>

											<div class="flex-grow-1 ms-3">
												<ul class="graphic-design">
													
													<li>
													
													<p><%= rsans.getString(16)%></p>
													</li>
													
													<li style="position:relative; left:700px; top:1px; font-size: 18px;">
													
													<p style="color: gray;font-size:15px;"class="graphic-design"><%= rsans.getString(10) %> </p>
													
												</li>
												</ul>

												<h3>
												<span>Answer:</span>
												<p> <%= rsans.getString(9)%></p>
											
												<p>
													<% 
										
												if(rsans.getString(14)==null )
													{
													}
												else
												{
													%>
													<a href=<%= rsans.getString(14)%>  ><i class="bi-image" style="font-size: 20px;"></i>
													</a>
													 <%
												}
												 %>
												 </p>
							
											</h3>
								
												
											
													
					

												<div class="d-flex justify-content-between align-items-center">
													<ul class="anser-list">
														
														
														<li>
															
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
		
		

		
		
        
 
<%@ include file="userfooter.jsp"%>
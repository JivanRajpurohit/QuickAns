<%@page import="user.DBConnection"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<script src="ckeditor/ckeditor.js"></script>

<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css"></link>-->
<%
CachedRowSet rs=DBConnection.selectquery("select *from user where user_id='"+ session.getAttribute("user_id").toString() +"'");
rs.next();
%>
<%@ include file="userheader.jsp"%>
<div class="main-content-area ptb-100">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="sidebar-menu-wrap">
					<div
						class="sidemenu-wrap d-flex justify-content-between align-items-center">
						<h3>Pify Sidebar Menu</h3>
						<button class="btn btn-primary" type="button"
							data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample"
							aria-controls="offcanvasExample">
							<i class="ri-menu-line"></i>
						</button>
					</div>

					<div class="offcanvas offcanvas-start" tabindex="-1"
						id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
						<div class="offcanvas-header">
							<h5 class="offcanvas-title" id="offcanvasExampleLabel">Menu</h5>
							<button type="button" class="btn-close text-reset"
								data-bs-dismiss="offcanvas" aria-label="Close"></button>
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
				<div class="edit-profile-area">
					<div
						class="profile-content d-flex justify-content-between align-items-center">
						<div class="profile-img">
						<%if(rs.getString(8).equals(""))
						{%>
							<img src="images/up.jpg" width="90" height="90" alt="Image">
						<%}
						else
						{ %>
							<img src="<%=rs.getString(8)%>" width="90" height="90" alt="Image">
							
						<%} %>
						
							
								
							<h3><%=rs.getString(2)%></h3>

						</div>


					</div>

					<div class="profile-tabs">
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item" role="presentation">
								<button class="nav-link" id="edit-profile-tab"
									data-bs-toggle="tab" data-bs-target="#edit-profile"
									type="button" role="tab" aria-controls="edit-profile"
									aria-selected="true">Edit Profile</button>
							</li>
							<li class="nav-item" role="presentation">
										<button class="nav-link" id="email-settings-tab" data-bs-toggle="tab" data-bs-target="#email-settings" type="button" role="tab" aria-controls="email-settings" aria-selected="false">Saved Questions</button>
									</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link" id="change-password-tab"
									data-bs-toggle="tab" data-bs-target="#change-password"
									type="button" role="tab" aria-controls="change-password"
									aria-selected="false">Change Password</button>
							</li>


							<li class="nav-item" role="presentation">
								<button class="nav-link" id="delete-account-tab"
									data-bs-toggle="tab" data-bs-target="#delete-account"
									type="button" role="tab" aria-controls="delete-account"
									aria-selected="false">Delete Account</button>
							</li>


						</ul>

						<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade show active edit-profile"
								id="edit-profile" role="tabpanel"
								aria-labelledby="edit-profile-tab">
								<div class="public-information">
									<h3>Profile</h3>
									<form class="edeite-content" action="UpdateUserprofile"
										enctype="multipart/form-data" method="post">

										<div class="information d-flex align-items-center">
											
										
											<div class="file-upload-account-info">
												<label class="upload"> <i class="ri-link"></i> <input
													type="file" name="photo">
												</label> 
										
											</div>
										</div>

										<div class="form-group">
											<label>Display name</label> <input type="text"
												value='<%=rs.getString(2)%>' class="form-control"
												name="name" id="name">
										</div>

										<div class="form-group">
											<label>Phone</label> <input type="text"
												value="<%=rs.getString(3)%>" class="form-control"
												name="phone" id="location">
										</div>

										<div class="form-group">
											<label>Add profile credential</label>

											<%
											if (rs.getString(9) == null) {
											%>
											<input type="text" class="form-control" name="profile_crd"
												id="profile_crd" placeholder="Enter Profile Credential">
											<%
											}

											else {
											%>
											<input type="text" value="<%=rs.getString(9)%>"
												class="form-control" name="profile_crd" id="profile_crd"
												placeholder="Enter Profile Credential">
											<%
											}
											%>

										</div>

										<div class="form-group">
											<label>About:</label>
											<%
											if (rs.getString(10) == null) {
											%>
											<textarea class="form-control" name="bio" id="bio"
												placeholder="About Me"></textarea>
												<script>
									
						                        CKEDITOR.replace('bio');
						                
												</script>
											<%
											}

											else {
											%>
											<textarea class="form-control"
												 name="bio" id="bio"
												placeholder="About Me"><%=rs.getString(10)%></textarea>
												<script>
									
						                        CKEDITOR.replace('bio');
						                
												</script>
											<%
											}
											%>
										</div>

										<div class="form-group">
											<label>Add employment credential</label>

											<%
											if (rs.getString(11) == null) {
											%>
											<input type="text" class="form-control" name="emp_crd"
												id="emp_crd" placeholder="Enter Employment Credential">
											<%
											}

											else {
											%>
											<input type="text" value="<%=rs.getString(11)%>"
												class="form-control" name="emp_crd" id="emp_crd"
												placeholder="Enter Employment Credential">
											<%
											}
											%>

										</div>

										<div class="form-group">
											<label>Add education credential</label>
											<%
											if (rs.getString(12) == null) {
											%>
											<input type="text" class="form-control" name="edu_crd"
												id="edu_crd" placeholder="Enter Education Credential">
											<%
											}

											else {
											%>
											<input type="text" value="<%=rs.getString(12)%>"
												class="form-control" name="edu_crd" id="edu_crd"
												placeholder="Enter Education Credential">
											<%
											}
											%>

										</div>


										<div class="row">
											<div class="col-12">
												<div class="form-group mb-0">
													<button class="default-btn">Save change</button>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>


							<div class="tab-pane fade edit-profile" id="email-settings"
								role="tabpanel" aria-labelledby="email-settings-tab">
								<div class="public-information">
									<h3>Saved Questions</h3>
									<!-- <form class="edeite-content" action="UpdateUserprofile"
										enctype="multipart/form-data" method="post">   -->
									

					<%
					CachedRowSet rst = DBConnection.selectquery("select * from save_question s JOIN category c ON c.ct_id=s.ct_id JOIN question q ON s.q_id=q.q_id JOIN user u ON q.user_id=u.user_id where s.user_id='"+session.getAttribute("user_id")+"' ");
					
					%>
					<%
					while (rst.next()) 
					{
					%>
								
									<div class="single-qa-box like-dislike">
										<div class="d-flex">
											<div class="link-unlike flex-shrink-0">
												<a href="user.html"> <img src=<%=rst.getString(24)%>
													width="30" height="30" alt="Image">

												</a>

											</div>

											<div class="flex-grow-1 ms-3">
												<ul class="graphic-design">

													<li><a href="#"><%=rst.getString(18)%></a></li>

													<li
														style="position: relative; left: 700px; top: 1px; font-size: 18px;">
														<span class="graphic-design">In:</span> <span
														style="color: #f48225;" class="graphic-design"><%=rst.getString(8)%></span>

													</li>
												</ul>

												<h3>

													<p>
													
														<%=rst.getString(11)%>

													</p>



												</h3>






												<div
													class="d-flex justify-content-between align-items-center">
													<ul class="anser-list">

														<li><p> 
					<%
					 String c = rst.getString(4);
					 CachedRowSet rsy = DBConnection.selectquery("select *from answer a,user u where a.user_id=u.user_id and q_id='" + c + "'");
					
					 rsy.next();
 					%> 
 					<%=rsy.size()%> Answers

														</p></li>

														<li>
																</li>
														<li>
														
														<a href="SaveQuestion?x=<%=rst.getString(4) %>&y=<%=rst.getString(6)%>&z=save"> 
													<i class="bi-bookmarks-fill" style="font-size: 20px;"></i> </a>		
													
														 </li>
														
												</ul>
												
												
												
													
													<%
													if (rst.getString(15) == null) {
													} else {
													%>
													<a href=<%=rst.getString(15)%> style="position: relative; left: 200px; top: 1px;" class="default-btn">See Attachment</a>
													<%
													}
													%>



													<a href="userpostanswer.jsp?x=<%=rst.getString(4)%>" class="default-btn">Answer</a>


												</div>
											</div>
										</div>

									</div>

									<%
									}
									%>
								</form>	
								</div>
								
							</div>



							<div class="tab-pane fade edit-profile" id="change-password"
								role="tabpanel" aria-labelledby="change-password-tab">
								<div class="public-information">
									<h3>Change password</h3>

									<form method="post" action="UserChangePassword"
										class="edeite-content">
										<div class="form-group">
											<label>Current Password</label> <input type="password"
												class="form-control" name="t1" id="password">
										</div>

										<div class="form-group">
											<label>New Password</label> <input type="password"
												class="form-control" name="t2" id="new-password">
										</div>

										<div class="form-group">
											<label>New Password (again)</label> <input type="password"
												class="form-control" name="t3" id="new-password-again">
										</div>

										<div class="form-group mb-0">
											<button class="default-btn">Save change</button>
										</div>
									</form>
									<%
									if (request.getParameter("x") != null) {
										if (request.getParameter("x").equals("0")) {
											out.print("<font color='red'>Invalid Old Password</font>");
										} else {
											out.print("<font color='red'>Your password updated successfully.</font>");
										}

									}
									%>
									
									<%
		                           if(request.getParameter("ns")!=null)
		                           {
		                        	   out.print("<font color='red'>Old Password And Confirm Password Must be Same.</font>");
		                         	  
		                        		   
		                           }
										
		                        	   
		                        %>
										<%
		                           if(request.getParameter("p")!=null)
		                           {
		                        	   out.print("<font color='red'>Password Must Be 8 Digit.</font>");
		                         	  
		                        		   
		                           }
										
		                        	   
		                        %>
								
								
										<%
		                           if(request.getParameter("sp")!=null)
		                           {
		                        	   out.print("<font color='red'>Space Is Not Allowed</font>");
		                         	  
		                        		   
		                           }
										
		                        	   
		                        %>
                        
								</div>
							</div>



							<div class="tab-pane fade edit-profile" id="delete-account"
								role="tabpanel" aria-labelledby="delete-account-tab">
								<div class="public-information">
									<h3>Delete Account</h3>
									
									<form action="DeleteUserAccount" method="post">
									<ul class="delete-account">
										<li>
											<div class="form-check">
												<input class="form-check-input" type="checkbox"
													id="flexCheckDefault-9" required="required"> <label
													class="form-check-label" for="flexCheckDefault-9" >
													Delete your account? </label>
											</div>
										</li>
										<li><button class="default-btn">Delete </button></li>
									</ul>
									</form>
								</div>
							</div>
						</div>


					</div>

				</div>
			</div>
		</div>
	</div>
</div>
</div>

<%@ include file="userfooter.jsp"%>
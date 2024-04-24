<%@page import="user.DBConnection"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>
<script src="ckeditor/ckeditor.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
      CachedRowSet rs=DBConnection.selectquery("select *from expertuser e,category ct where e.ct_id=ct.ct_id and e.exp_id='"+ session.getAttribute("author_id").toString() +"'");
      rs.next();
      CachedRowSet rsc=DBConnection.selectquery("select *from category");
    %>
     <%@ include file="expertheader.jsp"%>
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
				CachedRowSet rst = DBConnection.selectquery("select * from question q JOIN user u ON q.user_id=u.user_id ;");
				%>
					<div class="col-lg-9">
						<div class="edit-profile-area">
							<div class="profile-content d-flex justify-content-between align-items-center">
								<div class="profile-img">
									<img src="<%= rs.getString(12) %>" width="150" height="150" alt="Image">
									<h3><%= rs.getString(2)%></h3>
									
								</div>

								
							</div>
							<br><br><br>
							<div class="profile-tabs">
								<ul class="nav nav-tabs" id="myTab" role="tablist">
									<li class="nav-item" role="presentation">
										<button class="nav-link" id="edit-profile-tab" data-bs-toggle="tab" data-bs-target="#edit-profile" type="button" role="tab" aria-controls="edit-profile" aria-selected="true">Edit Profile</button>
									</li>
									
									<li class="nav-item" role="presentation">
										<button class="nav-link" id="change-password-tab" data-bs-toggle="tab" data-bs-target="#change-password" type="button" role="tab" aria-controls="change-password" aria-selected="false">Change Password</button>
									</li>

									
									<li class="nav-item" role="presentation">
										<button class="nav-link" id="delete-account-tab" data-bs-toggle="tab" data-bs-target="#delete-account" type="button" role="tab" aria-controls="delete-account" aria-selected="false">Delete Account</button>
									</li>
									
									<li style="position:relative; left:250px; top:13px;" class="nav-item" role="presentation">
										<%
                           if(request.getParameter("x")!=null)
                           {
                        	   if(request.getParameter("x").equals("0"))
                        	   {
                        		  out.print("<font color='red'>Invalid Old Password</font>");
                        	   }
                        	   else{
                        		   out.print("<font color='red'>Your password updated successfully.</font>");
                        	   }
                        		   
                           }
                        	   
                        %>
									</li>
								</ul>
	
								<div class="tab-content" id="myTabContent">
									<div class="tab-pane fade show active edit-profile" id="edit-profile" role="tabpanel" aria-labelledby="edit-profile-tab">
										<div class="public-information">
											<h3>Profile</h3>
		<form class="edeite-content" action="UpdateExpertprofile" enctype = "multipart/form-data" method="post">
									
											<div class="information d-flex align-items-center">
												
												<div class="file-upload-account-info">
													<label class="upload">
														<i class="ri-link"></i>
														<input type="file" name="photo">
													</label>
													<span>Maximum file size: 10 MB.</span>
												</div>
											</div>

												<div class="form-group">
														<label>Display name</label>
														<input type="text" value='<%= rs.getString(2) %>' class="form-control" name="name" id="name">
													</div>

													<div class="form-group">
														<label>Phone</label>
														<input type="text" value="<%= rs.getString(3) %>" class="form-control" name="phone" id="location">
													</div>
													
												<div class="form-group">
														<label>Expert Qualification</label>
														<input type="text" value='<%= rs.getString(8)%>'class="form-control" name="qlfi" id="name">
													</div>
														
													<div class="form-group">
														<label>About</label>
														<%
														if(rs.getString(9)==null)
														{
														%>
														<textarea class="form-control" name="about" id="name" placeholder="About Me"></textarea>
														<script>
										                        CKEDITOR.replace('about');
										                </script>
														<% 
														} 
														
													
														else
														{
														%>
														<textarea class="form-control" name="about" id="name" placeholder="About Me"><%= rs.getString(9) %></textarea>
														<script>
										                        CKEDITOR.replace('about');
										                </script>
														<% 
														} 
														%>
													</div>
													
												<div class="form-group">
														<label>Category</label>
														<select class="form-control" name="ctid" id="name">
														 <%
														   while(rsc.next())
														   {
															   if(rsc.getString(1).equals(rs.getString(10)))
															   {
																   %>
																   <option selected value='<%= rsc.getString(2) %>'><%= rsc.getString(2) %></option>
																   <%
															   }
															   else
															   {
																   %>
																   <option value='<%= rsc.getString(2) %>'><%= rsc.getString(2) %></option>
																   <%
																   
															   }
														   }
														 %>
														</select>
													</div>

													
													
													<div class="form-group">
														<label>Employment</label>
														<%
														if(rs.getString(14)==null)
														{
														%>
														<input type="text"  class="form-control" name="emp_crd" id="emp_crd" placeholder="Enter Employment Credential">
														<% 
														} 
														
													
														else
														{
														%>
														<input type="text" value='<%= rs.getString(14) %>' class="form-control" name="emp_crd" id="emp_crd" placeholder="Enter Employment Credential">
														<% 
														} 
														%>
													</div>
													<div class="form-group">
													<label>Designation</label>
													<%
														if(rs.getString(13)==null)
														{
														%>
														<input type="text"  class="form-control" name="profile_crd" id="profile_crd" placeholder="Enter Profile Credential">
														<% 
														} 
														
													
														else
														{
														%>
														<input type="text" value='<%= rs.getString(13) %>' class="form-control" name="profile_crd" id="profile_crd" placeholder="Enter Profile Credential">
															
														<% 
														} 
														%>
													
													</div>
												
													
													<div class="form-group">
														<label>Education</label>
														<%
														if(rs.getString(15)==null)
														{
														%>
														<input type="text"  class="form-control" name="edu_crd" id="edu_crd" placeholder="Enter Education Credential">
														<% 
														} 
														
													
														else
														{
														%>
														<input type="text" value='<%= rs.getString(15) %>' class="form-control" name="edu_crd" id="edu_crd" placeholder="Enter Education Credential">
														
														<% 
														} 
														%>
														
													</div>
												
													
												<div class="form-group">
														<h3>Social Profiles</h3>
													</div>

															<div class="col-lg-6 col-mad-6">
															<div class="form-group">
																<label>YouTube link</label>
																<%
														if(rs.getString(6)==null)
														{
														%>
																<input type="text"  class="form-control" name="ytink" id="website-link" placeholder="YouTube link">
															<% 
														} 
														
													
														else
														{
														%>
														<input type="text" value='<%= rs.getString(6)%>' class="form-control" name="ytlink" id="website-link" placeholder="YouTube link">
															
														<% 
														} 
														%>
															</div>
														</div>
														<div class="col-lg-6 col-mad-6">
															<div class="form-group">
																<label>LinkdIn link</label>
																<%
														if(rs.getString(7)==null)
														{
														%>
																<input type="text" class="form-control" name="ldlink" id="facebook"placeholder="LinkedIn link">
														<% 
														} 
														
													
														else
														{
														%>
														<input type="text" value='<%= rs.getString(7)%>' class="form-control" name="ldlink" id="facebook">
														
														<% 
														} 
														%>
															</div>
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
	
									<div class="tab-pane fade edit-profile" id="change-password" role="tabpanel" aria-labelledby="change-password-tab">
										<div class="public-information">
											<h3>Change password</h3>

											<form method="post" action="ExpertChangePassword" class="edeite-content">
												<div class="form-group">
													<label>Current Password</label>
													<input type="password" class="form-control" name="t1" id="password">
												</div>

												<div class="form-group">
													<label>New Password</label>
													<input type="password" class="form-control" name="t2" id="new-password">
												</div>

												<div class="form-group">
													<label>New Password (again)</label>
													<input type="password" class="form-control" name="t3" id="new-password-again">
												</div>

												<div class="form-group mb-0">
													<button class="default-btn">Save change</button>
												</div>
											</form>
											<%
                           if(request.getParameter("x")!=null)
                           {
                        	   if(request.getParameter("x").equals("0"))
                        	   {
                        		  out.print("<font color='red'>Invalid Old Password</font>");
                        	   }
                        	   else{
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

																	

									<div class="tab-pane fade edit-profile" id="delete-account" role="tabpanel" aria-labelledby="delete-account-tab">
										<div class="public-information">
											<h3>Delete Account</h3>
											
											<form action="DeleteExpertAccount" method="post">
											<ul class="delete-account">
												<li>
													<div class="form-check">
														<input class="form-check-input" type="checkbox"  id="flexCheckDefault-9" required="required">
														<label class="form-check-label" for="flexCheckDefault-9">
															Delete your account?
														</label>
													</div>
												</li>
												<li>
													<button class="default-btn">
														Delete
													</button>
												</li>
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
		
<%@ include file="expertfooter.jsp"%>
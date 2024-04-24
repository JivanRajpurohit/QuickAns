<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.DBConnection"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>
<script src="ckeditor/ckeditor.js"></script>
 
    <%@ include file="userheader.jsp"%>
	<%
      CachedRowSet rs=DBConnection.selectquery("select *from category");
     
    %>
    
    <%
      
      CachedRowSet rst=DBConnection.selectquery("select *from question where exp_id='"+ request.getParameter("x") +"' and user_id='"+ session.getAttribute("user_id") +"' ORDER BY q_id DESC");
      
    	
    %>
		
		 <%
      
     // CachedRowSet rsta=DBConnection.selectquery("select *from answer where exp_id='"+ request.getParameter("x") +"' and user_id='"+ session.getAttribute("user_id") +"'");
		// select * from question q JOIN answer a where a.q_id=34 and q.q_id=34 and q.user_id='"+ session.getAttribute("user_id") +"' and q.exp_id='"+ request.getParameter("x") +"' and a.exp_id='"+ request.getParameter("x") +"';
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

					<div class="col-lg-9">
						<div class="middull-content">
							<form class="your-answer-form" enctype = "multipart/form-data" action="AskQuestionExpert" method="post">
									<ul class="page-nish">
								<li>
									<a href="userhome.jsp">
										<i class="ri-home-8-line"></i>
										Home
									</a>
								</li>
								
								<li class="active">
									Ask An Expert 
								</li>
							</ul>
							
							<%String eid=request.getParameter("x");
							CachedRowSet rse=DBConnection.selectquery("select *from expertuser where exp_id='"+eid +"' ");
						    rse.next();
							%>
								
								<div class="form-group">
								<input type="hidden" name="eid" value=<%= eid %>>
								<input type="hidden" name="exmail" value=<%= rse.getString(4) %>>
								<input type="hidden" name="exname" value=<%= rse.getString(2) %>>
																	
								<label>Category</label>
			
									<select class="form-select form-control" aria-label="Default select example" name="t1">
										 <%
										    while(rs.next())
										    {
										  %>
										    <option value='<%= rs.getString(1) %>'><%= rs.getString(2) %></option>
										  <%
										    }
										  %>	
									</select>
								</div>
								<div class="form-group">
									<label>Description</label>
									<!-- <textarea name="t2" class="form-control"></textarea> -->
									<textarea name="t2" class="form-control"></textarea>	
									<script>
									
			                        CKEDITOR.replace('t2');
			                
									</script>
									 <%
								  if(request.getParameter("ta")!=null)
								  {
									  %>
									  <span style="color:red">You Cannot Leave The Question Field Blank.</span>
									  <% 
								  }
									%>
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
									<button type="submit" class="default-btn">Post your Question</button>
									
								</div>
							</form>
							<br><br>
							
							<div class="main-content-text">
									<h2>Questions Asked By You</h2>
									</div>
							<br>
								
							<%
							while (rst.next()) {
							%>
							
							<div class="question-details-area">
								<div class="question-details-content like-dislike">
									<div class="d-flex">
										<div class="link-unlike flex-shrink-0">
											
												
											<%
											if (session.getAttribute("photo").equals("")) {
											%>
											
											<img src="images/up.jpg" width="30" height="30" alt="Image">
							
											<%
											}

											else {
											%>
											<img src="<%= session.getAttribute("photo").toString() %>" width="30" height="30" alt="Image">
											<%
											}
											%>

														</div>

										<div class="flex-grow-1 ms-3">
											<ul class="graphic-design">
												<li>
												<b style="font-size: 17px;"><%= session.getAttribute("user_name") %></b>
													
												</li>
												
												
											</ul>
											<input type="hidden" name="qi" value=<%=rst.getString(1)%>>
											<h3>
												<%=rst.getString(2)%>
												
								
											</h3>
								
												<ul class="tag-list">
												<li>
												
												
													<% 
										
												if(rst.getString(6)==null )
													{
													}
												else
												{
													%>
													<a href=<%= rst.getString(6)%> ><i class="bi-image" style="font-size: 20px;"></i></a>
													 <%
												}
												 %>
														</li>
												<li>
													<a href='useraskquestionexpertedit.jsp?x=<%= rst.getString(1) %> &y=<%= request.getParameter("x") %>' ><i class="bi-pencil-square"  style="font-size: 22px;" ></i></a>  
								
												</li>
												<li>
													<a href='DeleteUserExpertQuestion?x=<%= rst.getString(1) %>&y=<%= request.getParameter("x") %>' ><i class="bi-trash-fill" style="font-size: 22px;"></i></a>
								
												</li>
												<li>
													<a href='useraskquestionexpertanswer.jsp?x=<%= rst.getString(1) %>&y=<%= request.getParameter("x") %>' style="position: relative; top:-5
													px;" ><img alt="ans" src="photo/answer-icon.png" width=28px; height=28px;></a>
								
												</li>
											</ul>

										</div>
										
									</div>
								
								</div>
									
									</div>	
									
									<br>
								
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
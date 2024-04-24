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
      
      CachedRowSet rst=DBConnection.selectquery("select * from question q JOIN category c ON q.ct_id=c.ct_id where user_id='"+ session.getAttribute("user_id") +"' ORDER BY q_id DESC");
      
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
							<form class="your-answer-form" enctype = "multipart/form-data" action="AskQuestion" method="post">
									<ul class="page-nish">
								<li>
									<a href="userhome.jsp">
										<i class="ri-home-8-line"></i>
										Home
									</a>
								</li>
								
								<li class="active">
									Ask Question
								</li>
							</ul>
							
								
								<div class="form-group">
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
									<textarea name="t2" class="form-control" required></textarea>	
									<script>
					                        CKEDITOR.replace('t2');
					                </script>
					                <%
								  if(request.getParameter("ta")!=null)
								  {
									  %>
									  <span style="color:red">Please Enter Your Question.</span>
									  <% 
								  }
									%>
								</div>
								
								<div class="form-group">
									<div class="file-upload-account-info">
										<label class="upload">
											
											<input type="file" class="form-control" name="file">
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
											
												
										<%if(session.getAttribute("photo").equals(""))
										{%>
											<img src="images/up.jpg" width="30" height="30" alt="Image">
										<%}
										else
										{ %>
											<img src="<%= session.getAttribute("photo").toString() %>" width="30" height="30" alt="Image">
							
										<%} %>

														</div>

										<div class="flex-grow-1 ms-3">
											<ul class="graphic-design">
												<li>
												<b style="font-size: 17px;"><%= session.getAttribute("user_name") %></b>
													
												</li>
												
												<li style="position:relative; left:700px; top:1px; font-size: 18px;">
													<span class="graphic-design">In:</span>
													<span style="color: #f48225;"class="graphic-design"><%=rst.getString(9)%></span>
													
												</li>
												
												
											</ul>

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
													<a href='useraskquestionedit.jsp?x=<%= rst.getString(1) %>' ><i class="bi-pencil-square"  style="font-size: 22px;" ></i></a>  
								
												</li>
												
												<li>
													<a href='userpostanswer.jsp?x=<%= rst.getString(1) %>' ><img alt="ans" src="photo/answer-icon.png" width=28px; height=28px; ></a>  
								
												</li>
												
												<li>
													<a href='DeleteQuestion?x=<%= rst.getString(1) %>' ><i class="bi-trash-fill" style="font-size: 22px;"></i></a>
								
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
		
		<style>
		.button 
{
  
  font-size: 15px;
  text-align: center;
  color: white;
  background-color:#f48225;
  height:30px;
  width:90px;
  padding:10px;
}


.button:hover {background-color: black}


		</style>

		
        
 
<%@ include file="userfooter.jsp"%>
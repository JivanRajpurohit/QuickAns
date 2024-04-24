<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.DBConnection"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>
<script src="ckeditor/ckeditor.js"></script>
    <%@ include file="expertheader.jsp"%>
	<%
      CachedRowSet rsc=DBConnection.selectquery("select *from category");
	CachedRowSet rsq=DBConnection.selectquery("select *from question");
	rsq.next();
	CachedRowSet rsu=DBConnection.selectquery("select *from user");
     
    %>
    
  <script type="text/javascript">
  

    
    function checkdata()
    {
    	 var  flag=true;
        var t=document.f1.t2.value;
         if(t.trim()=="")
        	  {
        	  flag=false;
        	  document.getElementById("msg").innerHTML="Answer Field Must Be Fill..";
        	 }
         else
        	 {
         	  document.getElementById("msg").innerHTML="";
                	 
        	 }
    	 return flag;
    }
    
    
      </script>   
    
   
   
		
	
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
											<li><a href="experthome.jsp" class="box-style"> <span
													class="menu-title"> <i class="ri-home-8-line"></i>
														Home
												</span>
											</a></li>
											<li ><a href="#"
												class="has-arrow box-style"> <i class="ri-question-line"></i>
													<span class="menu-title"> Questions </span>
											</a>
												<ul class="sidemenu-nav-second-level">
													<li><a href="experthome.jsp"> <span
															class="menu-title">Asked questions</span>
													</a></li>
													<li><a href="experthome.jsp"> <span
															class="menu-title">Questions details</span>
													</a></li>
												</ul></li>
											
											
											<li><a href="unansweredforexpert.jsp" class="box-style"> <span
													class="menu-title"> <i
														class="ri-checkbox-circle-line"></i> Unanswered
												</span>
											</a></li>
											
											<li><a href="expertfaq.jsp" class="box-style"> <span
													class="menu-title"> <i class="ri-hq-line"></i> FAQs
												</span>
											</a></li>
											<li><a href="categoryforexpert.jsp" class="box-style"> <span
													class="menu-title"> <i class="ri-group-2-line"></i>
														Categories
												</span>
											</a></li>
											

											<li><a href="expertprofile.jsp" class="box-style"> <span
													class="menu-title"> <i
														class="ri-checkbox-circle-line"></i> Experts
												</span>
											</a></li>
											
											<li><a href="expertfeedback.jsp" class="box-style"> <span
													class="menu-title"> <i
														class="ri-checkbox-circle-line"></i> Feedback
												</span>
											</a></li>										</ul>
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
									<a href="experthome.jsp">
										<i class="ri-home-8-line"></i>
										Home
									</a>
								</li>
								
								<li class="active">
									Answer
								</li>
							</ul>
							<form onSubmit="return checkdata()" name="f1" class="your-answer-form" enctype = "multipart/form-data" action="PostAnswerExpert" method="post">
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
											
												<input type="hidden" value='<%=rsd.getString(8)%>' name="userid">
												<input type="hidden" value='<%=rsd.getString(9)%>' name="username">
												<input type="hidden" value="qqq" name="draft">
												
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
									<textarea name="t2" class="form-control" placeholder="Write Your Answer..." id="test"></textarea>	
						             <span id="msg" style="color:red"></span>
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
									
									
								<div class="form-group" id="run">
									<button type="submit" class="default-btn" >Post your answer</button>
								</div>
							</form>
							<br><br>
							
							<div class="main-content-text">
									<h2>Answers : </h2>
									</div>
							<br>
							<%
							
							 CachedRowSet rsans= DBConnection.selectquery("select *from answer a,expertuser e where a.exp_id=e.exp_id and q_id='"+ request.getParameter("x") +"'");
							%>
								
							
							<%
							 while(rsans.next())
							 {
							%>
							
							
						<div class="single-qa-box like-dislike">
										<div class="d-flex">
											<div class="link-unlike flex-shrink-0">
												
													
													<%
													if (rsans.getString(19).equals("")) {
													%>
													
													<img src="images/up.jpg" width="30" height="30" alt="Image">
													<%
													}
		
													else {
													%>
													<img src=<%= rsans.getString(19)%>	 width="30" height="30" alt="Image">
													<%
													}
													%>
												
												<%
												
												   CachedRowSet rslike=DBConnection.selectquery("select *From expertrating where exp_id='"+ session.getAttribute("author_id") +"' and ans_id='"+ rsans.getString(1) +"'");
												   CachedRowSet rsl=DBConnection.selectquery("select *From expertrating where ld_status='1'  and ans_id='"+ rsans.getString(1) +"'");
												   CachedRowSet rsdisl=DBConnection.selectquery("select *From expertrating where ld_status='0' and ans_id='"+ rsans.getString(1) +"'");
													
												   if(rslike.next())
												   {
												         
													    if(rslike.getString(2).equals("true"))
													    {
                                                        %>
                                                        
                                                        <div class="donet-like-list">
													<a href="" class="like-unlink-count like">
														<i class="ri-thumb-up-fill" style="color:#f48225;"></i>
														<p style="font-size: 12px">GOOD</p>
													</a>
												</div>
												
                                                        

												<div class="donet-like-list">
													<a href="" class="like-unlink-count dislike">
													<i class="ri-thumb-down-fill"></i>
														<p style="font-size: 12px">BAD</p>
													</a>
												</div>
                                                        
                                                        
                                                        <%
													    }
													    else
													    {
													    	%>
	                                                        
	                                                        <div class="donet-like-list">
														<a href="" class="like-unlink-count like">
														<i class="ri-thumb-up-fill" ></i>
															<p style="font-size: 12px">GOOD</p>
														</a>
													</div>

													<div class="donet-like-list">
													<a href="" class="like-unlink-count dislike">
													<i class="ri-thumb-down-fill" style="color:#f48225;"></i>
														<p style="font-size: 12px">BAD</p>
													</a>
												</div>
	                                                        
	                                                        
	                                                        <%
													    	
													    }
												   }
												   else
												   {
												%>

												<div class="donet-like-list">
													<a href="" class="like-unlink-count like">
														<i class="ri-thumb-up-fill"></i>
														<p style="font-size: 12px">GOOD</p>
													</a>
												</div>

												<div class="donet-like-list">
													<a href="" class="like-unlink-count dislike">
													<i class="ri-thumb-down-fill"></i>
														<p style="font-size: 12px">BAD</p>
													</a>
												</div>
												  <%
												   }
												   %>
											</div>
											
											<div class="flex-grow-1 ms-3">
												<ul class="graphic-design">
													
													<li>
													
													<p><%= rsans.getString(9)%></p>
													</li>
													
													<li style="position:relative; left:700px; top:1px; font-size: 18px;">
													
													<p style="color: gray;font-size:15px;"class="graphic-design"><%= rsans.getString(3) %> </p>
													
												</li>
												</ul>

												<h3>
												
												<p><%= rsans.getString(2)%></p>
												
												<p>
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
		
		

		
		
        
 
<%@ include file="expertfooter.jsp"%>
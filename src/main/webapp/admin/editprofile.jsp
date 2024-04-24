<%@ include file="header.jsp"%>
<%@page import="quickans.DBConnection"%>
<%@ page import="javax.sql.rowset.*"%>

<%
CachedRowSet rs=DBConnection.selectquery("select *from admin where aid='"+ session.getAttribute("aid") +"' ");
rs.next();
%>
<main class="content">
				<div class="container-fluid p-0">

					<div class="mb-3">
						<h1 class="h3 d-inline align-middle">Profile</h1>
					</div>
					
					<div class="row">
						<div class="col-md-6 col-xl-12">
						<form method="post" action="../EditProfile"  enctype = "multipart/form-data" method="post">
								
							<div class="card mb-3">
								<div class="card-header">
									<h5 class="card-title mb-0">Profile Details</h5>
								</div>
								<div class="card-body text-center">
								
									
									
														<%
														if(rs.getString(8)==null)
														{
														%>
																<img src="upp.png" alt=""  class="img-fluid rounded-circle mb-2" width="128" height="128" />
										
														<% 
														} 
														
													
														else
														{
														%>
																<img src="<%=rs.getString(8) %>" alt=" " class="img-fluid rounded-circle mb-2" width="128" height="128" />
											
														<% 
														} 
														%>
									
									<h5 class="card-title mb-0"><%=rs.getString(2) %></h5>
									
									
														<%
														if(rs.getString(6)==null)
														{
														%>
																<div class="text-muted mb-2"></div><br>
														<% 
														} 
														
													
														else
														{
														%>
																<div class="text-muted mb-2"><%=rs.getString(6) %></div><br>
														<% 
														} 
														%>
									
									
									
										
									<input type="file" class="form-control"
								placeholder="photo" name="t2" value=<%=rs.getString(8) %>> <br>
									
								</div>
								<input type="hidden" name="id" value=<%= session.getAttribute("aid") %>>
								<hr class="my-0" />
								<div class="card-body">
									<h5 class="h6 card-title">Name</h5><br>
									<input type="text" class="form-control" placeholder="Enter Your Name" name="name" value=<%=rs.getString(2) %>> <br>
								</div>
								
								<hr class="my-0" />
								<div class="card-body">
									<h5 class="h6 card-title">Skills</h5><br>
									<%
														if(rs.getString(5)==null)
														{
														%>
																<input type="text" class="form-control" placeholder="Enter Your Skills" name="skill" > <br>
																	
														<% 
														} 
														
													
														else
														{
														%>
																<input type="text" class="form-control" placeholder="Enter Your Skills" name="skill" value=<%=rs.getString(5) %>> <br>
																		
														<% 
														} 
														%>
								</div>
								
								<hr class="my-0" />
								<div class="card-body">
									<h5 class="h6 card-title">About</h5><br>
									
									<%
														if(rs.getString(6)==null)
														{
														%>
																<input type="text" class="form-control" placeholder="Enter Your Work" name="work" > <br>									
														<% 
														} 
														
													
														else
														{
														%>
																<input type="text" class="form-control" placeholder="Enter Your Work" name="work" value=<%=rs.getString(6) %>> <br>									
														<% 
														} 
														%>
									
									
									
									<%
														if(rs.getString(7)==null)
														{
														%>
																<input type="text" class="form-control" placeholder="Enter Your City" name="city" > <br>									
														<% 
														} 
														
													
														else
														{
														%>
																<input type="text" class="form-control" placeholder="Enter Your City" name="city" value=<%=rs.getString(7) %>> <br>									
														<% 
														} 
														%>
									<br><br>
								<div>
								<button class="btn btn-primary btn-sm" >SAVE</button>	
										</div>
								</div>
								
								
								
							</div>
							</form>
						</div>

						
					</div>

				</div>
			</main>


<%@ include file="footer.jsp"%>
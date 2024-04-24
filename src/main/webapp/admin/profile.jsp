<%@ include file="header.jsp"%>
<%@page import="quickans.DBConnection"%>
<%@ page import="javax.sql.rowset.*"%>


				<%
				CachedRowSet rs = DBConnection.selectquery("select *from admin where aid='"+session.getAttribute("aid")+"'");
				rs.next();
				%>

<main class="content">
				<div class="container-fluid p-0">

					<div class="mb-3">
						<h1 class="h3 d-inline align-middle">Profile</h1>
					</div>
					
					<div class="row">
						<div class="col-md-6 col-xl-12">
						<form method="post" action=""  enctype = "multipart/form-data">
								
							<div class="card mb-3">
								<div class="card-header">
									<h5 class="card-title mb-0">Profile Details</h5>
								</div>
								<div class="card-body text-center">
								
									
									<img src="<%= rs.getString(8) %>" alt="" type="file" class="img-fluid rounded-circle mb-2" width="128" height="128" />
									
									
									<h5 class="card-title mb-0"><%= rs.getString(2) %></h5>
									<div class="text-muted mb-2"><%= rs.getString(6) %></div>
										
									
									
								</div>
								<hr class="my-0" />
								<div class="card-body">
									<h5 class="h6 card-title">Skills</h5><br>
									<%= rs.getString(5) %><br>
								</div>
								
								<hr class="my-0" />
								<div class="card-body">
									<h5 class="h6 card-title">About</h5><br>
									
									<ul class="list-unstyled mb-0">
										<li class="mb-1"><span data-feather="briefcase" class="feather-sm me-1"></span>Work At <a href="#"><%= rs.getString(6) %></a></li>
										<li class="mb-1"><span data-feather="map-pin" class="feather-sm me-1"></span> From <a href="#"><%= rs.getString(7) %></a></li>
									</ul>
									
									<br><br>
								
								</div>
								
								
								
							</div>
							</form>
						</div>

						
					</div>

				</div>
			</main>


<%@ include file="footer.jsp"%>
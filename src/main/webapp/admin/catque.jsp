<%@ include file="header.jsp"%>
<%@page import="quickans.DBConnection"%>
<%@ page import="javax.sql.rowset.*"%>

<style>
tr:hover {background-color:#9494ff;}
</style>
<%
CachedRowSet rsc = DBConnection.selectquery("select *from category");
%>


<main class="content">
	<div class="container-fluid p-0">

		<div class="mb-3">
			<h1 class="h3 d-inline align-middle">Questions Reports</h1>
		</div>
		<div class="row">
			<div class="col-12 col-lg-12">
				<div class="card">
					<div class="card-header">
						<h5 class="card-title mb-0">Select Category</h5>
					</div>
					<div class="card-body">
						<form method="get" action="">

							<select class="form-control"
								placeholder="Category Name" name="t1">
			                    <%
			                     while(rsc.next())
			                     {
			                    	 %>
			                    	 <option value='<%=rsc.getString(1) %>'><%=rsc.getString(2) %></option>
			                    	 <%
			                     }
			                    %>					
								</select>
								 <br>
							<button type="submit" class="btn btn-primary me-2">Submit</button>
							<button class="btn btn-light">Cancel</button>
						</form>
						<br>

					</div>
				</div>


			</div>


		</div>
	</div>
	
	<%
 CachedRowSet rst = DBConnection.selectquery("select * from question q JOIN category c ON q.ct_id=c.ct_id JOIN user u ON q.user_id=u.user_id where q.ct_id='"+ request.getParameter("t1") +"'");
     
     
%>
<%
  if(request.getParameter("t1")!=null)
  {
%>


			<%
					while (rst.next()) {
					%>			
	<div class="card">
		
		<div class="card-body">
			
			<ul style="list-style-type: none;">
												
				<li>
				<img src="../<%= rst.getString(18)%>" width="30" height="30" alt="Image">&nbsp;&nbsp;&nbsp;<a href="#" style="font-size: 15px;"><%= rst.getString(12)%></a>
				</li>
													
				<li style="position:relative; left:850px; top:-30px; font-size: 15px;">
				<span class="graphic-design">In:</span>
				<span style="color: #f48225;"class="graphic-design"> <%= rst.getString(9)%></span>
													
				</li>
			</ul>
			
			<p style="position:relative; left:30px; top:-20px; font-size: 15px; font-weight: bolder;"><%= rst.getString(2)%></p>
				<% 
										
												if(rst.getString(6)==null )
													{
													}
												else
												{
													%>
													
													<a href="../<%= rst.getString(6)%>" style="position:relative; left:25px; top:1px; font-size: 20px;" ><i class="bi-image"></i></a>
													 <%
												}
												 %>
		</div>
	</div>
	<%
					}}
					%>
</main>




<%@ include file="footer.jsp"%>










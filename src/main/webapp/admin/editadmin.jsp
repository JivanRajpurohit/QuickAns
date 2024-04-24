<%@ include file="header.jsp"%>
<%@page import="quickans.DBConnection"%>
<%@ page import="javax.sql.rowset.*"%>

<%
String id = request.getParameter("x");
CachedRowSet rsc = DBConnection.selectquery("select * from admin where aid='" + id + "'");
rsc.next();
%>
<style>
tr:hover {background-color:#9494ff;}
</style>
<main class="content">
	<div class="container-fluid p-0">

		<div class="mb-3">
			<h1 class="h3 d-inline align-middle">Admin Forms</h1>
		</div>
		<div class="row">
			<div class="col-12 col-lg-12">
				<div class="card">
					<div class="card-header">
						<h5 class="card-title mb-0">Admin</h5>
					</div>
					<div class="card-body">
						<form method="post" action="../UpdateAdmin">
							<input type="hidden" value='<%=rsc.getString(1)%>' name="id">

							<dt>Admin Name :</dt>
							<input type="text" class="form-control"
								placeholder="Name" name="t1"
								value='<%=rsc.getString(2)%>'><br>
							<dt>Admin EmailId :</dt>
							<input type="text" class="form-control"
								placeholder="EmailId" name="t2"
								value='<%=rsc.getString(3)%>'><br>
							<dt>Admin Password :</dt>
							<input type="text" class="form-control"
								placeholder="Password" name="t3"
								value='<%=rsc.getString(4)%>'><br> <br>
							<button type="submit" class="btn btn-primary me-2">Update</button>
							<button class="btn btn-light">Cancel</button>
						</form>
						<br>

					</div>
				</div>


			</div>


		</div>
	</div>
	<div class="card">
		<div class="card-header">
			<h5 class="card-title mb-0">Admin</h5>
		</div>
		<div class="card-body">
			<table class="col-12 col-lg-12">
				<tr>
					<th style="border: solid 1px grey; padding: 10px;">Admin ID</th>
					<th style="border: solid 1px grey; padding: 10px;">Admin Name</th>
					<th style="border: solid 1px grey; padding: 10px;">EmailId</th>
					<th style="border: solid 1px grey; padding: 10px;">Password</th>
					<th style="border: solid 1px grey; padding: 10px;">Edit</th>
					<th style="border: solid 1px grey; padding: 10px;">Delete</th>

				</tr>

				<%
				CachedRowSet rs = DBConnection.selectquery("select *from admin");
				%>

				<tbody>

					<%
					while (rs.next()) {
					%>
					<tr>
						<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(1)%></td>
						<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(2)%></td>
						<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(3)%></td>
						<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(4)%></td>


						<td style="border: solid 1px grey; padding: 10px;"><a
							href='editadmin.jsp?x=<%=rs.getString(1)%>'>Edit</a></td>
						<td style="border: solid 1px grey; padding: 10px;"><a
							href='DeleteAdmin?x=<%=rs.getString(1)%>'>Delete</a></td>
					</tr>
					<%
					}
					%>
				</tbody>

			</table>
		</div>
	</div>

</main>


<%@ include file="footer.jsp"%>

<%@ include file="header.jsp"%>
<%@page import="quickans.DBConnection"%>
<%@ page import="javax.sql.rowset.*"%>



<style>
tr:hover {background-color:#9494ff;}
</style>

<main class="content">
		<div class="container-fluid p-0">
			<div class="row">
				<div class="col-12 col-lg-12">
					<div class="card"></div>
				</div>
			</div>
		</div>

<div class="card">
		<div class="card-header">
			<h5 class="card-title mb-0">Contact</h5>
		</div>
		<div class="card-body">
			<table class="col-12 col-lg-12">
				<tr>
					<th style="border: solid 1px grey; padding: 10px;">Name</th>
					<th style="border: solid 1px grey; padding: 10px;">Email</th>
					<th style="border: solid 1px grey; padding: 10px;">Phone</th>
					<th style="border: solid 1px grey; padding: 10px;">Subject</th>
					<th style="border: solid 1px grey; padding: 10px;">Message</th>
					

				</tr>

				<%
				CachedRowSet rs = DBConnection.selectquery("SELECT * FROM contactus");
				%>

				<tbody>

					<%
					while (rs.next()) {
					%>
					<tr>
						<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(2)%></td>
						<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(3)%></td>
						<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(4)%></td>
						<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(5)%></td>
						<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(6)%></td>
					
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
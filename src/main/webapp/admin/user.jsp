<%@ include file="header.jsp"%>
<%@page import="quickans.DBConnection"%>
<%@ page import="javax.sql.rowset.*"%>
<%
CachedRowSet rssc = DBConnection.selectquery("select *from expertuser");
rssc.next();
CachedRowSet rsc = DBConnection.selectquery("select *from category");
%>

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
		<h5 class="card-title mb-0">User</h5>
	</div>

     
	<div class="row">
		<div class="card-body" style="overflow:scroll">
			<table class="col-12 col-lg-12">
				<tr>
		
						<th style="border: solid 1px grey; padding: 10px;">User Name</th>
						<th style="border: solid 1px grey; padding: 10px;">PhoneNumber</th>
						<th style="border: solid 1px grey; padding: 10px;">Email ID</th>
						<th style="border: solid 1px grey; padding: 10px;">RegistrationDate</th>
						
						<th style="border: solid 1px grey; padding: 10px;">Photo</th>
						<th style="border: solid 1px grey; padding: 10px;">Profile</th>
						<th style="border: solid 1px grey; padding: 10px;">About</th>
						<th style="border: solid 1px grey; padding: 10px;">Employment</th>
						<th style="border: solid 1px grey; padding: 10px;">Education</th>
				
				</tr>

				<%
				CachedRowSet rs = DBConnection.selectquery("select *from user");
				%>

				<tbody>

					<%
					while (rs.next()) {
					%>
					<tr>
							<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(2)%></td>
							<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(3)%></td>
							<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(4)%></td>
							<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(6)%></td>
							<td style="border: solid 1px grey; padding: 10px;"><img src="../<%=rs.getString(8) %>" width="40" height="40"> </td>
							<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(9)%></td>
							<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(10)%></td>
							<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(11)%></td>
							<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(12)%></td>
		
					</tr>
					<%
					}
					%>
				</tbody>

			</table>
		</div>
	</div>

</div>
</main>
	<%@ include file="footer.jsp"%>
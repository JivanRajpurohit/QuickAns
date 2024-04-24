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
			<h5 class="card-title mb-0">Payment Status</h5>
		</div>
		<div class="card-body">
			<table class="col-12 col-lg-12">
				<tr>
				<th style="border: solid 1px grey; padding: 10px;">User</th>
					<th style="border: solid 1px grey; padding: 10px;">Package</th>
					<th style="border: solid 1px grey; padding: 10px;">amount</th>
					<th style="border: solid 1px grey; padding: 10px;">Starting Date</th>
					<th style="border: solid 1px grey; padding: 10px;">Ending Date</th>
					<th style="border: solid 1px grey; padding: 10px;">Payment Status</th>
					

				</tr>

				<%
				CachedRowSet rs = DBConnection.selectquery("SELECT * FROM subscription_payment s JOIN user u ON s.user_id=u.user_id JOIN subscription_package p ON s.s_package_id=p.s_package_id;");
				%>

				<tbody>

					<%
					while (rs.next()) {
					%>
					<tr>
						<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(9)%></td>
						<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(21)%></td>			
					    <td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(22)%></td>
					    <td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(5)%></td>
					    <td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(6)%></td>
					    <td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(7)%></td>
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
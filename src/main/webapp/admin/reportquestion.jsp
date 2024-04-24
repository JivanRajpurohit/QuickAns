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
			<h5 class="card-title mb-0">Reported Question</h5>
		</div>
		<div class="card-body">
			<table class="col-12 col-lg-12">
				<tr>
				<th style="border: solid 1px grey; padding: 10px;">Question</th>
					<th style="border: solid 1px grey; padding: 10px;">Delete</th>
					

				</tr>

				<%
				CachedRowSet rs = DBConnection.selectquery("SELECT * FROM reportquestion r JOIN question q ON r.q_id=q.q_id;");
				%>

				<tbody>

					<%
					while (rs.next()) {
					%>
					<tr>
						<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(4)%></td>
						<td style="border: solid 1px grey; padding: 10px;">
						<a href='../DeleteReportedQuestion?r=<%=rs.getString(1)%>&q=<%=rs.getString(2)%>'><i class="bi-trash-fill" style="font-size: 22px;"></i></a></td>
											
	
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
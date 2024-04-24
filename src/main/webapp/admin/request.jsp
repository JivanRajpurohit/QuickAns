<%@ include file="header.jsp" %>

<%@page import="quickans.DBConnection"%>
<%@ page import="javax.sql.rowset.*"%>

<style>
tr:hover {background-color:#9494ff;}
</style>

<%
CachedRowSet rssc = DBConnection.selectquery("select *from expertuser");
rssc.next();
CachedRowSet rsc = DBConnection.selectquery("select *from category");
%>


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
		<h5 class="card-title mb-0">Request for Become An Expert User</h5>
	</div>

     
	<div class="row">
		<div class="card-body">
			<table class="col-12 col-lg-12">
				<tr>
					<th style="border: solid 1px grey; padding: 10px;">Expert UserName</th>
					<th style="border: solid 1px grey; padding: 10px;">Email ID</th>
					<th style="border: solid 1px grey; padding: 10px;">FacebookLink</th>
					<th style="border: solid 1px grey; padding: 10px;">LinkdinLink</th>
					<th style="border: solid 1px grey; padding: 10px;">ExpertQualification</th>
					<th style="border: solid 1px grey; padding: 10px;">Category</th>
					<th style="border: solid 1px grey; padding: 10px;">Request</th>
					
				</tr>

				<%
				CachedRowSet rs = DBConnection.selectquery("select *from expertuser e,category c where e.ct_id=c.ct_id and e.status=2");
				%>

				<tbody>

					<%
					while (rs.next()) {
					%>
					<tr>
						<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(2)%></td>
						<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(4)%></td>
						<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(6)%></td>
						<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(7)%></td>
						<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(8)%></td>
						<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(17)%></td>
						<td style="border: solid 1px grey; padding: 10px;"><a
							href='../ApproveExpert?x=<%=rs.getString(1)%> &y=<%=rs.getString(4)%> &z=<%=rs.getString(2)%>'><span class="badge bg-success">Approve</span></a></td>
							
						
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

<%@ include file="footer.jsp" %>

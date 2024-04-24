<%@ include file="header.jsp"%>
<%@page import="quickans.DBConnection"%>
<%@ page import="javax.sql.rowset.*"%>
<img alt="ans" src="photo/answer-icon.png" width=28px; height=28px; >


<style>
tr:hover {background-color:#9494ff;}
</style>
<main class="content">
	<div class="container-fluid p-0">

		<div class="mb-3">
			<h1 class="h3 d-inline align-middle">Subscription Package</h1>
		</div>

		<div class="row">
			<div class="col-12 col-lg-12">
				<div class="card">
					<div class="card-header">
						<h5 class="card-title mb-0">Package</h5>
					</div>

					<div class="card-body">
						<form method="post" action="../AddPackage">

							<dt>Package Name :</dt>
							<input type="text" class="form-control"
								placeholder="Package Name" name="t1" required="required"><br>
							<dt>Package Amount :</dt>
							<input type="number" class="form-control"
								placeholder="Package Amount" name="t2" required="required"><br>
							<dt>Package Details :</dt>
							<textarea class="form-control" rows="3"
								placeholder="Package Details" name="t3" required="required"></textarea><br>
							<dt>Package Duration (In Days):</dt>
							<input type="text" class="form-control"
								placeholder="Package Duration" name="t4" required="required"><br>
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

	<div class="card">
		<div class="card-header">
			<h5 class="card-title mb-0">Package Details</h5>
		</div>
		<div class="card-body">
			<table class="col-12 col-lg-12">
				<tr>
					<th style="border: solid 1px grey; padding: 10px;">Package Name</th>
					<th style="border: solid 1px grey; padding: 10px;">Package Amount</th>
					<th style="border: solid 1px grey; padding: 10px;">Package Details</th>
					<th style="border: solid 1px grey; padding: 10px;">Package Duration</th>
					<th style="border: solid 1px grey; padding: 10px;">Edit</th>
					<th style="border: solid 1px grey; padding: 10px;">Delete</th>

				</tr>

				<%
				CachedRowSet rs = DBConnection.selectquery("select *from subscription_package");
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

						<td style="border: solid 1px grey; padding: 10px;"><a
							href='editpackage.jsp?x=<%=rs.getString(1)%>'><i class="bi-pencil-square"  style="font-size: 22px;" ></i></a></td>
						<td style="border: solid 1px grey; padding: 10px;"><a
							href='../DeletePackage?x=<%=rs.getString(1)%>'><i class="bi-trash-fill" style="font-size: 22px;"></i></a></td>
							

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

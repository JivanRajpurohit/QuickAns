<%@ include file="header.jsp"%>
<%@page import="quickans.DBConnection"%>
<%@ page import="javax.sql.rowset.*"%>

<style>
tr:hover {background-color:#9494ff;}
</style>


<main class="content">
	<div class="container-fluid p-0">

		<div class="mb-3">
			<h1 class="h3 d-inline align-middle">Forms</h1>
		</div>
		<div class="row">
			<div class="col-12 col-lg-12">
				<div class="card">
					<div class="card-header">
						<h5 class="card-title mb-0">Category</h5>
					</div>
					<div class="card-body">
						<form method="post" action="../AddCategory"  enctype = "multipart/form-data">

							<input type="text" class="form-control"
								placeholder="Category Name" name="t1"> <br>
								<input type="file" class="form-control"
								placeholder="photo" name="t2"> <br>
								
							<button type="submit" class="btn btn-primary me-2" >Submit</button>
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
			<h5 class="card-title mb-0">Category</h5>
		</div>
		<div class="card-body">
			<table class="col-12 col-lg-12">
				<tr>
					<th style="border: solid 1px grey; padding: 10px;">Category Id</th>
					<th style="border: solid 1px grey; padding: 10px;">Category Name</th>
					
					<th style="border: solid 1px grey; padding: 10px;"></th>
					<th style="border: solid 1px grey; padding: 10px;"></th>

				</tr>

				<%
				CachedRowSet rs = DBConnection.selectquery("select *from category");
				%>

				<tbody>

					<%
					while (rs.next()) {
					%>
					<tr>
						<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(1)%></td>
						
									
						<td style="border: solid 1px grey; padding: 10px;"><img src="<%=rs.getString(3) %>" width="40" height="40"> &nbsp;&nbsp; <%=rs.getString(2)%></td>
						

						<td style="border: solid 1px grey; padding: 10px;"><a
							href='editqlificategory.jsp?x=<%=rs.getString(1)%>'><i class="bi-pencil-square"  style="font-size: 22px;" ></i></a></td>
						<td style="border: solid 1px grey; padding: 10px;"><a
							href='../DeleteCategory?x=<%=rs.getString(1)%>' ><i class="bi-trash-fill" style="font-size: 22px;"></i></a></td>
							

							
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










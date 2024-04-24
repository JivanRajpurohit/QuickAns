<%@ include file="header.jsp"%>
<%@page import="quickans.DBConnection"%>
<%@ page import="javax.sql.rowset.*"%>
<%
CachedRowSet rsc = DBConnection.selectquery("select *from category");
%>
<style>
tr:hover {background-color:#9494ff;}
</style>
<main class="content">

<div class="container-fluid p-0">

		<div class="mb-3">
			<h1 class="h3 d-inline align-middle">Expert Report</h1>
		</div>
		<div class="row">
			<div class="col-12 col-lg-12">
				<div class="card">
					<div class="card-header">
						<h5 class="card-title mb-0">Category</h5>
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
  if(request.getParameter("t1")!=null)
  {
%>


<div class="card">
	<div class="card-header">
		<h5 class="card-title mb-0">Expert User</h5>
	</div>

        	<%
				CachedRowSet rs = DBConnection.selectquery("select *from expertuser e,category c where e.ct_id=c.ct_id and e.ct_id='"+ request.getParameter("t1") +"'");
				%>
        
	<div class="row">
		<div class="card-body" style="overflow:scroll">
			<table class="col-12 col-lg-12">
				<tr>
					
					<th style="border: solid 1px grey; padding: 10px;">Expert User
						Name</th>
					<th style="border: solid 1px grey; padding: 10px;">Phone
						Number</th>
					<th style="border: solid 1px grey; padding: 10px;">Email ID</th>
					<th style="border: solid 1px grey; padding: 10px;">YoutubeLink</th>
					<th style="border: solid 1px grey; padding: 10px;">LinkdinLink</th>
					<th style="border: solid 1px grey; padding: 10px;">ExpertQualification</th>
					<th style="border: solid 1px grey; padding: 10px;">About</th>
					<th style="border: solid 1px grey; padding: 10px;">Category</th>
					<th style="border: solid 1px grey; padding: 10px;">Profile</th>
					<th style="border: solid 1px grey; padding: 10px;">Employment</th>
					<th style="border: solid 1px grey; padding: 10px;">Education</th>

				</tr>

			
				<tbody>

					<%
					while (rs.next()) 
					{
					%>
					<tr>
						<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(2)%></td>
						<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(3)%></td>
						<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(4)%></td>
						<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(6)%></td>
						<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(7)%></td>
						<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(8)%></td>
						<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(9)%></td>
						<td style="border: solid 1px grey; padding: 10px;">
						<img src="<%=rs.getString(18) %>" width="40" height="40" >
						<p style="padding-left: 70px;position:relative;  left:-10px; top:-20px; ">
						<%=rs.getString(17)%></p></td>
						
						<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(13)%></td>
						<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(14)%></td>
						<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(15)%></td>
						

					</tr>
					<%
					}
					%>
			</tbody>

			</table>
		</div>
	</div>

</div>
<!-- <td style="border: solid 1px grey; padding: 10px; "><img src="//=rs.getString(18) %>" width="40" height="40" > <p style="padding-left: 70px;position:relative;  top:-20px; "><</p></td>
 -->
<%
  }
%>
</main>
	<%@ include file="footer.jsp"%>
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
			<h5 class="card-title mb-0">Feedback</h5>
		</div>
		<div class="card-body">
			<table class="col-12 col-lg-12">
				<tr>
					<th style="border: solid 1px grey; padding: 10px;">User/Expert</th>
			
					<th style="border: solid 1px grey; padding: 10px;">Feedback</th>
							<th style="border: solid 1px grey; padding: 10px;">Feedback Date</th>
					<th style="border: solid 1px grey; padding: 10px;">Feedback Rate</th>
					

				</tr>

				<%
				CachedRowSet rs = DBConnection.selectquery("SELECT * FROM feedback");
				%>

				<tbody>

					<%
					while (rs.next()) {
						CachedRowSet rsu=null;
					  	CachedRowSet rsa=null;
					    	
						if(rs.getString(4)==null)
					  	{
					  		rsa=DBConnection.selectquery("select *from expertuser where exp_id='"+ rs.getString(5) +"'");
					  	    rsa.next();
					
					  	}
					  	else
					  	{
							rsu=DBConnection.selectquery("select *from user where user_id='"+ rs.getString(4) +"'");
					        rsu.next();
					
					  	}
					%>
					<tr>
				
				
					   <%
					      if(rsu==null)
					      {
					     %>
						<td style="border: solid 1px grey; padding: 10px;"><%=rsa.getString(2)%></td>
						  <%
					      }
					      else{
						  %>
						<td style="border: solid 1px grey; padding: 10px;"><%=rsu.getString(2)%></td>
						  
						  <%
					      }
						  %>
							<td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(3)%></td>
					  	
					    <td style="border: solid 1px grey; padding: 10px;"><%=rs.getString(2)%></td>
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
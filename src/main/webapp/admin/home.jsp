
<%@ include file="header.jsp"%><br><br>
<%@page import="quickans.DBConnection"%>
<%@ page import="javax.sql.rowset.*"%>

<main class="content">

			<div class="container-fluid p-0">
			<div class="row">
				<div class="col-12 col-lg-12">
				
					<div class="card"></div>
					<h4 style="font-size: 30px; font-family: inherit; color: navy;">Welcome to the QuickAns <%=session.getAttribute("name").toString() %></h4>
					<br><br>
				</div>
			</div>
		</div>
				<div class="container-fluid p-0">

					<h1 class="h3 mb-3"><strong>Analysis</strong> </h1>

					<div class="row">
						<div class="col-xl-12 col-xxl-5 d-flex">
							<div class="w-100">
								<div class="row">
									<div class="col-sm-6">
									<a href="user.jsp">
										<div class="card">
											<div class="card-body">
												<div class="row">
												<% CachedRowSet rsu=DBConnection.selectquery("select count(*) from user");
												   rsu.next();
												%>
													<div class="col mt-0">
														<h5 class="card-title">USERS</h5>
													</div>

													<div class="col-auto">
														<div class="stat text-primary">
															<i class="bi bi-people" style="color: black; font-size: 30px"></i>
														
														</div>
													</div>
												</div>
												<h1 class="mt-1 mb-3"><%=rsu.getString(1) %></h1>
												<div class="mb-0">
													<span class="text-muted">Available</span>
												</div>
											</div>
										</div>
										</a>
 <% CachedRowSet rsc=DBConnection.selectquery("select count(*) from category");
   rsc.next();
%>
										<a href="qlificategory.jsp">
										<div class="card">
											
											<div class="card-body">
											
												<div class="row">
													<div class="col mt-0">
														<h5 class="card-title">Catagories</h5>
													</div>

													<div class="col-auto">
														<div class="stat text-primary">
														<i class="bi bi-tag" style="color: black; font-size: 30px"></i>
															</div>
													</div>
												</div>
												
												<h1 class="mt-1 mb-3"><%=rsc.getString(1) %></h1>
												<div class="mb-0">
													<span class="text-muted">Available</span>
												</div>
											</div>
											
										</div>
										</a>
									</div>
									<div class="col-sm-6">
									<a href="expertuser.jsp">
										<div class="card">
											<div class="card-body">
												<div class="row">
													<div class="col mt-0">
														<h5 class="card-title">Experts</h5>
													</div>
<% CachedRowSet rse=DBConnection.selectquery("select count(*) from expertuser");
   rse.next();
%>
													<div class="col-auto">
														<div class="stat text-primary">
															<img src='img/expert.png' width=30 height=30>
														</div>
													</div>
												</div>
												<h1 class="mt-1 mb-3"><%=rse.getString(1) %></h1>
												<div class="mb-0">
													<span class="text-muted">Available</span>
												</div>
											</div>
										</div>
										</a>
										
 <% CachedRowSet rsq=DBConnection.selectquery("select count(*) from question");
   rsq.next();
%>										
										<a href="catque.jsp">
										<div class="card">
											<div class="card-body">
												<div class="row">
													<div class="col mt-0">
														<h5 class="card-title">Question</h5>
													</div>

													<div class="col-auto">
														<div class="stat text-primary">
															<i class="bi bi-question-diamond" style="color: black; font-size: 30px"></i>
														
														</div>
													</div>
												</div>
												<h1 class="mt-1 mb-3"><%=rsq.getString(1) %></h1>
												<div class="mb-0">
													<span class="text-muted">Available</span>
												</div>
											</div>
										</div>
										</a>
									</div>
								</div>
							</div>
						</div>

						
					</div>
					
					<%
								CachedRowSet rseu = DBConnection.selectquery("select *From expertuser");
								
								%>

					<div class="row">
						<div class="col-12 col-lg-12 col-xxl-9 d-flex">
							<div class="card flex-fill">
								<div class="card-header">

									<h5 class="card-title mb-0">Expert Rating</h5>
								</div>
								
								<table class="table table-hover my-0">
									<thead>
										<tr>
											<th class="d-none d-xl-table-cell"> Expert Name</th>
											
											<th class="d-none d-xl-table-cell"> Rate</th>
											<th class="d-none d-xl-table-cell"> Profession</th>
											
										</tr>
									</thead>
									<tbody>
									<%
									while (rseu.next()) {
									%>
										<tr>
											<td><%=rseu.getString(2)%></td>
											
											<%
											CachedRowSet rsr = DBConnection.selectquery("select *From expertrating e JOIN expertuser eu ON e.exp_id=eu.exp_id where ld_status='1' and eu.exp_id='"+rseu.getString(1)+"'");
											 %>
											 <td class="d-none d-md-table-cell"><%= rsr.size()%></td>
											<td class="d-none d-xl-table-cell"><%=rseu.getString(13)%></td>
											
										</tr>
										<%
										}
										%>
									</tbody>
								</table>
							</div>
						</div>
						
						</div>
					<div class="col-xl-6 col-xxl-7">
							<div class="card flex-fill w-100">
								<div class="card-header">

									<h5 class="card-title mb-0">Recent Movement</h5>
								</div>
								<div class="card-body py-3">
									<div class="chart chart-sm">
										<canvas id="chartjs-dashboard-line"></canvas>
									</div>
								</div>
							</div>
						</div>
				

					<div class="row">
						<div class="col-12 col-md-6 col-xxl-3 d-flex order-2 order-xxl-3">
							<div class="card flex-fill w-100">
								<div class="card-header">

									<h5 class="card-title mb-0">Browser Usage</h5>
								</div>
								<div class="card-body d-flex">
									<div class="align-self-center w-100">
										<div class="py-3">
											<div class="chart chart-xs">
												<canvas id="chartjs-dashboard-pie"></canvas>
											</div>
										</div>

										<table class="table mb-0">
											<tbody>
												<tr>
													<td>Chrome</td>
													<td class="text-end">4306</td>
												</tr>
												<tr>
													<td>Firefox</td>
													<td class="text-end">3801</td>
												</tr>
												<tr>
													<td>IE</td>
													<td class="text-end">1689</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-12 col-lg-4 col-xxl-3 d-flex">
							<div class="card flex-fill w-100">
								<div class="card-header">

									<h5 class="card-title mb-0">Monthly Sales</h5>
								</div>
								<div class="card-body d-flex w-100">
									<div class="align-self-center chart chart-lg">
										<canvas id="chartjs-dashboard-bar"></canvas>
									</div>
								</div>
							</div>
						</div>
				</div>
			</main>

<script>
		document.addEventListener("DOMContentLoaded", function() {
			var ctx = document.getElementById("chartjs-dashboard-line").getContext("2d");
			var gradient = ctx.createLinearGradient(0, 0, 0, 225);
			gradient.addColorStop(0, "rgba(215, 227, 244, 1)");
			gradient.addColorStop(1, "rgba(215, 227, 244, 0)");
			// Line chart
			new Chart(document.getElementById("chartjs-dashboard-line"), {
				type: "line",
				data: {
					labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
					datasets: [{
						label: "Sales ($)",
						fill: true,
						backgroundColor: gradient,
						borderColor: window.theme.primary,
						data: [
							2115,
							1562,
							1584,
							1892,
							1587,
							1923,
							2566,
							2448,
							2805,
							3438,
							2917,
							3327
						]
					}]
				},
				options: {
					maintainAspectRatio: false,
					legend: {
						display: false
					},
					tooltips: {
						intersect: false
					},
					hover: {
						intersect: true
					},
					plugins: {
						filler: {
							propagate: false
						}
					},
					scales: {
						xAxes: [{
							reverse: true,
							gridLines: {
								color: "rgba(0,0,0,0.0)"
							}
						}],
						yAxes: [{
							ticks: {
								stepSize: 1000
							},
							display: true,
							borderDash: [3, 3],
							gridLines: {
								color: "rgba(0,0,0,0.0)"
							}
						}]
					}
				}
			});
		});
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			// Pie chart
			new Chart(document.getElementById("chartjs-dashboard-pie"), {
				type: "pie",
				data: {
					labels: ["Chrome", "Firefox", "IE"],
					datasets: [{
						data: [4306, 3801, 1689],
						backgroundColor: [
							window.theme.primary,
							window.theme.warning,
							window.theme.danger
						],
						borderWidth: 5
					}]
				},
				options: {
					responsive: !window.MSInputMethodContext,
					maintainAspectRatio: false,
					legend: {
						display: false
					},
					cutoutPercentage: 75
				}
			});
		});
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			// Bar chart
			new Chart(document.getElementById("chartjs-dashboard-bar"), {
				type: "bar",
				data: {
					labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
					datasets: [{
						label: "This year",
						backgroundColor: window.theme.primary,
						borderColor: window.theme.primary,
						hoverBackgroundColor: window.theme.primary,
						hoverBorderColor: window.theme.primary,
						data: [54, 67, 41, 55, 62, 45, 55, 73, 60, 76, 48, 79],
						barPercentage: .75,
						categoryPercentage: .5
					}]
				},
				options: {
					maintainAspectRatio: false,
					legend: {
						display: false
					},
					scales: {
						yAxes: [{
							gridLines: {
								display: false
							},
							stacked: false,
							ticks: {
								stepSize: 20
							}
						}],
						xAxes: [{
							stacked: false,
							gridLines: {
								color: "transparent"
							}
						}]
					}
				}
			});
		});
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			var markers = [{
					coords: [31.230391, 121.473701],
					name: "Shanghai"
				},
				{
					coords: [28.704060, 77.102493],
					name: "Delhi"
				},
				{
					coords: [6.524379, 3.379206],
					name: "Lagos"
				},
				{
					coords: [35.689487, 139.691711],
					name: "Tokyo"
				},
				{
					coords: [23.129110, 113.264381],
					name: "Guangzhou"
				},
				{
					coords: [40.7127837, -74.0059413],
					name: "New York"
				},
				{
					coords: [34.052235, -118.243683],
					name: "Los Angeles"
				},
				{
					coords: [41.878113, -87.629799],
					name: "Chicago"
				},
				{
					coords: [51.507351, -0.127758],
					name: "London"
				},
				{
					coords: [40.416775, -3.703790],
					name: "Madrid "
				}
			];
			var map = new jsVectorMap({
				map: "world",
				selector: "#world_map",
				zoomButtons: true,
				markers: markers,
				markerStyle: {
					initial: {
						r: 9,
						strokeWidth: 7,
						stokeOpacity: .4,
						fill: window.theme.primary
					},
					hover: {
						fill: window.theme.primary,
						stroke: window.theme.primary
					}
				},
				zoomOnScroll: false
			});
			window.addEventListener("resize", () => {
				map.updateSize();
			});
		});
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			var date = new Date(Date.now() - 5 * 24 * 60 * 60 * 1000);
			var defaultDate = date.getUTCFullYear() + "-" + (date.getUTCMonth() + 1) + "-" + date.getUTCDate();
			document.getElementById("datetimepicker-dashboard").flatpickr({
				inline: true,
				prevArrow: "<span title=\"Previous month\">&laquo;</span>",
				nextArrow: "<span title=\"Next month\">&raquo;</span>",
				defaultDate: defaultDate
			});
		});
	</script>

<%@ include file="footer.jsp" %>

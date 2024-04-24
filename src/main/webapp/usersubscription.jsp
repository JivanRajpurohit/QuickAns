<%@page import="user.DBConnection"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
     <%@ include file="userheader.jsp"%>
		
		
		<script src="https://checkout.razorpay.com/v1/checkout.js"></script>

<script>
 function onlinepayment(pid,amount,d,uid,name,phone,emailid)
 {
	 
	 var options = {
			    "key": "rzp_test_KJUkQA2ua4wilo",
			    "amount": amount*100, // Example: 2000 paise = INR 20
			    "name": "QuickAns",
			    "description": "QuickAns",
			    "image": "images/logo.png",// COMPANY LOGO
			    "handler": function (response) {
		        console.log("hello");
		        
		        
		        
		        
		        var xmlhttp = new XMLHttpRequest();
		        xmlhttp.onreadystatechange = function() {
		          if (this.readyState == 4 && this.status == 200) {
		        	  window.location = 'userregsusssub.jsp';
		          }
		        };  
		        xmlhttp.open("GET", "http://localhost:7075/userdemo/AddSubscription?pid="+pid+"&amount="+amount+"&uid="+uid+"&name="+name+"&phone="+phone+"&emailid="+emailid+"&duration="+d, true);
		        xmlhttp.send();
		         
			    },
			    "prefill": {
			        "name": name, // pass customer name
			        "email": emailid,// customer email
			        "contact": phone //customer phone no.
			    },
			    "notes": {
			        "address": "address" //customer address 
			    },
			    "theme": {
			        "color": "#15b8f3" // screen color
			    }
			};
			console.log(options);
			var propay = new Razorpay(options);
			propay.open();
 }
</script>

		
		
	
					<!-- Start Page title Area -->
		<div class="page-title-area ptb-100">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-6 col-md-4">
						<div class="page-title-content">
							<h2>Subscription Plan </h2>
						</div>
					</div>

					<div class="col-lg-6 col-md-8">
						<div class="page-title-list">
							<ul>
								<li>
									<a href="userhome.jsp">Home</a>
								</li>
								<li class="active">
								subscription Plan
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Page title Area -->

		<div class="sign-up-area ptb-100">
			<div class="container">
				<!-- <form class="user-form" action="UserSignUp" method="post"> -->
				<form class="user-form" name="f1" action="" method="post"> 
					<div class="row">
						
						
						 <%
					
						CachedRowSet rs=DBConnection.selectquery("select *from subscription_package");
					    CachedRowSet rsu=DBConnection.selectquery("select *from user where user_id='"+ session.getAttribute("user_id").toString()+"'");
                       rsu.next();
					    
%>

								
							    <div class="contact-form">
											<center><h2>Choose Your  Best Plan</h2></center>
								      	</div>
								      	<center><label>Take Your Described Plan To Join With Experts. </label></center>
											<br>
											<br>
											<%
										while (rs.next()) {
										%>
										
											<div class="col-xl-6 col-md-6">
									
										<div class="single-group-box">
										
											<div class="group-img">
												<img src="images/sub1.jpeg" alt="Image" width=400px >
												
											</div>

											<div class="group-content">
												<div class="group-sub-img">
													
													<h3><i class="fa fa-rupee"></i> <%=rs.getString(3) %></h3>
													<span>For <%=rs.getString(5)%> Months</span><br>
													
													
												</div>



												<p><%=rs.getString(4) %></p>
												<input type="button" value="Select" onclick="onlinepayment('<%= rs.getString(1)  %>','<%= rs.getString(3) %>','<%= rs.getString(5) %>','<%= rsu.getString(1) %>','<%= rsu.getString(2) %>','<%= rsu.getString(3) %>','<%= rsu.getString(4) %>');" class="group-btn">
											
											</div>
										</div>
									</div>
									
									
									<%
										}
											%>
									
									
									
					</div>
					
					
				</form>
				
			</div>
		</div>
		
<%@ include file="userfooter.jsp"%>
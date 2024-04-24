<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="expertheader.jsp"%>

<!-- Start Page title Area -->
		<div class="page-title-area ptb-100">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-6 col-md-4">
						<div class="page-title-content">
							<h2>Sign up</h2>
						</div>
					</div>

					<div class="col-lg-6 col-md-8">
						<div class="page-title-list">
							<ul>
								<li>
									<a href="experthome.jsp">Home</a>
								</li>
								<li class="active">
									Feedback
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
				<form class="user-form" action="ExpertFeedback" method="post"> 
					<div class="row">
						
						
						

								
							    <div class="contact-form">
											<center><h2>Your Feedback is matters!!</h2></center>
								      	</div>
								      	<center><label>Help us improve our services?Give us your  feedback.</label></center>
											<br>
											<br>
											<input type="hidden" name="eid" value='<%= session.getAttribute("author_id") %>'>
												
				<div class="col-12">
							<div class="form-group">
							<center><h6>Your Rating</h6></center>
								<input type="radio"  required="required" name="feedback" value="verygood"/>Very Good
								<br>
								<input type="radio" required="required" name="feedback" value="good"/>Good
								<br>
								<input type="radio" required="required" name="feedback" value="mediocre"/>Mediocre
								<br>
								<input type="radio" required="required" name="feedback" value="bad"/>Bad
								<br>
								<input type="radio" required="required" name="feedback" value="Verybad"/>Very Bad		
								<br>
							</div>
							</div>
							<center><h6>Your Feedback</h6></center>
							<div class="col-12">
							<div class="form-group">
								<textarea name="t1" class="form-control" id="message" cols="30" rows="6" required data-error="Write your message" placeholder="Write your feedback"></textarea>
						
							</div>
						</div>
											
							<div class="col-12">
								<button class="default-btn" type="submit">
									Submit Feedback
								</button>
							</div>
						
					</div>
					
					
				</form>
				
			</div>
		</div>

<%@ include file="expertfooter.jsp"%>
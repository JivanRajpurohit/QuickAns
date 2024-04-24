<%@ include file="userheader.jsp"%>
  
 
		

		<!-- Start Page title Area -->
		<div class="page-title-area ptb-100">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-6 col-md-4">
						<div class="page-title-content">
							<h2>Contact us</h2>
						</div>
					</div>

					<div class="col-lg-6 col-md-8">
						<div class="page-title-list">
							<ul>
								<li>
									<a href="userhome.jsp">Home</a>
								</li>
								<li class="active">
									Contact us
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Page title Area -->

		<!-- Start Contact Area -->
		<section class="contact-area ptb-100">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<div class="contact-form">
							<h2>Get in touch</h2>

							<form  action="AddContact" method="post">
								<div class="row">
									<div class="col-lg-12">
										<div class="form-group">
											<label>Name</label>
											<input type="text" name="t1" id="name" class="form-control" required data-error="Please enter your name" placeholder="Enter Name">
											<div class="help-block with-errors"></div>
										</div>
									</div>
		
									<div class="col-lg-12">
										<div class="form-group">
											<label>Email</label>
											<input type="email" name="t2" id="email" class="form-control" required data-error="Please enter your email" placeholder="Enter Email">
											<div class="help-block with-errors"></div>
										</div>
									</div>

									<div class="col-lg-12">
										<div class="form-group">
											<label>Your Phone No</label>
											<input type="number" name="t3" id="phone_number" required data-error="Please enter your number" class="form-control" placeholder="Enter Phone Number">
											<div class="help-block with-errors"></div>
										</div>
									</div>
		
									<div class="col-lg-12">
										<div class="form-group">
											<label>Your Subject</label>
											<input type="text" name="t4" id="msg_subject" class="form-control" required data-error="Please enter your subject" placeholder="Subject">
											<div class="help-block with-errors"></div>
										</div>
									</div>
		
									<div class="col-lg-12">
										<div class="form-group">
											<label>Your Message</label>
											<textarea name="t5" class="form-control" id="message" cols="30" rows="6" required data-error="Write your message" placeholder="Write your message"></textarea>
											<div class="help-block with-errors"></div>
										</div>
									</div>

									<div class="col-12">
							<button class="default-btn" type="submit">
								Send Message
							</button>
							
						</div>
										</div>
							</form>
						</div>
					</div>

					<div class="col-lg-6">
						<div class="contacts-info">
							<h2>Contact informaton</h2>

							<ul class="address">
								<li>
									<span>Call:</span>
									<a href="tel:+1-719-504-1984">+91 709 621 7107</a>
								</li>
								<li>
									<span>Email:</span>
									<a href="usercontact.jsp"><span class="__cf_email__" data-cfemail="b3c3dad5caf3d4ded2dadf9dd0dcde">quickans@gmail.com</span></a>
								</li>
								<li class="location">
									<span>Address:</span>
									11,Shivshukh nagar,<br>Vastral , 382418<br>Ahmedabad,Gujrat
								</li>
							</ul>

							<div class="map-area">
							<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1836.352871381383!2d72.66030223751424!3d22.997845652523868!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395e8634c798f52f%3A0x166362e3b9ab15d1!2sShiv%20Shukh%20Nagar%20Society%2C%20Pranami%20Nagar%2C%20Vastral%2C%20Ahmedabad%2C%20Gujarat%20382418!5e0!3m2!1sen!2sin!4v1676439096666!5m2!1sen!2sin" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Contact Area -->


<%@ include file="userfooter.jsp"%>
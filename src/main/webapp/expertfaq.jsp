<%@ include file="expertheader.jsp"%>
		<!-- Start Mail Content Area -->
		<div class="main-content-area ptb-100">
			<div class="container">
				<div class="row">
					<div class="col-lg-3">
						<div class="sidebar-menu-wrap">
							<div class="sidemenu-wrap d-flex justify-content-between align-items-center">
								<h3>Pify Sidebar Menu</h3>
								<button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
									<i class="ri-menu-line"></i>
								</button>
							</div>
							  
							<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
								<div class="offcanvas-header">
									<h5 class="offcanvas-title" id="offcanvasExampleLabel">Menu</h5>
									<button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
								</div>
								<div class="offcanvas-body">
								<div class="left-sidebar">
									<nav class="sidebar-nav" data-simplebar>
										<ul id="sidebar-menu" class="sidebar-menu">
											<li><a href="experthome.jsp" class="box-style"> <span
													class="menu-title"> <i class="ri-home-8-line"></i>
														Home
												</span>
											</a></li>
											<li ><a href="#"
												class="has-arrow box-style"> <i class="ri-question-line"></i>
													<span class="menu-title"> Questions </span>
											</a>
												<ul class="sidemenu-nav-second-level">
													<li><a href="experthome.jsp"> <span
															class="menu-title">Asked questions</span>
													</a></li>
													<li><a href="experthome.jsp"> <span
															class="menu-title">Questions details</span>
													</a></li>
												</ul></li>
											
											
											<li><a href="unansweredforexpert.jsp" class="box-style"> <span
													class="menu-title"> <i
														class="ri-checkbox-circle-line"></i> Unanswered
												</span>
											</a></li>
											
											<li><a href="expertfaq.jsp" class="box-style"> <span
													class="menu-title"> <i class="ri-hq-line"></i> FAQs
												</span>
											</a></li>
											<li><a href="categoryforexpert.jsp" class="box-style"> <span
													class="menu-title"> <i class="ri-group-2-line"></i>
														Categories
												</span>
											</a></li>
											

											<li><a href="expertprofile.jsp" class="box-style"> <span
													class="menu-title"> <i
														class="ri-checkbox-circle-line"></i> Experts
												</span>
											</a></li>
											
											<li><a href="expertfeedback.jsp" class="box-style"> <span
													class="menu-title"> <i
														class="ri-checkbox-circle-line"></i> Feedback
												</span>
											</a></li>										</ul>
									</nav>
								</div>
								</div>
							
								</div>
						</div>
					</div>

					<div class="col-lg-6">
						<div class="middull-content">
							<ul class="page-nish">
								<li>
									<a href="experthome.jsp">
										<i class="ri-home-8-line"></i>
										Home
									</a>
								</li>
								<li class="active">
									FAQs
								</li>
							</ul>

							

									<div class="main-content-text">
									<p>Below we ansnwer to some of the most frequently asked questions about<b> QuikAns</b>. We are unable to answer all questions here, so if you have any other questions, please<span class="forgot-login"> <a href="usercontact.jsp">contact us</a></span>.</p>
									</div>
							<br><br>
									
									<div class="accordion mb-0" id="accordionExample">
								<div class="accordion-item">
							
									<h2 class="accordion-header" id="headingOne">
										<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
											1. What does QuickAns mean?
										</button>
									</h2>
				
									<div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
										<div class="accordion-body">
											<p>The name QuickAns is derived from the English words  quick question and answer. In English, the word quickans also makes sense and its meaning is nothing more than answering a question with a question.</p>
										</div>
									</div>
								</div>
				
								<div class="accordion-item">
									<h2 class="accordion-header" id="headingTwo">
										<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
										2. For what purpose was QuickAns created?
										</button>
									</h2>
									<div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
										<div class="accordion-body">
										<p>Our goal is to create a community where users are free to ask and answer questions in a friendly way, all this happening in a user-friendly environment. </p>
										</div>
									</div>
								</div>
				
								<div class="accordion-item">
									<h2 class="accordion-header" id="headingThree">
										<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
										3. Who can ask questions on the site?
										</button>
									</h2>
									<div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
										<div class="accordion-body">
											<p>Anyone can read the questions on <b>QuickAns</b>, but registration is required before you ask or answer a question.</p>
										</div>
									</div>
								</div>
				
								<div class="accordion-item">
									<h2 class="accordion-header" id="headingFour">
										<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
										4. Who answers the questions?
										</button>
									</h2>
									<div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
										<div class="accordion-body">
									<p>	Anyone who has registered on the site has the opportunity to answer the questions. On <b>QuickAns</b>, the users can also get expert answers.
									</p>	
										</div>
									</div>
								</div>
				
								<div class="accordion-item">
									<h2 class="accordion-header" id="headingFive">
										<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
									5. Who are the experts?
									</button>
									</h2>
									<div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
										<div class="accordion-body">
										<p>Experts are verified users who have passed a certain check.</p>
										</div>
									</div>
								</div>
				
								<div class="accordion-item">
									<h2 class="accordion-header" id="headingSix">
										<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
										6. Can anyone be an expert on <b> QuickAns</b>?
										</button>
									</h2>
									<div id="collapseSix" class="accordion-collapse collapse" aria-labelledby="headingSix" data-bs-parent="#accordionExample">
										<div class="accordion-body">
										<p>Yes, if they can prove that they are proficient in a particular subject.</p>
										</div>
									</div>
								</div>
				
								<div class="accordion-item">
									<h2 class="accordion-header" id="headingSeven">
										<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
											7. What are the benefits of being an expert?
										</button>
									</h2>
									<div id="collapseSeven" class="accordion-collapse collapse" aria-labelledby="headingSeven" data-bs-parent="#accordionExample">
										<div class="accordion-body">
										<p>Experts on the site can provide more information about themselves, which helps them gain more popularity.</p>
										</div>
									</div>
								</div>

								<div class="accordion-item">
									<h2 class="accordion-header" id="headingEight">
										<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
											8. Is is possible to ask or answer a question anonymously?
									</button>
									</h2>
									<div id="collapseEight" class="accordion-collapse collapse" aria-labelledby="headingEight" data-bs-parent="#accordionExample">
										<div class="accordion-body">
										<p>Yes, users have the opportunity to post their personal questions and answers anonymously on the site.</p>
										</div>
									</div>
								</div>
								
								<div class="accordion-item">
									<h2 class="accordion-header" id="headingEight">
										<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
											9. What are the tags?										</button>
									</h2>
									<div id="collapseEight" class="accordion-collapse collapse" aria-labelledby="headingEight" data-bs-parent="#accordionExample">
										<div class="accordion-body">
										<p>All questions must be tagged. The automated system of the site helps in this, but the tags we recommend do not always define the topic most accurately. In this case, you may want to add additional tags manually.<br>If you are particularly interested in a specific topic, please subscribe to that tag and you will receive an email notification when a new question related to that topic comes. </p>
										</div>
									</div>
								</div>
								
								<div class="accordion-item">
									<h2 class="accordion-header" id="headingEight">
										<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
											10. Is it possible to delete the user account?										</button>
									</h2>
									<div id="collapseEight" class="accordion-collapse collapse" aria-labelledby="headingEight" data-bs-parent="#accordionExample">
										<div class="accordion-body">
										<p> You can delete your account at any time on the profile page.</p>
										</div>
									</div>
								</div>

					
						
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
<%@ include file="expertfooter.jsp"%>
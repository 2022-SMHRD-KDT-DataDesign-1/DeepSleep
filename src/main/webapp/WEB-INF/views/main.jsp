<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Crew &mdash; 100% Free Fully Responsive HTML5 Template by FREEHTML5.co</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FREEHTML5.CO" />

	<!-- header/footer css  -->
	<link rel="stylesheet" href="css1/headerfooter.css">
	<!-- 팀원소개 시작 stylesheet  -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" 
		integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" 
		crossorigin="anonymous" referrerpolicy="no-referrer">
	<!-- 팀원소개 끝 stylesheet -->
	<!-- 서비스 흐름도 css  -->
	<link rel="stylesheet" href="css1/process.css">
	
	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<!-- Animate.css -->
	<link rel="stylesheet" href="css1/animate.css">
	<!-- Icomoon Icon Fonts-->
	<!-- <link rel="stylesheet" href="css1/icomoon.css"> -->
	<!-- Simple Line Icons -->
	<!-- <link rel="stylesheet" href="css1/simple-line-icons.css"> -->
	<!-- Owl Carousel -->
	<link rel="stylesheet" href="css1/owl.carousel.min.css">
	<link rel="stylesheet" href="css1/owl.theme.default.min.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css1/bootstrap.css">

	<link rel="stylesheet" href="css1/style.css">

	<!-- Styleswitcher ( This style is for demo purposes only, you may delete this anytime. ) -->
	<link rel="stylesheet" id="theme-switch" href="css1/style.css">
	<!-- End demo purposes only -->

	<!-- Modernizr JS -->
	<script src="js1/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	
	<!-- 로그인 모달창을 위한 라이브러리  -->
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css1/bootstrap.min.css">
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js1/bootstrap.min.js"></script>
	 <script>
	  $(document).ready(function(){
	      if(${not empty msgType}){
	         if(${msgType eq "실패 메세지"}){
	            $("#messageType").attr("class", "modal-content panel-warning");
	         }
	         $("#myMessage").modal("show");
	      }
	   });
	 
	 	function openLoginModal(){
	 		$("#loginModal .modal-content").load("/member/loginForm.jsp"); 
	 	}
	 	
	 </script>
	</head>
	<body>
	<%@ include file="./header/header.jsp"%>

	<div id="slider" data-section="home">
		<div class="owl-carousel owl-carousel-fullwidth">
			<!-- 배경1 -->
		    <div class="item" style="background-image: url('images/imgM12.png'); background-repeat: repeat-x; background-size: 100%;">
		    	<div class="container" style="position: relative;">
		    		<div class="row">
					    <div class="col-md-8 col-md-offset-2 text-center">
			    			<div class="fh5co-owl-text-wrap">
						    	<div class="fh5co-owl-text">
						    		<h1 class="main-bg-s1"><a href="#" target="_blank">ILEM</a></h1>
									<h3 class="main-bg-sub-s1"><strong>I</strong>mage <strong>L</strong>abeling <strong>E</strong>very <strong></strong> Moment</h3>
									<p class="to-animate-2re">
										<c:if test="${empty mvo}">
			            					<a class="btn btn-primary btn-lg" data-toggle="modal" href="#loginModal" onclick="openLoginModal()" 
			            					   style="position: relative; bottom: -90px; font-size: 35px;">Start</a>
										</c:if>
										<c:if test="${not empty mvo}">
			            					<a class="btn btn-primary btn-lg" href="${contextPath}/logout.do"
			            					   style="position: relative; bottom:-90px; font-size: 35px;">${mvo.nickname}</a>
										</c:if>
									</p>
						    	</div>
						    </div>
					    </div>
					    <div class="col-md-4 col-md-push-1 col-sm-4 col-sm-push-1 iphone-image">
					    	<!-- <div class="iphone to-animate-2"><img src="images/iphone-2.png" alt="Free HTML5 Template by FREEHTML5.co"></div> -->
					    </div>
		    		</div>
		    	</div>
		    </div>
			<!-- 배경2  -->
		    <div class="item" style="background-image: url('images/imgM22.png'); background-repeat: no-repeat; background-size: cover;">
		    	<div class="container" style="position: relative;">
		    		<div class="row">
		    			<div class="col-md-8 to-animate" style="position: relative; top: 100px; width:75%;">
							<img src="images/samImg.gif" class="img-responsive img-rounded" style="width:65%;">
							<p style="position:relative; font-size: 25px; top:10px; color:#fff;">
								<strong>SAM</strong> is a promptable segmentation system with<br>
								 zero-shot generalization to unfamiliar objects and<br>
								 images without the need for additional training.
							</p>
						</div>
		    		</div>
		    	</div>
		    </div>
			<!-- 배경3  -->
		    <div class="item" style="background-image: url('images/imgM33.jpg'); background-repeat: no-repeat; background-size: cover;">
		    	<!-- <div class="overlay"></div> -->
		    	<div class="container" style="position: relative;">
		    		<div class="row">
		    			<div class="col-md-8 to-animate" style="position: relative; top: 100px; width:75%;">
							<img src="images/dino2.png" class="img-responsive img-rounded" style="width:65%;">
							<p style="position:relative; font-size: 25px; top:10px; color:#fff;">
								 <strong>Grounding DINO</strong> can detect arbitrary objects with<br>
								  human inputs such as category names or referring<br>
								  expressions.
							</p>
						</div>
		    		</div>
		    	</div>
		    </div>

		</div>
	</div>
	
	<div id="fh5co-about-us" data-section="about">
		<div class="container">
			<div class="row row-bottom-padded-lg" id="about-us">
				<div class="col-md-12 section-heading text-center">
					<h2 class="to-animate">About Us</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 to-animate">
							<h3><strong>DEEP SLEEP</strong>은 <span>Deep</span> Learning에서 <span>Deep</span>과 Sleep이라는 두 가지<br>개념을
								결합한 이름 입니다. 딥러닝은 기계 학습의 한 분야로, 우리 팀이 지속적
								이고 깊은 학습을 통해 최고의 성과를 도출하려는 의지를<br> 상징하고,
								깊은잠은 몸과 마음을 편안하게 쉬게 해주며 에너지를 충전하는 과정을 의미합니다.
								저희는 고도의 기술 연구와 발전을 추구,동시에 팀원들의
								웰빙을 챙기며 균형있게 성장하는 조직이 되고자 합니다.
							</h3>
						</div>
					</div>
				</div>
				<div class="col-md-8 to-animate">
					<img src="images/samImg.gif" class="img-responsive img-rounded" alt="Free HTML5 Template">
				</div>
				<div class="col-md-4 to-animate">
					<h2>How we got started</h2>
					<p style="font-size: 16px;">
						최근 몇 년 동안 인공지능 기술은 빠르게 발전하고 있으며 정부의 디지털 뉴딜 정책의 핵심이라 할 수 있는 AI 산업 육성을 위한 데이터 라벨링의 중요성이 부각되고 있습니다.
					    데이터 라벨링은 AI 학습을 위한 원천 데이터에 값(라벨)을 붙이는 필수 작업으로, 비정형 데이터를 컴퓨터가 이해할 수 있는 형태로 변형하고 가공합니다. 
					    딥러닝 기반 AI 개발에 들어가는 시간이 많은 소모되는 기업들은 빠르게 프로토타입을 생성하고 결과물을 시장에 내놓기를 원합니다. 
					    오토 라벨링 서비스는 빠르게 데이터 셋을 생성하는데 필요한 라벨링 작업을 감소시켜 프로젝트 개발 및 진행 속도를 높이는 데 도움이 됩니다.
					</p>
					<p style="font-size: 16px;">
						이러한 배경에서 오토 라벨링 서비스는 시간과 비용을 절약하며 훈련 데이터의 질을 높이고,
						프로젝트 개발 속도를 높여 딥러닝 기반 AI 개발을 가속화하는 데 도움이 줄 수 있어 개발하였습니다.
					</p>
					<!-- <p><a href="#" class="btn btn-primary" data-nav-section="teamMember">Meet the team</a></p> -->
				</div>
			</div>
			<div class="row" id="team">
				<section>
					<div class="container flow-content" data-section="teamMember">
						<!-- <h2 class="section-title">Meet the team</h2> -->
						<ul role="list" class="grid" data-columns="3">
							<li>
								<article class="card" data-visible="false">
									<div data-card="front" class="card__front flow-content">
										<img class="card__img mx-auto" src="https://images.unsplash.com/photo-1599566150163-29194dcaad36?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzMjM4NDZ8MHwxfHJhbmRvbXx8fHx8fHx8fDE2ODUwMjU1ODF8&ixlib=rb-4.0.3&q=80&w=400" alt="John Smith (from Unsplash)" />
										<div class="flow-content" data-spacing="sm">
											<p class="card__name">팀장 김영민</p>
											<p class="card__position">Project Manager</p>
										</div>
									</div>
									<div data-card="back" class="card__back flow-content">
										<p class="card__name">팀장 김영민</p>
										<p>	
											[Project 총괄]<br>
											- ???<br>
											[Modeling]<br>
											- ???
										</p>
									</div>
									<footer class="card__footer">
										<button data-card-controller class="card__toggle">
											<i class="fa-solid fa-plus card__toggle-icon"></i>
										</button>
									</footer>
								</article>
							</li>
							<li>
								<article class="card" data-visible="false">
									<div data-card="front" class="card__front flow-content">
										<img class="card__img mx-auto" src="https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzMjM4NDZ8MHwxfHJhbmRvbXx8fHx8fHx8fDE2ODUwMzAxNzB8&ixlib=rb-4.0.3&q=80&w=400" alt="John Smith (from Unsplash)" />
										<div class="flow-content" data-spacing="sm">
											<p class="card__name">부팀장 김예함</p>
											<p class="card__position">Back-End Developer</p>
										</div>
									</div>
									<div data-card="back" class="card__back flow-content">
										<p class="card__name">부팀장 김예함</p>
										<p>
											[Back-End]<br>
											- ???<br>
											[Front-End]<br>
											- ???
										</p>
									</div>
									<footer class="card__footer">
										<button data-card-controller class="card__toggle">
											<i class="fa-solid fa-plus card__toggle-icon"></i>
										</button>
									</footer>
								</article>
							</li>
							<li>
								<article class="card" data-visible="false">
									<div data-card="front" class="card__front flow-content">
										<img class="card__img mx-auto" src="https://images.unsplash.com/photo-1580489944761-15a19d654956?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzMjM4NDZ8MHwxfHJhbmRvbXx8fHx8fHx8fDE2ODUwMzAyODV8&ixlib=rb-4.0.3&q=80&w=400" alt="John Smith (from Unsplash)" />
										<div class="flow-content" data-spacing="sm">
											<p class="card__name">팀원 염혜정</p>
											<p class="card__position">Database Developer</p>
										</div>
									</div>
									<div data-card="back" class="card__back flow-content">
										<p class="card__name">팀원 염혜정</p>
										<p>
											[DataBase]<br>
											- ???<br>
											[Back-End]<br>
											- ???
										</p>
									</div>
									<footer class="card__footer">
										<button data-card-controller class="card__toggle">
											<i class="fa-solid fa-plus card__toggle-icon"></i>
										</button>
									</footer>
								</article>
							</li>
							<li>
								<article class="card" data-visible="false">
									<div data-card="front" class="card__front flow-content">
										<img class="card__img mx-auto" src="https://images.unsplash.com/photo-1540569014015-19a7be504e3a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzMjM4NDZ8MHwxfHJhbmRvbXx8fHx8fHx8fDE2ODUwMjU1ODF8&ixlib=rb-4.0.3&q=80&w=400" alt="John Smith (from Unsplash)" />
										<div class="flow-content" data-spacing="sm">
											<p class="card__name">팀원 최유정</p>
											<p class="card__position">Back-End Developer</p>
										</div>
									</div>
									<div data-card="back" class="card__back flow-content">
										<p class="card__name">팀원 최유정</p>
										<p>
											[Back-End]<br>
											- ???<br>
											[Front-End]<br>
											- ???
										</p>
									</div>
									<footer class="card__footer">
										<button data-card-controller class="card__toggle">
											<i class="fa-solid fa-plus card__toggle-icon"></i>
										</button>
									</footer>
								</article>
							</li>
							<li>
								<article class="card" data-visible="false">
									<div data-card="front" class="card__front flow-content">
										<img class="card__img mx-auto" src="https://images.unsplash.com/photo-1552058544-f2b08422138a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzMjM4NDZ8MHwxfHJhbmRvbXx8fHx8fHx8fDE2ODUwMzAyMjl8&ixlib=rb-4.0.3&q=80&w=400" alt="John Smith (from Unsplash)" />
										<div class="flow-content" data-spacing="sm">
											<p class="card__name">팀원 고유빈</p>
											<p class="card__position">Front-End Developer</p>
										</div>
									</div>
									<div data-card="back" class="card__back flow-content">
										<p class="card__name">팀원 고유빈</p>
										<p>
											[Front-End]<br>
											- ???
										</p>
									</div>
									<footer class="card__footer">
										<button data-card-controller class="card__toggle">
											<i class="fa-solid fa-plus card__toggle-icon"></i>
										</button>
									</footer>
								</article>
							</li>
						</ul>
					</div>
				</section>
			</div>
		</div>
	</div>
	<div id="fh5co-our-services" data-section="services">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center">
					<h2 class="to-animate">Our Service</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 to-animate">
							<h3>데이터 분류와 라벨링 작업을 신속하게 처리하고, 정확도를 높일 수<br>있는 <strong>ILEM</strong> 소개합니다.
							    SAM과 Grounding Dino 기술을 결합한 뛰어난 Auto-Labeling 서비스로 인공지능 학습에 필수적인 
							    데이터 처리를<br>경제적이고 효율적으로 손쉽게 진행할 수 있습니다.
							</h3>
						</div>
					</div>
				</div>
			</div>
			<!-- <h1>Our Service</h1> -->
			<div class="row">
				<div class='cdpen_progress'>
					<img class="flowimg" src="images/flow2.png">
					<div class='cdpen_progress_inner'>
						<div class='cdpen_progress_inner__step'>
							<label for='step-1'>Image Upload</label>
						</div>
						<div class='cdpen_progress_inner__step'>
							<label for='step-2'>Input Keyword</label>
						</div>
						<div class='cdpen_progress_inner__step'>
							<label for='step-3'>Zero-Shot</label>
						</div>
						<div class='cdpen_progress_inner__step'>
							<label for='step-4'>Object Detection</label>
						</div>
						<div class='cdpen_progress_inner__step'>
							<label for='step-5'>Data</label>
						</div>
						<input checked='checked' id='step-1' name='step' type='radio'>
						<input id='step-2' name='step' type='radio'>
						<input id='step-3' name='step' type='radio'>
						<input id='step-4' name='step' type='radio'>
						<input id='step-5' name='step' type='radio'>
						<div class='cdpen_progress_inner__bar'></div>
						<div class='cdpen_progress_inner__bar--set'></div>

						<div class='cdpen_progress_inner__tabs'>
							<div class='tab tab-0'>
								<h1 style="position: relative;top: -12px;">Image Upload</h1>
								<p>
								   <strong>ILEM</strong>(Image Labeling Every Moment) 객체탐지와 오토라벨링 서비스에 사용할 라벨링이 되어있지 않은 이미지들을
								   업로드 영역에 드래그&드롭을 하고 키워드 입력 또는 전체 객체 탐지를 실행합니다.
								</p>
							</div>
							<div class='tab tab-1'>
								<h1 style="position: relative;top: -12px;">Input Keyword</h1>
								<p>
									객체탐지를 위해 원하는 키워드를 입력해주세요. <strong>ILEM</strong>(Image Labeling Every Moment)에서 지원하는 객체탐지 키워드는
								 	20가지 입니다. 키워드에 설명은 서비스페이지에서 확인해주세요.
								</p>
							</div>
							<div class='tab tab-2'>
								<h1 style="position: relative;top: -12px;">Zero-Shot</h1>
								<p>
									<strong>Zero-shot</strong>은 사전에 라벨링되지 않은 새로운 클래스의 객체를 탐지할 수 있어 학습 모델이 객체 특징과 속성을 이해하고,
									새로운 클래스를 예측하여 <strong>Grounding Dino</strong> Model에서 라벨링을 진행합니다.
								</p>
							</div>
							<div class='tab tab-3'>
								<h1 style="position: relative;top: -12px;">Object Detection</h1>
								<p>
									<strong>Grounding Dino</strong>를 통해 객체 탐지와 라벨링이 수행되면, 각각의 객체가 정확하게 식별되고, 위치와<br> 카테고리가 정해집니다.
									<strong>SAM</strong> Model이 활용되어 각 객체별 이미지 분류 작업을 진행합니다. 
								</p>
							</div>
							<div class='tab tab-4'>
								<h1 style="position: relative;top: -12px;">Data</h1>
								<p>
									<strong>Grounding Dino</strong> Model을 통해 이미지에서 객체 탐지와 라벨링 작업을 수행한 결과물을
									<strong>SAM</strong> Model을 통해 객체 탐지 이미지들을 분류한 결과물이 출력되고 파일로 다운로드 할 수 있습니다.
								</p>
							</div>
						</div>

						<div class='cdpen_progress_inner__status'>
							<div class='box_base'></div>
							<div class='box_lid'></div>
							<div class='box_ribbon'></div>
							<div class='box_bow'>
								<div class='box_bow__left'></div>
								<div class='box_bow__right'></div>
							</div>
							<div class='box_item'></div>
							<div class='box_tag'></div>
							<div class='box_string'></div>
						</div>
					</div> <!-- cdpen_progress_inner-->
				</div> <!-- cdpen_progress -->
			</div> <!-- row -->
		</div>
	</div>
	
	<div id="fh5co-features" data-section="features">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center">
					<h2 class="to-animate">데이터 라벨링 중요성</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 to-animate">
							<h3>데이터 라벨링은 인공지능 모델의 정확도와 성능을 결정짓는<br>핵심 요소로서,
							    향상된 결과물을 위해 정교한 데이터 처리가<br>무엇보다 중요합니다.
							</h3>
						</div>
					</div>
				</div>
			</div>
			<!-- <h1>데이터 라벨링 중요성</h1> -->
			<div class="row">
				<div class="col-md-3 col-sm-6 ">
					<div class="service-box">
						<div class="service-icon yellow">
							<div class="front-content">
								<i class="fa fa-database"></i>
								<h3>학습데이터 생성</h3>
							</div>
						</div>
						<div class="service-content">
							<h3>품질있는 학습데이터 생성</h3>
							<p> 머신 러닝 모델의 성능은 학습 데이터의 품질에 크게 의존합니다. 정확한 라벨링 작업을 통해, 품질 높은 학습 데이터를 생성할 수 있으며, 이를 바탕으로 더 정한 예측 및 분석이 가능한 모델을 학습시킬 수 있습니다</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 ">
					<div class="service-box">
						<div class="service-icon orange">
							<div class="front-content">
								<i class="fa fa-microchip"></i>
								<h3>모델 성능</h3>
							</div>
						</div>
						<div class="service-content">
							<h3>모델 성능 개선</h3>
							<p>라벨링 작업은 모델의 성능에 직접적인 영향을 줍니다. 정확하게 라벨링된 데이터를 사용하여 모델을 학습시키면, 모델의 성능이 향상되며 일반화 능력이 높아집니다.</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="service-box">
						<div class="service-icon grey">
							<div class="front-content">
								<i class="fa fa-business-time"></i>
								<h3>비용과 시간</h3>
							</div>
						</div>
						<div class="service-content">
							<h3>비용과 시간 절약</h3>
							<p>정확하고 효율적인 라벨링 작업을 수행함으로써, 전체적인로젝트 진행 시간을 단축하고 비용을 절약할 수 있습니다. 이로 인해 더 많은 자원을 다른 중요한 과에 투자할 수 있게 됩니다.</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="service-box ">
						<div class="service-icon red">
							<div class="front-content">
								<i class="fa fa-magnifying-glass-chart"></i>
								<h3>적용 분야</h3>
							</div>
						</div>
						<div class="service-content">
							<h3>적용 분야 확장</h3>
							<p>정확한 라벨링 작업은 AI 및 ML 분야를 넘어 다양한 실제 산업 및 상황에서의 활용이 가능해집니다. 안정적인 라벨링을 통해 생성된 모델은 의료, 금융, 보안 등 다양한 분야에서 사용될 수 있습니다</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="fh5co-testimonials" data-section="testimonials">		
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center">
					<h2 class="to-animate">오토라벨링이 필요한 이유</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 to-animate">
							<h3 style="color:#fff;">오토라벨링은 정확하고 빠른 데이터 처리를 달성해 인공지능<br>모델의 학습 품질을 높이고,
							    인력과 비용 부담을 줄여 성능<br>향상과 효율성 극대화에 기여합니다.
							</h3>
						</div>
					</div>
				</div>
			</div>
			<!-- <h1>오토라벨링이 필요한 이유</h1> -->
			<div class="row">
				<div class="col-md-3 col-sm-6 ">
					<div class="service-box">
						<div class="service-icon yellow">
							<div class="front-content">
								<i class="fa fa-database"></i>
								<h3>데이터 처리</h3>
							</div>
						</div>
						<div class="service-content">
							<h3>대량의 데이터 처리</h3>
							<p>딥러닝 및 다양한 데이터 분석 기법들은 대량의 데이터를 필요로 합니다. 오토라벨링 서비스를 통해, 사용자들은 대량의 데이터를 보다 효율적이고 빠르게 처리할 수 있습니다.</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="service-box">
						<div class="service-icon grey">
							<div class="front-content">
								<i class="fa fa-microchip"></i>
								<h3>모델 개선</h3>
							</div>
						</div>
						<div class="service-content">
							<h3>모델 개선</h3>
							<p>오토라벨링의 결과를 통해 더 빨리 데이터를 확인하고, 개선사항을 찾아내어 딥러닝 모델의 성능을 개선할 수 있습니다. 또한, 빠른 데이터 라벨링 프로세스 덕분에 모델 개선 작업을 더 빠르게 할 수 있습니다.</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 ">
					<div class="service-box">
						<div class="service-icon orange">
							<div class="front-content">
								<i class="fa fa-business-time"></i>
								<h3>비용과 시간</h3>
							</div>
						</div>
						<div class="service-content">
							<h3>비용과 시간 절감</h3>
							<p>데이터 라벨링 작업은 전문가나 수작업이 필요하여 시간과 비용이 많이 소모되는 작업입니다. 오토라벨링을 사용하면, 좀 더 빠른 시간 내에 라벨링을 완료할 수 있으며, 인건비 절감 효과도 얻을 수 있습니다.</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="service-box ">
						<div class="service-icon red">
							<div class="front-content">
								<i class="fa fa-crosshairs"></i>
								<h3>정확성 및 일관성</h3>
							</div>
						</div>
						<div class="service-content">
							<h3>높은 정확성 및 일관성</h3>
							<p> AI 기반의 오토라벨링 서비스를 사용함으로써 한 번에 정확하고 일관된 라벨링 결과를 얻을 수 있습니다. 이를 통해, 데이터 분석 및 딥러닝 모델 학습에 좀 더 신뢰할 수 있는 데이터를 제공할 수 있습니다.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="fh5co-pricing" data-section="pricing">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center">
					<h2 class="single-animate animate-pricing-1">Data Trend</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 to-animate">
							<h3>한국데이터산업진흥원의 조사&#183;연구보고서,<br>주간동향을 기반으로 정보를 제공합니다.</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="content-wrapper">
				<div class="news-card">
					<a href="https://bit.ly/3P1hQTj" target="_blank" class="news-card__card-link"></a>
					<img src="images/bdimg1.jpg" alt="" class="news-card__image">
					<div class="news-card__text-wrapper">
						<h2 class="news-card__title">데이터 이코노미<br>제5호-UK,ASEAN,etc</h2>
						<div class="news-card__post-date">May 31, 2023</div>
						<div class="news-card__details-wrapper">
							<p class="news-card__excerpt">데이터산업 정책 이슈, 데이터산업 비즈니스 이슈&hellip;</p>
							<a href="https://bit.ly/3P1hQTj" target="_blank" class="news-card__read-more">Read more <i class="fas fa-long-arrow-alt-right"></i></a>
						</div>
					</div>
				</div>
				
				<div class="news-card">
					<a href="https://bit.ly/3WY8Ws0" target="_blank" class="news-card__card-link"></a>
					<img src="images/bdimg2.jpg" alt="" class="news-card__image">
					<div class="news-card__text-wrapper">
						<h2 class="news-card__title">데이터산업 동향<br>이슈 브리프</h2>
						<div class="news-card__post-date">May 31, 2023</div>
						<div class="news-card__details-wrapper">
							<p class="news-card__excerpt">미국 연방 인사관리처 데이터 전략 2023-2026&hellip;</p>
							<a href="https://bit.ly/3WY8Ws0" target="_blank" class="news-card__read-more">Read more <i class="fas fa-long-arrow-alt-right"></i></a>
						</div>
					</div>
				</div>
				
				<div class="news-card">
					<a href="https://bit.ly/3CeHpsG" target="_blank" class="news-card__card-link"></a>
					<img src="images/bdimg6.jpg" alt="" class="news-card__image">
					<div class="news-card__text-wrapper">
						<h2 class="news-card__title">데이터 이코노미<br>제4호-미국,EU </h2>
						<div class="news-card__post-date">May 08, 2023</div>
						<div class="news-card__details-wrapper">
							<p class="news-card__excerpt">미국, 국가사이버보안전략발표(23.03), 급성장하는 데이터 활용 및 수익화 시장&hellip;</p>
							<a href="https://bit.ly/3CeHpsG" target="_blank" class="news-card__read-more">Read more <i class="fas fa-long-arrow-alt-right"></i></a>
						</div>
					</div>
				</div>
				
				<div class="news-card">
					<a href="https://bit.ly/43tz00u" target="_blank" class="news-card__card-link"></a>
					<img src="images/bdimg4.jpg" alt="" class="news-card__image">
					<div class="news-card__text-wrapper">
						<h2 class="news-card__title">6월 1주<br>글로벌 데이터산업 뉴스</h2>
						<div class="news-card__post-date">Jun 07, 2023</div>
						<div class="news-card__details-wrapper">
							<p class="news-card__excerpt">EU 규제 당국, 데이터 공유 관련 반독점 규제 완화&hellip;</p>
							<a href="https://bit.ly/43tz00u" target="_blank" class="news-card__read-more">Read more <i class="fas fa-long-arrow-alt-right"></i></a>
						</div>
					</div>
				</div>
				
				<div class="news-card">
					<a href="https://bit.ly/42tVHjF" target="_blank" class="news-card__card-link"></a>
					<img src="images/bdimg5.jpg" alt="" class="news-card__image">
					<div class="news-card__text-wrapper">
						<h2 class="news-card__title">5월 5주<br>글로벌 데이터산업 뉴스</h2>
						<div class="news-card__post-date">May 30, 2023</div>
						<div class="news-card__details-wrapper">
							<p class="news-card__excerpt">중국-상하이협력기구 빅데이터센터 공식 출범&hellip;</p>
							<a href="https://bit.ly/42tVHjF" target="_blank" class="news-card__read-more">Read more <i class="fas fa-long-arrow-alt-right"></i></a>
						</div>
					</div>
				</div>
				
				<div class="news-card">
					<a href="https://bit.ly/3WTOnN0" target="_blank" class="news-card__card-link"></a>
					<img src="images/bdimg3.jpg" alt="" class="news-card__image">
					<div class="news-card__text-wrapper">
						<h2 class="news-card__title">5월 4주<br>글로벌 데이터산업 뉴스</h2>
						<div class="news-card__post-date">May 23, 2023</div>
						<div class="news-card__details-wrapper">
							<p class="news-card__excerpt">프랑스 데이터 보호당국, 'AI에 대한 실행 계획'발표&hellip;</p>
							<a href="https://bit.ly/3WTOnN0" target="_blank" class="news-card__read-more">Read more <i class="fas fa-long-arrow-alt-right"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="fh5co-press" data-section="press">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center">
					<h2 class="single-animate animate-press-1">Insight</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 to-animate">
							<h3>영상을 통해 데이터 라벨링 본질과 중요성을 이해할 수 있으며,<br>인공지능 학습에 있어 필수적인 데이터 라벨링 작업의 기능과<br>방법에 대해 자세한 지식을 얻으실 수 있습니다.</h3>
						</div>
					</div>
				</div>
			</div>
						
			<div class="content-wrapper">
				<div class="news-card">
					<a href="https://youtu.be/wBurFi--448" target="_blank" data-title="Boss: Demon Firesage" data-width="1024" data-toggle="lightbox" data-gallery="youtubevideos" class="news-card__card-link">
						<button type="button" class="btn btn-play"; >
							<span class="glyphicon glyphicon-play" aria-label="Play"></span>
						</button>
						<img src="//i1.ytimg.com/vi/wBurFi--448/mqdefault.jpg" class="img-responsive">
					</a>
				</div>
				<div class="news-card">
					<a href="https://youtu.be/UrpDD7NP-WQ" target="_blank" data-title="Boss: Demon Firesage" data-width="1024" data-toggle="lightbox" data-gallery="youtubevideos" class="news-card__card-link">
						<button type="button" class="btn btn-play">
							<span class="glyphicon glyphicon-play" aria-label="Play"></span>
						</button>
						<img src="//i1.ytimg.com/vi/UrpDD7NP-WQ/mqdefault.jpg" class="img-responsive">
					</a>
				</div>
				<div class="news-card">
					<a href="https://youtu.be/57AMGzsf-60" target="_blank" data-title="Boss: Demon Firesage" data-width="1024" data-toggle="lightbox" data-gallery="youtubevideos" class="news-card__card-link">
						<button type="button" class="btn btn-play">
							<span class="glyphicon glyphicon-play" aria-label="Play"></span>
						</button>
						<img src="//i1.ytimg.com/vi/57AMGzsf-60/mqdefault.jpg" class="img-responsive">
					</a>
				</div>
				<div class="news-card">
					<a href="https://youtu.be/iNFR7tUDj6c" target="_blank" data-title="Boss: Demon Firesage" data-width="1024" data-toggle="lightbox" data-gallery="youtubevideos" class="news-card__card-link">
						<button type="button" class="btn btn-play">
							<span class="glyphicon glyphicon-play" aria-label="Play"></span>
						</button>
						<img src="//i1.ytimg.com/vi/iNFR7tUDj6c/mqdefault.jpg" class="img-responsive">
					</a>
				</div>
				<div class="news-card">
					<a href="https://youtu.be/9_N3y5QPaKI" target="_blank" data-title="Boss: Demon Firesage" data-width="1024" data-toggle="lightbox" data-gallery="youtubevideos" class="news-card__card-link">
						<button type="button" class="btn btn-play">
							<span class="glyphicon glyphicon-play" aria-label="Play"></span>
						</button>
						<img src="//i1.ytimg.com/vi/9_N3y5QPaKI/mqdefault.jpg" class="img-responsive">
					</a>
				</div>
				<div class="news-card">
					<a href="https://youtu.be/rFWhI254Io0" target="_blank" data-title="Boss: Demon Firesage" data-width="1024" data-toggle="lightbox" data-gallery="youtubevideos" class="news-card__card-link">
						<button type="button" class="btn btn-play">
							<span class="glyphicon glyphicon-play" aria-label="Play"></span>
						</button>
						<img src="//i1.ytimg.com/vi/rFWhI254Io0/mqdefault.jpg" class="img-responsive">
					</a>
				</div>
			</div> <!-- content-wrapper -->
		</div> <!-- container -->
	</div> <!-- fh5co-press -->
	
	<%@ include file="./header/footer.jsp"%>

	<!-- 로그인 모달창 -->
						  <div class="modal" id="loginModal" role="dialog">
						   <div class="modal-dialog">
						    <div class="modal-content">
						     <div class="modal-header">
						      <button type="button" class="close" data-dismiss="modal">×</button>
						     </div>
						     <div class="modal-body">
						      <jsp:include page="member/loginForm.jsp"></jsp:include>
						     </div>
						    </div>
						   </div>
						  </div>
					 </li>
		          </ul>
		        </div>
		        
			  <!-- Modal -->
			<div class="modal fade" id="myMessage" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div id="messageType" class="modal-content panel-info">
						<div class="modal-header panel-heading">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">${msgType}</h4>
						</div>
						<div class="modal-body">
							<p id="">${msg}</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>

				</div>
			</div>
	
	<!-- jQuery -->
	<script src="js1/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js1/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js1/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js1/jquery.waypoints.min.js"></script>
	<!-- Owl Carousel -->
	<script src="js1/owl.carousel.min.js"></script>

	<!-- For demo purposes only styleswitcher ( You may delete this anytime ) -->
	<script src="js1/jquery.style.switcher.js"></script>

	<!-- Main JS (Do not remove) -->
	<script src="js1/main.js"></script>
	
	<!-- 팀원소개 js 시작 -->
	<script src="js1/teamIntro.js"></script>
	<!-- 팀원소개 js 끝-->

	</body>
</html>

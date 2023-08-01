<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>

<!-- css 파일 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css?after">
<!-- home_슬라이드쇼 만들기 https://swiperjs.com/demos#responsive-breakpoints -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<!-- @media query 사용하기 위해 viewport 설정 -->
<script src="/kgstudy/resources/js/jquery.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />

</head>
<body>
	
	
	<%@include file="../include/header.jsp" %>
	
	
	<!-- home section -->
	<section class="home" id="home">
	
		<div class="swiper home-slider">
		
			<div class="swiper-wrapper">
			
				<div class="swiper-slide slide" style="background: url('${pageContext.request.contextPath}/resources/img/home-1.jpg')no-repeat;">
					<div class="content">
						<span class="con_span">고객의 취향을 맞춘 다양한 공간</span>
						<h3 class="con_h3">STUDY<br>TOGETHER</h3>
						<a href="/kgstudy/store/find.do" class="btn_main">지점보기</a>
					</div>
				</div>
				
				<div class="swiper-slide slide" style="background: url('${pageContext.request.contextPath}/resources/img/home-2.jpg')no-repeat;">
					<div class="content">
						<span class="con_span">고객의 취향을 맞춘 다양한 공간</span>
						<h3 class="con_h3">STUDY<br>TOGETHER</h3>
						<a href="/kgstudy/store/find.do" class="btn_main">지점보기</a>
					</div>
				</div>
				
				<div class="swiper-slide slide" style="background: url('${pageContext.request.contextPath}/resources/img/home-3.jpg')no-repeat;">
					<div class="content">
						<span class="con_span">고객의 취향을 맞춘 다양한 공간</span>
						<h3 class="con_h3">STUDY<br>TOGETHER</h3>
						<a href="/kgstudy/store/find.do" class="btn_main">지점보기</a>
					</div>
				</div>
				
			</div>
			
			<div class="swiper-button-next"></div>
    		<div class="swiper-button-prev"></div>
			
		</div>
		
	</section> <!-- home section end -->
	
	<!-- home courses slider start -------------------------------------------------------- -->
	
	<div class="courses_box">
		<div class="courses_div">STUDY TOGETHER MANAGMENT SYSTEM</div>
	</div>
	
	<section class="home-courses">
	
		<div class="swiper home-courses-slider">
			
			<div class="swiper-wrapper">
			
				<div class="swiper-slide slide-courses">
					<div class="courses-img">
						<img class="ci" src="${pageContext.request.contextPath}/resources/img/course-1.png">
						<h3 class="ch3">편리한 예약 시스템</h3>
					</div>
					<div class="content-courses">
						<h3 class="c_h3">STUDY TOGETHER</h3>
						<p class="c_p">편리하게 이용권 구매와<br>좌석 선택을 할 수 있는<br> 예약 시스템을 가지고 있습니다.</p>
						<a href="#" class="btn_main">예약하기</a>
					</div>
				</div>
				
				<div class="swiper-slide slide-courses">
					<div class="courses-img">
						<img class="ci" src="${pageContext.request.contextPath}/resources/img/course-2.png">
						<h3 class="ch3">함께 공부할 수 있는 스터디룸</h3>
					</div>
					<div class="content-courses">
						<h3 class="c_h3">STUDY TOGETHER</h3>
						<p class="c_p">스터디 및 협업을 할 수 있는<br>스터디룸 공간이 있습니다.</p>
						<a href="/kgstudy/seat/seat.do" class="btn_main">예약하기</a>
					</div>
				</div>
				
				<div class="swiper-slide slide-courses">
					<div class="courses-img">
						<img class="ci" src="${pageContext.request.contextPath}/resources/img/course-3.jpg">
						<h3 class="ch3">집중이 잘되는 다양한 공간</h3>
					</div>
					<div class="content-courses">
						<h3 class="c_h3">STUDY TOGETHER</h3>
						<p class="c_p">쾌적하고, 넉넉한 좌석들로<br>편안한 스터디 환경을 제공합니다.</p>
						<a href="/kgstudy/seat/seat.do" class="btn_main">예약하기</a>
					</div>
				</div>
				
				<div class="swiper-slide slide-courses">
					<div class="courses-img">
						<img class="ci" src="${pageContext.request.contextPath}/resources/img/course-4.png">
						<h3 class="ch3">주도적인 학습</h3>
					</div>
					<div class="content-courses">
						<h3 class="c_h3">STUDY TOGETHER</h3>
						<p class="c_p">주도적인 학습을 위해<br>마이페이지에서<br>학습시간을 확인하실 수 있습니다</p>
						<a href="/kgstudy/seat/seat.do" class="btn_main">예약하기</a>
					</div>
				</div>

			</div>
		
		</div>
		
	</section> <!-- home courses slider end -->
	
	<%@include file="../include/footer.jsp" %>
	
	<script>
		let loginMsg = "${loginMsg}"; //로그인 성공 메세지
	
		if (loginMsg) {
			alert(loginMsg);
		}
	</script>
	<script>
		let logoutMsg = "${logoutMsg}"; //로그아웃 메세지
	
		if (logoutMsg) {
			alert(logoutMsg);
		}
	</script>
	
	
	<!-- home_슬라이드쇼 -->
	<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
	<!-- main JS 파일 -->
	<script src="${pageContext.request.contextPath}/resources/js/main/main.js"></script>
	
</body>
</html>
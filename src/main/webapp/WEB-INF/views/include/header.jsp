<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<!-- css 파일 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/header.css?after">
<!-- 구글 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Nunito:wght@200;300;400;600;700&display=swap" rel="stylesheet">
<!-- 아이콘 가져오기 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<!-- @media query 사용하기 위해 viewport 설정 -->
<meta name="viewport" content="width=device-width,initial-scale=1" />

</head>
<body>

	<!-- header section -->
	<div id="menu-bars" class="fas fa-bars"></div> <!-- 창이 작아지면 메뉴바 생김 -->

	<header>
		
		<a href="/kgstudy/main.do" class="logo"><img src="${pageContext.request.contextPath}/resources/img/logo.png" width="180"></a>
		
		<nav class="navbar">
			<a href="/kgstudy/main.do">home</a>
			<a href="/kgstudy/store/find.do">지점찾기</a>
			<a href="#">소식</a>
			<a href="#">리뷰</a>
			<a href="/kgstudy/order/passOrder.do">이용권구매</a>
			<a href="#">예약</a>
		</nav>
		
		
		<div class="follow"> <!-- 아이콘 -->
		
		<c:choose>
				<c:when test="${loginUser.user_grant == 'user'}">
					<a href="/kgstudy/userStudyChartView.do" id="user_page" class='fa fa-user'></a> <!-- 마이페이지 -->
					<a href="/kgstudy/logout.do" id="logout" class='fas fa-user-slash'></a> <!-- 로그아웃 -->
					<!-- <a href="#" id="ask" class='fas fa-headphones-alt'></a> 고객센터(문의) -->
				</c:when> 
				<c:when test="${loginUser.user_grant == 'admin'}">
					<a href="#" id="admin_page" class='fas fa-user-cog'></a> <!-- 관리자페이지 -->
					<a href="/kgstudy/logout.do" id="logout" class='fas fa-user-slash'></a> <!-- 로그아웃 -->
					<!-- <a href="#" id="ask" class='fas fa-headphones-alt'></a> 고객센터(문의) -->
				</c:when> 
				<c:otherwise> 
					<a href="/kgstudy/loginPageView.do" id="login" class='fa fa-unlock'></a> <!-- 로그인 -->
				</c:otherwise>
		</c:choose>
		</div>
		
	</header>
	
	<script src="${pageContext.request.contextPath}/resources/js/main/header.js"></script>
	<!-- header section end -->
	
</body>
</html>
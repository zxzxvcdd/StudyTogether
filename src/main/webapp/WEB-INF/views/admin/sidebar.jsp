

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	<!-- header section -->
	<div id="menu-bars" class="fas fa-bars"></div> <!-- 창이 작아지면 메뉴바 생김 -->

	<header>
		
		<div>
			
			
	
			<a href="/kgstudy/main.do" class="logo"><img src="${pageContext.request.contextPath}/resources/img/logo.png" width="180" style="margin-bottom: 5px;"></a><br>
				
				<div style="font-size:20px; color:#badc58;">(관리자 페이지)</div>
		</div>
		
		<nav class="navbar">
			<a href="/kgstudy/getMemberList.do">사용자관리</a>
			<a href="/kgstudy/store/getMenuList.do">이용권 관리</a>
			<a href="/kgstudy/board/getOrderList.do">결제관리</a>
			<a href="/kgstudy/reviewListView.do">이용 통계 분석</a>
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
					<a href="/kgstudy/userStudyChartView.do" id="user_page" class='fa fa-user'></a> <!-- 마이페이지 -->
					<a href="/kgstudy/logout.do" id="logout" class='fas fa-user-slash'></a> <!-- 로그아웃 -->
					<!-- <a href="#" id="ask" class='fas fa-headphones-alt'></a> 고객센터(문의) -->
				</c:when> 
				<c:otherwise> 
					<a href="/kgstudy/loginPageView.do" id="login" class='fa fa-unlock'></a> <!-- 로그인 -->
				</c:otherwise>
		</c:choose>
		</div>
		
	</header>

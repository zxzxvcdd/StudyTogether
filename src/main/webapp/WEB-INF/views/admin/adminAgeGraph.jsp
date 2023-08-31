<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<meta charset="UTF-8">
<title>이용 통계 분석 페이지</title>

<%@ include file="../include/static-header.jsp"%>

<!-- css 파일 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/memberManager.css?after">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/adminGraph.css?after">

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.min.js"></script>

</head>


<body>


	<%@include file="sidebar.jsp"%>

	<section class="content_graph_section">

		<div class="content_hedear_wrap ">

			<ul class="paymentList">
				<li class="select_btn_list">
					<div class="select_btn">
						<button type="button" class="btn_select_list"
							onclick="location.href='/kgstudy/admin/MaeGraphPage.do'">월별
							매출 차트</button>
					</div>
					<div class="select_btn">
						<button type="button" class="btn_select_list"
							onclick="location.href='/kgstudy/admin/AgeGraphPage.do'">나이대별
							인원수 차트</button>
					</div>
				</li>
			</ul>

		</div>

		<div class="content_wrap">
			<div class="chart_content_bax">
				<div class="chart_container">

					<div class="chart_ex">

						<h2>[ 나이대별 인원수 차트 ]</h2>

						<img
							data-src="http://localhost:8080/kgstudy/resources/fileUpload/rGraph/${imgName}.png"
							width="650px" style="margin-bottom: 5px;">

					</div>

				</div>
			</div>
		</div>

	</section>


	<script>
	function toggleShow() {
		//event.stopPropagation();
		$(".AgeGraph").toggleClass("show");
		
	};

	toggleShow();
	
	// lazy loading
	const images = document.querySelectorAll('[data-src]');

	const intersectionObserver = new IntersectionObserver((entries,observer)=>{
	  entries.forEach(entry=>{
	     if(!entry.isIntersecting) return;
	    const src = entry.target.getAttribute('data-src');
	    entry.target.src=src;
	    observer.unobserve(entry.target);
	  })
	},{
	    threshold:0.9,
	  })
	  
	images.forEach(image=>{
		  intersectionObserver.observe(image);
		})
	</script>

</body>
</html>
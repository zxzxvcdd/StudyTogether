<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>

<!-- css 파일 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/userStudyChartList.css?after">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/userStudyChartView.css?after">

<!-- jquery -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.min.js"></script>
<!-- chart js CDN -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>

</style>
</head>
<body>

	<%@include file="../include/header.jsp"%>

	<section class="mypage" id="mypage">

		<div class="payment">
			
			<!-- --------------------------------------------------- -->
			<ul class="paymentList">
				<li class="select_btn_list">
					<div class="select_btn">
						<button type="button" class="btn_select_list" onclick="location.href='userStudyChartView.do'">
							나의 학습 정보
						</button>
					</div>
					<div class="select_btn">
						<button type="button" class="btn_select_list" onclick="location.href='userModifyCkView.do'">
							개인정보 확인/수정
						</button>
					</div>
				</li>
			</ul>
			<!-- --------------------------------------------------- -->
			
			<!-- --------------------------------------------------- -->
			<!-- 구매한 이용권 현황 => 없으면 :보유하고 있는 이용권 없습니다. -->
			<ul class="paymentList">
					<li class="paymentItem">
						<div class="item">

							<div class="order_date">
								<strong>[ 이용권 현황 ]</strong>
							</div>
				<%-- <c:forEach var="dto" items="${dtoList}"> --%>
							<div class="product_content">
								<div class="product_content_list">
									<div class="content_list_box">
										<label class="pcon-label">이용권이름 : </label>
											<c:set var="placeName" value="${dto.order.placeName}" /> <!-- 지점명 자르기 위해서 -->
                                   	 		<c:set var="pLen" value="${fn:length(placeName)}" /> <!-- 지점명 자르기 위해서 -->
										<label class="pcon-label">지점 이름 : ${fn:substring(placeName,8,pLen)}</label>
										<label class="pcon-label">총 금액 : ${dto.order.totalPrice} 원</label>
										<button type="button" class="btn_refund_order" data-total-price="${dto.order.totalPrice}" data-imp-uid="${dto.order.impUid}">환불하기</button>
									</div>	
								</div>
							</div>

						</div> 
						
					</li>
				<%-- </c:forEach> --%>
			</ul> <!-- paymentList-end -->
			<!-- --------------------------------------------------- -->
			
			<!-- --------------------------------------------------- -->
			<!-- 날짜 선택해서 1주일간 일일 공부시간 보여주기 -->
			<ul class="paymentList">
				<li class="select_list_study">
					<div class="con-date">
						<div class="con-strong">
							<strong>[ 나의 학습정보 ]</strong>
						</div>
						<label class="con-label">날짜 선택</label> 
						<input type="date" id="date" min="1800-01-01"> 
						<label class="con-label">1주일간 나의 총 공부 시간 : </label> 
					</div>
					
					<!-- 여기에 chart.js 뜨도록 -->
					<canvas id="myChart" width="400" height="400"></canvas>
					
				</li>
			</ul>
			<!-- --------------------------------------------------- -->
			
		</div>
		<!-- payment div end -->

	</section> <!-- mypage section end -->

	<%@include file="../include/footer.jsp"%>

	<script>
	
	const ctx = document.getElementById('myChart').getContext('2d');
	
	const myChart = new Chart(ctx, {
	    type: 'bar',
	    data: {
	        labels: ['월', '화', '수', '목', '금', '토', '일'],
	        datasets: [{
	            label: '# of Votes',
	            data: [12, 19, 3, 5, 2, 3, 3], //시간단위
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	    	plugins: {
	    	    legend: {
	    	      display: false,
	    	    }
	    	  },
	        scales: {
	            y: {
	                beginAtZero: true
	            }
	            
	        }
	    }
	}); //chart.js-end
	
	</script>

</body>
</html>
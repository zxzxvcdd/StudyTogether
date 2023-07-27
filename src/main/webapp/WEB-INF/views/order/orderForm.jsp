<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>결제</title>

<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/order/order-form.js"></script>

<!-- css 파일 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/order/order-form.css?after">
<!-- jquery -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.min.js"></script>

</head>

<body>

	<%@include file="../include/header.jsp"%>
	
	<div class="container" style="justify-content: center">
		<h1>상품 상세</h1>
		
		<!-- 상품 선택 =================================================== -->
		<div class="form-group menu-list-form">

			<div class="order-title">
				<div>상품 유형</div>
			</div>

				<div style="display: flex; width: 50%; margin-bottom: 3px;">
					<input type="radio" id="pass-time" name="pass" checked>
					<p>시간권</p>
				</div>
				<div style="display: flex; width: 50%; margin-bottom: 3px;">
					<input type="radio" id="pass-day" name="pass">
					<p>기간권</p>
				</div>
			
		</div>
		
		<!-- 상품 선택(시간권) =================================================== -->
		<div class="form-group menu-list-form menu-list-con time dblock">

			<div class="order-title">
				<div>상품 선택</div>
			</div>
			
			<c:forEach var="timePass" items="${resMap.timePassList}">
				<div style="display: flex; width: 50%; margin-bottom: 3px;">
					<input type="radio" class="pass timePass" name="menuId" data-price="${timePass.passPrice }" value="${timePass.menuId}">
					<p style="margin-right: 20px;">${timePass.menuName}</p>
					<p class="price" id="${timePass.passPrice}"><fmt:formatNumber value="${timePass.passPrice}" pattern="#,###" />원</p>
				</div>
			</c:forEach>
			
		</div>
		
		<!-- 상품 선택(기간권) =================================================== -->
		<div class="form-group menu-list-form menu-list-con day">

			<div class="order-title">
				<div>상품 선택</div>
			</div>

			<c:forEach var="dayPass" items="${resMap.dayPassList}">
				<div style="display: flex; width: 50%; margin-bottom: 3px;">
					<input type="radio" class="pass dayPass" name="menuId" data-price="${dayPass.passPrice }" value="${dayPass.menuId}">
					<p style="margin-right: 20px;">${dayPass.menuName}</p>
					<p class="price" id="${dayPass.passPrice}"><fmt:formatNumber value="${dayPass.passPrice}" pattern="#,###" />원</p>
				</div>
			</c:forEach>
				
		</div>
		
		<!-- 결제 수단 =================================================== -->
		<div>
			<div class="form-group" style="flex-wrap: wrap; display: flex;">
				<label style="width: 100%;" class="font">결제 수단</label>

				<div style="display: flex; width: 50%">
					<input type="radio" id="kakaopay" name="payment-method"
						value="kakaopay" checked>
					<p for="kakao-pay">카카오페이</p>
				</div>
				<div style="display: flex; width: 50%">
					<input type="radio" id="kcp" name="payment-method" value="kcp">
					<p for="credit-card">신용카드</p>
				</div>
				<div style="display: flex; width: 50%">
					<input type="radio" id="payco" name="payment-method" value="payco">
					<p for="payco">페이코</p>
				</div>
				<div style="display: flex; width: 50%">
					<input type="radio" id="tosspay" name="payment-method"
						value="tosspay">
					<p for="tosspay">토스페이</p>
				</div>
			</div>
		</div>


		<div class="total-price" style="display: flex; text-align: center; justify-content: center">
			<p class="font">결제 금액 : &nbsp;</p>
			<p class="font total-price-value"></p>
			<p class="font">원</p>
		</div>
	</div>
	
	<div class="buttons">
		<button id="pay-button" onclick="javascript:order.go_pay()">결제하기</button>
		<button id="back-button" onclick="history.back()">뒤로가기</button>
	</div>
	
	<script>
		$("input:radio[name=pass]").click(function(){
		    $(".menu-list-con").toggleClass("dblock");
		});
	/* 	
		let n = "${loginUser.user_id}";
	 */	
		let n = "admin01";
		
	
		
	</script>
	
	<script>
		// 선택한 상품 값을 가져오기
	    $('.pass').click(function(){
	    	let passPrice = $(this).data("price");
	    	/* console.log(passPrice); */
			$(".total-price-value").text(passPrice.toLocaleString());
			$(".total-price-value").data("menu_id",$(this).val());
		});
	</script>
	
</body>
</html>
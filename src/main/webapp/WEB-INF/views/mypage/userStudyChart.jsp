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
					<div class="select_btn">
						<button type="button" class="btn_select_list" onclick="location.href='userReviewView.do?user_id=${loginUser.user_id}'">
							나의 리뷰 관리
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
										<label class="pcon-label">남은 기간 : </label>
										<label class="pcon-label">남은 시간 : </label>
										<label class="pcon-label">총 금액 : 원</label>
										<button type="button" class="btn_refund_order" data-total-price="${dto.order.totalPrice}" data-imp-uid="${dto.order.impUid}">환불하기</button>
									</div>	
								</div>
							</div>
							
							<div>
								<button type="button" class="btn_order_list" onclick="arccodionMenu(${dto.order.orderId})"> 구매한 이용권 상세보기</button>
							</div>
							
						</div> 
						
						<!-- 구매한 이용권 상세보기 -->
						<div id="content${dto.order.orderId}" class="content">
							<ul class="paymentList">
								<c:set var="totalAmount" value="0" />

								<!-- --------------------------------------------------- -->
								<c:forEach var="payments" items="${dto.paymentsList}">

									<li class="orderOneView">
										<div class="itme-one">

											<!-- 구입한 상품정보들 -->
											<div class="product_content">
												<div class="product_content_list">
													<img alt="상품1"
														src="/kgCoffee/img/menuImg/${payments.fileName}">
												</div>

												<div class="product_content_list">
													<div class="content_list_box">
														<h3 class="menu_name">${payments.menuName}</h3>
														<!-- 각상품들의 이름 -->
														<a class="order_total">${payments.menuPrice} 원</a>
														<!-- 각 상품들의 가격 -->
														<a class="order_total">${payments.menuAmount} 개</a>
														<!-- 각상품들의 수량 -->
													</div>
												</div>
											</div>

										</div>
									</li>
									<c:set var="totalAmount"
										value="${totalAmount + payments.menuAmount }" />

								</c:forEach>
								<!-- <hr class="hr_view"> -->
								<div class="order_total_view">
									<strong>[ 결제 정보 ]</strong><br>
									<p>지점명 : ${fn:substring(placeName,8,pLen)}</p>
									<p>총 수량 : ${totalAmount} 개</p>
									<p>총 금액 : ${dto.order.totalPrice} 원</p>
								</div>
							</ul>


						</div>
						<!-- 구매한 이용권 상세보기 -->
						
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
					
					<!-- chart.js -->
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
		            label: '',
		            data: [1, 3, 5, 10, 2, 3, 3], //시간단위
		            backgroundColor: [
	/*  	            'rgba(255, 99, 132, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 0.2)',
		                'rgba(153, 102, 255, 0.2)', */
		                'rgba(22, 160, 133,0.2)'
		            ],
		            borderColor: [
	/*  	            'rgba(255, 99, 132, 1)',
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(153, 102, 255, 1)',  */
		                'rgba(22, 160, 133,1)'
		            ],
		            borderWidth: 1
		        }]
		    },
		    options: {
		    	plugins: {
		    	    legend: {
		    	      display: false, //라벨 없애기
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
	
	<script>
	
		$(".btn_refund_order").click(function refundOrder(){
	
			if(confirm("해당 주문을 환불하시겠습니까?")){
	
				let imp_uid = $(this).data("imp-uid");
				let total_price= $(this).data("total-price");
	
				let reqUrl = "/kgCoffee/order/api/refund.do";
	
				console.log(imp_uid)
	
				
				console.log(total_price)
	
				$.ajax({
	                type : "POST",
	                url : reqUrl,
	                data : {
	                    // 저장할 pay 정보 넣어서 서버 보내서 DB 테이블 저장
	                    imp_uid : imp_uid,
	                    total_price: total_price,
	
	
	                },
	                success:function(res_data) {
	
	                	
	                    var res = JSON.parse(res_data);
	                    
	                    console.log(res);
						
						var msg = res.msg;
						console.log(msg);
	                    if(!(msg===null)){
	
	                        if(msg==="refund-success"){
	                            alert("환불이 완료되었습니다.");
								location.reload(true);
	
	                        }else if(msg==="delete-faild"){
	
	                            alert("결제 실패.");
	
	                        }else if(msg==="refund-faild"){
	                            alert("refund-faild");
	
	                        }
	
	                    }
	
	                }
	            })
	
			}
			
		})
	
		
		//아코디언 메뉴 클릭 이벤트
		function arccodionMenu(orderId){
		    $("#content"+orderId).toggleClass("show");
		}
	
	</script>

</body>
</html>
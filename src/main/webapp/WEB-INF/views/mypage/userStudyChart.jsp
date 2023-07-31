<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
			<!-- 구매한 이용권 현황 => 없으면 : 보유하고 있는 이용권 없습니다. -->
			<ul class="paymentList">
					<li class="paymentItem">
					<c:choose>
					<c:when test="${resMap.sumPassTime != 0}"> 
						<div class="item">

							<div class="order_date">
								<strong>[ 이용권 현황 ]</strong>
							</div>
							
							<div class="product_content">
								<div class="product_content_list">
									<div class="content_list_box">
										<label class="pcon-label">총 남은 시간 : <fmt:formatNumber value="${resMap.sumPassTime / 3600}" pattern="#" /> 시간 </label>
										<label class="pcon-label">총 금액 : ${resMap.totalPrice }원</label>
									</div>	
								</div>
							</div>
							
							<div>
								<!-- <button type="button" class="btn_order_list" onclick="arccodionMenu()"> 구매한 이용권 상세보기</button> -->
								
								<div style="display: flex; width: 50%; margin-bottom: 3px;">
									<input type="radio" id="pass-time" name="pass" checked>
									<p>시간권</p>
								</div>
								<div style="display: flex; width: 50%; margin-bottom: 3px;">
									<input type="radio" id="pass-day" name="pass">
									<p>기간권</p>
								</div>
							</div>
							
						</div> 
						
						<!-- 구매한 이용권 상세보기 -->
						<!-- ---------------------------------------------------------------- -->
							<div class="form-group menu-list-form menu-list-con time dblock">

								<div class="order-title">
									<div>시간권 상세보기</div>
								</div>
								
								<c:forEach var="timePass" items="${resMap.timePassList}">
								
									<div style="display: flex; width: 50%; margin-bottom: 3px;">
						
										<p style="margin-right: 20px;">${timePass.passName}</p>
										<p class="price" id="${timePass.passPrice}"><fmt:formatNumber value="${timePass.passPrice}" pattern="#,###" />원</p>
									</div>
								
								</c:forEach>
								
							</div>
							
							<!-- 상품 선택(기간권) =================================================== -->
							<div class="form-group menu-list-form menu-list-con day">
					
								<div class="order-title">
									<div>기간권 상세보기</div>
								</div>
					
								<c:forEach var="dayPass" items="${resMap.dayPassList}">
									<div style="display: flex; width: 50%; margin-bottom: 3px;">
										<p style="margin-right: 20px;">${dayPass.passName}</p>
										<p class="price" id="${dayPass.passPrice}"><fmt:formatNumber value="${dayPass.passPrice}" pattern="#,###" />원</p>
									</div>
								</c:forEach>
									
							</div>
							
							
							
							<%-- <ul class="paymentList">
								<c:set var="totalAmount" value="0" />

								<!-- --------------------------------------------------- -->
								<c:forEach var="payments" items="${resMap.timePassList}">

									<li class="orderOneView">
										<div class="itme-one">

											<!-- 구입한 상품정보들 -->
											<div class="product_content">
												<div class="product_content_list">
													<div class="content_list_box">
														<h3 class="menu_name">${payments.menuName}</h3>
														<!-- 각상품들의 이름 -->
														<a class="order_total">${payments.menuPrice} 원</a>
														<!-- 각 상품들의 가격 -->
														<a class="order_total">${payments.menuAmount} 개</a>
														<!-- 각상품들의 수량 -->
														<button type="button" class="btn_refund_order" data-total-price="${dto.order.totalPrice}" data-imp-uid="${dto.order.impUid}">환불하기</button>
													</div>
												</div>
											</div>

										</div>
									</li>
									<c:set var="totalAmount"
										value="${totalAmount + payments.menuAmount }" />

								<!-- <hr class="hr_view"> -->
								<div class="order_total_view">
									<strong>[ 결제 정보 ]</strong><br>
									<p>지점명 : ${fn:substring(placeName,8,pLen)}</p>
									<p>총 수량 : ${totalAmount} 개</p>
									<p>총 금액 : ${dto.order.totalPrice} 원</p>
								</div>
								</c:forEach>
							</ul>
 --%>

						<!-- </div> -->
						</c:when>
						
						<c:when test="${resMap.sumPassTime == 0}"> 
							<div class="pass_none">
								<b class="pass_none">보유한 이용권이 없습니다.</b>
							</div>
						</c:when>
						
						</c:choose>
						
					</li>

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
							<div class="con-margin">
								<label class="con-label">총 공부 시간 : ${resMap.sumTime } 시간 </label> 
							</div>
							
						<form id="frm3" action="userStudyChartView.do" method="get">
							<div>
								<label class="con-label">시작 날짜</label> 
								<input type="date" class="studyDate startDate" name="startDate">
								<label class="con-label">종료 날짜</label> 
								<input type="date" class="studyDate endDate" name="endDate">
								<button onclick="formSubmit();" class="btn-tazone">검색</button>
							</div>
						</form>
						
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
	var resMap = "${resMap}";
	makeChart();
	
	
	
	
	function makeChart() {	// 데이터를 가져왔을때 동작. 매개변수로 data 입력
			

			
	
		
			
				chartShow();

		} //chartSend()-end
	
	function chartShow() {

		var chartDatas = [];
		var chartLabels = [];
		var chartTitle;
		let reservList = [];
		<c:forEach var="reserv" items="${resMap.reservList}" varStatus="status">
		chartDatas.push(parseInt("${reserv.useTime/3600}"))

		</c:forEach>
		
		<c:forEach var="date" items="${resMap.reservDates}" varStatus="status">
		chartLabels.push("${date}");	

		</c:forEach>
		
		console.log(chartDatas);
		
	

		var context = document.getElementById('myChart');



		var myChart = new Chart(context, {
			type: 'bar', // 차트의 형태
			data: { // 차트에 들어갈 데이터

				labels: chartLabels, //x 축

				datasets: [  //데이터
					{
						label: chartTitle, //차트 제목
						fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
						data: chartDatas,
						backgroundColor: [	//색상
							'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(255, 159, 64, 0.2)'
						],
						borderColor: [	//경계선 색상
							'rgba(255, 99, 132, 1)',
							'rgba(54, 162, 235, 1)',
							'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)',
							'rgba(153, 102, 255, 1)',
							'rgba(255, 159, 64, 1)'
						],
						borderWidth: 1 //경계선 굵기
					}
				]
			},
			options: {
				scales: {
					y: {
						beginAtZero: true
					}
				}
			}
		});

	} //chartShow()-end
		
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
	
		
		
		if("${search}"){

		
		//오늘 날짜
		let startDate= new Date(20+"${search.startDate}");
		let endDate=  new Date(20+"${search.endDate}");

		startDate.setDate(startDate.getDate()+1)
		endDate.setDate(endDate.getDate()+1)

		
		$(".endDate").val(endDate.toISOString().slice(0,10));
		
		//1주일 전 날짜
		$(".startDate").val(startDate.toISOString().slice(0,10));
	
		}else{


					//오늘 날짜
		let now = new Date();
		let today = now.toISOString().slice(0,10);
		$(".endDate").val(today);
		
		//1주일 전 날짜
		$(".startDate").val(new Date(now.setDate(now.getDate()-7)).toISOString().slice(0,10));

		}
	</script>
	
	<script>	
	
		function formSubmit(){
			$("#frm3").submit();
		}
		
		
		
		$("input:radio[name=pass]").click(function(){
		    $(".menu-list-con").toggleClass("dblock");
		});

	</script>

</body>
</html>
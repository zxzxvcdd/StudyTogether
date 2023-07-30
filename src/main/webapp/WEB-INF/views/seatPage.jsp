<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/seatPage.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<%-- <script src="${pageContext.request.contextPath }/resources/js/seatPage.js" /> --%>
<style>
body {
	width: 100%;
	font-family: 'Spoqa Han Sans Neo', sans-serif;
}

div.wrapper {
	width: 100%;
}

.content_wrap {
	width: 100%;
	position: relative;
	margin: 0 auto;
	padding: 20px;
}

.seatinfo_wrap_1 {
	box-sizing: border-box;
	box-shadow: 1px 1px 5px #ddd;
	height: 10vh;
	margin-bottom: 10px;
	text-align: center;
	width: 90%;
	display: inline-block;
	font-size: 15px;
	font-weight: 500;
	color: #333
}

.seat_wrap {
	background: white;
	width: 90%;
	height: 60vh;
	border-radius: 0.28571rem;
	box-shadow: 1px 1px 5px #ddd;
}

.add_btn {
	background: gray;
	width: 50px;
	height: 50px;
	position: absolute;
	top: 20%;
	right: 10%
}

.seatinfo {
	box-sizing: border-box;
	width: 100%;
	min-width: 40px;
	display: block;
	border-bottom: 1px solid #ddd;
	box-shadow-bottom: 1px 1px 5px #ddd;
	color: gray;
}

.seatinfo div {
	box-shadow-right: 1px 1px 5px #ddd;
}

.seatinfo div:last-child {
	box-shadow-right: none;
	border-right: none;
}

.seatinfo_title {
	width: 24.3%;
	display: inline-block;
	box-sizing: border-box;
}

.seatinfo_content {
	box-sizing: border-box;
	width: 24.3%;
	display: inline-block;
}

.seatinfo_bar {
	height: 35px;
	position: relative;
	display: inline-block;
	width: 6px;
	margin-left: -3px;
	margin-right: -3px;
	z-index: 10;
	vertical-align: middle;
	box-sizing: border-box;
	border: 3px solid transparent;
}

.seat_wrap ul {
	display: inline-flex;
	margin: 0;
	padding-left: 0;
	cursor: inherit;
	list-style: none;
}

.seat_wrap ul li {
	list-style-type: none;
	margin-right: 10px;
	font-size: .1px;
	font-weight: 500;
	color: #575962;
}

.seat_wrap ul li span {
	display: inline-block;
	width: 9px;
	height: 9px;
	margin-top: 4px;
	margin-right: 5px;
	border-radius: 10px;
	background-color: white;
	vertical-align: top;
	margin-right: 0px;
}

.seat_check {
	text-align: center;
}

.seat_list {
	zoom: 0.9;
}



.box {
	font-size: 0.75rem;
	height: 40px;
	width: 40px;
	box-shadow: 1px 1px 5px #ddd;
	border: solid 1px white;
	color: black;
	border-radius: 5px;
	cursor: pointer;
	text-align: center;
	display: inline-block;
}

.box:hover {
	top: 0;
	right: 0;
	transform: translate(0, 0);
	z-index: 400;
	width: 50px;
	height: 50px;
}

.seat_color1 {
	background-color: green;
}

.seat_color2 {
	background-color: red;
	cursor: default;
}

.box.seat_color2:hover, .box.seat_color3:hover {
	top: 0;
	right: 0;
	transform: translate(0, 0);
	z-index: 400;
	width: 40px;
	/* 기존 크기로 복원 */
	height: 40px;
	/* 기존 크기로 복원 */
}

.seat_color3 {
	background-color: gray;
	cursor: default;
}

.myseat {
	cursor: pointer;
	background-color: violet;
}

.box .active {
	display: block;
}

.container {
	display:none; 
	position: absolute; top : 0;
	bottom: 0;
	left: 0;
	right: 0;
	margin: auto;
	max-width: 400px;
	margin: 30px auto 10px;
	background-color: rgba(0, 0, 0, 0.06);
	border-radius: 5px;
	padding: 0px 0px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	top: 0;
}

.inner_modal{
	display: block;
}


.container h1 {
	font-size: 30px;
	text-align: center;
	padding: 10px 20px;
	margin-bottom: 0px;
	background: #fff;
}

.form-group {
	padding: 20px;
	margin-bottom: 3px;
	background: #fff;
}

.order-title {
	display: block;
	clear: both;
}

.order-title > div {
	float: right;
}

.order-title > div:first-child {
	float: left;
	font-size: 20px;
}

.order-title div:last-child {
	font-size: 20px;
	font-weight: 550;
	width: 100%;
	
}

/* .order-title div:nth-child(2) div {
	
} */

.menu-list-form .font {
	margin-bottom: 0px;
	padding-bottom: 20px;
	box-sizing: border-box;
	height: 40px;
}

.menu-list-form:has(div.show) {
	padding-bottom: 10px;
}

.menu-list-form:has(div.show) .font {
	border-bottom: 2px solid rgba(0, 0, 0, 0.1);
	transition: all 0.5s ease-in-out;
}

.menu-list-form:has(div.show) .open-menu {
	border: 0;
}

.menu-list-form:has(div.show) .open-menu::after {
	transform: rotate(-180deg);
}

.menu-list-con {
	display: none; 
	
}

.menu-list-con.dblock {
	display: block;
	box-shadow: 1px 1px 5px #ddd;
}

.buttons {
	text-align: center;
	/* margin: 20px 0; */
	box-shadow:  1px 1px 5px #ddd;
	
	padding: 20px;
    background: #fff;
	
}

button {
	padding: 10px 20px;
	margin-right: 10px;
	font-size: 16px;
	border: none;
	border-radius: 5px;
	color: #fff;
	background-color: #FDD000;
	cursor: pointer;
}

button:hover {
	background-color: #F0F0F0;
	color: #000;
}

textarea, input[type="text"] {
	width: 100%;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

input[type="radio"] {
	margin-right: 5px;
}



</style>
</head>

<body>
	<div class="wrapper">
		<div class="content_wrap">
			<div class="seatinfo_wrap_1">
				<div class="seatinfo">
					<div class="seatinfo_title">지점명</div>
					<div class="seatinfo_title">전체좌석</div>
					<div class="seatinfo_title">사용좌석</div>
					<div class="seatinfo_title">여유좌석</div>
				</div>
				<div class="seatinfo">
					<div class="seatinfo_content">1</div>
					<div class="seatinfo_content">1</div>
					<div class="seatinfo_content">1</div>
					<div class="seatinfo_content">1</div>
				</div>
			</div>
			<div class="seat_wrap">
				<div class="seat_check">
					<ul>
						<li><span style="background: #669934"></span> 이용 가능</li>
						<li><span style="background: #6b6c68"></span> 이용 불가</li>
						<li><span style="background: #cd3333"></span> 이용중</li>
						<li><span style="background: violet"></span> 본인 좌석</li>
					</ul>
				</div>


				<!-- ========== 테스트 ====================== -->
					<c:set var="userId" value="aa" />


				<!-- 좌석 리스트 -->
				<div class="seat_list">
					<c:forEach var="vo" items="${seat }">

						<!-- 사용자 본인 자리 확인 -->
						<c:choose>
	
							<c:when test="${loginUser.user_id eq vo.userId && vo.seatType=='N'}">

								<div class="box myseat" data-id="${vo.seatId}"
									data-type="${vo.seatType}" data-name="${vo.seatName }"
									onclick="checkOut(this)">${vo.seatName}</div>
							</c:when>
							<c:otherwise>

								<div class="box" data-id="${vo.seatId}"
									data-type="${vo.seatType}" data-name="${vo.seatName }"
									onclick="addConfirm(this)">${vo.seatName}</div>

							</c:otherwise>
						</c:choose>
					</c:forEach>

				</div>

			</div>
		</div>

		<!-- ================ !모달창! ==================== -->
		<div class="container" style="justify-content: center">
			<h1>이용권</h1>

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

	
				
			</div>



			<!-- 상품 선택(기간권) =================================================== -->
			 <div class="form-group menu-list-form menu-list-con day">

					<div class="order-title">
						<div>상품 선택</div>
					</div>


				</div> 

			<div class="buttons">
				<button id="pay-button" onclick="checkIn()">사용하기</button>
				<button id="back-button" onclick="location.href='/order/passOrder.do'">구매하기</button>
				<button id="reset-button" onclick="resetModal()">취소</button>
			</div>

		</div>



	</div>



	<!-- <nav class="add_btn"></nav> -->











	<Script>
				let seat = "${loginUser.user_id}";

				console.log(seat);

				/* ================= 좌석상태 색깔 처리 ============================== */
				$(document).ready(function () {

					$(".box").each(function (i, seat) {

						let seatType = $(this).data("type");

						if (seatType === "Y") {
							$(this).addClass('seat_color1');
						} else if (seatType === "N") {
							$(this).addClass('seat_color2');
						} else if (seatType === "D") {
							$(this).addClass('seat_color3');
						}


					})
				})
				
				
				
				
				
				
				/* 모달창 취소 이벤트 */
				function resetModal(){
					$(".container").removeClass('inner_modal');
				}
				
				
				/* 모달창 이벤트 */
				function addModal(timePassList, dayPassList){
					
					
					$(".container").addClass('inner_modal');
					
					let $time = $(".menu-list-form.time");
					let $day = $(".menu-list-form.day");
					
					console.log(timePassList);
					
					/* 사용자 시간권 */
					for(var timePass in timePassList){	
						
						timePass =timePassList[timePass];
						console.log(timePass);
						console.log(timePass.passPrice);
						
						
						
						let newEl = document.createElement("div");
						
						let innerText = "";
						
						newEl.style.cssText ="display: flex; width: 50%; margin-bottom: 3px;"

						
						
						
						innerText +=
							
							"	<div style='display: flex; width: 150%; margin-bottom: 3px;'>"
							+ "		<input type='radio' class='pass timePass' name='menuId'"
							+ "			data-price='"+timePass.passPrice +"' value='" + timePass.menuId +"'>"
							+ "		<p style='margin-right: 10px;'>"+timePass.passName+"</p>"
							+ "		<p class='price' id='"+timePass.passPrice+"'>"
							+ 			timePass.passPrice
							+ "			원"
							+ "		</p>";
						
							
						
						
						newEl.innerHTML = innerText;
						
						console.log(newEl)
						$time.append(newEl);
						
						
					}
					
					
					/* 사용자 기간권 */
					for(var dayPass in dayPassList){
						
						let newEl = document.createElement("div");
						
						let innerText = "";
						
						dayPass =dayPassList[dayPass];
						
						newEl.style.cssText ="display: flex; width: 50%; margin-bottom: 3px;"

						
						
						
						innerText +=
							
							"	<div style='display: flex; width: 150%; margin-bottom: 3px;'>"
							+ "		<input type='radio' class='pass dayPass' name='menuId'"
							+ "			data-price='"+dayPass.passPrice +"' value='" + dayPass.menuId +"'>"
							+ "		<p style='margin-right: 10px;'>"+dayPass.passName+"</p>"
							+ "		<p class='price' id='"+dayPass.passPrice+"'>"
							+ 			dayPass.passPrice
							+ "			원"
							+ "		</p>";
						
							
						
						
						
						newEl.innerHTML = innerText;
						
						$day.append(newEl);
							
						
					}
					
					/* 모달창 라디오 이벤트 */
					$("input:radio[name=pass]").click(function(){
					    $(".menu-list-con").toggleClass("dblock");
					});


					
				}
				
				
		




				/* ======================= 퇴실처리 ============================= */

				function checkOut(seatElement) {

					if (confirm("퇴실하시겠습니까?")) {
						var seatId = $(seatElement).data("id");
						var seatType = $(seatElement).data("type");
						var seatName = $(seatElement).data("name");
						var seatVO = {
							seatId: seatId,
							seatType: seatType,
							seatName: seatName
						};

						var reqUrl = "seatCheckOut.do";



						$.ajax({
							url: reqUrl,
							type: "POST",
							contentType: "application/json",
							data: JSON.stringify(seatVO),

							success: function (data) {
	
								console.log(data);
								let msg = data;
								if (msg) {

									if (msg === "success") {
										$(seatElement).removeClass('seat_color2');
										$(seatElement).addClass('seat_color1');
										alert("퇴실");
										location.reload();


									}


								}
							}

						})


					}





				};



			


				/* ================ 좌석선택 메소드 ========================== */
				function addConfirm(seatElement) {

					 var userId = '${loginUser.user_id}'; 
				
					
					console.log(userId);
					
					/* 로그인 확인 처리 */
					if (userId != "") {

						if ($(seatElement).data("type") === "Y") {

							
							
							if (confirm("좌석을 선택하시겠습니까?")) {

								
								
								var reqUrl = "getPassList.do";



								



								$.ajax({
									url: reqUrl,
									type: "POST",
									contentType: "application/json",
									data: "",

									success: function (data) {

										console.log(data);
										let res = data;
										
										let timePassList = res.timePassList;
										let dayPassList =res.dayPassList;
										
										addModal(timePassList, dayPassList);


										}
									})

								}
								
								
						
							}
						}else {
							alert("로그인 후 이용해주세요");

					} 

					}









				


				
				function checkIn(seatElement) {
					
					var seatId = $(seatElement).data("id");
					var seatType = $(seatElement).data("type");
					var seatName = $(seatElement).data("name");
					var seatVO = {
						seatId: seatId,
						seatType: seatType,
						seatName: seatName
					};


			
					var reqUrl = "seatChecke.do";



					$.ajax({
						url: reqUrl,
						type: "POST",
						contentType: "application/json",
						data: JSON.stringify(seatVO),

						success: function (data) {

							console.log(data);
							let msg = data;
							if (msg) {

								if (msg === "success") {
									
									
									
									$(seatElement).removeClass('seat_color1');
									$(seatElement).addClass('seat_color2');

									alert("예약성공");
									location.reload();

								} else if (msg == "fail") {
									alert("이미 이용중인 좌석입니다.");
								} else if (msg === "checkedIN") {

									alert("1인 1좌석만 이용 가능합니다.");
								}




							}
						}

					})

				}
					
				
			










			</Script>

</body>

</html>
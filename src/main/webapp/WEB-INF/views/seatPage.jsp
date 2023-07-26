<%@page import="com.spring.kgstudy.seat.vo.TestUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/seatPage.css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
  <%-- <script src="${pageContext.request.contextPath }/resources/js/seatPage.js"/> --%>
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

.seatinfo div{

	box-shadow-right: 1px 1px 5px #ddd;	


}
.seatinfo div:last-child{

	box-shadow-right: none;	
	border-right: none;


}
.seatinfo_title {
	width: 24.3%;
	display: inline-block;
	box-sizing:border-box;

}

.seatinfo_content {

	box-sizing:border-box;
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

.seat_wrap ul{
	display: inline-flex;
	margin: 0;
    padding-left: 0;
    cursor: inherit;
    list-style: none;
    
}

.seat_wrap ul li{
	 list-style-type: none;
	 margin-right: 10px; 	
	 font-size: .1px;
    font-weight: 500;
    color: #575962;
}

.seat_wrap ul li span{

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

.seat_check{
	text-align: center;
	
}


.seat_list{
	zoom: 0.9;
}

.seat_list{

}

 .box{
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

.box:hover{
	top: 0;
    right: 0;
    transform: translate(0,0);
    z-index: 400;
    width: 50px;
    height: 50px;
}

.seat_color1{
	background-color: green;
		
}

.seat_color2{
	background-color: red;
	cursor: default;

    
}

.box.seat_color2:hover,.box.seat_color3:hover {
  top: 0;
  right: 0;
  transform: translate(0,0);
  z-index: 400;
  width: 40px; /* 기존 크기로 복원 */
  height: 40px; /* 기존 크기로 복원 */
}

.seat_color3{
	background-color: gray;
	cursor: default;
}

.box{
	
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
					<li><span style="background: #669934"></span>
						이용 가능
					</li>
					<li><span style="background: #6b6c68"></span>
						이용 불가
					</li>
					<li><span style="background: #cd3333"></span>
						이용중
					</li>
				</ul>
			  </div>
			  
			  
			  <!-- ========== 테스트 ====================== -->
			 <%
    			String userId = "admin";
   				 TestUser loginUser = new TestUser(userId);
    			request.setAttribute("loginUser", loginUser);
			%>
			  
			  
			  
			  <!-- 좌석 리스트 -->
			  <div class="seat_list">
			  	<c:forEach var="vo" items="${seat }" >
			  	  
			  	  <!-- 사용자 본인 자리 확인 -->
			  	  <c:choose>
			  	  
			  	  	<c:when test="${loginUser.userId eq vo.userId}">
			  	  	
			  			<div class="box myseat" data-id="${vo.seatId}" data-type="${vo.seatType}" data-name="${vo.seatName }" onclick="addConfirm(this)">${vo.seatName} </div>
			  	  	</c:when>
			  	  	<c:otherwise>
			  			<div class="box" data-id="${vo.seatId}" data-type="${vo.seatType}" data-name="${vo.seatName }" onclick="addConfirm(this)">${vo.seatName} </div>

					</c:otherwise>
		  		</c:choose>
		  	</c:forEach>
		  </div>
		</div>
			<nav class="add_btn"></nav>

		</div>







	</div>

	<Script>
		let seat = "${seat}";

		console.log(seat);
		
	/* ================= 좌석상태 색깔 처리 ============================== */
	$(document).ready(function() {
		
		$(".box").each(function(i,seat){
			
			let seatType = $(this).data("type");
			
			if(seatType==="Y"){
				$(this).addClass('seat_color1');	
			}else if(seatType==="N"){
				$(this).addClass('seat_color2');
			}else if(seatType==="D"){
				$(this).addClass('seat_color3');
			}
			
			
		})
		
		
		
		
		
		
		
		/* ======================= 퇴실처리 ============================= */
	 
		$(".myseat").click(function(){
				
			if(confirm("퇴실하시겠습니까?")){
				var seatId = $(this).data("id");
				var seatType = $(this).data("type");
				var seatName = $(this).data("name");
				var seatVO = {
					    seatId: seatId,
					    seatType: seatType,
					    seatName: seatName
					  }; 
				
				var reqUrl = "seatCheckOut.do";
				
				
				
				$.ajax({
					url : reqUrl,
					type : "POST",
					contentType: "application/json",
					data : JSON.stringify(seatVO),   
				
					success : function(data) {
						
						console.log(data);
						let msg = data;
						if(msg){
						
							if(msg==="success"){
								$(this).removeClass('seat_color2');
								$(this).addClass('seat_color1');
								alert("퇴실");
								location.reload(); 
								
								
							}
						
						
						}
					}
						
				})
				
				
			}
			
			
			
		})
		
	});
	
	
	
	
	
			
		/* ================ 좌석선택 메소드 ========================== */
		function addConfirm(seatElement){
			  
			if($(seatElement).data("type")==="Y"){
				
				if(confirm("좌석을 선택하시겠습니까?")){
					
					console.log($(seatElement));
					
					var seatId = $(seatElement).data("id");
					var seatType = $(seatElement).data("type");
					var seatName = $(seatElement).data("name");
					var seatVO = {
						    seatId: seatId,
						    seatType: seatType,
						    seatName: seatName
						  };
					
					
					console.log(JSON.stringify(seatVO));
					
					var reqUrl = "seatChecke.do";
					
					
					
					console.log($(this));
					
	
					
					$.ajax({
						url : reqUrl,
						type : "POST",
						contentType: "application/json",
						data : JSON.stringify(seatVO),
					
						success : function(data) {
							
							console.log(data);
							let msg = data;
							if(msg){
							
								if(msg==="success"){
									$(seatElement).removeClass('seat_color1');
									$(seatElement).addClass('seat_color2');
									alert("예약성공");
									location.reload(); 
									
								}
							
							
							}
						}
							
					})
					
				}
			}
				
				
					
					
			         
		         
		

		
		      };

		  
		
	
	
	
		
		
		
		
		
		
		
	</Script>

</body>
</html>
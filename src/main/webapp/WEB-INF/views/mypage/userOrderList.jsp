<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<!DOCTYPE html>
<html>
<head profile="http://www.w3.org/2005/10/profile">
 
<meta charset="UTF-8">
<title>review</title>

<!-- jquery -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.min.js"></script>
<!-- css 파일 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/userModify.css?after">

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
.content_wrap{

    display: grid;
    align-content: center;
    width: 700px;
    box-shadow: rgba(0, 0, 0, 0.08) 0px 2px 4px 0px, rgba(0, 0, 0, 0.16) 0px 0px 1px 0px;
    background-color: rgb(255, 255, 255);
    margin-bottom: 20px;
    padding: 25px;

}
.content_title_wrap{


	font-size: 24px;
	border-bottom: 4px solid #e5e5e5

}
.order_list_wrap{
	
	
	margin: 0 auto;
	width: 80%;
	padding: 20px 0;
	

}

.order_detail{
	
	list-style: none;

	
	font-size: 18px;
	border-bottom: 3px solid #a5a5a5;
	
	padding: 5px 10px;
	margin-bottom: 10px;
	
}


.order_detail_content{
	
}
.order_detail_content>*{

	font-size: 18px;
	display: inline-block;
	margin: 10px 0;
	width: 20%;
	font-weight: 500;

}
.order_detail_content>*:first-child{

	margin-left: 70px;
}
.order_date{
	font-size: 20px;
	font-weight: 700;
	display: block;


}
.order_state{

	color: darkred;

}
.btn_refund{


	color: yellow;

}

.btn_refund { 

    min-height: 34px;
	background-color: #f9ca24;
	color: #fff;
   
	border-radius: 10px;
    font-weight: 500;
    
}

.btn_refund:hover { 
	background-color: #ecf0f1;
    color: #2f3640;
}
.board_page {
	margin-top: 30px;
	text-align: center;
	font-size: 0;
}

.board_page a {
    background: #fff;
	display: inline-block;
	width: 40px;
	height: 35px;
	box-sizing: border-box;
	vertical-align: middle;
	border: 1px solid #ddd;
	line-height: 100%;
	border-radius: 4px;
}

.board_page a.bt {
	padding-top: 10px;
	font-size: 1.2rem;
	letter-spacing: -1px;
}

.board_page a.num {
	padding-top: 9px;
	font-size: 1.4rem;
	margin-left: 3px;
}

.board_page a.num.on {
	/*    border-color: #000; */
	background: #f9ca24;
	color: #fff;
}

.board_page a:first-child {
	border-left: 1px solid #ddd;
}


</style>





</head>
 <%@ include file="../include/static-header.jsp" %> 
<body>

	<%@include file="../include/header.jsp"%>

	<section class="modify" id="modify">

		<div class="modify-mg">

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
					<div class="select_btn active">
						<button type="button" class="btn_select_list" onclick="location.href='myOrderList.do'">
							결제 목록 확인
						</button>
					</div>
				</li>
			</ul>


			<ul class="modifyList">
				
		
				
				<li class="content_wrap"> 
				
					<div class="content_title_wrap"> 
						<b class="content_title">결제 목록</b>
					</div>
					

					<ul class="order_list_wrap">

						<c:forEach var="order" items="${resMap.orderList}" varStatus="status" >
							<li class="order_detail">
								<div class="order_date"><fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd"/></div>
								<div class="order_detail_content">
									
									<div class="order_name">${order.orderName} </div>
									<div class="order_state">
										<b>
											<c:if test="${order.orderState=='PAID'}">
												결제완료
											</c:if>
											<c:if test="${order.orderState=='PENDING_REFUND'}">
												환불 대기중
											</c:if>	
											<c:if test="${order.orderState=='REFUNDED'}">
												환불완료
											</c:if>
										</b>
									</div>
									<div class="order_price">${order.orderPrice}원</div>
									<c:if test="${order.orderState=='PAID'}">
										<button type="button" class="btn_refund" onclick="refundOrder('${order.orderId}')">환불하기</button>
									</c:if>
								</div>
							</li>
						</c:forEach>
					</ul>
						
						<c:choose>
							<c:when test="${resMap.orderList == '[]'}">
								<div class="order_none">
									<b class="order_none">결제 내역이 없습니다.</b>
								</div>
							</c:when>
						</c:choose>
						
			
					<c:set var="action" value="myOrderList.do?type=${resMap.search.type}&keyword=${resMap.search.keyword}"/>

					<div id="paging" class="board_page">
						<!-- 1~10까지 있는 페이지의 페이징 -->
				
						<c:if test="${resMap.paging.prev}">
							<a href="${action}&pageNum=${resMap.paging.beginPage-1}" class="bt prev"><</a>
						</c:if>

						<c:forEach begin="${resMap.paging.beginPage}" end="${resMap.paging.endPage}"
							step="1" var="index">
							<c:choose>
								<c:when test="${resMap.paging.page.pageNum==index}">
									<a href="${action}&pageNum=${index}" class="num on">${index}</a>
								</c:when>
								<c:otherwise>
									<a href="${action}&pageNum=${index}" class="num">${index}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:if test="${resMap.paging.next}">
							<a href="${action}&pageNum=${resMap.paging.endPage+1}" class="bt next">></a>
						</c:if>
					</div>
					
						
						
						
				</div>

				</li> <!-- reviewView end -->
				<!-- --------------------------------------------------------------------- -->
				
				
			</ul>
			<!-- modifyList end -->

		</div>
		<!-- modify-mg div end -->

	</section>

	<%@include file="../include/footer.jsp"%>

	<script>
	

	
		let msg = "${msg}";
		
		if(msg) {
			alert(msg);
		}
		
		/* -------------------------------------------------- */

		function refundOrder(orderId){

			let reqUrl = "/kgstudy/order/refund.do";
			
			if(!confirm("환불하시겠습니까?"))return;
			
			$.ajax({
	                type : "POST",
	                url : reqUrl,
	                data : {
	                    
	                    orderId:orderId,
	
	                },
	                success:function(msg) {
						
						
						alert(msg);
						window.location.reload();
					}


				});

		}
		
	</script>

</body>
</html>
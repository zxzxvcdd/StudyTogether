<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<meta charset="UTF-8">
<title>주문
관리페이지</title>

 <%@ include file="../include/static-header.jsp" %> 




<!-- css 파일 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/orderManager.css?after">


<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.min.js"></script>

</head>


<body>


	<%@include file="sidebar.jsp"%>




	<section class="content_section">


		<div class="content_hedear_wrap ">


			<ul class="modify-mg">
				<li class="modify_name">
					<h2 class="h2" align="center">주문 관리 페이지</h2>
				</li>
			</ul>

		</div>
		<div class="content_wrap">
			<div class="content">
				<div class="board_wrap">

					<div>
						<form id="frm1" action="orderList.do"
							method="get" enctype="multipart/form-data">
							<div class="board_search_wrap">
                         

								<ul class="board_ul">
                            
                       
									<li class="board_search_select">
										<div class="input_select_wrap input_wrap2">
											<select name="type">

                                                <option value="id">아이디</option>
                                                <option value="order">주문번호</option>
                                                <option value="name">주문명</option>
                                                <option value="date">주문날짜</option>
											</select>
										</div>
						
										<div class="input_text_wrap input_wrap2">
											<label> <input type="text" name="keyword"
												value="${resMap.search.keyword}" placeholder="검색어를 입력하세요"
												required="required">
											</label>
										</div>
									</li>
									<li class=bt_wrap><a href="#" onclick="searchOrder();"
										class="on">검색</a> <a href="#" onclick="refundOrder()"
										class="on">환불</a>
                                    </li>
                                    <li class="grant_wrap">
                                        <div class="grant_radio">
                                        주문상태 : 
                                        <input type="radio" name="grant" value="" checked>모두
                                        <input type="radio" name="grant" value="PAID">결제완료
                                        <input type="radio" name="grant" value="PENDING_REFUND">환불대기
                                        <input type="radio" name="grant" value="REFUNDED">환불완료
										</div>
                                    </li>
								</ul>
							</div>
						</form>
					</div>

	
					<form id="frm2" action="orderRefund.do"
						method="post" enctype="multipart/form-data">

						<div class="board_list_wrap">
							<div class="board_list">
								<div class="top">
									<div class="check">
										<input type="checkbox" class="check" name="checkIdAll"
											id="allCheck">
									</div>
									<div class="order_id">주문번호</div>
									<div class="id">아이디</div>
									<div class="order_name">주문이름</div>
									<div class="pass_state">이용권상태</div>
									<div class="pass_time">이용권 남은시간</div>
									<div class="order_price">금액</div>
									<div class="order_date">주문날짜</div>
									<div class="order_state">주문상태</div>
								</div>

                                <c:forEach var="order" items="${resMap.orderList}">
								<div class="order_content">
									
										<div class="check">
											<input type="checkbox" class="check" name="orderId"
												value="${order.orderId}">
										</div>
										<div class="order_id">
											${order.orderId}
										</div>
										<div class="id">${order.userId}</div>
										<div class="order_name">${order.orderName}</div>
										<div class="pass_state">${order.passState}</div>
										<div class="pass_time">
										
										<c:if test="${order.passType=='TIME'}">
										<fmt:parseNumber var="format_hh" value="${order.passTime/3600}"  integerOnly="true"/>
										<fmt:formatNumber var="format_mm" value="${order.passTime%3600/60}" pattern="0"/>
										${format_hh}시간 ${format_mm}분
										</c:if>
										<c:if test="${order.passType=='SEASON'}">
										<fmt:formatDate value="${order.passStart}" pattern="yyyy-MM-dd"/> 
										~ 
										<fmt:formatDate value="${order.passEnd}" pattern="yyyy-MM-dd"/>
										</c:if>
										</div>
										<div class="order_price">${order.orderPrice}원</div>
										<div class="order_date"><fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd"/></div>
										<div class="order_state">
											<c:if test="${order.orderState=='PAID'}">
												결제완료
											</c:if>
											<c:if test="${order.orderState=='PENDING_REFUND'}">
												환불 대기중
											</c:if>	
											<c:if test="${order.orderState=='REFUNDED'}">
												환불완료
											</c:if>
										</div>
									
								</div>
                                </c:forEach>
							</div>
						</div>
					</form>

                    <c:set var="action" value="orderList.do?type=${resMap.search.type}&keyword=${resMap.search.keyword}"/>

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

			</div>
		</div>
	</section>


	<script>

    let msg = "${msg}";

    if (msg) {
        alert(msg);
    }

    let url = "getMemberList.do";

    let searchType = "${resMap.search.type}"
	let orderState= "${resMap.search.grant}"

	
    if(searchType){

        $("option[value="+searchType+"]").attr("selected","selected");
        $("input:radio[name='grant']:input[value='"+orderState+"']").attr("checked","true");


    }
	
	$("#user_management").toggleClass("active");
    
	
	
		$(document).ready(function() {
			$("#allCheck").change(function() {
				if (this.checked) {
					$(".check").prop("checked", true);
				} else {
					$(".check").prop("checked", false);
				}
			});
		});




    function searchOrder(){

        document.getElementById("frm1").submit();
    }

    function refundOrder(){
        var temp=confirm("정말 환불하시겠습니까?");

        if(temp){
        document.getElementById("frm2").submit();
        }

    }




	</script>



</body>
</html>
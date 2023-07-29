<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review</title>

<!-- jquery -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.min.js"></script>
<!-- css 파일 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/userModify.css?after">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/review/reviewList.css?after">

<style>
/* 별점 css */
.rate { display: inline-block; border: 0; margin-right: 520px; margin-bottom: 5px;}
.rate > input {display: none;}
.rate > label {float: right; height: 26px; background-color: #fff;}
.rate > label:before {display: inline-block; height: 26px; cursor: pointer; content: url("https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png");}
.rate input:checked ~ label, 
.rate label:hover,.rate label:hover ~ label { height: 26px; background-color: #f27370 !important;} 
.rate input:checked + .rate label:hover,
.rate input input:checked ~ label:hover,
.rate input:checked ~ .rate label:hover ~ label,  
.rate label:hover ~ input:checked ~ label { height: 26px; background-color: #f27370 !important;} 
</style>

</head>
<body>

	<%@include file="../include/header.jsp"%>

	<section class="modify" id="modify">

		<div class="modify-mg">

			<ul class="modifyList">
				<li class="review_name">
					<h3>나의 리뷰 관리</h3>
				</li>
			</ul>


			<ul class="modifyList">
				
				<!-- --------------------------------------------------------------------- -->
				<c:choose>
					<c:when test="${reservationVO != null}">
						<li class="reviewView"> <!-- 리뷰 작성 (이용한 지점이 있으면 뜨도록) -->
							<div class="text-area-store"> <!-- 지점이름 -->
								<b>[ 지점명 : ${reservationVO.storeName} ]</b>
							</div>
		
							<fieldset class="rate"> <!-- 별점 -->
								<input type="radio" id="rating5" name="rating" value="5" onclick="clickStar(this);">
								<label for="rating5" title="5점"></label> 
											
								<input type="radio" id="rating4" name="rating" value="4" onclick="clickStar(this);">
								<label for="rating4" title="4점"></label> 
											
								<input type="radio" id="rating3" name="rating" value="3" onclick="clickStar(this);">
								<label for="rating3" title="3점"></label> 
											
								<input type="radio" id="rating2" name="rating" value="2" onclick="clickStar(this);">
								<label for="rating2" title="2점"></label> 
										
								<input type="radio" id="rating1" name="rating" value="1" onclick="clickStar(this);">
								<label for="rating1" title="1점"></label> 
							</fieldset>	
							
							<div class="text-area-zone"> <!-- 작성하는 text box -->
								<textarea class="tazone" placeholder="후기를 작성해주세요."></textarea>
								<button class="btn-tazone">등록</button><br>
							</div>
							
							<div class="text-file">
								<input type="file" name="file" id="file" class="text-file-btn">
							</div>
							
						</li> <!-- reviewView end -->
					</c:when>
				</c:choose>
				<!-- --------------------------------------------------------------------- -->
				
				<!-- --------------------------------------------------------------------- -->
				
				<li class="reviewViewList"> <!-- 나의 리뷰만 뜨도록 -->
				
					<div class="reviewView-my"> <!-- 별점순, 최신순으로 sort -->
						<b class="cont-user-my">나의 리뷰</b>
					</div>
					
					<div class="reviewView-line"> <!-- 리뷰 content -->
						
					<c:forEach var="reviewList" items="${reviewList}" >
						<div class="review_cont">
							
							<div class="r-area-star"> <!-- 별점 표시 -->
								<ul class="r-star_list">
									<li><span class="rating"></span><img src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>
							
									<li><span class="rating"></span><img src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>
							
									<li><span class="rating"></span><img src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>
							
									<li><span class="rating"></span><img src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>
							
									<li><span class="rating"></span><img src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>
								</ul>
							</div>
							
							<div class="r-cont-area">
								<b class="cont-user-id">${reviewList.user_id }</b><br> <!-- 유저ID -->
								<b class="cont-user-b"><fmt:formatDate value="${reviewList.review_date}" pattern="yyyy-MM-dd"/> | </b> 
								<b class="cont-user-b">지점명 : ${reviewList.store_name}</b>
							</div>
							
							<div class="r-cont-text">
								${reviewList.review_content}
							</div>
							
							<div class="r-cont-img">
								<ul class="inner">
									<li>
										<a href="#">
											<span>
												<img src="${pageContext.request.contextPath}/resources/img/${reviewList.review_filename}" style="width: 165px;">
											</span>
										</a>
									</li>
								</ul>
							</div>
							
						</div>
						</c:forEach>
						
						<c:choose>
							<c:when test="${reviewList == '[]'}">
								<div class="review_none">
									<b class="review-none">작성된 리뷰가 없습니다.</b>
								</div>
							</c:when>
						</c:choose>
						
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
	
		var value = null;
		
		function clickStar(arg0) {
			value = $(arg0).val();
			alert(value + "점 선택"); //별점 테스트
			
		}
		
		/* alert("${reviewList}"); */
		
	</script>

</body>
</html>
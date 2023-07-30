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

</head>
<body>

	<%@include file="../include/header.jsp"%>

	<section class="modify" id="modify">

		<div class="modify-mg">

			<ul class="modifyList">
				<li class="review_name">
					<h3>리뷰</h3>
				</li>
			</ul>


			<ul class="modifyList">
				
				<!-- --------------------------------------------------------------------- -->
				<li class="reviewView"> <!-- 리뷰 통계 -->
					
					<div class="reviewView-line">
						
						<div class="star_area">
							<p class="total">
								총 <em><!-- 리뷰 총 갯수 --></em>건
							</p>
							
							<p class="num">
								<strong>4.8 점</strong> <!-- 총점의 평균 점수 -->
							</p>
							<ul class="star_list">
								<li><span class="rating"></span><img src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>
					
								<li><span class="rating"></span><img src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>
					
								<li><span class="rating"></span><img src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>
					
								<li><span class="rating"></span><img src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>
					
								<li><span class="rating" style="width: 80%;"></span><img src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>
							</ul>
						</div>
				
						<div class="graph_area">
							<ul class="graph_list">
					
								<li><span class="per">83%</span>
									<div class="graph">
										<span style="height: 83%;"></span>
									</div> <span class="txt">5점</span></li>
					
								<li><span class="per">13%</span>
									<div class="graph">
										<span style="height: 13%;"></span>
									</div> <span class="txt">4점</span></li>
					
								<li><span class="per">3%</span>
									<div class="graph">
										<span style="height: 3%;"></span>
									</div> <span class="txt">3점</span></li>
					
								<li><span class="per">1%</span>
									<div class="graph">
										<span style="height: 1%;"></span>
									</div> <span class="txt">2점</span></li>
					
								<li><span class="per">1%</span>
									<div class="graph">
										<span style="height: 1%;"></span>
									</div> <span class="txt">1점</span></li>
							</ul>
						</div>
						
					</div>
					
				</li> <!-- reviewView end -->
				<!-- --------------------------------------------------------------------- -->
				
				<!-- --------------------------------------------------------------------- -->
				<li class="reviewViewList"> <!-- 리뷰 리스트 -->
					
					<div class="reviewView-sort"> <!-- 별점순, 최신순으로 sort -->
						<div class="align_sort">
							<ul id="gdasSort">
								<li><a href="#">별점순</a></li>
								<li><a href="#">최신순</a></li>
								<li>
									<a>지점검색</a>
								</li>
							</ul>
						</div>
					</div>
					
					
					<div class="reviewView-line"> <!-- 나의 리뷰 content -->
						
						<div class="review_cont">
						
							<div class="r-area-star"> <!-- 별점 -->
								<ul class="r-star_list">
									<li><span class="rating" id="star1"></span><img src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>
							
									<li><span class="rating" id="star2"></span><img src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>
							
									<li><span class="rating" id="star3"></span><img src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>
							
									<li><span class="rating" id="star4"></span><img src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>
							
									<li><span class="rating" id="star5"></span><img src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>
								</ul>
							</div>
							
							<div class="r-cont-area">
								<b class="cont-user-id">user01</b><br> <!-- 유저ID -->
								<b class="cont-user-b">2023.07.28 | </b> 
								<b class="cont-user-b">지점명 : 종로점</b>
							</div>
							
							<div class="r-cont-text">
								추천추천!!<br>
								조용하고 집중하기 좋습니다
							</div>
							
							<div class="r-cont-img">
								<ul class="inner">
									<li>
										<a href="#">
											<span>
												<img src="${pageContext.request.contextPath}/resources/img/review_img.jpg" style="width: 165px;">
											</span>
										</a>
									</li>
								</ul>
							</div>
							
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
	
</body>
</html>
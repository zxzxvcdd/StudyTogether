<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<li class="reviewView">
					<!-- 리뷰 통계 -->

					<div class="reviewView-line">

						<div class="star_area">
							<p class="total">
								총 <em>
									${reviewCnt }
								</em>건
							</p>

							<p class="num"><!-- 총점의 평균 점수 -->
								<strong><fmt:formatNumber value="${avgStar}" pattern=".0" /> 점</strong>
								<input class="avgStarNum" type="hidden" value="${avgStar}" >
							</p>
								<ul class="star_list">
									<li><span class="rating avgStar" id="star1"></span><img
										src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>
	
									<li><span class="rating avgStar" id="star2"></span><img
										src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>
	
									<li><span class="rating avgStar" id="star3"></span><img
										src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>
	
									<li><span class="rating avgStar" id="star4"></span><img
										src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>
	
									<li><span class="rating avgStar" id="star5"></span><img
										src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>
								</ul>
						</div>

						<div class="graph_area">
							<ul class="graph_list">
							<fmt:parseNumber var= "star5" integerOnly= "true" value= "${starMap.starCnt5 *100 / reviewCnt}" />
							<fmt:parseNumber var= "star4" integerOnly= "true" value= "${starMap.starCnt4 *100 / reviewCnt}" />
							<fmt:parseNumber var= "star3" integerOnly= "true" value= "${starMap.starCnt3 *100 / reviewCnt}" />
							<fmt:parseNumber var= "star2" integerOnly= "true" value= "${starMap.starCnt2 *100 / reviewCnt}" />
							<fmt:parseNumber var= "star1" integerOnly= "true" value= "${starMap.starCnt1 *100 / reviewCnt}" />
	
								<li><span class="per">${star5}%</span>
									<div class="graph">
										<span class="graph_5"  style="height:${star5}%;"></span>
									</div> <span class="txt">5점</span></li>

								<li><span class="per">${star4}%</span>
									<div class="graph">
										<span class="graph_4"  style="height:${star4}%;"></span>
									</div> <span class="txt">4점</span></li>

								<li><span class="per">${star3}%</span>
									<div class="graph">
										<span class="graph_3"  style="height:${star3}%;"></span>
									</div> <span class="txt">3점</span></li>

								<li><span class="per">${star2}%	</span>
									<div class="graph">
										<span class="graph_2"  style="height:${star2}%;"></span>
									</div> <span class="txt">2점</span></li>

								<li><span class="per">${star1}%</span>
									<div class="graph">
										<span class="graph_1" style="height:${star1}%;"></span>
									</div> <span class="txt">1점</span></li>
							</ul>
						</div>

					</div>

				</li>
				<!-- reviewView end -->
				<!-- --------------------------------------------------------------------- -->

				<!-- --------------------------------------------------------------------- -->
				<li class="reviewViewList">
					<!-- 리뷰 리스트 -->

					<!-- <div class="reviewView-sort">
						별점순, 최신순으로 sort
						<div class="align_sort">
							<ul id="gdasSort">
								<li><a href="#">별점순</a></li>
								<li><a href="#">최신순</a></li>
								<li><a>지점검색</a></li>
							</ul>
						</div>
					</div> -->


					<div class="reviewView-line">
						
						<c:forEach var="rvo" items="${Rlist}" varStatus="status" >
						<div class="review_cont review${status.index}">

							<div class="r-area-star">
								<!-- 별점 -->
								<ul class="r-star_list">
									<li><span class="rating" id="star${status.index}-1"></span><img
										src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>

									<li><span class="rating" id="star${status.index}-2"></span><img
										src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>

									<li><span class="rating" id="star${status.index}-3"></span><img
										src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>

									<li><span class="rating" id="star${status.index}-4"></span><img
										src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>

									<li><span class="rating" id="star${status.index}-5"></span><img
										src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>
								</ul>
							</div>

						
							<div class="r-cont-area">
									<b class="cont-user-id">${rvo.user_id}</b>
									<br>
									<!-- 유저ID -->
									<b class="cont-user-b"><fmt:formatDate value="${rvo.review_date}" pattern="yyyy-MM-dd"/> | </b>
									<b class="cont-user-b">지점명 : ${rvo.store_name}</b>
									<input class="starNum" type="hidden" data-index="${status.index}" value="${rvo.review_star}" >
							</div>

							<div class="r-cont-text">
								${rvo.review_content}
							</div>

							<c:choose> <%-- 사용자가 리뷰를 적었을때 img를 넣었으면 보여주고 안넣었으면 보여주지 말기 --%>
								<c:when test="${rvo.review_filename != null}">
								<div class="r-cont-img">
									<ul class="inner">
										<li>
											<a href="#">
												<span> <%-- 이미지 경로################################## --%>
													<%-- <img src="${pageContext.request.contextPath}/resources/img/${reviewList.review_filename}" style="width: 165px;"> --%>
													<img src="${pageContext.request.contextPath}/resources/fileUpload/${rvo.review_filename}" style="width: 165px;">
												</span>
											</a>
										</li>
									</ul>
								</div>
								</c:when>
							</c:choose>
							
						</div>
						</c:forEach>
					</div>

				</li>
				<!-- reviewView end -->
				<!-- --------------------------------------------------------------------- -->


			</ul>
			<!-- modifyList end -->

		</div>
		<!-- modify-mg div end -->

	</section>

	<%@include file="../include/footer.jsp"%>
	
	<script>
		/* 각각의 게시물의 별점 조절 */
		$(".starNum").each(function(i,el) {

			let star = $(el).val();
			let index = $(el).data("index");
			
			starId ="#star"+index+"-";
			//console.log(star);
			
			for(j=5;j>star;j--){
				
				//console.log(starId+j);
				$(starId+j).css("width","0%");
			}
			
		})
		
		
		/* 전체 게시물의 별점 평점 조절 */
		let avgStarNum = $(".avgStarNum").val();
		
		$(".avgStar").each(function(i,el) {

			let avgStar = "${avgStar}";
		
			for(j=5;j>avgStar;j--){
				$("#star"+j).css("width", 0+"%");
				
			}
			
			var target= "#star"+(parseInt(avgStar/1)+1);
			
			console.log(target);
			
				$(target).css("width", avgStar%1*100+"%");
				
				
		})
		
	</script>
	
	
</body>
</html>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/review/reviewList.css?after">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/board.css?after">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
<script type="text/javascript">
/* 삭제버튼 JQuery */
	$(document).ready(function() {
		$("button").on("click", function(e) {
			var formData = $("#frm");
			var btn = $(this).data("btn");
			if (btn == 'remove') {
				formData.attr("action", "remove.do");
				formData.attr("method", "get")
			} 
			formData.submit();
		});
	});
</script>


<script type="text/javascript">
$(document).ready(function() {
	//페이지 번호 클릭시 이동 하기
	var pageFrm=$("#pageFrm");
	$(".paginate_button a").on("click", function(e){
		e.preventDefault(); // a tag의 기능을 막는 부분
		var page=$(this).attr("href"); // 페이지번호
		pageFrm.find("#page").val(page);
		pageFrm.submit(); 		
	});
});
</script>

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
					<c:when test="${reservationVO != null}"> <!-- 리뷰 작성 (이용한 지점이 있으면 뜨도록) -->
							<li class="reviewView">
							<form id="frm5" action="reviewInsert.do" method="post" enctype="multipart/form-data">
								<div class="text-area-store"> <!-- 지점이름 -->
									<b>[ 지점명 : ${reservationVO.storeName} ]</b>
									<input type="hidden" name="user_id" value="${loginUser.user_id}">
									<input type="hidden" name="store_id" value="${reservationVO.storeId}">
									<input type="hidden" name="store_name" value="${reservationVO.storeName}">
									<input type="hidden" name="reservation_id" value="${reservationVO.reservationId}">
									<input type="hidden" name="review_star" id="inputStar">
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
									<textarea name="review_content" class="tazone" placeholder="후기를 작성해주세요."></textarea>
									<button onclick="formSubmit();" class="btn-tazone">등록</button><br>
								</div>
								
								<div class="text-file">
									<input type="file" name="file" id="file" class="text-file-btn">
								</div>
							</form>
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
						
					<c:forEach var="reviewList" items="${reviewList}" varStatus="status" >
						<div class="review_cont review${status.index}">
							
							<div class="r-area-star"> <!-- 별점 표시 -->
								<ul class="r-star_list">
									<li><span class="rating" id="star${status.index}-1"></span>
									<img src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>
							
									<li><span class="rating" id="star${status.index}-2"></span>
									<img src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>
							
									<li><span class="rating" id="star${status.index}-3"></span>
									<img src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>
							
									<li><span class="rating" id="star${status.index}-4"></span>
									<img src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>
							
									<li><span class="rating" id="star${status.index}-5"></span>
									<img src="https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png"></li>
								</ul>
							</div>
							
							<div class="r-cont-area">
								<b class="cont-user-id">${reviewList.user_id }</b><br> <!-- 유저ID -->
								<b class="cont-user-b"><fmt:formatDate value="${reviewList.review_date}" pattern="yyyy-MM-dd"/> | </b> 
								<b class="cont-user-b">지점명 : ${reviewList.store_name}</b>
								<input class="starNum" type="hidden" data-index="${status.index}" value="${reviewList.review_star}" >
								
								
								
								<a href="remove.do?review_id=${reviewList.review_id}" class="btn btn-warning btn-sm" style="float:right;">삭제</a>
								
							</div>
							
							<div class="r-cont-text">
								${reviewList.review_content}
							</div>
							
							<c:choose> <%-- 사용자가 리뷰를 적었을때 img를 넣었으면 보여주고 안넣었으면 보여주지 말기 --%>
								<c:when test="${reviewList.review_filename != null}">
								<div class="r-cont-img">
									<ul class="inner">
										<li>
											<a href="#">
												<span> <%-- 이미지 경로################################## --%>
													<img src="/kgstudy/resources/fileUpload/${reviewList.review_filename}" style="width: 165px;">
												</span>
											</a>
										</li>
									</ul>
								</div>
								</c:when>
							</c:choose>	
							
						</div>
						</c:forEach>
						
						<c:choose>
							<c:when test="${reviewList == '[]'}">
								<div class="review_none">
									<b class="review-none">작성된 리뷰가 없습니다.</b>
								</div>
							</c:when>
						</c:choose>
						
						
					<!-- 페이징 처리 START -->
					<div style="text-align: center">
						<ul class="pagination">
							<!-- 이전 처리 -->
							<c:if test="${pageMaker.prev}">
								<li class="paginate_button previous"><a
									href="${pageMaker.startPage-1}">이전</a>
									<%-- 	<a href="${cpath}/review/reviewListView.do?page=${pageMaker.startPage-1}">이전</a> --%>
									<%-- 	<a href="${pageMaker.startPage-1}">이전</a> --%>
							</c:if>
							<!-- 페이지 번호 처리 -->
							<c:forEach var="pageNum" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
								<li class="paginate_button ${pageMaker.cri.page==pageNum ? 'active' : ''}">
								<a href="${pageNum}">${pageNum}</a></li>
							</c:forEach>
							<!-- 다음 처리 -->
							<c:if test="${pageMaker.next}">
								<li class="paginate_button previous">
								<a href="${pageMaker.endPage+1}">다음</a> 
								<%-- <a href="${cpath}/review/reviewListView.do?page=${pageMaker.endPage+1}">다음</a> --%>
									<%-- 	<a href="${pageMaker.endPage+1}">다음</a> --%>
							</c:if>

						</ul>
					</div> <!-- END --> <%-- <form id="pageFrm" action="${cpath}/review/reviewListView.do" method="get"> --%>
					<form id="pageFrm" action="/kgstudy/userReviewView.do" method="get">
						<input type="hidden" id="page" name="page" value="${pageMaker.cri.page}" /> 
						<input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum}" />
					</form>
						
						
						
						
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
		function formSubmit(){
			$("#frm5").submit();
		}
	</script>
	
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
		
		/* -------------------------------------------------- */
	
		let msg = "${msg}";
		
		if(msg) {
			alert(msg);
		}
		
		/* -------------------------------------------------- */
		
		var value = null;
		
		function clickStar(arg0) {
			value = $(arg0).val();
			//alert(value + "점 선택"); //별점 선택 잘 되는지 테스트
			
			$("#inputStar").val(parseFloat(value));
			//alert($("#inputStar").val()); //별점 잘 들어가는지 테스트
		}
		
	</script>

</body>
</html>
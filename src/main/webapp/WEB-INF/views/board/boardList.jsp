<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>board List</title>
<meta charset="utf-8">
<!-- css 파일 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/board.css?after">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<script type="text/javascript">
	$(document).ready(function() {
		var result = '${result}';
		console.log("bn:"+result);
		
		checkModal(result);

		$("#regBtn").click(function() {
			location.href = "${cpath}/board/register.do";
		});
		//페이지 번호 클릭시 이동 하기
		var pageFrm=$("#pageFrm");
    	$(".paginate_button a").on("click", function(e){
    		e.preventDefault(); // a tag의 기능을 막는 부분
    		var page=$(this).attr("href"); // 페이지번호
    		pageFrm.find("#page").val(page);
    		pageFrm.submit(); // /kgstudy/board/boardList   		
    	});
    	// 상세보기 클릭시 이동 하기
    	$(".move").on("click", function(e){
    		e.preventDefault(); // a tag의 기능을 막는 부분
    		var board_id=$(this).attr("href");
    		var tag="<input type='hidden' name='board_id' value='"+board_id+"'/>";
    		pageFrm.append(tag);
    		pageFrm.attr("action","${cpath}/board/get.do");
    		pageFrm.attr("method","get");
    		pageFrm.submit();
    	});
	});
	function checkModal(result) {
		if (result == '') {
			return;
		}
		if (result > 0) {
			// 새로운 다이얼로그 창 띄우기
			console.log(result)
			 $(".modal-body").html("게시글 "+result+"번이 등록되었습니다.");
		}
		 $("#myModal").modal("show");
	}
	 function goMsg(){
    	 alert("삭제된 게시물입니다."); // Modal창
     }
</script>

</head>
<body>
<%@include file="../include/header.jsp"%>

<div class="jumbotron text-center">
  <h1>STUDY TOGETHER</h1>
  <p style="color: white;">고객의 취향을 맞춘 다양한 공간!</p>
</div>

	<div class="container">
		<div class="panel panel-success">
			<div class="panel-heading">문의 게시판</div>
			<div class="panel-body">
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th class="center" style="width: 5%">번호</th>
							<th style="width: 55%">제목</th>
							<th class="center" style="width: 15%">작성자</th>
							<th class="center" style="width: 15%">작성일</th>
							<th class="center" style="width: 10%">조회수</th>
						</tr>
					</thead>
					<c:forEach var="vo" items="${list}">
						<tr>
							<td class="center">${vo.board_id}</td>
							<td>
							<c:if test="${vo.boardLevel>0}">
								<c:forEach begin="1" end="${vo.boardLevel}">
									<span style="padding-left: 10px"></span>
								</c:forEach>
								<i class="bi bi-arrow-return-right"></i>
							</c:if>
							<c:if test="${vo.boardLevel>0}">
								<c:if test="${vo.boardAvailable==1}"> 	<!-- XSS를 방지하기 위해 c:out 태그 사용 -->
									<a class="move" href="${vo.board_id}"><c:out value='[RE]${vo.title}'/></a>
								</c:if>
								<c:if test="${vo.boardAvailable==0}">
									<a href="javascript:goMsg()">삭제된 게시물 입니다.</a>
								</c:if>							
							</c:if>
							<c:if test="${vo.boardLevel==0}">
								<c:if test="${vo.boardAvailable==1}">
									<a class="move" href="${vo.board_id}"><c:out value='${vo.title}'/></a>
								</c:if>
								<c:if test="${vo.boardAvailable==0}">
									<a href="javascript:goMsg()">삭제된 게시물 입니다.</a>
								</c:if>
							</c:if>
							</td>
							<td class="center">${vo.writer}
							<td class="center"><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.indate}" /></td>
							<td class="center">${vo.count}</td>
						</tr>
					</c:forEach>
					<c:if test="${!empty loginUser}">
					<tr>
						<td colspan="5">
							<button id="regBtn" class="btn btn-sm btn-success pull-right">글쓰기</button>
						</td>
					</tr>
					</c:if>
					<c:if test="${empty loginUser}">
					<tr>
						<td colspan="5">
							<button disabled="disbaled" id="regBtn" class="btn btn-sm btn-success pull-right">글쓰기</button>
						</td>
					</tr>
					</c:if>
					
				</table>
				
				
				
				
				<!-- 검색 -->
				<div style="text-align: center;">
					<form class="form-inline" action="${cpath}/board/list.do" method="post">
						<div class="form-group">
							<select name="type" class="form-control">
								<option value="writer"
									${pageMaker.cri.type=='writer' ? 'selected' : ''}>작성자</option>
								<option value="title"
									${pageMaker.cri.type=='title' ? 'selected' : ''}>제목</option>
								<option value="content"
									${pageMaker.cri.type=='content' ? 'selected' : ''}>내용</option>
							</select>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="keyword" value="${pageMaker.cri.keyword}">
						</div>
						<button type="submit" class="btn btn-success">검색</button>
					</form>
				</div>





				<!-- 페이징 처리 START -->
				<div style="text-align: center">
				 <ul class="pagination">
				<!-- 이전 처리 -->
				<c:if test="${pageMaker.prev}">
					<li class="paginate_button previous">
					<%-- <a href="${cpath}/board/list.do?page=${pageMaker.startPage-1}">이전</a> --%>
					<a href="${pageMaker.startPage-1}">이전</a>
				</c:if>
				<!-- 페이지 번호 처리 -->
				  <c:forEach var="pageNum" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	         		<li class="paginate_button ${pageMaker.cri.page==pageNum ? 'active' : ''}"><a href="${pageNum}">${pageNum}</a></li>
		  		  </c:forEach>
				<!-- 다음 처리 -->
				<c:if test="${pageMaker.next}">
					<li class="paginate_button previous">
					<%-- <a href="${cpath}/board/list.do?page=${pageMaker.endPage+1}">다음</a> --%>
					<a href="${pageMaker.endPage+1}">다음</a>
				</c:if>
				
				 </ul>
				</div>
				<!-- END -->
				<form id="pageFrm" action="${cpath}/board/list.do?type=${cri}" method="get">
					<input type="hidden" id="page" name="page" value="${pageMaker.cri.page}" />
					<input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum}" />
					<input type="hidden" id="type" name="type" value="${pageMaker.cri.type}" />
					<input type="hidden" id="keyword" name="keyword" value="${pageMaker.cri.keyword}" />
				</form>



				<!-- Modal 추가 -->
				<div id="myModal" class="modal fade" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">MESSAGE</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>
							<div class="modal-body"></div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>

					</div>
				</div>
				<!-- Modal END -->



			</div>
			<!-- <div class="panel-footer">문의 게시판</div> -->
		</div>
	</div>

</body>
</html>
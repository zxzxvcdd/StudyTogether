<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>register</title>
  <meta charset="utf-8">
<!-- css 파일 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/board.css?after">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
/* 버튼 JQuery */
	$(document).ready(function() {
		$("button").on("click", function(e) {
			var formData=$("#frm");
			var btn = $(this).data("btn"); // data-btn="list"
			if (btn == 'reply') {
				formData.attr("action", "${cpath}/board/reply.do");
			} else if (btn == 'list') {
				var formData1=$("#frm1");
				formData1.attr("action", "${cpath}/board/list.do");
				formData1.submit();
				return;
			} else if(btn =='reset'){
				formData[0].reset();
				return;
			}
			formData.submit();
		});
	});
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
        <form id="frm" method="post">
        	<input type="hidden" name="page" value="<c:out value='${cri.page}'/>"/>
			<input type="hidden" name="perPageNum" value="<c:out value='${cri.perPageNum}'/>"/>	
          <!-- board_id(원글, 부모글) -->
          <input type="hidden" name="board_id" value="${vo.board_id}" />
          <input type="hidden" name="user_id" value="${loginUser.user_id}" />
          <div class="form-group">
             <label>제목</label>
             <input type="text" name="title" class="form-control" value="${vo.title}">
          </div>
          <div class="form-group">
             <label>작성자</label>
             <input type="text" readonly="readonly" name="writer" class="form-control" value="${loginUser.user_name}">
          </div>
          <div class="form-group">
             <label>답변</label>
             <textarea rows="10" name="content" class="form-control" value="${vo.content}"></textarea>
          </div>
          <div style="text-align: center;">
          	<button type="button" data-btn="reply" class="btn btn-sm btn-success">답변</button>
          	<button type="button" data-btn="reset" class="btn btn-sm btn-success">취소</button>
          	<button type="button" data-btn="list" class="btn btn-sm btn-success">목록</button>
          </div>
       </form>
       <form id="frm1" method="get">
 		 <input type="hidden" name="page" value="<c:out value='${cri.page}'/>"/>
		 <input type="hidden" name="perPageNum" value="<c:out value='${cri.perPageNum}'/>"/>
		 <input type="hidden" name="type" value="<c:out value='${cri.type}'/>"/>
         <input type="hidden" name="keyword" value="<c:out value='${cri.keyword}'/>"/>
	   </form>
    </div>
    <!-- <div class="panel-footer">문의 게시판</div> -->
  </div>
 </div>
</body>
</html>
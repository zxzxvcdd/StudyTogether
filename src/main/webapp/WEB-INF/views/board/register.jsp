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
        <form action="${cpath}/board/register.do" method="post">
        <input type="hidden" name="user_id" value="${loginUser.user_id}"/>
          <div class="form-group">
             <label>제목</label>
             <input type="text" name="title" class="form-control">
          </div>
          <div class="form-group">
             <label>작성자</label>
             <input type="text" readonly="readonly" name="writer" class="form-control" value="${loginUser.user_name}">
          </div>
          <div class="form-group">
             <label>내용</label>
             <textarea rows="10" name="content" class="form-control"></textarea>
          </div>
          <div style="text-align: center;">
          	<button type="submit" class="btn btn-success btn-sm">등록</button>
          	<button type="reset" class="btn btn-success btn-sm">취소</button>
          	<a href="${cpath}/board/list.do" class="btn btn-success btn-sm">목록</a>
          </div>
       </form>
    </div>
    <!-- <div class="panel-footer">문의 게시판</div> -->
  </div>
 </div>
</body>
</html>
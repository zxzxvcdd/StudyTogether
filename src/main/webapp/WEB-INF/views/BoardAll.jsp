<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/css.css" />


<body>

	<div class="board_wrap">
		<div class="board_title">
			<strong>문의게시판</strong>
		</div>
		<div class="board_list_wrap">
			<div class="board_list">
				<div class="top">
					<div class="num">번호</div>
					<div class="title">제목</div>
					<div class="writer">글쓴이</div>
					<div class="date">작성일</div>
					<div class="count">조회</div>
				</div>
				<div>
					<div class="num">5</div>
					<div class="title">
						<a href="BoardView.do">글 제목이 들어갑니다.</a>
					</div>
					<div class="writer">관리자</div>
					<div class="date">2023.07.20</div>
					<div class="count">33</div>
				</div>
				<div>
					<div class="num">4</div>
					<div class="title">
						<a href="BoardView.do"">글 제목이 들어갑니다.</a>
					</div>
					<div class="writer">관리자</div>
					<div class="date">2023.07.20</div>
					<div class="count">33</div>
				</div>
				<div>
					<div class="num">3</div>
					<div class="title">
						<a href="BoardView.do"">글 제목이 들어갑니다.</a>
					</div>
					<div class="writer">관리자</div>
					<div class="date">2023.07.20</div>
					<div class="count">33</div>
				</div>
				<div>
					<div class="num">2</div>
					<div class="title">
						<a href="BoardView.do"">글 제목이 들어갑니다.</a>
					</div>
					<div class="writer">관리자</div>
					<div class="date">2023.07.20</div>
					<div class="count">33</div>
				</div>
				<div>
					<div class="num">1</div>
					<div class="title">
						<a href="BoardView.do"">글 제목이 들어갑니다.</a>
					</div>
					<div class="writer">관리자</div>
					<div class="date">2023.07.20</div>
					<div class="count">33</div>
				</div>
			</div>
			<div class="board_page">
				<a href="#" class="bt first"><<</a> <a href="#" class="bt prev"><</a>
				<a href="#" class="num on">1</a> <a href="#" class="num">2</a> <a
					href="#" class="num">3</a> <a href="#" class="num">4</a> <a
					href="#" class="num">5</a> <a href="#" class="bt next">></a> <a
					href="#" class="bt last">>></a>
			</div>
			<div class="bt_wrap">
				<a href="BoardWrite.do" class="on">등록</a>
				<!--<a href="#">수정</a>-->
			</div>
		</div>
	</div>
</body>
</html>
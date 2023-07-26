<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify</title>

<!-- jquery -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.min.js"></script>
<!-- css 파일 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/userModify.css?after">

</head>
<body>

	<%@include file="../include/header.jsp"%>

	<section class="modify" id="modify">

		<div class="modify-mg">

			<ul class="modifyList">
				<li class="modify_name">
					<h3>회원 정보 수정</h3>
				</li>
			</ul>


			<ul class="modifyList">

				<li class="modifyView">

					<div class="modify-form">
						<form id="f1" action="userUpdate.do?user_id=${vo.user_id}" method="post">

							<table class="modify-table">

								<tr>
									<th>아이디</th>
									<td>${vo.user_id}</td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td>
										<input type="password" id="pw" name="user_pw" class="user_pw" placeholder="영문, 숫자, 특수문자 중 2가지를 혼합해주세요." required>
									</td>
								</tr>
								<tr>
									<th>이름</th>
									<td>
										<input type="text" id="name" name="user_name" value="${vo.user_name}" required>
									</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>
										<input type="text" name="user_email" id="email" value="${vo.user_email}" required>
									</td>
								</tr>
								<tr>
									<th>생년월일</th>
									<td>
										<input type="date" name="user_birthday" value="<fmt:formatDate value="${vo.user_birthday}" pattern = "yyyy-MM-dd"/>">
									</td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td>
										<input type="text" id="tel" name="user_tel" value="${vo.user_tel}" required>
									</td>
								</tr>
								
								<tr>
									<th>성별 선택</th>
									<td>
									<select id="select_gender" name="user_gender" required>
										<option value="" selected>선택하세요</option>
										<option value="M">남자</option>
										<option value="F">여자</option>
									</select>
									</td>
								</tr>

							</table>

							<div class="modify-button">
								<button type="submit" class="btn_design" onClick="return check();">확인</button>&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn_design" onclick="location.href='userModifyCkView.do'">취소</button>
							</div>

						</form>
					</div>

				</li>
				<!-- modifyView end -->

			</ul>
			<!-- modifyList end -->

		</div>
		<!-- modify-mg div end -->

	</section>

	<%@include file="../include/footer.jsp"%>
	
	<script src="${pageContext.request.contextPath}/resources/js/mypage/userModify.js"></script>
	
	<script>
		let msg = "${msg}";
	
		if (msg) {
			alert(msg);
		}
	</script>

</body>
</html>
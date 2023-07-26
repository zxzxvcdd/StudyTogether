<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css 파일 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/login.css?after">
<!-- jquery -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.min.js"></script>

</head>
<body class="login_body">

	<%@include file="../include/header.jsp"%>

	<!-- join section start ---------------------------------------------------------------- -->
	<div class="container">

		<div class="join-form-box">
			<form action="join.do" method="post" name="joinform">

				<h2>Join</h2>

				<div class="input-box">
					<label class="join-label" id="checkId"></label> 
					<input type="text" name="user_id" id="id" placeholder="아이디" class="input_id" required>
				</div>

				<div class="input-box">
					<input type="password" name="user_pw" id="pw" placeholder="비밀번호" required>
				</div>

				<div class="input-box">
					<input type="text" name="user_name" id="name" placeholder="이름" required>
				</div>

				<div class="input-box">
					<input type="text" name="user_email" id="email" placeholder="이메일" required>
				</div>

				<div class="input-box">
					<p class="font">
						생년월일<br>
					</p>
					<input type="date" name="user_birthday" placeholder="생년월일" required>
				</div>

				<div class="input-box">
					<input type="text" name="user_tel" id="tel" placeholder="전화번호" required>
				</div>

				<div class="con-gender">
					<p class="font">성별 선택</p>
					<select id="select_gender" name="user_gender" required>
						<option value="" selected>선택하세요</option>
						<option value="M">남자</option>
						<option value="F">여자</option>
					</select>
				</div>

				<div class="button">
					<input type="submit" class="btn" value="회원가입" onClick="return check();">
				</div>

			</form>
		</div>

	</div>
	<!-- join section end -->

	<%@include file="../include/footer.jsp"%>

	<!-- main JS 파일 -->
	<script src="${pageContext.request.contextPath}/resources/js/member/join.js"></script>

	<script>
		//아이디 중복 비동기 처리
		$('.input_id').focusout(function() {
			
			let user_id = $('.input_id').val();
			
			$.ajax({
				url: "IdCheck.do",
				type: "post",
				data:{user_id: user_id},
				success: function(result) {
					
					if(result == 1){
						$('#checkId').html('사용할 수 없는 아이디입니다.');
						$('#checkId').css("color", "#eb4d4b");
					} else {
						$('#checkId').html('사용할 수 있는 아이디입니다.');
						$('#checkId').css("color", "#6ab04c");
					}
					
				},
				  error: function (request, status, error) {
				        console.log("code: " + request.status)
				        console.log("message: " + request.responseText)
				        console.log("error: " + error);
				  }
				
			})
			
		}) //.ajax-end
	</script>
	
	<script>
		let joinMsg = "${joinMsg}"; //회원가입 실패 메세지
		
		if (joinMsg) {
			alert(joinMsg);
		}
	</script>

</body>
</html>
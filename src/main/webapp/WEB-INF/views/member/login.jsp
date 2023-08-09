<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- css 파일 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/login.css?after">

<meta charset="UTF-8">
<title>login</title>
</head>
<body class="login_body">
	
	<%@include file="../include/header.jsp" %>
	
	<!-- login section start ---------------------------------------------------------------- -->
	<section class="login">
	
        <div class="form-box">
        
            <div class="form-value">
            
                <form action="login.do" method="post">
                
                    <h2>Login</h2>
                    
                    <div class="inputbox">
                        <ion-icon name="mail-outline"></ion-icon>
                        <input type="text" name="user_id" required>
                        <label>아이디</label>
                    </div>
                    
                    <div class="inputbox">
                        <ion-icon name="lock-closed-outline"></ion-icon>
                        <input type="password" name="user_pw" required>
                        <label>비밀번호</label>
                    </div>
                    
                    <div class="button">
						<input type="submit" class="btn_login" value="로그인">
					</div>
                    
                </form>
                
                <button class="btn_login" onclick="location.href='joinPageView.do'">회원가입</button> <!-- form 밖으로 뺀 이유는 안빼면 회원가입 페이지로 이동을 안함 -->
                <button class="btn_login" onclick="location.href='findAccountPageView.do'">아이디/비밀번호 찾기</button>
                
                <!-- 카카오 로그인 버튼 -->
                <!-- client_id == > 네이버 개발자센터에서 REST API키 를 가져와서 넣기 -->
                <!-- redirect_uri ==> 카카오 로그인에서 사용할 URL 을 넣기 -->
                <a class="p-2" href="https://kauth.kakao.com/oauth/authorize?
					client_id=5c6a09db0cbb787e1692171c6940bdd9&
					redirect_uri=http://localhost:8080/kgstudy/kakaoLogin.do&response_type=code">
					<button class="btn_login" style="background-color: #FEE500;">카카오 로그인</button>
				</a>
				
            </div>
            
        </div>
        
    </section> <!-- login section end -->
	
	
	<%@include file="../include/footer.jsp" %>
	
	<script>
		let loginMsg = "${loginMsg}"; //로그인 실패 메세지
	
		if (loginMsg) {
			alert(loginMsg);
		}
	</script>
	
	<script>
		let joinMsg = "${joinMsg}"; //회원가입 성공 메세지
		
		if (joinMsg) {
			alert(joinMsg);
		}
	</script>
	<script>
		let updatePwMsg = "${updatePwMsg}";
		
		if (updatePwMsg) {
			alert(updatePwMsg);
		}
	</script>
	<script>
		let msg = "${msg}";
		
		if (msg) {
			alert(msg);
		}
	</script>
	
</body>
</html>
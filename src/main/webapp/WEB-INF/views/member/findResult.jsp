<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정정보 찾기</title>

<!-- css 파일 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/findAccount.css?after">

</head>
<body>
	
	<%@include file="../include/header.jsp"%>
	
	<section class="modify" id="modify">
		
		<div class="modify-mg">
		
			<ul class="modifyList">
				<li class="modify_name">
					<h3> 계정정보 찾기 </h3>
				</li>
			</ul>
			
			
			<nav class="find-account-tab">
				<ul class="find-account-list">
					<li class="find-account-id">
						<a class="fa-id" href='findAccountPageView.do'>아이디 찾기</a>
					</li>
				</ul>
				<ul class="find-account-list">
					<li class="find-account-pw">
						<a class="fa-pw" href='findAccountPwPageView.do'>비밀번호 찾기</a>
					</li>
				</ul>
			</nav>
			
			<ul class="modifyList">
			
				<li class="modifyView">
					
					<div class="modify-form">
					
						<p class="find-id-p" align="center">
							${resultVO.user_name} 회원님의 아이디입니다.
						</p>
						
						<p class="find-id-p" align="center" style="color: #f0932b">
							[  ${resultVO.user_id}  ]
						</p>
						
						<div class="modify-button">
							<button class="btn_design"  onclick="location.href='loginPageView.do'">로그인</button>
						</div>
						
					</div>
					
				</li>
			
			</ul>
			
		</div>
		
	</section>
	
	<%@include file="../include/footer.jsp"%>
	    
	<script>	    
		document.getElementById('go-back').addEventListener('click', () => {
			window.history.back();
		});
	</script>
	
</body>
</html>
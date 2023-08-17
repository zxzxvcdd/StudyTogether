<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
  <%@ include file="../include/static-header.jsp" %> 
<meta charset="UTF-8">
<title>modify</title>

<!-- jquery -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.min.js"></script>
<!-- css 파일 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/userModify.css?after">


<link rel="stylesheet" href="/kgstudy/resources/css/admin/default.css?after">
<link rel="stylesheet" href="/kgstudy/resources/css/admin/sidebar.css?after">



</head>
<body>

	<%@include file="sidebar.jsp"%>




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
						<form id="f1" action="modifyMember.do" method="post">

							<table class="modify-table">

								<tr>
									<th>아이디</th>
									<td>
									<input type="text" id="name" name="userId" value="${member.userId}" readonly>
									</td>
									
								</tr>
								<tr>
									<th>이름</th>
									<td>
										<input type="text" id="name" name="userName" value="${member.userName}" required>
									</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>
										<input type="text" name="userEmail" id="email" value="${member.userEmail}" required>
									</td>
								</tr>
								<tr>
									<th>생년월일</th>
									<td>
										<input type="date" name="userBirthday" value="<fmt:formatDate value='${member.userBirthday}' pattern = 'yyyy-MM-dd'/>">
									</td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td>
										<input type="text" id="tel" name="userTel" value="${member.userTel}" required>
									</td>
								</tr>
								
								<tr>
									<th>성별 선택</th>
									<td>
									<select id="select_gender" name="userGender" required>
										<option value="M">남자</option>
										<option value="F">여자</option>
									</select>
									</td>
								</tr>

								<tr>
									<th>사용자 권한 선택</th>
									<td>
									<select id="select_grant" name="userGrant" required>
										<option value="user">user</option>
										<option value="manager">manager</option>
										<option value="admin">admin</option>
									</select>
										<input id="store_list" name="store_list" list="store_list_data" type="text" style="display:none;" placeholder="매장을 선택해 주세요">
										<datalist id="store_list_data" class="store_list_data">
										<c:forEach var="store" items="${storeList}" varStatus="status">
											<c:set var="storeName" value="${store.storeName}" />
											<c:set var="sLen" value="${fn:length(storeName)}" />

											<option data-val="${store.storeId }" id="${fn:substring(storeName,7,sLen)}"
												value="${fn:substring(storeName,7,sLen)}"
												label="${store.storeRoadAddress }">
															</option>

										</c:forEach>
										</datalist>
									</td>
							
								</tr>

							</table>

							<div class="modify-button">
								<button type="submit" class="btn_design" >확인</button>&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn_design" onclick="location.href='document.referer'">취소</button>
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

	<%-- <%@include file="../include/footer.jsp"%> --%>

	<script>
		let msg = "${msg}";
	
		if (msg) {
			alert(msg);
		}


		$("#select_grant").change(function(e){

			console.log("sad");
			if($("#select_grant option:selected").val()==="manager"){

				console.log("qwe");
				$("#store_list").css("display","inline-block");
				

			}else{


				$("#store_list").css("display","none");
				$("#store_list").val("");

			}

		})


		
		let grant = "${member.userGrant}";
		let gender = "${member.userGender}";

		if(gender){

			$("option[value="+gender+"]").attr("selected","selected");


		}

		
		if(grant){

			$("option[value="+grant+"]").attr("selected","selected");


		}





	</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<html>
<head>
<meta charset="UTF-8">
<title>메뉴관리페이지</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous"/>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"
	defer="defer"></script>

 <%@ include file="../include/static-header.jsp" %> 




<!-- css 파일 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/menuManager.css?after">


<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.min.js"></script>
<style>
	h1{
		font-weight:700;
	}
	nav.navbar{
		display:block;
	}
	nav.navbar a{
		text-decoration:none;
	}

</style>

</head>


<body>


	<%@include file="sidebar.jsp"%>
	<form id="delete_form"action="deleteMenu.do" method="post">
		<div class="container" style="justify-content: center">
			<h1>상품 상세</h1>
			
			<!-- 상품 선택 =================================================== -->
			<div class="form-group menu-list-form">

				<div class="order-title">
					<div>상품 유형</div>
				</div>

					<div style="display: flex; width: 50%; margin-bottom: 3px;">
						<input type="radio" id="pass-time" name="pass" checked>
						<p>시간권</p>
					</div>
					<div style="display: flex; width: 50%; margin-bottom: 3px;">
						<input type="radio" id="pass-day" name="pass">
						<p>기간권</p>
					</div>
				
			</div>
			
			<!-- 상품 선택(시간권) =================================================== -->
			<div class="form-group menu-list-form menu-list-con time dblock">

				<div class="order-title">
					<div>상품 선택</div>
				</div>
				
				<div class="pass_con pass_header time_pass_header">
					<input type="checkbox" class="pass ckAll" value="timePass">
					<p class="pass_name">이용권 이름</p>
					<p  class="price" >이용권 가격</p>
					<p class="pass_time" >이용권 시간(초)</p>
				</div>

				<c:forEach var="timePass" items="${resMap.timePassList}" varStatus="status">
					<div class="pass_con ${status.index}">
						<input type="checkbox" class="pass timePass" name="menuId" data-price="${timePass.passPrice }" value="${timePass.menuId}">
						<p class="pass_name"><a href="" data-value="${status.index}">${timePass.menuName}</a></p>
						<p  class="price" id="${timePass.passPrice}"><fmt:formatNumber value="${timePass.passPrice}" pattern="#,###" />원</p>
						<p  class="pass_time" id="${timePass.passTime}">${timePass.passTime}초</p>
						<p  class="pass_type" style="display:none;">${timePass.passType}</p>
					</div>
				</c:forEach>
				
			</div>
			
			<!-- 상품 선택(기간권) =================================================== -->
			<div class="form-group menu-list-form menu-list-con day">

				<div class="order-title">
					<div>상품 선택</div>
				</div>
							<div class="pass_con pass_header time_pass_header">
					<input type="checkbox" class="pass ckAll" value="dayPass">
					<p class="pass_name">이용권 이름</p>
					<p  class="price" >이용권 가격</p>
					<p class="pass_time" >이용권 시간(초)</p>
				</div>



				<c:forEach var="dayPass" items="${resMap.dayPassList}" varStatus="status">
					<div class="pass_con" ${status.index}">
						<input type="checkbox" class="pass dayPass" name="menuId" data-price="${dayPass.passPrice }" value="${dayPass.menuId}">
						<p class="pass_name"><a href="" data-value="${status.index}">${dayPass.menuName}</a></p>
						<p class="price" id="${dayPass.passPrice}"><fmt:formatNumber value="${dayPass.passPrice}" pattern="#,###" />원</p>
						<p  class="pass_time" id="${dayPass.passTime}">${dayPass.passTime}초</p>
						<p  class="pass_type" style="display:none;">${dayPass.passType}</p>
					</div>
				</c:forEach>
					
			</div>



		</div>
	</form>
	
	<div class="buttons">
		<button id="btn-new">추가하기</button>
		<button id="btn-del">삭제하기</button>
	</div>
	
	<div class="modal fade modal-new" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">이용권 생성 창</h5>
					<button type="button" class="close btn_close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					이용권 이름: <input type="text" class="new-pass" name="menuName"><br>
					이용권 가격: <input type="text" class="new-pass" name="menuPrice"><br>
					이용권 종류: <select type="text" class="new-pass" name="passType">
									<option value="TIME">시간권
									<option value="SESON">기간권
								</select>					
					<br>
					이용권 시간: <input type="text" class="new-pass" name="passTime"><br>
					<div class="modal-footer">
						
						<div class="btn btn-primary btn-new">생성</div>
						<div class="btn btn-primary btn_close" data-dismiss="modal">취소</div>
					
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade modal-modify" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">이용권 수정 창</h5>
					<button type="button" class="close btn_close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<input type="hidden" class="modify-pass" name="menuId">
					이용권 이름: <input type="text" class="modify-pass" name="menuName"><br>
					이용권 가격: <input type="text" class="modify-pass" name="menuPrice"><br>
					이용권 종류: <select type="text" class="modify-pass" name="passType">
									<option value="TIME">시간권
									<option value="SESON">기간권
								</select>					
					<br>
					이용권 시간: <input type="text" class="modify-pass" name="passTime"><br>
					<div class="modal-footer">
						
						<div class="btn btn-primary btn-modi">수정</div>
						<div class="btn btn-primary btn_close" data-dismiss="modal">취소</div>
					
					</div>
				</div>
			</div>
		</div>
	</div>


								
	<script>
		$("input:radio[name=pass]").click(function(){
		    $(".menu-list-con").toggleClass("dblock");
			$(".pass").prop("checked", false)
		});

		
	
		function deleteMenu(){

			$("#btn-del").click(function(){


				var temp=confirm("정말 삭제하시겠습니까?");

				if(temp){
				$("#delete_form").submit();
				}

			})
		

		}


			

		function addNewModalEvent() {

			$("#btn-new").click(function () {


				$(".modal-new").toggleClass("show");

			})

			$(".btn_close").click(function () {
				$(".show").toggleClass("show");


			})

		}


		function addModifyModalEvent(){

			$(".menu-list-con a").click(function(e){
				e.preventDefault();
				let pass = ".pass_con."+$(this).data("value");
				
				let menuId =$(pass+" input").val();
				let menuName = $(pass+" p").eq(0).text();
				let menuPrice = $(pass+" p").eq(1).text()
				let passTime = $(pass+" p").eq(2).text()
				let passType = $(pass+" p").eq(3).text()

				$(".modal-modify").toggleClass("show");
				
				$(".modify-pass").eq(0).val(menuId);
				$(".modify-pass").eq(1).val(menuName);
				$(".modify-pass").eq(2).val(menuPrice);
				$(".modify-pass option[value="+passTime+"]").attr("selected","selected");
				$(".modify-pass").eq(4).val(passType);


			})
			


		}
		addModifyModalEvent();

		addNewModalEvent();
		deleteMenu();




		
	</script>
	
	<script>
	   let msg = "${msg}";

		if (msg) {
			alert(msg);
		}



		$(".ckAll").change(function() {
			var target = "."+$(this).val()
			if (this.checked) {
				$(target).prop("checked", true);
			} else {
				$(target).prop("checked", false);
			}
		});




	</script>


</body>
</html>
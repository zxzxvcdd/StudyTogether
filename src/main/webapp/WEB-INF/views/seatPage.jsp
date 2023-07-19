<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/seatPage.css">
</head>
<body>
	<section class="content_section">

			<div class="content_hedear_wrap">
				<div class="content_header">
					<div class="header_title">
					  <label class="font">지점선택</label>
					    <input type="text" id="store_list" name="store_list" list="store_list_data">
					</div>
				</div>
			</div>

			<%-- <div class="content_wrap">
				<div class="content">
				
		<div class="heading">
			<h1>KG MENU</h1>
			<div class="text">
			<div  class="menu-inset-serch">
				<form action="/kgCoffee/admin/adminSearchMenu.do">
					<input type="text" placeholder="메뉴검색" class="menuName" name="menuName" value="${menuName}"/>
					<input type="submit" value="검색" class="serch-btn" />
				</form>
			</div>
				<input type="checkbox" data-type="menuAll" data-value="All" checked/> 전체메뉴 &nbsp; 
				<input type="checkbox" data-type="caffeineType" data-value="decaffeine" /> 디카페인 &nbsp; 
				<input data-type="menuType" type="checkbox" data-value="Ice" />아이스 &nbsp; 
				<input type="checkbox" data-type="menuType" data-value="Hot" /> 핫 &nbsp; 
				<input type="checkbox" data-type="menuType" data-value="Food"/> 디저트
			</div>
		</div>
		
	<!-- ===== 메뉴 목록 ===== -->
		<div class="page_wrap">
		
		</div>
				</div>
			</div> --%>
		</section>
</body>
</html>
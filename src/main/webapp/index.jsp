<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- main page로 보내기 -->
	<script>
		location.href="main.do"
	</script>

			<div class="content_hedear_wrap">
				<div class="content_header">
					<div class="header_title">
					  <label class="font">지점선택</label>
					    <input type="text" id="store_list" name="store_list" list="store_list_data">
					</div>
				</div>
			</div>
	<a href="seat/seat.do?storeId=1">[이동]</a>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <%@ include file="../include/static-header.jsp" %> 
<meta charset="UTF-8">
<title>별점 테스트</title>

<style>
.rate { display: inline-block; border: 0; margin-right: 15px;}
.rate > input {display: none;} /* 먼저 input 태그를 가린다. */
.rate > label {float: right; height: 26px; background-color: #fff;}
.rate > label:before {display: inline-block; height: 26px; cursor: pointer; content: url("https://static.oliveyoung.co.kr/pc-static-root/image//product/bg_rating_star.png");}
.rate input:checked ~ label, 
.rate label:hover,.rate label:hover ~ label { height: 26px; background-color: #f27370 !important;  } 
.rate input:checked + .rate label:hover,
.rate input input:checked ~ label:hover,
.rate input:checked ~ .rate label:hover ~ label,  
.rate label:hover ~ input:checked ~ label { height: 26px; background-color: #f27370 !important;  } 
</style>

</head>
<body>

	<fieldset class="rate">
		<input type="radio" id="rating5" name="rating" value="5" onclick="clickStar(this);">
		<label for="rating5" title="5점"></label> 
									
		<input type="radio" id="rating4" name="rating" value="4" onclick="clickStar(this);">
		<label for="rating4" title="4점"></label> 
									
		<input type="radio" id="rating3" name="rating" value="3" onclick="clickStar(this);">
		<label for="rating3" title="3점"></label> 
									
		<input type="radio" id="rating2" name="rating" value="2" onclick="clickStar(this);">
		<label for="rating2" title="2점"></label> 
									
		<input type="radio" id="rating1" name="rating" value="1" onclick="clickStar(this);">
		<label for="rating1" title="1점"></label> 
	</fieldset>		


	<script>
		function clickStar(arg0) {
			var value = $(arg0).val();
			alert(value);
		}
	</script>

</body>
</html>
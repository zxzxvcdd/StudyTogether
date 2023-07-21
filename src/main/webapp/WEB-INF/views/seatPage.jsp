<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/seatPage.css">

<style>
body {
	width: 100%;
	font-family: 'Spoqa Han Sans Neo', sans-serif;
}

div.wrapper {
	width: 100%;
}

.content_wrap {
	width: 100%;
	position: relative;
	margin: 0 auto;
	padding: 20px;
}

.seatinfo_wrap_1 {
	box-sizing: border-box;
	box-shadow: 1px 1px 5px #ddd;	
	height: 10vh;
	margin-bottom: 10px;
	text-align: center;
	width: 90%;
	display: inline-block;
	font-size: 15px;
	font-weight: 500;
	color: #333
}

.seat_wrap {
	background: white;
	width: 90%;
	height: 60vh;
	border-radius: 0.28571rem;
	box-shadow: 1px 1px 5px #ddd;
}

.add_btn {
	background: gray;
	width: 50px;
	height: 50px;
	position: absolute;
	top: 20%;
	right: 10%
}

.seatinfo {
	box-sizing: border-box;
	width: 100%;
	min-width: 40px;
	display: block;
	border-bottom: 1px solid #ddd;
	box-shadow-bottom: 1px 1px 5px #ddd;	
	color: gray;
}

.seatinfo div{

	box-shadow-right: 1px 1px 5px #ddd;	


}
.seatinfo div:last-child{

	box-shadow-right: none;	
	border-right: none;


}
.seatinfo_title {
	width: 24.3%;
	display: inline-block;
	box-sizing:border-box;

}

.seatinfo_content {

	box-sizing:border-box;
	width: 24.3%;
	display: inline-block;
}

.seatinfo_bar {
	height: 35px;
	position: relative;
	display: inline-block;
	width: 6px;
	margin-left: -3px;
	margin-right: -3px;
	z-index: 10;
	vertical-align: middle;
	box-sizing: border-box;
	border: 3px solid transparent;
}

.seat_wrap ul{
	display: inline-flex;
	margin: 0;
    padding-left: 0;
    cursor: inherit;
    list-style: none;
    
}

.seat_wrap ul li{
	 list-style-type: none;
	 margin-right: 10px; 	
	 font-size: .1px;
    font-weight: 500;
    color: #575962;
}

.seat_wrap ul li span{

	display: inline-block;
    width: 9px;
    height: 9px;
    margin-top: 4px;
    margin-right: 5px;
    border-radius: 10px;
    background-color: white;
    vertical-align: top;
     margin-right: 0px;
}

.seat_check{
	text-align: center;
	
}



</style>
</head>
<body>
	<div class="wrapper">
		<div class="content_wrap">
			<div class="seatinfo_wrap_1">
				<div class="seatinfo">
					<div class="seatinfo_title">지점명</div>
					<div class="seatinfo_title">전체좌석</div>
					<div class="seatinfo_title">사용좌석</div>
					<div class="seatinfo_title">여유좌석</div>
				</div>
				<div class="seatinfo">
					<div class="seatinfo_content">1</div>
					<div class="seatinfo_content">1</div>
					<div class="seatinfo_content">1</div>
					<div class="seatinfo_content">1</div>
				</div>
			</div>
			<div class="seat_wrap">  
			  <div class="seat_check">
				<ul>
					<li><span style="background: #669934"></span>
						이용 가능
					</li>
					<li><span style="background: #6b6c68"></span>
						이용 불가
					</li>
					<li><span style="background: #cd3333"></span>
						이용중
					</li>
				</ul>
			  </div>
			</div>
			<nav class="add_btn"></nav>

		</div>







	</div>

	<Script>
		let seat = "${seat}";

		console.log(seat);
	</Script>

</body>
</html>
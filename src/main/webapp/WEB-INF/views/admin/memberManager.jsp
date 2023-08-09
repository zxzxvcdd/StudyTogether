<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<meta charset="UTF-8">
<title>회원관리페이지</title>



<link rel="stylesheet" href="/kgstudy/resources/css/admin/default.css?after">
<link rel="stylesheet" href="/kgstudy/resources/css/admin/sidebar.css?after">


<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.min.js"></script>

</head>
<style>
body {
	background-color: #f4f6f8;
}

ul, li {
	list-style: none;
}

a {
	text-decoration: none;
	color: inherit;
}
div.content_hedear_wrap{

	background: none;
	border: none;
	margin-top: 50px;
	
}
.content .board_wrap{
	width:100%;
	margin : 0px;
	padding-bottom:30px;
}
.board_wrap {
	width: 1200px;
	margin: 100px auto;
}


.board_search_wrap {
	width: 100%;
}

.board_search_wrap-view {
	width: 100%;
	/* display: inline-flex; */
	/* float: right; */
	display: table;
	margin-bottom: 20px;
}

.board_search_wrap ul li {
	diplay: inline-block;
}

* {
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
}

.input_select_wrap select {
	height: 100%;
	padding: 5px 15px !important;
	padding-right: 20px;
	color: #1c1c1b;
	box-shadow: 0px 0px 0px 1px #ddd;
	outline: none;
	border-radius: 4px;
	background: #fff;
	transition: all 0.15s;
}

.board_search_select div {
	display: inline-block;
	margin-left: 3px;
}

.board_ul {
	
    clear:both;
}

ul.board_ul>li {
	display: inline-block;
}

.grant_wrap{
    margin-top: 70px;
    float:right
}
div.bt_wrap {
	display: inline-flex;
	
}

.bt_wrap {
	margin-top: 30px;
	text-align: center;
	font-size: 0;
}

.bt_wrap a {
	display: inline-block;
	min-width: 80px;
	margin-left: 10px;
	padding: 12px;
	border-radius: 4px;
	font-size: 1.4rem;
	border: 1px black solid;
}

.bt_wrap a:first-child {
	margin-left: 0;
}

.bt_wrap a.on {
	background: #f9ca24;
	color: #fff;
	border: 1px #f9ca24 solid;
	border-radius: 4px;
}

.input_text_wrap label input {
	height: 100%;
	padding: 5px 15px !important;
	color: #1c1c1b;
	box-shadow: 0px 0px 0px 1px #ddd;
	outline: none;
	border-radius: 4px;
	background: #fff;
	transition: all 0.15s;
}

.input_wrap2 {
	height: 45px !important;
}

.modify-mg {
    margin: 30px auto;
}


.btn_design { 
	font-size: 16px;
    letter-spacing: -.3px;
    overflow: hidden;
    width: 15%;
    padding: 8px 6px 7px;
    border-radius: 6px;
    background-color: #ecf0f1;
    font-weight: 500;
    color: #2f3640;
}

.btn_design:hover { 
	font-size: 16px;
    letter-spacing: -.3px;
    overflow: hidden;
    width: 15%;
    padding: 8px 6px 7px;
    border-radius: 6px;
    background-color: #f9ca24;
    font-weight: 500;
    color: #fff;
}

.board_list {
	width: 100%;
	border-top: 2px solid #000;
	background: white;
}

.board_list>div {
	border-bottom: 1px solid #ddd;
	font-size: 0;
}

.board_list>div.top {
	border-bottom: 1px solid #999;
}

.board_list>div:last-child {
	border-bottom: 1px solid #000;
}

.board_list>div>div {
	display: inline-block;
	padding: 15px 0;
	text-align: center;
	font-size: 1.4rem;
}

.board_list>div.top>div {
	font-weight: 600;
}

.board_list .num {
	width: 10%;
}



.board_list>*>*{
    width:23%;
}



.board_list .check {
	width: 5%;
}

.board_list .id {
	width: 10%;
}
.board_list .name {
	width: 10%;
}
.board_list .grant {
	width: 5%;
}

.board_page {
	margin-top: 30px;
	text-align: center;
	font-size: 0;
}

.board_page a {
	display: inline-block;
	width: 40px;
	height: 35px;
	box-sizing: border-box;
	vertical-align: middle;
	border: 1px solid #ddd;
	line-height: 100%;
	border-radius: 4px;
}

.board_page a.bt {
	padding-top: 10px;
	font-size: 1.2rem;
	letter-spacing: -1px;
}

.board_page a.num {
	padding-top: 9px;
	font-size: 1.4rem;
	margin-left: 3px;
}

.board_page a.num.on {
	/*    border-color: #000; */
	background: #f9ca24;
	color: #fff;
}

.board_page a:first-child {
	border-left: 1px solid #ddd;
}

#frm2 [type="checkbox"] {
	appearance: none;
	width: 16px !important;
	height: 16px;
	box-sizing: border-box;
	border: 1px solid #afafaf;
	border-radius: 3px;
}

#frm2 [type="checkbox"]:focus {
	border: 1px solid black;
	outline: 1px;
}

#frm2 [type="checkbox"]:checked {
	background:url(https://icon-icons.com/icons2/930/PNG/48/check_icon-icons.com_72363.png);
	background-color: #f9ca24;
	background-size: cover;
}

#frm2 input[type='checkbox']:focus {
	outline: 1;
}



</style>

<body>


	<%@include file="sidebar.jsp"%>



	<section class="content_section">


		<div class="content_hedear_wrap ">


			<ul class="modify-mg">
				<li class="modify_name">
					<h2 class="h2" align="center">회원 관리 페이지</h2>
				</li>
			</ul>

		</div>
		<div class="content_wrap">
			<div class="content">
				<div class="board_wrap">
					<!----------------------------------- 멤버 검색창 ------------------------------------>
					<div>
						<form id="frm1" action="getMemberList.do"
							method="get" enctype="multipart/form-data">
							<div class="board_search_wrap">
                         

								<ul class="board_ul">
                            
                       
									<li class="board_search_select">
										<div class="input_select_wrap input_wrap2">
											<select name="type">

                                                <option value="id">아이디</option>
                                                <option value="name">이름</option>
                                                <option value="tel">전화번호</option>
                                                <option value="email">이메일</option>
                                                <option value="store">매장이름</option>

											</select>
										</div>
						
										<div class="input_text_wrap input_wrap2">
											<label> <input type="text" name="keyword"
												value="${resMap.search.keyword}" placeholder="검색어를 입력하세요"
												required="required">
											</label>
										</div>
									</li>
									<li class=bt_wrap><a href="#" onclick="searchMember();"
										class="on">검색</a> <a href="#" onclick="deleteMember()"
										class="on">삭제</a>
                                    </li>
                                    <li class="grant_wrap">
                                        <div class="grant_radio">
                                        권한 : 
                                        <input type="radio" name="grant" value="" checked>모두
                                        <input type="radio" name="grant" value="user">사용자
                                        <input type="radio" name="grant" value="manager">점장
                                        <input type="radio" name="grant" value="admin">관리자
										</div>
                                    </li>
								</ul>
							</div>
						</form>
					</div>

	
					<form id="frm2" action="deleteMember.do"
						method="get" enctype="multipart/form-data">

						<div class="board_list_wrap">
							<div class="board_list">
								<div class="top">
									<div class="check">
										<input type="checkbox" class="check" name="checkIdAll"
											id="allCheck">
									</div>
									<div class="id">아이디</div>
									<div class="name">이름</div>
									<div class="email">이메일</div>
									<div class="tel">전화번호</div>
									<div class="storeName">매장이름</div>
									<div class="grant">권한</div>
								</div>

                                <c:forEach var="member" items="${resMap.memberList}">
								<div>
									
										<div class="check">
											<input type="checkbox" class="check" name="checkId"
												value="${member.userId}">
										</div>
										<div class="id">
											<a href="modifyMember.do?userId=${member.userId}">${member.userId}</a>
										</div>
										<div class="name">${member.userName}</div>
										<div class="gender">${member.userEmail}</div>
										<div class="tel">${member.userTel}</div>
										<div class="storeName">${member.storeName}</div>
										<div class="grant">
											${member.userGrant}
										</div>
									
								</div>
                                </c:forEach>
							</div>
						</div>
					</form>

                    <c:set var="action" value="getMemberList.do?type=${resMap.search.type}&keyword=${resMap.search.keyword}"/>

					<div id="paging" class="board_page">
						<!-- 1~10까지 있는 페이지의 페이징 -->
				
						<c:if test="${resMap.paging.prev}">
							<a href="${action}&pageNum=${resMap.paging.beginPage-1}" class="bt prev"><</a>
						</c:if>

						<c:forEach begin="${resMap.paging.beginPage}" end="${resMap.paging.endPage}"
							step="1" var="index">
							<c:choose>
								<c:when test="${resMap.paging.page.pageNum==index}">
									<a href="${action}&pageNum=${index}" class="num on">${index}</a>
								</c:when>
								<c:otherwise>
									<a href="${action}&pageNum=${index}" class="num">${index}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:if test="${resMap.paging.next}">
							<a href="${action}&pageNum=${resMap.paging.endPage+1}" class="bt next">></a>
						</c:if>
					</div>





				</div>

			</div>
		</div>
	</section>


	<script>

    let msg = "${msg}";

    if (msg) {
        alert(msg);
    }

    let url = "getMemberList.do";

    let searchType = "${resMap.search.type}"

    if(searchType){

        $("option[value="+searchType+"]").attr("selected","selected");


    }
	
	$("#user_management").toggleClass("active");
    
	
	
		$(document).ready(function() {
			$("#allCheck").change(function() {
				if (this.checked) {
					$(".check").prop("checked", true);
				} else {
					$(".check").prop("checked", false);
				}
			});
		});




    function searchMember(){

        document.getElementById("frm1").submit();
    }

    function deleteMember(){
        var temp=confirm("정말 삭제하시겠습니까?");

        if(temp){
        document.getElementById("frm2").submit();
        }

    }




	</script>



</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<meta charset="UTF-8">
<title>회원관리페이지</title>

 <%@ include file="../include/static-header.jsp" %> 




<!-- css 파일 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/memberManager.css?after">


<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.min.js"></script>

</head>


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
	let grant = "${resMap.search.grant}"
	console.log(grant)
    if(searchType){

        $("option[value="+searchType+"]").attr("selected","selected");


    }
    if(grant){

        $("input:radio[name ='grant']:input[value='"+grant+"']").attr("checked","true") 

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
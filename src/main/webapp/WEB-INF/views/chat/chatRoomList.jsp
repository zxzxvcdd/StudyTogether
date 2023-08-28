<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head profile="http://www.w3.org/2005/10/profile">
<%@ include file="../include/static-header.jsp" %>
<meta charset="UTF-8">
<title>review</title>

<!-- jquery -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.min.js"></script>

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>

body header{
    display: flex;
}

li{

    list-style: none;
}

*, :after, :before {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;


    line-height: 1;
    vertical-align: baseline;
    margin: 0px;
    padding: 0px;
    outline: 0px;
}


.studies-contents{


    padding: 40px;

}

.studies-header {
    position: relative;
    z-index: 3;
}

.studies-header-title-wrap {
    display: flex;
    justify-content: space-between;
    align-items: flex-end;
    margin-bottom: 10px;
}
.studis-header.title {
    display: flex;
    align-items: center;
    font-size: 22px;
    font-weight: 700;
    color: #333;
    line-height: 30px;
}



.search_wrap {
	width: 100%;
}



.search_wrap ul li {
	display: inline-block;
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



.search_select div {
	display: inline-block;
	margin-left: 3px;
}

.search_ul {
	
    margin-bottom: 10px;
    clear:both;
	
}

ul.search_ul>li {
	display: inline-block;
}

.grant_wrap{

    float:right;
    padding-top: 20px;
    


}


.grant_wrap *{

    display: inline-block;
    
}
div.bt_wrap {
	display: inline-flex;
	
}

.bt_wrap {
	margin-left: 10px;
	text-align: center;
	font-size: 0;
}

.bt_wrap a {
	display: inline-block;
	min-width: 60px;
	margin-left: 5px;
	padding: 8px;
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
p{
    margin: 0;
}



.studies-filter-ready-chk{

    
}


.studies-body {
    margin-top: 10px;
}


.study-item-list-wrap.flex-wrap {
    width: 100%;
    display: flex;
    flex-wrap: wrap;
}

.study-item-list-wrap {
    height: 100%;
}



.study-item-list {
    width: 224px;
    height: auto;
    border-radius: 6px;
    background-color: #fff;
    position: relative;
    cursor: pointer;
    margin-bottom: 40px;
}

.study-item-list.flex-wrap:nth-of-type(5n-4) {
    margin-left: 0;
}

.study-item-list.flex-wrap {
    width: calc(20% - 16px);
    margin-left: 20px;
}

.study-item-list:first-of-type {
    margin-left: 0;
}

.study-item-img-wrap {
    flex: 1;
    border-radius: 4px;
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
    overflow: hidden;
}


.study-item-img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: .2s ease-out;
}

.study-item-img-wrap:hover .study-item-img {
    transform: scale(1.1)
}

img {
    max-width: 100%;
    height: auto;
}


.study-item-info-cover {
    width: 100%;
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    background: linear-gradient(180deg,rgba(0,0,0,0) 70%,rgba(0,0,0,0.3) 100%);
}

.study-item-info-badge-wrap {
    display: flex;
    position: absolute;
    top: 10px;
    left: 10px;
    color: #fff;
    font-weight: 700;
}

.study-item-info-personnel-wrap {
    padding-left: 18px;
    background: url(/kgstudy/resources/img/ico_user02_white.svg) no-repeat center left/auto 100%;
    display: flex;
    position: absolute;
    bottom: 10px;
    left: 10px;
    font-size: 12px;
    font-weight: 500;
    color: #fff;
}


.study-item-info-personnel.maximum::before {
    content: "/";
    margin: 0 2px;
}

.room-more-view-btn-area {
    display: flex;
    position: absolute;
    top: 8px;
    right: 6px;
    z-index: 2;
}

.study-item-tx-wrap {
    padding: 5px 5px;
    min-height: 40px;

}

.study-item-tx.title {
    font-size: 13px;
    color: #333;
    line-height: 19px;
    word-break: break-word;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;
}

em {
    font-style: normal;
}

.study-item-tx-hashtag-wrap {
    margin-top: 4px;
    display: flex;
}



@media(max-width: 1199px) {

 

    .study-item-list.flex-wrap {
        width: calc(25% - 15px);
        margin: 0
    }

    .study-item-list.flex-wrap:nth-of-type(4n-3) {
        margin-left: 0
    }

    .study-item-list.flex-wrap:not(:nth-child(4n-3)) {
        margin-left: 20px
    }

    .study-item-list.flex-wrap:not(:nth-child(-n+4)) {
        margin-top: 20px
    }


}

@media(max-width: 959px) {

    .study-item-list-cover {
        width: calc(50vw - 25px);
        right: 20px;
        left: auto
    }


    .study-item-list.flex-wrap {
        width: calc(33.333333% - 7px);
        margin: 0
    }

    .study-item-list.flex-wrap:nth-of-type(3n-2) {
        margin-left: 0
    }

    .study-item-list.flex-wrap:not(:nth-child(3n-2)) {
        margin-left: 10px
    }

    .study-item-list.flex-wrap:not(:nth-child(-n+3)) {
        margin-top: 20px
    }

    .study-item-list:hover .study-item-img {
        transform: scale(1)
    }



}

@media(max-width: 767px) {
    .study-item-list.flex-wrap {
        width: calc(50% - 5px);
        margin: 0
    }

    .study-item-list.flex-wrap:nth-of-type(2n-1) {
        margin-left: 0
    }

    .study-item-list.flex-wrap:not(:nth-child(2n-1)) {
        margin-left: 10px
    }

    .study-item-list.flex-wrap:not(:nth-child(-n+2)) {
        margin-top: 20px
    }

}

@media(min-width: 960px) {

    .study-item-list-wrap {
        width: max-content;
        display: flex
    }

    .study-item-list-wrap.flex-wrap {
        width: 100%
    }

   .study-item-list {
        margin-left: 20px
    }

     .study-item-list:first-of-type {
        margin-left: 0
    }




}


.board_page {
	margin-top: 30px;
	text-align: center;
	font-size: 0;
}

.board_page a {
    background: #fff;
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
</style>

</head>

<body>

    <%@include file="../include/header.jsp" %>

        <div class="wrapper">

            <div class="studies-contents">
                <div class="studies-header">
                    <div class="studies-header-title-wrap">
                        <div class="studis-header title">
                            공개 스터디
                        </div>
                    </div>
                    <div class="studies-header-search">
                        <form id="search_room" action="getAllChatRoom"
                        method="get" >
                            <div class="search_wrap">
                                <ul class="search_ul">
                                    <li class="search_select">
                                        <div class="input_select_wrap input_wrap2">
                                            <select name="type">

                                                <option value="">전체</option>
                                                <option value="title">방 제목</option>
                                                <option value="goal">목표</option>
                                                <option value="category">카테고리</option>
                                            </select>
                                        </div>
                        
                                        <div class="input_text_wrap input_wrap2">
                                            <label> <input type="text" name="keyword"
                                                value="${resMap.search.keyword}" placeholder="검색어를 입력하세요"
                                                >
                                            </label>
                                        </div>
                                    </li>
                                    <li class=bt_wrap><a href="#" onclick="searchOrder();"
                                        class="on">검색</a>
                                    </li>
                                    <li class="grant_wrap">
                                        <label for="tc" class="studies-filter-ready-wrap">
                                            
                                            <input type="radio" id="tc" name=grant  value="" class="studies-filter-ready-chk"> 
                                            <p class="studies-filter-tx ready">전체 방</p>
                                        </label>
                                        <label for="free" class="studies-filter-ready-wrap">
                                            <input type="radio" id="free" name=grant  value="free" class="studies-filter-ready-chk"> 
                                            <p class="studies-filter-tx ready">바로 참여 가능한 방</p>
                                        </label>
                                        
                                        <label for="full" class="studies-filter-ready-wrap">
                                            <input type="radio" id="full" name=grant  value="full" class="studies-filter-ready-chk"> 
                                            <p class="studies-filter-tx ready">가득찬 방</p>
                                        </label>
                                            
                                    </li>
                                </ul>
                            </div>
                        </form>

                    </div>
                </div>


                <div class="studies-body">
                    <div class="study-item-list-wrap flex-wrap">
                    <c:forEach var="chatRoom" items="${resMap.chatRoomList}" varStatus="status">

                            <div class="study-item-list flex-wrap">
                                <div class="study-item-img-wrap" data-id="${chatRoom.chatRoomId}" data-title="${chatRoom.chatRoomTitle}"><img
                                    src="/kgstudy/resources/fileUpload${chatRoom.chatRoomImg}"
                                        alt="study-img" class="study-item-img">
                                        <div class="study-item-info-cover">
                                            <div class="study-item-info-badge-wrap">
                                                ${chatRoom.chatRoomTitle}
                                            </div>
                                        
                                            <div class="study-item-info-personnel-wrap">
                                                <span class="study-item-info-personnel present">${chatRoom.chatRoomCnt}</span> 
                                                <span class="study-item-info-personnel maximum">${chatRoom.chatRoomMax}</span>
                                            </div>
                                        <div class="room-more-view-btn-area"><!----></div> <!---->
                                    </div>
                                </div>
                                <div class="study-item-tx-wrap">
                                    <em class="study-item-tx title">${chatRoom.chatRoomGoal}</em> 
                                    <div class="study-item-tx-hashtag-wrap"></div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                
                <c:set var="action" value="getAllChatRoom?type=${resMap.search.type}&keyword=${resMap.search.keyword}"/>


                <div id="paging" class="board_page">
         
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





        <%@include file="../include/footer.jsp" %>



        <script>

            let ckFree= "${resMap.search.grant}"

            let searchType = "${resMap.search.type}"
            
            if(searchType){

                $("option[value="+searchType+"]").attr("selected","selected");

                
                

            }


            $("input:radio[name='grant']:input[value='"+ckFree+"']").attr("checked","true");


            function searchOrder(){

            document.getElementById("search_room").submit();
            }

            let msg = "${msg}";

            if (msg) {
                alert(msg);
            }


            function enterChatRoom(){


                $(".study-item-img-wrap").click(function(){

                    let roomTitle= $(this).data("title");
                    let roomId = $(this).data("id");
                   
                    window.open("enterChatRoom?chatRoomId="+roomId,roomTitle,'width=450,height=700,scrollbars=yes,resizable=no');


                })


            }

            enterChatRoom();
            


        </script>

</body>

</html>
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
.studies-header.title {
    display: flex;
    align-items: center;
    font-size: 22px;
    font-weight: 700;
    color: #333;
    line-height: 30px;
}

.header_btn_wrap button{

       
    font-size: 16px;
    letter-spacing: -.3px;
    overflow: hidden;
    width: 100px;
    height: 30px;

    border-radius: 6px;
    background-color: #ecf0f1;
    font-weight: 500;
  

    border: 0.1px solid #000;

    cursor: pointer;

    
}

.header_btn_wrap button:hover{

    background-color: #f9ca24;
    color: #fff;


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











.side_wrap{

display: none;
position: fixed;
top:0;
right: 0;



height: 100vh;

width: 100vw;

background: rgba(0,0,0,0.1);

padding: 0;
padding-left: 80%;

z-index: 10;


}

.side_wrap.show{
display:block;

}

.side_con{

width: 100%;
background: #fff;
height: 100%;

z-index: 11;

padding: 10px;


border-left: 0.5px solid rgba(0,0,0,0.1);

}


.side_con .side_header{

font-weight: 700;

padding-bottom: 10px;
border-bottom: 4px solid rgba(0,0,0,0.2);
clear: both;
}

.side_con .side_close{
width: 100%;
height: 30px;
clear:both;
border-bottom: 4px solid rgba(0,0,0,0.2);
margin-bottom: 10px;
}

.side_con .side_close>*{


}

div.exit_btn{

float:left;

width: 20px;
height: 20px;

cursor: pointer;

}


button.side_close_btn{


    

overflow: hidden;


border-radius: 6px;

cursor: pointer;


float: right;
display: block;




width: 20px;
height: 20px;

line-height: 11px;

font-size: 20px;
color: black;
font-weight: 400;

border: 0.1px solid #000;
background: rgba(16,16,16,0.01);




}

button.side_close_btn:hover{

background-color: #f9ca24;
color: #fff;


}


.side_con .side_header .side_title{

font-size: 20px;

}

.side_con .side_header .side_cnt{

font-size: 12px;

}
.side_con .side_header .side_date{

font-size: 12px;
color: #5F5F5F

}



.side_con .myChat_list_wrap{

font-size: 16px;
overflow: auto;

margin-top: 20px;
height: 650px;


}

.side_con .myChat_list_wrap .myChat_list_header{

font-weight: 900;
padding-bottom: 5px;
border-bottom: 2px solid rgba(0,0,0,1);
width: fit-content;
margin-bottom: 10px;




}

.side_con .myChat_list_wrap .myChat_list{


height: auto;

}

.myChat_list_wrap .myChat_list .myChat{


margin-bottom: 15px;

padding-left: 15px;
padding-bottom: 5px;

width: 90%;

height: 100px;
cursor: pointer;

font-size: 20px;
font-weight: 700;
display: inline-flex;
align-items: center;

border-bottom: 3px solid rgba(0,0,0,0.2);


}

.side_con .myChat_list_wrap .myChat_list .myChat >*{

line-height: 80px;
height: 80px;
margin: 0 5px;

}
.side_con .myChat_list_wrap .myChat_list .myChat_cnt{

    font-size: 16px;
    color: rgba(0,0,0,0.4);
    margin: 0;

    padding-top: 5px;

}



.side_con .myChat_list_wrap .myChat_list .myChat_banner{

width: 80px;
height: 80px;

border-radius: 10px;
overflow: hidden;


}

.side_con .myChat_list_wrap .myChat_list .myChat_banner img{
    vertical-align: baseline;

}

.side_con .myChat_list_wrap .myChat_list .chat_user.my_chat{

font-weight: 700;

}


.side_con .myChat_list_wrap .myChat_list .chat_user.my_chat .chat_user_my{


width: 20px;
height: 20px;


border-radius: 50%;

background-repeat: no-repeat;
background-position: center;
background-size: cover;

background-image: url("/kgstudy/resources/img/chat/me.png");


}



.side_con .myChat_list_wrap .myChat_list .invite_btn_wrap .invite_btn_tx{
font-weight: 700;
font-size: 16px;
display: inline-block;

}
.side_con .myChat_list_wrap .myChat_list .invite_btn_wrap button{

margin: 0;
padding: 0;
text-align: center;
display: inline-block;

line-height: 30px;
width: 30px;
height: 30px;
font-size: 30px;
color: blue;
font-weight: lighter;

border: 0.1px solid #000;
background: rgba(16,16,16,0.01)

}








</style>

</head>

<body>

    <%@include file="../include/header.jsp" %>

        <div class="wrapper">

            <div class="studies-contents">
                <div class="studies-header">
                    <div class="studies-header-title-wrap">
                        <div class="studies-header title">
                            공개 스터디
                        </div>
                        <div class="header_btn_wrap">
                            <button type="button" class="create_chat_btn">스터디 생성</button>
                            <button type="button" class="my_chat_btn">내 스터디 목록</button>
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


        <section class="side_wrap">
            <div class="side_con">
                <div class="side_close"> 
                     <button type="button" class="side_close_btn">x</button>
                </div>
        

                
                <div class="myChat_list_wrap">
                    
                    <div class="myChat_list_header"> 나의 채팅방</div>

                    <ul class="myChat_list">
               
                        <c:forEach var="myChat" items="${resMap.myChat.chatRoomList}" varStatus="status">
                            <li class="myChat" data-title="${myChat.chatRoomTitle}" data-id="${myChat.chatRoomId}">
                                
                                <div class="myChat_banner"><img
                                    src="/kgstudy/resources/fileUpload${myChat.chatRoomImg}"
                                        alt="study-img" class="study-item-img"></div>
                                <div class="myChat_title">${myChat.chatRoomTitle}</div>
                                <div class="myChat_cnt">
                                    <span class="study-item-info-personnel present">${myChat.chatRoomCnt}</span> 
                                    <span class="study-item-info-personnel maximum">${myChat.chatRoomMax}</span>
                                </div>

                            </li>
                            
                            
                            
                        </c:forEach>
         
                    </ul>
                    

                    
                </div>
            </div>
            
        </section>




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
                   
                    window.open("enterChatRoom?chatRoomId="+roomId,roomTitle,'width=450,height=720,scrollbars=yes,resizable=no');


                })

                $(".myChat").click(function(){

                let roomTitle= $(this).data("title");
                let roomId = $(this).data("id");

                window.open("enterChatRoom?chatRoomId="+roomId,roomTitle,'width=450,height=720,scrollbars=yes,resizable=no');


                })


            }

            enterChatRoom();

            function createChat(){

                $(".create_chat_btn").click(function(){


                    window.location="createChatRoom";

                })
            }
            createChat()
            
            $(".my_chat_btn").click(function () {
                    $(".side_wrap").toggleClass("show");


                })

            $(".side_close_btn").click(function () {


                $(".side_wrap").toggleClass("show");

            })





        </script>

</body>

</html>
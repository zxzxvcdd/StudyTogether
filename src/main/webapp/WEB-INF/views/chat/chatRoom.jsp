<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head profile="http://www.w3.org/2005/10/profile">

<meta charset="UTF-8">
<title>review</title>

<script src="${pageContext.request.contextPath}/resources/js/sockjs.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/stomp.min.js"></script>
<!-- jquery -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.min.js"></script>



<style>



*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
li{
    list-style: none;
}

html{

    width: 100%;
    height: 100vh;


}

body{
    width: 100%;
    height: 100%;
    overflow: hidden;
}
.wrapper{
    
    position: relative;
    width: 100%;
    height: 100%;
    padding-top: 10vh;
    padding-bottom: 15vh;


}
section{

    
    padding: 20px
}



.header_wrap{

    top:0;
    left:0;
    height: 10vh;

    width: 100vw;
    
    z-index: 1;
    padding: 10px;
    position: fixed;
    
    padding-bottom: 5px;
    background: #9bbbd4;
  
    overflow: visible;

    clear:both;
}

.body_wrap{
    
    z-index: 0;
 
    box-sizing: border-box;
    height: 90vh;
    background: #9bbbd4;
    

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
    padding-left: 30%;

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
    border-bottom: 2px solid rgba(0,0,0,0.4);
    clear: both;
}

.side_con .side_close{
    width: 20px;
    height: 30px;
    float: right;
}
button.side_close_btn{


display: flex;
align-items: center;

margin: 0;
padding: 0;
text-align: center;
padding-left: 4px;

width: 20px;
height: 20px;
font-size: 20px;
color: black;
font-weight: lighter;

border: 0.1px solid #000;
background: rgba(16,16,16,0.01)


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



.side_con .user_list_wrap{
  
    font-size: 16px;
    overflow: auto;

    margin-top: 20px;
    height: 550px;
   

}

.side_con .user_list_wrap .user_list_header{

    font-weight: 700;
    



}

.side_con .user_list_wrap .user_list{

    
    height: auto;

}

.side_con .user_list_wrap .user_list .chat_user{
    

    margin: 10px 0;

    height: 30px;
    
}
.side_con .user_list_wrap .user_list .chat_user >*{

    display: inline-flex;
}
.side_con .user_list_wrap .user_list .chat_user .chat_user_auth{

    
    width: 20px;
    height: 20px;

   
    border-radius: 50%;

    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;


}

.side_con .user_list_wrap .user_list .chat_user .chat_user_auth.master{

    background-image: url("/kgstudy/resources/img/chat/king.png");

}

.side_con .user_list_wrap .user_list .chat_user.my_chat{
    
    font-weight: 700;

}


.side_con .user_list_wrap .user_list .chat_user.my_chat .chat_user_my{


    width: 20px;
    height: 20px;

   
    border-radius: 50%;

    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;

    background-image: url("/kgstudy/resources/img/chat/me.png");
  

}



.side_con .user_list_wrap .user_list .invite_btn_wrap .invite_btn_tx{
    font-weight: 700;
    font-size: 16px;
    display: inline-block;
 
}
.side_con .user_list_wrap .user_list .invite_btn_wrap button{

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



.header_wrap > *{
/* 
display: inline-flex; */


}




.header_banner_wrap {
 
    float:left;
    justify-content: center;
    align-items: center;
    overflow: hidden;
    border-radius: 15px;
    width: 50px;
    height: 50px;

    margin-right: 20px;
    
}

.header_banner {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: .2s ease-out;
}

.header_banner_wrap:hover .header_banner {
    transform: scale(1.1)
}

img {
    width: 100%;
    height: 100%;


    object-fit: cover;
}






.header_title_wrap{

    float:left;
    position: relative;
    /* position: absolute;
    top:0%;
    left:18%;
    height: 100%; */

    justify-content: center;

    
}

.header_title_tx{

    height: 70%;
    align-items: center;
    display: flex;
    

}
.header_title_tx h1{

    font-size: 20px;
    
}

.study-item-info-personnel-wrap {
    padding-left: 18px;
    background: url(/kgstudy/resources/img/ico_user02_white.svg) no-repeat center left/auto 100%;
    display: flex;
    position: absolute;
    bottom:-20px;
    left: 0px;
    font-size: 12px;
    font-weight: 700;
    color: #5F5F5F;
    
}


.study-item-info-personnel.present{

    margin-left: 5px;

}
.study-item-info-personnel.maximum::before {
    content: "/";
    margin: 0 3px;

}

.header_btn_wrap{

    float:right;
    
}

.header_btn_wrap *{

    display: inline-flex;
    
}




.search_wrap{

    display:none;

    margin-top: 30px;
    clear:both;
    height: 5vh;
    width: 100%;
    padding: 10px;
    font-size: 16px;

    
}

.search_con{
    width: 70%;
    background: #fff;
    border-radius: 15px;
    padding: 0 5px;

}

.search_chat{
    width: 60%;
    background: none;
    border: none;
    border-right: 1px solid #000;
}

.chat_list_wrap{
    position: relative;
    height: 70vh;
    overflow: auto;
    
}
.chat_list{
    height: auto;
    margin-bottom: 10px;
    
    
}

li.chat{

    min-height: 60px;
    height: auto;
    clear:both;
}


.chat_con{
    
    border-radius: 10px;
    background: #fff;
    width: fit-content;
    max-width: 60%;
    float: left;
    padding: 5px;

    display: inline-flex;

    margin-bottom: 10px;
    padding: 5px;

    word-break:break-all;

}

li.chat.chat_alert{
    min-height: 30px;
}

.chat_alert .chat_con{
    text-align: center;
    width: 100%;
    max-width: 100%;
    background: rgba(0,0,0,0.1);
    display: block;
   

    
}

.chat_writer{

}


.chat_state{

    display: block;
    font-size: 8px;
    float: left;
    margin: 0 5px;
    padding-top: 5px;

}


.chat_cnt{


}

.chat_cnt.cnt0{
    visibility: hidden;
}

.chat_date{



}

div.my_chat{

    visibility: hidden;

}
.chat:has(div.my_chat) .chat_con{

    float:right;
    background: #fef01b;

}


.chat:has(div.my_chat) .chat_state{

    float:right;
    text-align: right;

}

.send_data_wrap{

    position: fixed;
    bottom: 0;
    left: 0;
    width: 100vw;
    height: 15vh;
    background: #fff;

    clear: both;
    
}


.send_data_wrap >*{

    box-sizing: border-box;
    

}
.send_data_wrap .send_text_wrap{
    float: left;
    width: 85%;
    height: 100%;
    padding: 2.5%;
    

}

.send_data_wrap .send_text_wrap .send_chat{

    width: 100%;
    height: 100%;

    border: none;
    outline: none;
}


.send_data_wrap .send_btn_wrap{

    float: right;
    width: 15%;
    height: 100%;

}


.send_data_wrap .send_btn_wrap button{
    
    width: 100%;
    height: 100%;
    margin: 0;
    padding: 0;




}
::-webkit-scrollbar {

box-sizing: border-box;
width: 10px;
height: 5px;
background: none;

}

::-webkit-scrollbar-thumb {
height: 10%;
/* 스크롤바의 길이 */
background: rgba(0,0,0,0.4);
/* 스크롤바의 색상 */

border-radius: 10px;

}

::-webkit-scrollbar-track {

background: none;
/*스크롤바 뒷 배경 색상*/

}

button{
    
   
    font-size: 16px;
    letter-spacing: -.3px;
    overflow: hidden;
    width: 30px;
    height: 30px;
    padding: 5px ;
    border-radius: 6px;
    background-color: #ecf0f1;
    font-weight: 500;
  

    border: 0.1px solid #000;

    cursor: pointer;

}

button:hover{

    background-color: #f9ca24;
    color: #fff;


}

.invite_wrap{
    position: fixed;

    top:0;
    left:0px;
    bottom: 0;
    right: 0;
    width: 100vw;
    height: 100vh;
    
    background: rgba(0,0,0,0.1);

    display: none; 
    z-index: 100;

}

.invite_wrap.show{

display: block;
}
.invite_con{
background: #fff;

margin: 5%;
width: 90%;
height: 90%;
clear: both;

border: 0.5px solid rgba(0,0,0,0.1);

border-radius: 5px;

padding: 40px;

overflow: auto;
}


.user_search{

margin: 0 auto;
width: 300px;
margin-bottom: 20px;

}
.user_search input{

border-bottom: 1px solid #000;
}
.user_search button{

    width: 30px;
    height: 30px;

    font-size: 18px;

    display: inline-flex;
    align-items: center;
    text-align: center;
    margin: 0;

    border-radius: 6px;
    background: rgba(16,16,16,0.01);
    
    color: #000;


}

.user_search button:hover{

background-color: #f9ca24;
color: #fff;


}

.playlist_wrap{
width: 50%;
height: 450px;
float:left;

}
.playlist{

border: 1px solid #000;
padding: 20px;
padding-left: 30px;


height: 400px;
overflow: auto;

}

.playlist ul{


height: fit-content;

}

.playlist li{
width: fit-content;

list-style: none;
border-bottom: 1px solid rgba(0,0,0,0.5);
margin-bottom: 15px;

cursor: pointer;

}

.playlist li *{

cursor: pointer;
}

.invite_header_con{

text-align: center;

font-weight: 700;
font-size: 26px;

}
.playlist_header{
margin: 0 auto;
text-align: center;
width: fit-content;
margin-bottom: 10px;

}



.fa.fa-search{

    width: 20px;
    height: 20px;

    font-weight: 700;
    border-radius: 50%;

    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;

    background-image: url("/kgstudy/resources/img/chat/search.png");

}
.fa.fa-list{


   
width: 20px;
height: 20px;

font-weight: 700;
border-radius: 50%;

background-repeat: no-repeat;
background-position: center;
background-size: cover;

background-image: url("/kgstudy/resources/img/chat/list.png");

}

.send_data_wrap
.send_btn_wrap{


}

.btn_wrap{
    width: 150px;
    margin: 0 auto;
}

.btn_wrap button{

    width: 60px;
    margin-right: 10px;

}



</style>

</head>

<body>

    <c:set var="chatInfo" value="${resMap.chatInfo}"/>

        <div class="wrapper">

            <section class="header_wrap">
                <div class="header_banner_wrap">
                    <div class="header_banner" data-id="${chatInfo.chatRoomId}" data-title="${chatInfo.chatRoomTitle}"><img
                        src="/kgstudy/resources/fileUpload${chatInfo.chatRoomImg}"
                            alt="study-img" class="study-item-img">
                    </div>
             
                </div>
                <div class="header_title_wrap">
                    <div class="header_title_tx">
                        <h1 class="header_title">
                            ${chatInfo.chatRoomTitle}
                        </h1>
                    </div>
                    <div class="study-item-info-personnel-wrap">
                        <span class="study-item-info-personnel present">${fn:length(chatInfo.chatUserList)}</span> 
                        <span class="study-item-info-personnel maximum">${chatInfo.chatRoomMax}</span>
                    </div>
                </div>

                <div class="header_btn_wrap">
                    <div class="search_btn_wrap">
                        <button type="button" class="search_btn">
                            <div class="fa fa-search"></div>
                        </button>
                    </div>
                    <div class="user_btn_wrap">
                        <button type="button" class="user_btn">
                            <div class="fa fa-list"></div>
                        </button>
                    </div>
                </div>
                
            
                <div class="search_wrap">
                    <div class="search_con">
                        <input type="text" name="keyword" class="search_chat" placeholder="대화 내용 검색">

                    </div>
                    <div class="search_close">
                        <button type="button" class="search_close_btn"></button>
                    </div>
                    
                </div>



            </section>


            <section class="body_wrap">

        

                <div class="chat_list_wrap">
                    <ul class="chat_list">
                        
                        <c:forEach var="chat" items="${chatInfo.chatList}" varStatus="status">
                            
                            <c:choose>
                                <c:when test="${chat.chatState eq 'alert'||chat.userId eq 'admin'}">
                                    <li class="chat chat_alert chat${chat.chatId}">
                                        <div class="chat_con">${chat.chatContent}</div>
                                    </li>
                                </c:when>
                                <c:otherwise>

                                    <li class="chat chat${chat.chatId}">
                                
                                        <div class="chat_writer ${chat.userId}" >${chat.userId}</div>
                                        <div class="chat_con">${chat.chatContent}</div>
                                        <div class="chat_state ${chat.chatState}">
                                            <div class="chat_cnt cnt${chat.chatCkCnt}">${chat.chatCkCnt}</div>
                                            <div class="chat_date"><fmt:formatDate value="${chat.chatDate}" pattern="a h:mm"/></div>
                                        </div>
                                    </li>        
                                </c:otherwise>
                            </c:choose>
                        
        
                        </c:forEach>
                    </ul>
                        
                </div>

                <div class="send_data_wrap">
                    <div class="send_text_wrap">
                        <textarea  name="chatContent" class="send_chat" spellcheck="false" autofocus></textarea>
                    </div>
                    <div class="send_btn_wrap">

                        <button type="button" class="send_btn">
                            전송
                        </button>

                    </div>
                    
                </div>

            </section>

            <section class="side_wrap">
                <div class="side_con">
                    <div class="side_close"> 

                        <button type="button" class="side_close_btn">x</button>
                    </div>
                    <div class="side_header">

                        <div class="side_title"> ${chatInfo.chatRoomTitle}</div>
                        
                        <div class="side_cnt"> ${chatInfo.chatRoomCnt}명 참여중</div>
                        <div class="side_date"> 개설일 <fmt:formatDate value="${chatInfo.chatRoomDate}" pattern="yyyy.MM.dd"/></div>

                    </div>


                    
                    <div class="user_list_wrap">
                        
                        <div class="user_list_header"> 대화 상대</div>

                        <ul class="user_list">
                   
                            <c:forEach var="user" items="${chatInfo.chatUserList}" varStatus="status">
                                <li class="chat_user ${user.userId}">
                                    
                                    <div class="chat_user_id">${user.userId}</div>
                                    <div class="chat_user_auth ${user.roomAuth}"></div>
                                    <div class="chat_user_my"></div>

                                </li>
                                
                                
                                
                            </c:forEach>
                            <li class=" invite_btn_wrap">
                                <button type="button" class="invite_btn">+</button>
                                <div class="invite_btn_tx">대화상대 초대</div>
                            </li>
                        </ul>
                        

                        
                    </div>
                </div>
                
            </section>

            

          

            


        </div>
        <div class="invite_wrap">
            <div class="invite_con">
                <div class="invite_header">
                    <div class="invite_header_con">
                        회원 초대
                    </div>
                </div>
                <div class="user_search">
                        <div class="form_input">
                            <input class="user_filter" type="text">
                            <button type="button" class="search-button"><div class="fa fa-search"></div></button>
                        </div>
                </div>
                <div class="playlist_wrap">
                    <div class="playlist_header">
                        초대가능한 회원
                    </div>
                    <div class="user_list playlist">
                        <ul>
      
                        </ul>
                   </div>
                </div>
                <div class="playlist_wrap">
                    <div class="playlist_header">
                        초대할 회원
                    </div>
                    <div class="invite_list playlist">
                        
                        <ul>

                        </ul>
                    </div>
                </div>
                <div class="btn_wrap">
                    <button type="button" class="btn_modal">확인</button>
                    <button type="button" class="btn_modal_close">취소</button>
                </div>
            </div>
        </div>


        <script>

            let roomId="${chatInfo.chatRoomId}"
            
            let userId="${loginUser.user_id}";
            // userId="user11";

            console.log(userId);
            
            let formData=new FormData();


            let newChat={
                chatRoomId:roomId,
                userId:userId,
                chatContent:"",
                chatState:"public",
                files:formData
            }


            

            function ckOwn(){

                $("."+userId).addClass("my_chat");
            }

           





  

            function connect(){

                var socket = new SockJS("/kgstudy/msgProc");
                stompClient = Stomp.over(socket);

                stompClient.connect({}, function(frame){

                    console.log('Connected: ' + frame);

                    var subChat = '/topic/chat/room/'+roomId;
                    var subUpChat = '/topic/update/chat/'+roomId;
                    var subUpUser = '/topic/update/userList/'+roomId;
            
                    stompClient.subscribe(subChat, function (data) {

                        
        
                        let rcvChat = JSON.parse(data.body)


                        displayChat(rcvChat);
                    
                    });

                    stompClient.subscribe(subUpUser, function (data) {


                        let rcvChat = JSON.parse(data.body)

                        console.log("user update")
                        console.log(rcvChat.length)


                        $(".chat_user").remove();
                        for( i=0; i<rcvChat.length; i++){

                            
                            var rUid = rcvChat[i].userId;
                            var rAuth = rcvChat[i].roomAuth;
                            
                            var newUl = document.createElement("li");


                            newUl.classList.add("chat_user")
                            newUl.classList.add(rUid);

                            var inTag = "";

                            inTag +=                
                                        '<div class="chat_user_id">'+rUid+'</div>'
                                    + '<div class="chat_user_auth '+rAuth+'"></div>'
                                    + '<div class="chat_user_my"></div>';

                            newUl.innerHTML=inTag;


                            $(".user_list").append(newUl);
                            
                            ckOwn();


                        }


                        
                    });
                    stompClient.subscribe(subUpChat, function (data) {


                                let rcvChat = JSON.parse(data.body)

                        
                                console.log("cnt update")
                        

                                for( i=0; i<rcvChat.length; i++){

                                    var rid = rcvChat[i].chatId;
                                    var rCnt = rcvChat[i].chatCkCnt;
                                    var rState = rcvChat[i].chatState;

                                    $(".chat"+rid+ " .chat_cnt").text(rCnt);
                                    $(".chat"+rid+ " .chat_content").text(rCnt);
                                    var k = $(".chat"+rid+ " chatState")
                                    k.removeClass();
                                    k.addClass("chatState");
                                    k.addClass(rState);


                                }



                    });

                    
                   
                })

            }


            function disconnect() {

                
                $(window).on("beforeunload", function (e) {
                    
                    e.preventDefault();
                    

                alert("disconnect");

                
                sendDate = JSON.stringify(newChat)
                stompClient.send("/app/chat/close", {}, sendDate);



                if (stompClient !== null) {
                    stompClient.disconnect();
                }

                console.log("Disconnected");
  
              });
             

            }

            function sendChat() {
                let inputText =$(".send_chat").val();
            
            
                

                if(inputText.trim().length==0) return;

                $(".send_chat").val("");
                newChat.chatContent=inputText;
                
                sendDate = JSON.stringify(newChat)


                stompClient.send("/app/chat/message", {}, sendDate);


                $(".send_chat").focus();

            }



            

            function displayChat(rcvChat) {
                let newChatEL = document.createElement("li");
                
                newChatEL.classList.add('chat');
                newChatEL.classList.add('chat'+rcvChat.chatId);
                
                let chatWriter = rcvChat.userId;
                let chatContent = rcvChat.chatContent;
                let chatState = rcvChat.chatState;
             
       

                let chatCkCnt = rcvChat.chatCkCnt;
                let chatDate = new Date(rcvChat.chatDate);
                let hours = chatDate.getHours() % 12 ? chatDate.getHours() % 12 : 12;
                let minutes = chatDate.getMinutes() < 10 ? '0' + chatDate.getMinutes() : chatDate.getMinutes();
                let ampm = chatDate.getHours() >= 12 ? '오후 ' : '오전 ';

                let fmDate =ampm +hours+":"+minutes;


                let innerText =""
                if(chatState==='alert'){
                    newChatEL.classList.add('chat_alert');
                    
                    innerText+='<div class="chat_con">'+chatContent+'</div>';

                }else{

                    if(chatWriter===userId){
                        
                        
                        chatWriter+=" my_chat";
            
                        
                        
                    }
          


                    innerText+= 
                                '		<div class="'+ chatWriter +'" >'+ chatWriter+'</div>'
                                + '		<div class="chat_con">'+ chatContent +'</div>'
                                + '		<div class="chat_state '+ chatState+'">'
                                + '			<div class="chat_cnt cnt'+rcvChat.chatCkCnt+'">'+rcvChat.chatCkCnt+'</div>'
                                + '			<div class="chat_date">'+fmDate+'</div>'
                                + '		</div>'
   



                }

                
                newChatEL.innerHTML= innerText;

                $(".chat_list").append(newChatEL);
                

                $(".chat_list_wrap").scrollTop($(".chat_list").height());


            }


            function addSendBtnEvent(){

                

                $(".send_btn").click(function(){

                    sendChat()

                });

         
                $(".send_chat").on("keyup",function(key){

                    console.log(key.keyCode===13);
                    
                    
                    if(key.keyCode===13) {
                        
                        key.preventDefault();
                        if(!key.shiftKey){
                            console.log(key.keyCode);
                            sendChat()
                        }
                    }
                });

            }

            function focusScroll(){

                
                let target =$(".chat-1");


                if(target.length==0){
                 

                        target=$(".chat").last();
                    }
                    
                

                if(target.length!=0){
                let offsetTop =target.position().top;
       
                    
            
           
               
                $('.chat_list_wrap').scrollTop(offsetTop);
                }
            }

            var inviteUserList = new Array();

            

            function selectUser(){

                console.log("select");
                $("input:checkbox[name='userList']").change(function(){
           
                    
                    var $this = $(this);
                    var targetId = $this.attr('id');
                    var maxCnt = "${chatInfo.chatRoomMax}";

                    var ckCnt = $("input:checkbox[name='userList']:checked").length;
              

                    if(ckCnt > maxCnt){

                        alert("지정 된 최대 인원 수보다 많은 인원을 초대할 수 없습니다.\n최대 인원 수를 변경해 주세요.");
                        $this.prop("checked",false);
                        return;

                    }

                    if($this.is(":checked")){

                        var li = document.createElement("li");
                        
                        li.innerText=$this.val();
                        li.classList.add(targetId);


                        $(".invite_list ul").append(li);

                        $("."+targetId).click(function(){

                            for(let i = 0; i < inviteUserList.length; i++) {
                                
                                if (array[i] === $this.val()) {
                                    array.splice(i, 1);
                                }
                            }


                            $(this).remove();
                 

                            $this.prop("checked",false);

                        })

                       

                   

                        inviteUserList.push($this.val());




                    }else{


                        
                        for(let i = 0; i < inviteUserList.length; i++) {
                            if (array[i] === $this.val()) {
                                array.splice(i, 1);
                            }
                        }
                        
                        $("."+targetId).remove();

                        
                    }


                })
                }
            
            function addModal(){

                $(".btn_modal_close").click(function(){

                    $(".invite_wrap").toggleClass("show");
                })
            $(".btn_modal").click(function(){


                let reqUrl = "inviteUser?chatRoomId="+roomId;

                
                
                let inviteData = {
                    "userList":inviteUserList
                }
               

                console.log(inviteData)
                $.ajax({
                    url: reqUrl,
                    type: "POST",
                    data: inviteData,
               
                    success: function (data) {

                        
                        alert(data);

                        $(".invite_wrap").toggleClass("show");
                       
                    }
                });

            })

            $(".invite_btn").click(function(){


                let reqUrl = "getAllMember?chatRoomId="+roomId;

                $.ajax({
                    url: reqUrl,
                    type: "GET",
                    data: "",

                    success: function (data) {

                        console.log(data);
                        let userList = data;

                        

                  
                        for(i=0;i<userList.length;i++){

                            let memberEl = document.createElement("li");
                            let memberHtml="";

                            memberHtml+=

                                "    <label for=user_"+i+" class='playlist-user'>   "
                            +   "        <input id= user_"+i+" type='checkbox' name='userList' value="+userList[i].userId+" readonly> " 
                            +    userList[i].userId
                            +    "    </label> "

                            memberEl.innerHTML=memberHtml;
                            $(".user_list.playlist ul").append(memberEl);
                        }
                        
                        selectUser();
                        

                    }
                })
                



                $(".invite_wrap").toggleClass("show");
            




            })


            $(".user_btn").click(function(){
                $(".side_wrap").toggleClass("show");


            })

            $(".side_close_btn").click(function(){


                $(".side_wrap").toggleClass("show");

            })



            }
  
        
        


            //////////////////////////////////////////////////////////////
            // 메인
            $(function () {

                var flag = "${resMap.flag}"
            
                if(flag==="false"){

                    alert("${resMap.msg}");
                    window.close();


                }

                ckOwn();


                addSendBtnEvent();
                    
                connect();

                disconnect();

                focusScroll();

               
                addModal();


           
            });


            

        </script>

</body>

</html>
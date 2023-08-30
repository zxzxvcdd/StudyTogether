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

.user_wrap{

    display: none;
    position: fixed;
    top:0;
    right: 0;


    width: 100vw;
    height: 100vh;

    width: 100vw;

    background: rgba(0,0,0,0.1);


}

.user_wrap.show{
    display:block;

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
    
    height: 70vh;
    overflow: auto;
    
}
.chat_list{
    height: auto;
    
    
}

li.chat{

    min-height: 30px;
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
.chat_alert .chat_con{

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

.chat_date{



}

div.my_chat{

    display: none;

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
    
    margin-top: 10px;
    font-size: 16px;
    letter-spacing: -.3px;
    overflow: hidden;
    width: 50px;
    padding: 8px 6px 7px;
    border-radius: 6px;
    background-color: #ecf0f1;
    font-weight: 500;
    color: #2f3640;

    cursor: pointer;

}

button:hover{

    background-color: #f9ca24;
    color: #fff;


}
.side_wrap{

    display: none;
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
                        <button type="button" class="search_btn">검색</button>
                    </div>
                    <div class="user_btn_wrap">
                        <button type="button" class="user_btn">목록</button>
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
                                        <div class="chat_state">
                                            <div class="chat_cnt">${chat.chatCkCnt}</div>
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
                        <input type="text" name="chatContent" class="send_chat" autofocus>
                    </div>
                    <div class="send_btn_wrap">

                        <button type="button" class="send_btn">
                            전송
                        </button>

                    </div>
                    
                </div>

            </section>

            <section class="side_wrap">

             






            </section>

            

           

            


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


            let focusTarget = $(".chat-1");



            function ckOwn(){

                $("."+userId).addClass("my_chat");
            }

           





  

            function connect(){

                var socket = new SockJS("/kgstudy/msgProc");
                stompClient = Stomp.over(socket);

                stompClient.connect({}, function(frame){

                    console.log('Connected: ' + frame);

                    var subChat = '/topic/chat/room/'+roomId;
                    var subReload = '/topic/chat/reload/'+roomId;
            
                    stompClient.subscribe(subChat, function (data) {

                        
        
                        let rcvChat = JSON.parse(data.body)

                        console.log(rcvChat);


                        displayChat(rcvChat);
                    
                    });

                    stompClient.subscribe(subReload, function (data) {

                        location.reload()
                    });

                    addSendBtnEvent();
                    $(window).on("beforeunload", disconnect);
                    focusScroll(focusTarget);

                })

            }


            function disconnect() {

                
                event.preventDefault();

                
                sendDate = JSON.stringify(newChat)
                stompClient.send("/app/chat/close", {}, sendDate);



                if (stompClient !== null) {
                    stompClient.disconnect();
                }
                
                console.log("Disconnected");

            }

            function sendChat() {
                let inputText =$(".send_chat").val();
            
                if(inputText.trim==="") return;


                newChat.chatContent=inputText;
                
                sendDate = JSON.stringify(newChat)


                stompClient.send("/app/chat/message", {}, sendDate);



            }


            

            function displayChat(rcvChat) {
                let newChatEL = document.createElement("li");
                
                newChatEL.classList.add('chat');
                newChatEL.classList.add('chat'+rcvChat.chatId);
                
                let chatWriter = rcvChat.userId;
                let chatContent = rcvChat.chatContent;
             
       

                let chatCkCnt = rcvChat.chatCkCnt;
                let chatDate = new Date(rcvChat.chatDate);
                let hours = chatDate.getHours() % 12 ? chatDate.getHours() % 12 : 12;
                let minutes = chatDate.getMinutes() < 10 ? '0' + chatDate.getMinutes() : chatDate.getMinutes();
                let ampm = chatDate.getHours() >= 12 ? '오후 ' : '오전 ';

                let fmDate =ampm +hours+":"+minutes;


                let innerText =""
                if(rcvChat.chatState==='alert'){
                    newChatEL.classList.add('chat_alert');
                    
                    innerText+='<div class="chat_con">'+chatContent+'</div>';

                }else{

                    if(chatWriter===userId){
                        
                        
                        chatWriter+=" my_chat";
            
                        
                        
                    }
          


                    innerText+= 
                                '		<div class="'+ chatWriter +'" >${chat.userId}</div>'
                                + '		<div class="chat_con">'+ chatContent +'</div>'
                                + '		<div class="chat_state">'
                                + '			<div class="chat_cnt">'+rcvChat.chatCkCnt+'</div>'
                                + '			<div class="chat_date">'+fmDate+'</div>'
                                + '		</div>'
   



                }

                
                newChatEL.innerHTML= innerText;

                $(".chat_list").append(newChatEL);
                

                $(".chat_list_wrap").scrollTop($(".chat_list").height());


            }


            function addSendBtnEvent(){

                
                $(".send_btn").click(
                    sendChat
                    
                    
                    );
                $(".send_chat").on("keyup",function(key){

                    console.log(key.keyCode===13)

                    if(key.keyCode===13) {
                        sendChat
                    }
            });

            }

            function focusScroll(target){

                if(!target||target.innerText===undefined){
                    
                    target=$(".chat").last();
                }
                
                console.log(target.innerText);
                console.log($(".chat").last());
                let offsetTop =target.offset().top;
                offsetTop =target.offset().top;
                console.log(target);
                console.log(target.offset());
                console.log(offsetTop);
           
               
                $('.chat_list_wrap').animate({scrollTop: offsetTop}, 0);

            }


            
           
  
        
        


            //////////////////////////////////////////////////////////////
            // 메인
            $(function () {



                

                ckOwn();

                connect()

                

                


           
            });


            

        </script>

</body>

</html>
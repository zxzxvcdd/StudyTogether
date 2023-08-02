<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
            <!DOCTYPE html>
            <html>

                <head>
                    <meta charset="UTF-8"/>
                    <meta name="viewport" content="width=device-width, initial-scale=1">
                        <title>Insert title here</title>
                        <link
                            rel="stylesheet"
                            href="${pageContext.request.contextPath }/resources/css/seatPage.css"/>
                        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
                        <link
                            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
                            rel="stylesheet"
                            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
                            crossorigin="anonymous"/>
                        <script
                            src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
                            crossorigin="anonymous"
                            defer="defer"></script>
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
                                
                                margin: 0 auto;
                                padding: 20px;
                            }
                            .seatinfo_wrap_1 {
                                box-sizing: border-box;
                                box-shadow: 1px 1px 5px #ddd;
                                height:auto;
                                margin-bottom: 10px;
                                text-align: center;
                                width: 1000px;
                                display: inline-block;
                                font-size: 15px;
                                font-weight: 500;
                                color: #333;
                                background: white;
                                margin: 10px auto;
	                            display:block;
                            }

                            .seat_wrap {
                                margin-top: 50px;
                                background: white;
                                width: 1000px;
                                height: 600px;
                                margin: 0 auto;
                                border-radius: 0.28571rem;
                                box-shadow: 1px 1px 5px #ddd;
                                position: relative;
                            }

                            .add_btn {
                                background: gray;
                                width: 50px;
                                height: 50px;
                                position: absolute;
                                top: 20%;
                                right: 10%;
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

                            .seatinfo div {
                                box-shadow-right: 1px 1px 5px #ddd;
                            }

                            .seatinfo div:last-child {
                                box-shadow-right: none;
                                border-right: none;
                            }

                            .seatinfo_title {
                                width: 24.3%;
                                display: inline-block;
                                box-sizing: border-box;
                            }

                            .seatinfo_content {
                                box-sizing: border-box;
                                width: 24.3%;
                                display: inline-block;
                            }

                            .seatinfo_bar {
                                height: 35px;
                                
                                display: inline-block;
                                width: 6px;
                                margin-left: -3px;
                                margin-right: -3px;
                                z-index: 10;
                                vertical-align: middle;
                                box-sizing: border-box;
                                border: 3px solid transparent;
                            }

                            .seat_wrap ul {
                                display: inline-flex;
                                margin: 0;
                                padding-left: 0;
                                cursor: inherit;
                                list-style: none;
                            }

                            .seat_wrap ul li {
                                list-style-type: none;
                                margin-right: 10px;
                                font-size: 0.1px;
                                font-weight: 500;
                                color: #575962;
                            }

                            .seat_wrap ul li span {
                                display: inline-block;
                                width: 9px;
                                height: 9px;
                                margin-top: 4px;
                                margin-right: 5px;
                                border-radius: 10px;
                                background-color: white;
                                vertical-align: top;
                                margin-right: 0;
                            }

                            .seat_check {
                                text-align: center;
                            }

                            .seat_list {
                                zoom: 0.9;
                            }

                            .box {
                                font-size: 0.75rem;
                                height: 40px;
                                width: 40px;
                                box-shadow: 1px 1px 5px #ddd;
                                border: solid 1px white;
                                color: black;
                                border-radius: 5px;
                                cursor: pointer;
                                text-align: center;
                                position: absolute;
                     
                            }

                            .box:hover {
                                background: gray;
                                transform: translate(0, 0);
                               
                            }

                            .seat_color1 {
                                background-color: green;
                                cursor: default;
                            }

                            .seat_color2 {
                                background-color: red;
                                cursor: default;
                            }

                            .seat_color3 {
                                background-color: gray;
                                cursor: default;
                            }

                            .myseat {
                                cursor: pointer;
                                background-color: violet;
                            }

                            .box .active {
                                }

                            .container {
                                display: none;
                                position: absolute;
                                top: 0;
                                bottom: 0;
                                left: 0;
                                right: 0;
                                margin: auto;
                                max-width: 400px;
                                margin: 30px auto 10px;
                                background-color: rgba(0, 0, 0, 0.06);
                                border-radius: 5px;
                                padding: 0;
                                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                                top: 0;
                            }

                            .inner_modal {
                                display: block;
                            }

                            .container h1 {
                                font-size: 30px;
                                text-align: center;
                                padding: 10px 20px;
                                margin-bottom: 0;
                                background: #fff;
                            }

                            .form-group {
                                padding: 20px;
                                margin-bottom: 3px;
                                background: #fff;
                            }

                            .order-title {
                                display: block;
                                clear: both;
                            }

                            .order-title > div {
                                float: right;
                            }

                            .order-title > div:first-child {
                                float: left;
                                font-size: 20px;
                            }

                            .order-title div:last-child {
                                font-size: 20px;
                                font-weight: 550;
                                width: 100%;

                            }

                            .menu-list-form .font {
                                margin-bottom: 0;
                                padding-bottom: 20px;
                                box-sizing: border-box;
                                height: 40px;
                            }

                            .menu-list-form:has(div.show) {
                                padding-bottom: 10px;
                            }

                            .menu-list-form:has(div.show) .font {
                                border-bottom: 2px solid rgba(0, 0, 0, 0.1);
                                transition: all 0.5s ease-in-out;
                            }

                            .menu-list-form:has(div.show) .open-menu {
                                border: 0;
                            }

                            .menu-list-form:has(div.show) .open-menu::after {
                                transform: rotate(-180deg);
                            }

                            .menu-list-con {
                                display: none;

                            }

                            .menu-list-con.dblock {
                                display: block;
                                box-shadow: 1px 1px 5px #ddd;
                            }

                            .buttons {
                                text-align: center;
                                /* margin: 20px 0; */
                                box-shadow: 1px 1px 5px #ddd;

                                padding: 20px;
                                background: #fff;

                            }
                            .store_check {

                                width: 400px;
                                text-align:center;

                            }

                            .store_check * {
                                display: inline-block;

                            }

                            .goChange,
                            .store_id {
                                padding: 10px 20px;
                                margin-right: 10px;
                                font-size: 16px;
                                border: none;
                                border-radius: 5px;
                                color: #fff;
                                background-color: #FDD000;
                                cursor: pointer;
                            }

                            button:hover {
                                background-color: #F0F0F0;
                                color: #000;
                            }

                            input[type="text"],
                            textarea {
                                width: 300px;
                                padding: 8px;
                                border: 1px solid #ccc;
                                border-radius: 3px;
                            }

                            input[type="radio"] {
                                margin-right: 5px;
                            }

                            .modal.show {

                                display: block;
                                top: 0;

                                position: fixed;
                                top: 0;
                                left: 0;
                                bottom: 0;
                                right: 0;
                                background: rgba(0, 0, 0, 0.4);

                            }
                            .modal.show .modal-dialog {

                                margin-top: 300px;

                            }

                            .modal.show * {

                                font-size: 14px;

                            }

                            .modal.show .modal-title {
                                font-size: 16px;
                                font-weight: 700;
                            }

                            .modal.show .modal-body {}

                            .btn_wrap{

                             

                            }
                            .btn-con{

                                display:block;
                                width:300px;
                                margin : 0 auto;
                                text-align:center;
                            }
                            .btn-con *{
                                display:inline-block;
                                
                            }
                             header .navbar{

                                display:block;
                             }

                            header .navbar a {
                                display: block;
                                font-size: 2rem;
                                color: #fff;
                                margin: 2rem 0;
                                text-decoration:none;
                            }
                            header .navbar a:hover {
                                letter-spacing: .2rem;
                                color: var(--grean-color);
                            }

                            header .follow a {
                                font-size: 2rem;
                                color: #fff;
                                margin: 0 .7rem;
                            }

                            header .follow a:hover {
                                color: var(--grean-color);
                            }

                        </style>
                    </head>


                   

                    <body>
                    <%@include file="./include/header.jsp"%>
                  
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
                                                <div class="seatinfo_content">${stName}</div>
                                                <div class="seatinfo_content">${totalSeat}</div>
                                                <div class="seatinfo_content">${seatCnt}</div>
                                                <div class="seatinfo_content">${seatCk}</div>
                                            </div>
                                        </div>

                                        <div class="seat_wrap">
                                            <div class="seat_check">
                                                <ul>
                                                    <li>
                                                        <span style="background: #669934"></span>
                                                        이용 가능</li>
                                                    <li>
                                                        <span style="background: #6b6c68"></span>
                                                        이용 불가</li>
                                                    <li>
                                                        <span style="background: #cd3333"></span>
                                                        이용중</li>
                                                    <li>
                                                        <span style="background: violet"></span>
                                                        본인 좌석</li>
                                                </ul>
                                            </div>

                                            <!-- ========== 테스트 ====================== -->
                                            <c:set var="userId" value="aa"/>

                                            <!-- 좌석 리스트 -->
                                            <div class="seat_list">
                                              

                                            </div>

                                        </div>
                                    </div>

                                </div>

                                    <div class="btn_wrap">
                                        <div class="btn-con">
                                            <button type="button" class="goChange" onclick="newSeatForm()">좌석 추가</button>
                                            <button type="button" class="goChange" onclick="updateSeat()">수정 완료</button>
                                        </div>
                                    </div>
                                <div
                                    class="modal fade modal-del"
                                    id="exampleModal"
                                    tabindex="-1"
                                    role="dialog"
                                    aria-labelledby="exampleModalLabel"
                                    aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">좌석 수정 창</h5>
                                                <button type="button" class="close del-close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                원하시는 작업을 선택해 주세요
                                                <div class="modal-footer">
                                                    <div class="btns">
                                                        <div class="btn btn-primary btn-del">삭제</div>
                                                        <div class="btn btn-primary btn-change" data-dismiss="modal">상태변경</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                  <div
                                    class="modal fade modal-new"
                                    id="exampleModal"
                                    tabindex="-1"
                                    role="dialog"
                                    aria-labelledby="exampleModalLabel"
                                    aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">좌석 생성 창</h5>
                                                <button type="button" class="close btn_close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                좌석이름: <input type="text" class="new-seat" name="seatName">
                                                <div class="modal-footer">
                                                    
                                                        <div class="btn btn-primary btn-new">생성</div>
                                                        <div class="btn btn-primary btn_close" data-dismiss="modal">취소</div>
                                                  
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                    <!-- <nav class="add_btn"></nav> -->

                                    <Script>

                                        let newPosX = 0,
                                            newPosY = 0,
                                            startPosX = 0,
                                            startPosY = 0,
                                            index = 0,
                                            targetSeat;
                                        



                                        const seatList = new Array();
                                        let newSeat;
                                        <c:forEach var="vo" items="${seat}" varStatus="status">
                                            
                                                newSeat = new Object();
                                                newSeat.seatId= "${vo.seatId}";
                                                newSeat.seatName= "${vo.seatName}";
                                                newSeat.storeId= "${vo.storeId}";
                                                newSeat.seatType= "${vo.seatType}";
                                                newSeat.x= "${vo.x}";
                                                newSeat.y= "${vo.y}";
                                                

                                                index++;
                                                seatList.push(newSeat);

                                                createSeat(index-1);
                                            
                                        </c:forEach>
                                        let storeId= seatList[0].storeId;
                                        
                                        function createSeat(i){

                                            let newBox = document.createElement("div");+i


                                            newBox.classList.add("box");
                                            
                                            newBox.classList.add("box"+i);
                                            if("${loginUser.user_id}"===seatList[i].userId && seatList[i].seatType=='N'){
                                                newBox.classList.add("myseat");
                                            }
                                            
                                            newBox.setAttribute("data-id",seatList[i].seatId);
                                            newBox.setAttribute("data-name",seatList[i].seatName);
                                            newBox.setAttribute("data-type",seatList[i].seatType);
                                            
                                            newBox.setAttribute("data-index",i);
                                            newBox.innerText=newSeat.seatName;
                                            
                                            $(".seat_list").append(newBox);
                                   
                                            $(".box"+i).css("top",seatList[i].y+"px");
                                            $(".box"+i).css("left",seatList[i].x+"px");

                                            refreshTypeClass(".box"+i)
                                            addDbClickEvent(".box"+i);
                                            addMoveEvent(".box"+i);


                                        }
                                        
                                        function addDbClickEvent(newBox) {

                                            
                                            $(newBox).dblclick(function (e) {

                                               
                                                e.preventDefault();

                                                $(".modal-del").toggleClass("show");
                                                
                                                targetSeat = this;

                                            })

                                        }

                    


                                        function addMoveEvent(newBox) {

                                            
                                            $(newBox).mousedown(function(eq){
                                                
                                                startPosX = eq.clientX;
                                                startPosY = eq.clientY;
                                                eq.preventDefault();
                                                console.log(startPosX);
                                                console.log("mousedown");

                                      
                                                
                                                $(document).mousemove(moveSeat)
                                                $(document).mouseup(function(){
                                                    console.log("mouseup");
                                                    $(document).off("mousemove")
                                                })

                                            


                                                function moveSeat(e) {
                                                    e.preventDefault();
                                                    
                                                    newPosX = startPosX - e.clientX;
                                                    newPosY = startPosY - e.clientY;
                                                   
                                                    startPosX = e.clientX;
                                                    startPosY = e.clientY;
                                        
                                                    curY = e.clientY-20-50;
                                                    curX = (e.clientX-20-317-240);
                                                    
                                                    $(newBox).css("top",curY+ "px") 
                                                    $(newBox).css("left",curX+ "px") 

                                                    let offsetLeft = ($(newBox).offset().left - newPosX);
                                                    let offsetTop = ($(newBox).offset().top - newPosY);
                                                    
                                                   


                                       
                                                                                   

                                                    let targetIndex = $(newBox).data("index");
                                                    

                                                    seatList[targetIndex].x = curX;
                                                    seatList[targetIndex].y = curY;
                                                
                                                }      


                                            })
                                            

                                        }

                                        function changeState() {
                                            
                                            let targetType = $(targetSeat).data("type");
                                            let targetIndex = $(targetSeat).data("index") ;
                                            
                                            let changeType;
                                            if (targetType === "Y") {

                                                console.log("비활성화")
                                                changeType = "D"
                                            } else if (targetType === "D") {
                                                
                                                console.log("활성화")
                                                changeType = "Y"

                                            } else if (targetType === "N") {

                                                alert("사용중인 좌석은 상태를 변경할 수 없습니다.");
                                                return;
                                            }

                                   
                                            $(targetSeat).data("type", changeType);
                                            
                                            console.log($(targetSeat).data("type"));
                                            console.log($(targetSeat));


                                            seatList[targetIndex].seatType = changeType;
                                            console.log(seatList[targetIndex].seatType);
                                            refreshTypeClass(targetSeat);

                                        }

                                        function addDelModalEvent() {

                                            $(".btn-del").click(function () {

                                                delSeat()
                                                $(".modal-del").toggleClass("show");
                                            })

                                            $(".btn-change").click(function () {

                                                changeState();
                                                $(".modal-del").toggleClass("show");

                                            })
                                            $(".del-close").click(function () {
                                                $(".modal-del").toggleClass("show");
                                               

                                            })
                                        }
                                        function addNewModalEvent() {

                                            $(".btn-new").click(function () {
                                                
                                                newSeat = new Object();
                                                newSeat.seatId= "0";
                                                newSeat.seatName= $('input[name=seatName]').val();
                                                newSeat.storeId= storeId;
                                                newSeat.seatType= "Y";
                                                newSeat.x= "50";
                                                newSeat.y= "50";
                                                

                                                index++;
                                                seatList.push(newSeat);
                                                createSeat(index-1)
                                                $(".modal-new").toggleClass("show");
                                      
                                            })

                                            $(".btn_close").click(function () {
                                                $(".modal-new").toggleClass("show");
                    

                                            })

                                        }

                                        function delSeat() {

                                            if (confirm("좌석을 삭제 하시겠습니까?")) {


                                                var reqUrl = "deleteSeat.do?seatId="+$(targetSeat).data("id");


                                                $.ajax({
                                                    url: reqUrl,
                                                    type: "GET",

                                                    success: function (data) {

                                                        console.log(data);
                                                        var resMap = data;

                                                        alert(resMap.msg);
                                                        if(resMap.flag==1){
                                                            
                                                            let targetIndex = $(targetSeat).data("index");
                                          
                                                            $(targetSeat).remove();
                                                            seatList.splice(targetIndex,1);
                                                            index--;

                                                        }

                        
                                                    }
                                                })


                                    



                                            }

                                        }


                                        function refreshTypeClass(newBox) {

                                           
                                                let seatType = $(newBox).data("type");

                                           

                                                $(newBox).removeClass('seat_color1');

                                                $(newBox).removeClass('seat_color2');
                                                $(newBox).removeClass('seat_color3');

                                                if (seatType === "Y") {
                                                    $(newBox).addClass('seat_color1');
                                                } else if (seatType === "N") {
                                                    $(newBox).addClass('seat_color2');
                                                } else if (seatType === "D") {
                                                    $(newBox).addClass('seat_color3');
                                                }

                                      

                                        }


                                        function updateSeat(){

                                            
                                      


                                            
                                            
                                            
                                            
                                            let postData = JSON.stringify(seatList);
                                            
                                            var reqUrl = "updateSeat.do";
                                       
                                            $.ajax({
                                                url: reqUrl,
                                                type: "POST",
                                                contentType: "application/json;charset=UTF-8",
                                                data: postData, 
                                                success: function(data){
                                                    
                                          
                                                    console.log(data);

                                                    let resMap= data

                                                    alert(resMap.msg);
                       
                                                }
                                            })


                                        }

                                        function newSeatForm(){

                                            
                                            $(".modal-new").toggleClass("show");



                                        }
                                       

                                        $(document).ready(function () {
                                            addNewModalEvent();
                                            addDelModalEvent(); 
                                         

                                          
                                           

                                        })
                                    </Script>

                                </body>

                            </html>
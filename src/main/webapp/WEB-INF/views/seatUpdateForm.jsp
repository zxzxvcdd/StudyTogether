<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
            <!DOCTYPE html>
            <html>

                <head>
                        <%@ include file="./include/static-header.jsp" %> 
                    <title>Insert title here</title>
                    <link rel="stylesheet" href="/kgstudy/resources/css/seatPage.css?after"/>
                    <script src="/kgstudy/resources/js/jquery-3.7.0.min.js"></script>
                    <script src="/kgstudy/resources/js/seat/seatUpdate.js"></script>

               
                    
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
                                        
                                    
                                       

          
                                    </Script>

                                </body>

                            </html>
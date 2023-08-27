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

                                </div>
                            </div>


                            <div class="studies-body">
                                <c:forEach var="chatRoom" items="${resMap.chatRoomList}" varStatus="status">

                                    <div class="study-item-list-wrap flex-wrap">
                                        <div class="study-item-list flex-wrap">
                                            <div class="study-item-img-wrap"><img
                                                src="https://img.camstudy.us/room/c2679a3b9e9b4ffeb1f0bdda87f66127/img/x412m1krgqfbz.jpg"
                                                    alt="study-img" class="study-item-img">
                                                    <div class="study-item-info-cover">
                                                    <div class="study-item-info-badge-wrap"><!----> <!----> <!----></div>
                                                    <!---->
                                                    <div class="study-item-info-personnel-wrap"><span
                                                            class="study-item-info-personnel present">0</span> <span
                                                            class="study-item-info-personnel maximum">16</span></div>
                                                    <div class="room-more-view-btn-area"><!----></div> <!---->
                                                </div>
                                            </div>
                                            <div class="study-item-tx-wrap"><em class="study-item-tx title">매일매일 30분 미션
                                                    인증📝</em>
                                                    <div class="study-item-tx-hashtag-wrap"></div>
                                                </div>
                                            </div>
                                        
                                        </div>
                                        <div class="studies-more-btn-wrap"><button class="studies-more-btn">더보기</button></div>
                                    </div>
                            </c:forEach>
                        </div>
                        



                    </div>





                    <%@include file="../include/footer.jsp" %>



                        <script>


                            let msg = "${msg}";

                            if (msg) {
                                alert(msg);
                            }



                        </script>

            </body>

            </html>
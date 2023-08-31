<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link
	href='${pageContext.request.contextPath}/resources/fullcalendar-5.11.4/lib/main.css'
	rel='stylesheet' />
<script
	src='${pageContext.request.contextPath}/resources/fullcalendar-5.11.4/lib/main.js'></script>

<%@ include file="../include/static-header.jsp"%>

<script>

	var selectedEventId; // 클릭한 이벤트의 아이디를 저장할 변수
	
	//오늘날짜
	function getToday(){
	    var date = new Date();
	    var year = date.getFullYear();
	    var month = ("0" + (1 + date.getMonth())).slice(-2);
	    var day = ("0" + date.getDate()).slice(-2);
	    return year + "-" + month + "-" + day;
	}

	//fullcalendar
	document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');

	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      headerToolbar: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'dayGridMonth,timeGridWeek,timeGridDay'
	      },
	      initialView: 'dayGridMonth',	    
	      initialDate: getToday(), // 초기 날짜 설정 ( 설정하지 않으면 오늘 날짜가 보임 )
	      navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
	      // editable: true,
	      selectable: true, // 달력 일자 드래그 설정 가능
	      selectMirror: true,
	      locale: 'ko', // 한국어 설정
	      dateClick: function(info){
	    	  //alert('클릭한 날짜: ' + info.dateStr);
	    	  $(".start_d").val(info.dateStr);
	    	  $(".insertModal").addClass("show");
	    	 	
	      },
	      select: function(arg) {
	    	 
	    	  $(".insertModal").addClass("show");
	    	  
	    	 // 드래그한 날짜를 가져옴
	        var startDate = arg.start;
	        var endDate = arg.end;

	    	// 시작 날짜와 종료 날짜를 input 태그에 채움 (이렇게 하면 전날짜가 입력되고 db에 저장됨;;)
	       	// var startDateStr = startDate.toISOString().split('T')[0];
	        
	        
	     // 날짜를 수정해서 넣지 않으면 날짜 데이터가 하루전 날짜로 출력됨
	        var startDate2 = new Date(startDate);
	        startDate2.setDate(startDate.getDate() + 1);
	        var startDateStr = startDate2.toISOString().split('T')[0];
	        
	        var endDateStr = endDate.toISOString().split('T')[0];
	        
	        var endDate2 = new Date(endDate);
		    endDate2.setDate(endDate.getDate() + 1);
		    var endDateStr2 = endDate2.toISOString().split('T')[0];
	        

	        $(".start_d").val(startDateStr);
	        $(".end_d_str").val(endDateStr); //출력 데이터
	        
	        $(".end_d").val(endDateStr2); //db에 저장되는 데이터
	        
	        // title 값이 있을때, 화면에 calendar.addEvent() json 형식으로 일정을 추가   
	        if (title) {
	          	calendar.addEvent({
	            title: title,
	            start: arg.start,
	            end: arg.end,
	            allDay: arg.allDay
	          })    
	        }
	       calendar.unselect()  // 드래그 이벤트 선택 취소
	       
	      },
	      eventClick: function(arg, successCallback, failureCallback) {

	    	  var id = arg.event.id;
	    	  var userID = "${loginUser.user_id}"
		    	console.log("userID : " + userID);
	    	  console.log("아이디 : " + id);
	    	  
	    	  selectedEventId = id; // 클릭한 이벤트의 아이디를 변수에 저장
	    	  
			//db연동시킬곳 => json데이터
			// ajax 처리로 데이터를 로딩 시킨다.
	    	 $.ajax({
	    		 type:"get",
	    		 url:"${pageContext.request.contextPath}/calendar/oneData.do",
	    		data:{id: id},
	    		dataType:"Json",
	    		success:function(data){
	    			console.log("Received data:", data);
	    			
	    			$("#title").val(data.title);
	    			$("#content").val(data.content);
	    			$("#start").val(data.start);
	    			
	    			// endDate 화면출력 (날짜 수정)
	    			var endDate = data.end;
	    			var endDate2 = new Date(endDate);
	    			endDate2.setDate(endDate2.getDate() - 1);
	    			var endDateStr2 = endDate2.toISOString().split('T')[0];
	    			//console.log(endDateStr2);
	    			$("#end").val(endDateStr2); //화면 출력 데이터
	    			
	    			
	    			const id = parseInt(data.id, 10);
	    			$("#id").val(id);
	    			
	    			//$(".color").val(data.color);
	    			

	    		},
	    		error: function(error){
	    			console,error("Error data :" , error);
	    			//failureCallback(error);
	    		}
	    	  });
	    	  
	        if (confirm('해당 일정을 수정 및 삭제 하시겠습니까?')) {
				
	        	$(".updateModal").addClass("show");
	        	
	        	// 삭제 버튼 클릭 시, JavaScript 함수 호출하여 이벤트 아이디 전달
	            $("#deleteEventButton").click(function() {
	                if (confirm('해당 일정을 삭제 하시겠습니까?')) {
	                    deleteEvent(selectedEventId); // 저장한 이벤트 아이디를 전달
	                }
	            });
	        	
	        }
	      },
	      editable: true,
	   	  // 이벤트가 드래그되었을 때의 동작 정의
          eventDrop: function(info) {
        	// 드래그한 날짜를 가져옴
        	    var startDate = info.event.start;
        	    var endDate = info.event.end;

        	    // 시작 날짜와 종료 날짜를 input 태그에 채움
        	    $(".start_d").val(startDate.format("YYYY-MM-DD"));
        	    $(".end_d").val(endDate.format("YYYY-MM-DD"));
              
          },
	      dayMaxEvents: true, // allow "more" link when too many events
	      events: function(info, successCallback, failureCallback){
	    	  //db연동시킬곳 => json데이터
	    	  // ajax 처리로 데이터를 로딩 시킨다.
	    	  
	    	  var userID = "${loginUser.user_id}"
	    	  console.log("userID : " + userID);
	    	  
	    	  $.ajax({
	    		 type:"get",
	    		 url:"${pageContext.request.contextPath}/calendar/data.do",
	    		 data:{userID: userID},
	    		dataType:"Json",
	    		
	    		success:function(data){
	    			console.log("Received data:", data);
	    			successCallback(data);
	    		},
	    		error: function(error){
	    			console,error("Error data :" , error);
	    			failureCallback(error);
	    		}
	    	  });
	    	  
	      }
	    });

	    calendar.render();
	  });
	

 	// 이벤트 삭제 함수 (Ajax 요청으로 서버에 삭제 요청)
    function deleteEvent(eventId) {
        $.ajax({
            type: "get",
            url: "/kgstudy/calendar/calenDelete.do",
            data: { id: eventId },
            dataType: "text",
            success: function(data) {
                //삭제를 성공하면 캘린더 페이지를 다시 띄우기
                location.href="${pageContext.request.contextPath}/calendar/calendar.do" 
            },
            error: function(error) {
                console.error("Error deleting event:", error);
            }
        });
    }
	
</script>

<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 1100px;
	margin: 0 auto;
}

.fc-view-harness.fc-view-harness-active {
	background-color: #fff;
}

.modal.show {
	display: block;
}
</style>

<title>calendar</title>
</head>
<body>

	<%@include file="../include/header.jsp"%>

	<div id='calendar'></div>

	<!-- 일정등록 Modal -->
	<div id="myModal" class="modal insertModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						onclick="closeBtn();">&times;</button>
					<h4 class="modal-title">일정등록</h4>
				</div>
				<form action="calenInsert.do" method="post">
					<div class="modal-body">
						<table class="table table-bordered">
							<tr>
								<td>이름</td>
								<td colspan="2">
									<input type="text" class="form-control" name="title" placeholder="일정이름을 적어주세요" />
									<input type="hidden" name="userID" id="userID" value="${loginUser.user_id}" />
								</td>
							</tr>

							<tr>
								<td>시작일</td>
								<td colspan="2"><input type="date"
									class="form-control start_d" name="start" /></td>
							</tr>

							<tr>
								<td>종료일</td>
								<td colspan="2"><input type="date"
									class="form-control end_d_str" name="endstr" /></td>
								<input type="hidden" class="form-control end_d" name="end" />
							</tr>

							<!-- <tr>
				    			<td>시간</td>
				    			<td><input type="time" class="form-control start_t" /></td>
				    			<td><input type="time" class="form-control end_t" /></td>
							</tr> -->

							<tr>
								<td>내용</td>
								<td colspan="2"><textarea rows="5" class="form-control"
										name="content" placeholder="세부내용을 적어주세요"></textarea></td>
							</tr>

							<tr>
								<td>초대</td>
								<td colspan="2"><input type="text" class="form-control"
									name="groupId" /></td>
							</tr>

							<tr>
								<td>색상</td>
								<td colspan="3"><input type="color" id="colorPicker"
									name="color"></td>
							</tr>

						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							onclick="closeBtn();">취소</button>
						<button type="submit" class="btn btn-default" data-dismiss="modal">등록</button>
					</div>
				</form>
			</div>

		</div>
	</div>
	<!-- 일정등록 Modal-end -->


	<!-- 일정 수정 및 삭제 Modal -->
	<div id="updateModal" class="modal updateModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						onclick="closeBtn();">&times;</button>
					<h4 class="modal-title">일정 수정 및 삭제</h4>
				</div>
				<form action="calenUpdate.do" method="post">
					<div class="modal-body">
						<table class="table table-bordered">
							<tr>
								<td>이름</td>
								<td colspan="2">
									<input type="text" class="form-control" name="title" id="title" />
									<input type="hidden" name="userID" id="userID" value="${loginUser.user_id}" />
								</td>
							</tr>

							<tr>
								<td>시작일</td>
								<td colspan="2"><input type="date"
									class="form-control start_d" name="start" id="start" /></td>
							</tr>

							<tr>
								<td>종료일</td>
								<td colspan="2">
									<input type="date" class="form-control end_d" name="end" id="end" />
								</td>
							</tr>

							<!-- <tr>
				    			<td>시간</td>
				    			<td><input type="time" class="form-control start_t" /></td>
				    			<td><input type="time" class="form-control end_t" /></td>
							</tr> -->

							<tr>
								<td>내용</td>
								<td colspan="2"><textarea rows="5" class="form-control"
										name="content" id="content"></textarea></td>
							</tr>

							<tr>
								<td>초대</td>
								<td colspan="2"><input type="text" class="form-control"
									name="groupId" id="groupId" /></td>
							</tr>

							<tr>
								<td>색상</td>
								<td colspan="3"><input type="color" id="colorPicker"
									name="color" class="color" /> <input type="hidden" name="id"
									id="id" /></td>
							</tr>

						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal" onclick="closeBtn();">취소</button>
						<button type="submit" class="btn btn-default" data-dismiss="modal" onclick="onSubmitForm();">수정</button>
						<button type="button" class="btn btn-default" data-dismiss="modal" id="deleteEventButton">삭제</button>
					</div>
				</form>
			</div>

		</div>
	</div>
	<!-- 일정 수정 및 삭제 Modal-end -->


	<script>
	
		//닫기 버튼
		function closeBtn() {
			$(".modal").removeClass("show");
		}
		
		//색상 선택
		$("#colorPicker").on('input', () => {
            $("#colorPicker").val();
            //alert($("#colorPicker").val());
        });
		
		
		//수정 및 삭제 폼 제출할때 종료일 날짜가 +1되도록 수정하기
		function onSubmitForm() {
		    // 종료일(end) 값을 가져오기
		    let endDate = $("#end").val();
		
		    var endDate2 = new Date(endDate);
		    endDate2.setDate(endDate2.getDate() + 1);
		    var endDateStr = endDate2.toISOString().split('T')[0];
		
		    $("#end").val(endDateStr);
		
		    // 폼을 서버로 제출
		    $("form").submit();
		}

		
	</script>

</body>
</html>
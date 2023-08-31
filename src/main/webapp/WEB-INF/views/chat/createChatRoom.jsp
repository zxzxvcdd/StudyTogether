<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<!DOCTYPE html>
<html>
<head>
  <%@ include file="../include/static-header.jsp" %> 
<meta charset="UTF-8">
<title>create study</title>

<!-- jquery -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.min.js"></script>
<!-- css 파일 -->

<style>

.cont_wrap{

    width: 100%;

    padding: 40px;

    height: auto;
}

.cont_wrap *{
    
    font-size: 18px;
   
}

.cont >*{
    width: 60%;
    background: white;
    margin: 0 auto;

}

.cont_header_wrap{

    
    width: 60%;


    border-radius: 15px;
    height: 60px;
    margin-bottom: 40px;
    margin-top: 10px;


}

.cont_header{
    text-align: center;
    color: #000;

    font-size: 24px;
    font-weight: 700;

    line-height: 60px;


}

.cont_body_wrap{

    
    padding: 40px
   

}

.cont_body{

    min-height: 700px;

}

.cont_body *{

   
}

#create_study_form{

    width: 100%;
    min-height: 700px;

}

.create_study_room{

    border-top: 1px solid #000;
    
    border-bottom: 1px solid #000;

    width: 100%;
    min-height: 700px;
    margin-bottom: 20px;
    border-collapse: collapse;
}


.create_study_room th{

    background: #dfe4ea;
    

}

.create_study_room tr{

    margin: 0;
    height: 60px;
    border-bottom: 1px solid lightgray;
    box-sizing: border-box;

 

}

.create_study_room td{

    width: 400px;
    padding: 20px;

}

.create_study_room input,select{

    
   
    border-bottom: 1px solid #000;


}
.maxCnt{

    width: 40px;
}

.btn_wrap{

    text-align: center;

}

.btn_wrap button{
    
    margin-top: 10px;
    font-size: 16px;
    letter-spacing: -.3px;
    overflow: hidden;
    width: 15%;
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

.invite_wrap{
    position: fixed;
    display: block;
    top:0;
    left:200px;
    bottom: 0;
    right: 0;
    width: 100vw;
    height: 100vh;
    
    background: rgba(0,0,0,0.1);

    display: none;

}

.invite_wrap.show{

    display: block;
}
.invite_con{
    background: #fff;
    margin: 10vh auto 0;
    width: 600px;
    height: 750px;
    clear: both;

    padding: 40px;
}
.user_search{

    margin: 0 auto;
    width: 300px;
    margin-bottom: 20px;

}
.user_search input{

    border-bottom: 1px solid #000;
}
button{
    cursor: pointer;
}
.user_search button{

    width: 40px;
    height: 40px;
    
    font-size: 18px;

   

    border-radius: 6px;
    background-color: #ecf0f1;
    font-weight: 700;
    color: #2f3640;
    
}

.user_search button:hover{

background-color: #f9ca24;
color: #fff;


}

.playlist_wrap{
    width: 50%;
    float:left;
}
.playlist{
    
    border: 1px solid #000;
    padding: 20px;
    padding-left: 30px;

    
   

   
    height: 500px;
    

}

.playlist ul{

    overflow: auto;
    height: 100%;

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
.invite_btn{

    margin-top: 10px;
    font-size: 16px;
    letter-spacing: -.3px;
    overflow: hidden;
    width: 100px;
    padding: 8px 6px 7px;
    border-radius: 6px;
    background-color: #ecf0f1;
    font-weight: 500;
    color: #2f3640;
    margin-left: 30px;

}

</style>

</head>
<body>

	<%@include file="../include/header.jsp"%>

	<section class="cont_wrap">

		<div class="cont">


			<div class="cont_header_wrap">
					<div class="cont_header">
                        스터디 만들기
					</div>
			
			</div>

			<div class="cont_body_wrap">


					<div class="cont_body">
						<form id="create_study_form" action="createChatRoom" method="post" enctype="multipart/form-data">

							<table class="create_study_room">

								<tr>
									<th>스터디 이름</th>
									<td>
										<input type="text" name="chatRoomTitle"  required>
									</td>
								</tr>
								<tr>
									<th>스터디 설명</th>
									<td>
										<input type="text" name="chatRoomComment"  required>
									</td>
								</tr>
								<tr>
									<th>스터디 목표</th>
									<td>
										<input type="text" name="chatRoomGoal" required>
									</td>
								</tr>
								<tr>
									<th>최대 인원 수</th>
									<td>
										<input type="number" name="chatRoomMax" class="maxCnt"  value=4 required><button type="button" class="invite_btn">회원초대</button>
									</td>
								</tr>
								<tr>
									<th>대표 이미지</th>
									<td>
                                        <div id="checkLog"></div>
										<input type="file" name="file" id="file-input" required>
									</td>
								</tr>
								<tr>
									<th>공개 여부</th>
									<td>
                                        <input type="radio" name="chatRoomState" value="public" required checked> 공개
                                        <input type="radio" name="chatRoomState" value="private" required> 비공개
									</td>
								</tr>
								<tr>
									<th>강퇴 기능 활성화</th>
									<td>
                                        <input type="radio" name="exitCk" value="Y" required checked> 활성화
                                        <input type="radio" name="exitCk" value="N" required> 비활성화
									</td>
								</tr>							
								<tr>
									<th>강퇴 권한 설정</th>
									<td>
                                        <select id="select_gender" name="exitOpt" required>
                                            <option value="1">방장</option>
                                            <option value="2">매니저</option>
                                        </select>
									</td>
								</tr>
								
							</table>

							<div class="btn_wrap">
								<button type="submit" class="btn_design" onClick="return check();">확인</button>&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn_design" onclick="location.href='userModifyCkView.do'">취소</button>
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
                                                <button type="button" class="search-button"><i class="fa fa-search"></i></button>
                                            </div>
                                    </div>
                                    <div class="playlist_wrap">
                                        <div class="playlist_header">
                                            초대가능한 회원
                                        </div>
                                        <div class="user_list playlist">
                                            <ul>
                                                <c:forEach var="user" items="${userList}" varStatus="status">
                                                    <li>
                                                        <label for="user_${status.index}" class="playlist-user">
                                                            <input id="user_${status.index}" type="checkbox" name="userList" value="${user.userId}" readonly>
                                                            ${user.userId}
                                                        </label>
                                                    </li>
                                                </c:forEach>
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
                                    </div>
                                </div>
                            </div>
						</form>
					</div>



		</div>
		<!-- modify-mg div end -->

	</section>

	<%@include file="../include/footer.jsp"%>
	

    
<script>

    function userFilter(){
        $(".user_filter").on('keyup', function(e) {

            
            var $this = $(this);
            
            var exp = new RegExp($this.val(), 'i');
            $(".user_list li label").each(function() {
            var $self = $(this);
          
            if(!exp.test($self.text())) {
                $self.parent().hide();
            } else {
                $self.parent().show();
            }
            });
        });
    };

    function selectUser(){

        $("input:checkbox[name='userList']").change(function(){
            
            
            var $this = $(this);
            var targetId = $this.attr('id');
            var maxCnt = $(".maxCnt").val();

            var ckCnt = $("input:checkbox[name='userList']:checked").length;
            console.log(ckCnt);

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

                    $(this).remove();
                    $this.prop("checked",false);

                })




            }else{

                $("."+targetId).remove();
                
            }


        })
    }




    let check= false;

    function fileCheckEvent() {

        $("#file-input").change(function(e){
            check= false;
           
            const $checkLog = document.getElementById("checkLog");
     
            if (e.target.value !== "") {
                const ext = e.target.value.split('.').pop().toLowerCase();
                const list = ['gif', 'png', 'jpg', 'jpeg', ]
          
                for (let i in list) {
                    // console.log(list[i]);
                    if (ext === list[i]) {
                        check = true;

                    }
                }
                console.log(check);
          
                if (check !== true) {
                    $checkLog.innerHTML =
                        `<b class="c-red" style="color: red">[파일확장자를 확인하세요]<br>[gif, png, jpg, jpeg]</b>`;
                    return;
                } else {
                   
                    if (e.target.files[0].size > 10 * 1024 * 1024) {
                        $checkLog.innerHTML =
                            `<b class="c-red" style="color: red">[파일용량 초과 (최대:10MB) ]</b>`;
                            check = false;
                        return;
                    } else {
                        e.target.style.borderColor = 'skyblue';
                        $checkLog.innerHTML = `<b class="c-blue" style="color: limegreen">[업로드가능한 파일입니다.]</b>`;
                    }
                }
            }

            const $uploadBtn = document.getElementById('upload-btn');
            const $uploadForm = document.getElementById('upload-form');
            $uploadBtn.addEventListener("click", (e) => {
                e.preventDefault();
                if (check === true) {
                    $uploadForm.submit();
                } else {
                    alert('파일을 다시 확인하세요');
                }
            });
        })
    }

    function addModal(){

        $(".btn_modal").click(function(){

            $(".invite_wrap").toggleClass("show");


        })

        $(".invite_btn").click(function(){

            $(".invite_wrap").toggleClass("show");


        })


    }


    (function (){

        fileCheckEvent();
        userFilter();
        selectUser();
        addModal();

    })();

</script>

	
	<script>
		let msg = "${msg}";
	
		if (msg) {
			alert(msg);
		}
	</script>

</body>
</html>
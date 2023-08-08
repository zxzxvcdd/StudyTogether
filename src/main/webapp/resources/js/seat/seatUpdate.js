function createSeat(i) {

    let newBox = document.createElement("div"); +i


    newBox.classList.add("box");

    newBox.classList.add("box" + i);
    if ("${loginUser.user_id}" === seatList[i].userId && seatList[i].seatType == 'N') {
        newBox.classList.add("myseat");
    }

    newBox.setAttribute("data-id", seatList[i].seatId);
    newBox.setAttribute("data-name", seatList[i].seatName);
    newBox.setAttribute("data-type", seatList[i].seatType);

    newBox.setAttribute("data-index", i);
    newBox.innerText = newSeat.seatName;

    $(".seat_list").append(newBox);

    $(".box" + i).css("top", seatList[i].y + "px");
    $(".box" + i).css("left", seatList[i].x + "px");

    refreshTypeClass(".box" + i)
    addDbClickEvent(".box" + i);
    addMoveEvent(".box" + i);


}

function addMoveEvent(newBox) {


    $(newBox).mousedown(function (eq) {

        startPosX = eq.clientX;
        startPosY = eq.clientY;
        eq.preventDefault();
    

        $(newBox).css("z-index", 100)

        $(document).mousemove(moveSeat)
        $(document).mouseup(function () {
            console.log("mouseup");
            $(document).off("mousemove")
            $(newBox).css("z-index", 1)
        })




        function moveSeat(e) {


            newPosX = startPosX - e.clientX;
            newPosY = startPosY - e.clientY;

            startPosX = e.clientX;
            startPosY = e.clientY;



            var top = $(newBox).css("top").slice(0, -2);
            var left = $(newBox).css("left").slice(0, -2);


            let offsetLeft = (left - newPosX);
            let offsetTop = (top - newPosY);


            $(newBox).css("top", offsetTop + "px")
            $(newBox).css("left", offsetLeft + "px")


            let targetIndex = $(newBox).data("index");


            seatList[targetIndex].x = offsetLeft;
            seatList[targetIndex].y = offsetTop;

        }


    })


}

function updateSeat() {



    let postData = JSON.stringify(seatList);

    var reqUrl = "updateSeat.do";

    $.ajax({
        url: reqUrl,
        type: "POST",
        contentType: "application/json;charset=UTF-8",
        data: postData,
        success: function (data) {


            console.log(data);

            let resMap = data

            alert(resMap.msg);

        }
    })


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



function addDbClickEvent(newBox) {


    $(newBox).dblclick(function (e) {


        e.preventDefault();

        $(".modal-del").toggleClass("show");

        targetSeat = this;

    })

}





function changeState() {

    let targetType = $(targetSeat).data("type");
    let targetIndex = $(targetSeat).data("index");

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
        newSeat.seatId = "0";
        newSeat.seatName = $('input[name=seatName]').val();
        newSeat.storeId = storeId;
        newSeat.seatType = "Y";
        newSeat.x = "50";
        newSeat.y = "50";


        index++;
        seatList.push(newSeat);
        createSeat(index - 1)
        $(".modal-new").toggleClass("show");

    })

    $(".btn_close").click(function () {
        $(".modal-new").toggleClass("show");


    })

}

function delSeat() {

    if (confirm("좌석을 삭제 하시겠습니까?")) {


        var reqUrl = "deleteSeat.do?seatId=" + $(targetSeat).data("id");


        $.ajax({
            url: reqUrl,
            type: "GET",

            success: function (data) {

                console.log(data);
                var resMap = data;

                alert(resMap.msg);
                if (resMap.flag == 1) {

                    let targetIndex = $(targetSeat).data("index");

                    $(targetSeat).remove();
                    seatList.splice(targetIndex, 1);
                    index--;

                }


            }
        })



    }

}







function newSeatForm() {


    $(".modal-new").toggleClass("show");



}

$(document).ready(function () {
    addNewModalEvent();
    addDelModalEvent();





})



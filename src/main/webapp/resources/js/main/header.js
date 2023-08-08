//header
//화면이 작아졌을때 header가 사라지고 오른쪽에 메뉴바가 생김
let menu = document.querySelector('#menu-bars');
let header = document.querySelector('header');

menu.onclick = () => {
	menu.classList.toggle('fa-times');
	header.classList.toggle('active');
}

window.onscroll = () => {
	menu.classList.remove('fa-times');
	header.classList.remove('active');
}




// 입실&퇴실 마우스오버 이벤트
function mover() {
	let m = document.getElementById('seat');
	m.innerText = "(퇴실하겠습니까?)";
	m.style.color = "#ff7979";
}
function checkout() {


	if (confirm("퇴실하시겠습니까?")) {

		var reservId = "${reservId}";

		console.log(reservId);

		var reqUrl = "/kgstudy/seat/seatCheckOut.do?reservationId=" + reservId;


		$.ajax({
			url: reqUrl,
			type: "POST",


			success: function (data) {

				console.log(data);
				let msg = data;
				if (msg) {

					if (msg === "success") {

						alert("퇴실완료");
						location.reload();


					}


				}
			}

		})


	}

}


function mout() {
	let m = document.getElementById('seat');
	m.innerText = "(좌석 이용중)";
	m.style.color = "#badc58";
}


// 입실&퇴실 마우스오버 이벤트
function mover() {
	let m = document.getElementById('seat');
	m.innerText = "(퇴실하겠습니까?)";
	m.style.color = "#ff7979";
}

function mout() {
	let m = document.getElementById('seat');
	m.innerText = "(좌석 이용중)";
	m.style.color = "#badc58";
}


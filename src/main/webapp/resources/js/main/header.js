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


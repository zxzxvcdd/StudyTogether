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
	
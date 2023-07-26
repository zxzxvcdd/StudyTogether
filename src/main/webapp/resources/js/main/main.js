
/* home_슬라이드쇼 */
var swiper = new Swiper(".home-slider", {
	grabCursor:true,
	loop:true,
	navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
});


/* home courses slider_슬라이드쇼 */
var swiper = new Swiper(".home-courses-slider", {
	slidesPerView: 1,
	spaceBetween: 10,
	pagination: {
        el: ".swiper-pagination",
        clickable: true,
	},
	breakpoints: {
        0: {
          slidesPerView: 1,
        },
       	990: {
          slidesPerView: 2,
        },
        1270: {
          slidesPerView: 3,
        },
      },
});

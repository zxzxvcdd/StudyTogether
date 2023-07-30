
function arccodionMenu(){

    $(".menu-list-wrap").toggleClass("show");

} 

let order = {
    go_pay : function() {
        var paymentMethod = document.querySelector('input[name="payment-method"]:checked').value;
        // 아임포트 API 키 설정
        var IMP = window.IMP;
        var tossClientKey = "test_ck_lpP2YxJ4K877JAdv7KX8RGZwXLOb";
        // 본인 포트원 IMP 이름

        
        IMP.init('imp18778788');
        //


		let tp =$(".total-price-value").text();
		tp = parseInt(tp.replace(/,/g , ''));
		let menuId =$(".total-price-value").data("menu_id");
		console.log(menuId);
		console.log(tp);
		
		if(menuId===undefined || tp ===NaN){
		
			alert("메뉴를 선택하세요");
			return
		}
        var merchant_uid = 'kg_study_' + new Date().getTime();

        IMP.request_pay({
            pg : paymentMethod,
            pay_method : 'card',
            merchant_uid : merchant_uid,
            name : n ,
            amount : tp,
            buyer_email : 'iamport@siot.do',
            buyer_name : "kgStudy",
            buyer_tel : '010-1234-5678',
            m_redirect_url : 'http://localhost:8080/kgStudy/suc',
           
        }, function(res) {
        
        	console.log(res);
            if ( res.success ) {
                console.log(res);
                // 결제검증

                // {
                //     apply_num: "42827474",
                //     bank_name: null,
                //     buyer_addr: "서울특별시 강남구 삼성동",
                //     buyer_email: "test@portone.io",
                //     buyer_name: "포트원 기술지원팀",
                //     buyer_postcode: "123-456",
                //     buyer_tel: "010-1234-5678",
                //     card_name: "신한카드",
                //     card_number: "5428790000000294",
                //     card_quota: 0,
                //     currency: "KRW",
                //     custom_data: null,
                //     imp_uid: "imp_347242536261",
                //     merchant_uid: "57008833-33004",
                //     name: "당근 10kg",
                //     paid_amount: 1004,
                //     paid_at: 1648344363,
                //     pay_method: "card",
                //     pg_provider: "kcp",
                //     pg_tid: "22336466628585",
                //     pg_type: "payment",
                //     receipt_url: "https://admin8.kcp.co.kr/assist/bill.BillActionNew.do?cmd=card_bill&tno=22336466628585&order_no=imp_347242536261&trade_mony=1004",
                //     status: "paid",
                //     success: true
                // }
                
              
  

		
				
                //var reqUrl = "/kgCoffee/order/complete";
                var reqUrl = "/kgstudy/order/complete.do";

                $.ajax({
                    type : "POST",
                    url : reqUrl,
                    data : {
                        // 저장할 pay 정보 넣어서 서버 보내서 DB 테이블 저장
                        impUid : res.imp_uid,
                        paid_amount : res.paid_amount,
                        pay_method : res.pay_method,
                        pg_provider : res.pg_provider,  
                        paidAt : res.paid_at,
                        card_name : res.card_name,
                        passPrice: tp,
                        merchant_uid: merchant_uid, 
						menuId:menuId,
                    },
                    success:function(res_data) {
 
                    	
                        var msg = res_data
        
        			
                        if(!(msg===null)){
    
                         
                         alert(msg);
                         
                        }
    
                    }
                })
            }
        });




    }
}


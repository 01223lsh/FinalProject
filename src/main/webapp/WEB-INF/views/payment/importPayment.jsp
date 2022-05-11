<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- import 결제 라이브러리 추가 -->    
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script type="text/javascript">

//아임포트 관리자 계정으로 발급받은 가맹 식별코드를 이용하여 
var IMP = window.IMP;		// 생략 가능
IMP.init("imp22966233");	// 예: imp00000000
	
function requestPay() {
	console.log("결제창 호출")
	// IMP.request_pay(param, callback) 결제창 호출
	IMP.request_pay({ // param
		pg: "html5_inicis",
		pay_method: "card",
		merchant_uid: 'merchant_' + new Date().getTime(),
		name: "프로젝트 명",
		amount: ${totalPrice},
		buyer_name: "세션의 멤버 이름 조회",
		buyer_tel: "세션의 멤버 연락처 조회"
	}, function (rsp) { // callback
			if (rsp.success) {
	              // 결제 성공 시 로직,
	        } else {
	              // 결제 실패 시 로직,
	        }
	});
}

</script>
    

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- import 결제 라이브러리 추가 -->    
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	var IMP = window.IMP;		// 생략 가능
	IMP.init("imp22966233");	// 예: imp00000000
})
	
function requestPay() {
	// IMP.request_pay(param, callback) 결제창 호출
	// order.jsp 와 분리 해두었기 때문에 에러 빨간줄이 생길 수도 있습니다. -> 문제 없이 작동
	IMP.request_pay({ 
		// param
		pay_method: "card",
		merchant_uid: "merchant_uid" + new Date().getTime(),
// 		customer_uid: "customer_uid", //빌링키 발급 왜 안됨?
// 		name: "프로젝트 이름 "
		name: $("#projectTitle").val(),
// 		amount: 0,
		amount: ${order.totalPrice},
		buyer_email: "dudwo2144@gmail.com",
		buyer_name: "세션 멤버 이름",
		buyer_tel: "세션 멤버 연락처"
		
	}, function (rsp) { // callback
		if ( rsp.success ) { // 결제 성공 로직
	    	
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
			alert(msg)
			
			$.ajax({
				url: "/payment/order",
				method: "POST",
// 				headers: {"Content-Type": "application/json"},
				contentType: "application/json; charset=utf-8",
				data: JSON.stringify ({
					paymentCode: rsp.merchant_uid,
					paymentTotal: rsp.paid_amount,
					paymentMethod: rsp.pay_method,
					postalCode: $("#sample6_postcode").val(),
					address: $("#sample6_address").val(),
					addressDetail: $("#sample6_detailAddress").val(),
				 	addressExtra: $("#sample6_extraAddress").val(),
					recipientName: $("#recipientName").val(),
					recipientPhone: $("#recipientPhone").val(),
					precautions: $("#precautions").val(),
					orderNo: $("#orderNo").val(),
					projectNo: $("#projectNo").val()
				})
			}).done(function (data) {
				// 가맹점 서버 결제 API 성공시 로직
				location.href="/payment/result?orderNo=" + $("#orderNo").val() + "&projectNo=" + $("#projectNo").val();
			})
		}
	    else {
			// 결제 실패 시 로직,
			alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);      
		}
  });
}
</script>
    

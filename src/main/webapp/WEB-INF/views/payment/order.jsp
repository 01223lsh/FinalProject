<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>

<script type="text/javascript">


</script>

<style type="text/css">

.orderStep {
	padding: 30px 60px 30px 60px;
	text-align: center;
	font-weight: bold;
	display: flex;
}
.orderStep ol {
	margin: 0 auto;
	padding-left: 0px;
}
.orderStep ol li { 
	float: left;
    display: block;
    width: 90px;
    padding: 0;
    background: url(/resources/static/img/order/orderStepLine.png) repeat-x 0 center;
}
.orderStep ol li.active em { 
	width: 90px;
    height: 90px;
    background: #557cf2;
}
.orderStep ol li em {
	width: 90px;
    height: 90px;
    font-size: 16px;
    line-height: 20px;
	display: table-cell;
	vertical-align: middle;
	border-radius: 50%;
	background: #fff;
	box-sizing: content-box;
	border: 1px dashed #979797;
}

.rewardInfo, .priceInfo, .memberInfo, .addressInfo, .recipientDiv {
	border: 1px solid #eee;
	border-radius: 5px;
	padding-right: 40px;
/* 	margin: 0 auto 20px 100px 20px 100px; */
	margin: 0 auto;
	width: 600px;
}
.priceInfo dl {display: table;}
.priceInfo dt {
	display: table-cell;
	padding: 15px 0 15px 15px;
	fsont-size: 30px;
    font-weight: 500px;
    width: 140px;
}
.priceInfo dd {
	display: table-cell;
	padding: 15px 15px 15px 0px;
}
.addressInfo, .recipientDiv {
	padding : 15px;
}
.recipientInfo {
	margin: 0.2em 0;
    font-size: 1em;
    padding: 0.5em;
    border: 1px solid #ccc;
    border-color: #dbdbdb #d2d2d2 #d0d0d0 #d2d2d3;
    box-shadow: inset 0.1em 0.1em 0.15em rgb(0 0 0 / 10%);
    vertical-align: middle;
    line-height: 1.25em;
    outline: 0;
}



</style>

<div class="container">

<h1>주문 정보 입력 페이지 </h1>
<hr>

	<div class="orderStep">
		<ol>
			<li>
				<em>리워드 선택</em>
			</li>
			<li class="active" style="padding: 0 80px; box-sizing: content-box;">
				<em>결제 예약</em>
			</li>
			<li>
				<em>결제 완료</em>
			</li>
		</ol>	
	</div>
	
	<div>
		<h4 style="font-weight: bold;">결제 정보 입력</h4>
		<hr>
	</div>
	
	<div class="rewardInfo">
	
	<ul>
		<c:forEach var="i" items="${rewardList}" varStatus="status">
		<li>
			<hr>
			<p>${i.rewardName}</p>
			<p>${i.rewardIntro}</p>
			<p>수량: ${rewardCountArr[status.index] }<p>
			<hr>
		</li>
		</c:forEach>
	</ul>
		
	</div>
	
	<hr>
	<div class="priceInfo">
		<dl>
			<dt>추가 펀딩금: </dt>
			<dd>${additionalFunding }원</dd>
			<dt>총 금액: </dt>
			<dd>${totalPrice }원</dd>
		</dl>
	</div>
	<hr>
	
	<div class="memberInfo">
	세션정보 : 회원 정보 들어가는 칸
	</div>
	
	<hr>
	<form action="/payment/paymentResult" method="post">
		
		<input type="hidden" name="totalPrice" value="${totalPrice }">
		<input type="hidden" name="additionalFunding" value="${additionalFunding }">
		
		<c:forEach var="i" items="${rewardList}" varStatus="status">
			<input type="hidden" name="rewardNo" value="${i.rewardNo}">
			<input type="hidden" name="rewardCount" value="${rewardCountArr[status.index]}">
		</c:forEach>
		
		<!-- 카카오 우편번호 api -->
		<c:import url="/WEB-INF/views/payment/delivery.jsp"/><br>
			
		<hr>
		
		<!-- 수령인 정보 입력 -->
		<div class="recipientDiv">
			<input type="text" class="recipientInfo" name="recipientName" placeholder="수령인 성함">
			<input type="text" class="recipientInfo" id="recipientPhone" name="recipientPhone" placeholder="수령인 연락처">
			<input type="text" class="recipientInfo" name="precautions" placeholder="배송시 요청사항">		
		</div>
		
		<h2 align="center">총 <em style="font-size:2em;">${totalPrice}</em>원 결제 합니다</h2>
		<hr>
		<button id="paymentBtn" class="btn-lg" style="background: #d4dfff;">
		결제진행
		</button>
	</form>


</div> <!-- .container end -->

<c:import url="/WEB-INF/views/layout/footer.jsp"/>

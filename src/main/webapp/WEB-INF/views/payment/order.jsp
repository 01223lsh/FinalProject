<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:import url="/WEB-INF/views/layout/header.jsp"/>

<!-- 아임포트 api 코드 -->
<c:import url="/WEB-INF/views/payment/importPayment.jsp"/>
<!-- 카카오 우편번호 api -->
<c:import url="/WEB-INF/views/payment/kakaoDelivery.jsp"/>

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
    background: #39AEA9;
   	color: white;
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


.all {
	padding: 0px 20px 20px 20px;
	margin-left: 20%;
	margin-right: 20%;
}
.rewardDiv {
 	margin: 0 auto; 
	padding: 10px 0px 0px 0px; 
	border-radius: 1px;
}
.rewardInfo {padding: 10px 0px 0px 0px;}
.rewardFor {
	border-radius: 2px;
	padding: 10px;
	margin-bottom: 10px;
	background: #f5f5f5;
}
.rewardFor th {font-size: 14px;}
.rewardFor td {
	padding: 0px 0px 0px 65px;
	font-size: 12px;
	color: rgb(109, 109, 109) !important;
}

.priceDiv {display: flex;}
.additionalDiv, .totalDiv {width: 50%;}
.additionalDiv th, .totalDiv th {font-size: 14px;}
.additionalDiv td, .totalDiv td {
	padding-left: 65px;
	font-size: 25px;
	color: rgb(57 174 169);
}
.memberRecipientDiv {display: flex;}
.memberDiv, .recipientDiv {
	width: 50%;
	padding: 10px;
}
.memberInfo th {font-size: 14px;}
.memberInfo td {
	padding-left: 65px;
	font-size: 12px;
	color: rgb(109, 109, 109) !important;
}

/* 배송에 관련된 내용 */
.addressInfo p {
	font-size: 1px;
	color: #39aea9;
	padding-left: 8px;
}
#totalPrice {border: none;}
#paymentBtn {background: #39AEA9;}
#paymentBtn:hover {background: #6c757d;}
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
.dForm {
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
#sample6_address{width: 348px;}
</style>

<div class="container">

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
	
	<hr>
	
	<div class="all">
	
		<div class="rewardDiv">
		<h5 style="font-weight: bold;">리워드 정보</h5>
		
			<div class="rewardInfo">
				<c:forEach var="i" items="${rewardOrderList}">
					<div class="rewardFor">
						<table>
							<tr>
								<th>리워드 이름</th>
								<td>${i.rewardName}</td>
							</tr>
							<tr>
								<th>리워드 구성</th>
								<td>${i.rewardIntro}</td>
							</tr>
						</table>
					</div>
				</c:forEach>
			</div>
			
		</div>
		
		<div class="memberRecipientDiv">
			<div class="memberDiv">
				<h5>회원 정보</h5>
				
				<div class="memberInfo">
					<table>
						<tr>
							<th>닉네임</th>
							<td>${member.nick}</td>
						</tr>
						<tr>
							<th>e-mail</th>
							<td>${member.email}</td>
						</tr>
						<tr>
							<th>연락처</th>
							<td>${member.phone}</td>
						</tr>
					</table>
				</div>
				
			</div>
			
			<div class="recipientDiv">
				<h5>수령인 정보</h5>
				<input type="text" class="recipientInfo" id="recipientName" name="recipientName" placeholder="수령인 성함">
				<input type="text" class="recipientInfo" id="recipientPhone" name="recipientPhone" placeholder="수령인 연락처">
<!-- 				<input type="text" class="recipientInfo" id="precautions" name="precautions" placeholder="배송시 요청사항"> -->
<!-- 				<p>배송에 관련된 내용만 적어주세요.</p>		 -->
			</div>
		</div>		
		
		<div class="addressInfo">
			<input type="text" class="dForm" name="postalCode" id="sample6_postcode" placeholder="우편번호">
			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" class="dForm" name="address" id="sample6_address" placeholder="주소"><br>
			<input type="text" class="dForm" name="addressDetail" id="sample6_detailAddress" placeholder="상세주소">
			<input type="text" class="dForm" name="addressExtra" id="sample6_extraAddress" placeholder="참고항목">	
			<input type="text" class="recipientInfo" id="precautions" name="precautions" placeholder="배송시 요청사항">
			<p>* 배송 요청 사항은 배송에 관련된 내용만 적어주세요.</p>		
		</div>
		
		<div class="priceDiv">
			<div class="additionalDiv">
				<table>
				
				<tr>
					<th>추가 펀딩금</th>
					<td><fmt:formatNumber value="${order.addtionalFunding}" type="currency"/></td>
				</tr>
					
				</table>
			</div>
			
			<div class="totalDiv">
				<table>
				
				<tr>
					<th>최종금액</th>
					<td><fmt:formatNumber value="${order.totalPrice}" type="currency"/></td>
				</tr>
					
				</table>
			</div>
		</div>	
		
		<!-- 결제 api로 넘겨줄 정보들 -->		
			<input type="hidden" id="projectNo" name="projectNo" value="${project.projectNo}">
			<input type="hidden" id="projectTitle" value="${project.projectTitle}">
			<input type="hidden" id="orderNo" name="orderNo" value="${order.orderNo }">
			<input type="hidden" id="memberName" value="${member.name}">
			<input type="hidden" id="memberEmail" value="${member.email}">
			<input type="hidden" id="memberPhone" value="${member.phone}">
		<!-- 결제 api로 넘겨줄 정보들 -->		
			
		<h2 align="center">총 <em style="font-size:2em;">
		<fmt:formatNumber value="${order.totalPrice}" type="currency"/>
		</em> 결제 합니다</h2>
		<hr>
		
		<div style="text-align: center;">
			<button id="paymentBtn" class="btn btn-secondary" onclick="requestPay()">결제진행</button>
		</div>
		
	</div>

	 
		
		<!-- 수령인 정보 입력 -->
		<!-- 
		<div class="recipientDiv">
			<input type="text" class="recipientInfo" id="recipientName" name="recipientName" placeholder="수령인 성함">
			<input type="text" class="recipientInfo" id="recipientPhone" name="recipientPhone" placeholder="수령인 연락처">
			<input type="text" class="recipientInfo" id="precautions" name="precautions" placeholder="배송시 요청사항">		
		</div>
		
		<h2 align="center">총 <em style="font-size:2em;">${order.totalPrice}</em>원 결제 합니다</h2>
		<hr>
		
		<input type="button" value="결제진행" onclick="requestPay()" class="btn-lg" style="background: #d4dfff;">

		 -->
	
</div> <!-- .container end -->

<c:import url="/WEB-INF/views/layout/footer.jsp"/>

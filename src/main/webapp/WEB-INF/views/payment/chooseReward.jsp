<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>

<script type="text/javascript">

$(document).ready(function() {
	
})

window.onload = function() {
	
	alert.
	
}

</script>

<style type="text/css">

.orderStep {
	padding: 30px 60px 30px 60px;
	text-align: center;
	font-weight: bold;
	display: flex;
/* 	margin: 0 auto; */
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
.rewardList {
width: 1100px;
}
.rewardList ul {
	list-style: none;
	padding-left: 0px;}
.rewardList li {
	height: 210px;
	margin-bottom: 10px;
}
.rewardBox {	
	display: inline-block;
	border: 1px solid #e1e1e1;
	border-radius: 5px;
	background: #d4dfff;
	margin-left: 155px;
}
.rewardBox dt {
	float: left; 
    text-align: center;
    width: 100px;
    padding-top: 100px;
}
.rewardBox dd {
	float: left;
    padding: 5px 430px 5px 10px;
} 

dd p:nth-child(1){
	font-size: 30px;
	margin-bottom: 15px;
}
dd p:nth-child(2){font-size: 25px;}
dd p:nth-child(4){font-size: 12px;}
dd p:nth-child(5) input {width: 40px;}
dd p em {
	padding-left: 15px;
	font-size: 12px;
}


</style>

	<div class="container">
		<h1>프로젝트 상세보기 후 리워드 재선택 페이지</h1>
		
		<div class="orderStep">
			<ol>
				<li class="active">
					<em>리워드 선택</em>
				</li>
				<li style="padding: 0 80px; box-sizing: content-box;">
					<em>결제 예약</em>
				</li>
				<li>
					<em>결제 완료</em>
				</li>
			</ol>	
		</div>
		
		<div>
			<h4 style="font-weight: bold;">리워드 선택</h4>
			<p>펀딩해주시는 금액에 따라 리워드가 제공 됩니다.</p>
			<hr>
		</div>
		
		<form action="#" method="get">
		
		<div class="rewardList">
			<c:forEach var="i" items="${rewardList }">
			<ul>
			<li>
				<dl class="rewardBox">
					<dt>
					<c:choose>
						<c:when test="${i.rewardNo eq rewardNo}">
							<input type="checkbox" checked>
						</c:when>
						<c:when test="${i.rewardNo ne rewardNo}">
							<input type="checkbox">
						</c:when>
					</c:choose>
					</dt>
					<dd>
					
					<p><label for="checkbox">${i.rewardPrice } 펀딩 합니다.</label></p>
					<p>리워드 품명: ${i.rewardName }</p>
					<p>리워드 구성내용: ${i.rewardIntro }<em>(${i.rewardAmount}남음)</em></p>
					<p>배송비 없음 | 리워드 배송 예정일 : yyyy-mm-dd</p>
					<p>수량: 
					<c:choose>
					<c:when test="">
						<input id="rewardAmount" name="rewardAmount" type="number" min="0" max="9" value="0">
					</c:when>
					<c:when test="">
						<input type="">
					</c:when>
					</c:choose>
					</p>
					
					</dd>
				</dl>
			</li>
			</ul>
			</c:forEach>
		</div>
		
		<hr>
		
		<div>
			<h4 style="font-weight: bold;">추가 펀딩금 (선택)</h4>
			<p>후원금을 더하여 펀딩할 수 있습니다. 추가 후원금을 입력하시겠습니까?</p>
			<input type="text" maxlength="9" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
			원을 추가로 후원합니다. <em style="font-style: 12px;">(최대 9자리)</em>
			<hr>
			<button class="btn-lg" style="background: #d4dfff;">다음 단계로 >></button>
		</div>
		
		
		</form>
	
	</div> <!-- .container end -->
	
<!-- footer.jsp가 될 영역 -->
<c:import url="/WEB-INF/views/layout/footer.jsp"/>
<!-- footer.jsp가 될 영역 -->
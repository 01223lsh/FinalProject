<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>

<script type="text/javascript">

window.onload = function(){
	toggleAmount()
	sumPrice()
}

//toggleAmount()는 onclick이라는 이벤트에 의해서 실헹 되기 때문에 
//window.onload 를 통하여 페이지의 요소가 모두 로드되고 함수가 호출 되도록한다.
//결제 페이지로 넘어가기전 선택한 리워드의 수량을 선택할 수 있도록 해준다.
function toggleAmount() {
	var checkBox = document.getElementsByName("rewardNo")
	var rewardCount = document.getElementsByName("rewardCount")
	for (var i = 0; i < checkBox.length; i++) {
		if (checkBox[i].checked) {
			rewardCount[i].disabled = false;
		} else {
			rewardCount[i].disabled = true;
		}
	}
}

function sumPrice() {
	var checkBox = document.getElementsByName("rewardNo")
	var rewardCount = document.getElementsByName("rewardCount")
	var rewardPrice = document.getElementsByClassName("rewardPrice")
	var addition = document.getElementById("additionalFunding")
	
	var sumArr = []
	var sum = 0
	
	for (var i = 0; i < checkBox.length; i++) {
		if (checkBox[i].checked) {
			sumArr.push(rewardPrice[i].innerText * rewardCount[i].value)
			console.log(i+1, "번째 총 금액")
		}
	}
	for (var i = 0; i < sumArr.length; i++) {
		sum += sumArr[i]
	}
	
	document.getElementById("totalPrice").value = sum + parseInt(addition.value)
}

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
.rewardList {width: 1100px;}
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
.rewardPrice {font-size: 30px;}


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
		
		<form action="/payment/order" method="get">
		
		<div class="rewardList">
			<c:forEach var="i" items="${rewardList }">
			<ul>
			<li>
				<dl class="rewardBox">
					<dt>
					<c:choose>
						<c:when test="${i.rewardNo eq rewardNo}">
							<input type="checkbox" name="rewardNo" value="${i.rewardNo }" onclick="toggleAmount()" checked>
						</c:when>
						<c:when test="${i.rewardNo ne rewardNo}">
							<input type="checkbox" name="rewardNo" value="${i.rewardNo }" onclick="toggleAmount()">
						</c:when>
					</c:choose>
					</dt>
					<dd>
					
					<p><label for="checkbox"><em class="rewardPrice">${i.rewardPrice}</em> 펀딩 합니다.</label></p>
					<p>리워드 품명: ${i.rewardName }</p>
					<p>리워드 구성내용: ${i.rewardIntro }<em>(${i.rewardAmount}남음)</em></p>
					<p>배송비 없음 | 리워드 배송 예정일 : yyyy-mm-dd</p>
					<p>수량: 
						<input type="number" name="rewardCount" min="1" max="9" value="0" onclick="sumPrice()" disabled>
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
			<input type="text" id="additionalFunding" name="addtionalFunding" min="0" maxlength="9" 
			oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
			value="0" onkeyup="sumPrice()">
			원을 추가로 후원합니다. <em style="font-style: 12px;">(최대 9자리)</em>
			<hr>
			<p>
			총 <input id="totalPrice" value="" readonly>원 결제 합니다.
			</p>
			<hr>
			<button id="paymentBtn" class="btn-lg" style="background: #d4dfff;">
			다음 단계로 >>
			</button>
		</div>
		
		</form> <!--  -->
	
	</div> <!-- .container end -->
	
<!-- footer.jsp가 될 영역 -->
<c:import url="/WEB-INF/views/layout/footer.jsp"/>
<!-- footer.jsp가 될 영역 -->
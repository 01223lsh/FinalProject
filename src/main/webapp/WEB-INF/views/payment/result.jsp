<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>

<script type="text/javascript">

$(document).ready(function() {
	
})

window.onload = function() {
	
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

.resultDiv {
	margin-left: 20%;
	margin-right: 20%;
}
p {
	text-align: center;
	font-size: 20px;
}
.mainBtn {text-align: center;}
#paymentBtn {background: #39AEA9;}
#paymentBtn:hover {background: #6c757d;}
	
</style>

<div class="container">

	<div class="orderStep">
		<ol>
			<li>
				<em>리워드 선택</em>
			</li>
			<li style="padding: 0 80px; box-sizing: content-box;">
				<em>결제 정보</em>
			</li>
			<li class="active">
				<em>결제 완료</em>
			</li>
		</ol>	
	</div>
	
	<hr>
	
	<div class="resultDiv">
	
		<h2 align="center">결제가 완료 되었습니다!</h2>
		
		<hr>
		
		<p>${nick} 회원님은 ${index}번째 공식 후원자가 되었습니다.</p>
		<p>
		총 <fmt:formatNumber value="${order.totalPrice}" type="currency"/> 결제 하셨으며 프로젝트 기간은 
			<fmt:formatDate value="${project.openDate}"/> ~
			<fmt:formatDate value="${project.closeDate}"/> 동안 진행 됩니다. 
		</p>
		
		<div class="mainBtn">
			<button id="paymentBtn" class="btn btn-secondary" onClick="location.href='/member/main'">메인으로</button>
		</div>
	
	</div>


</div> <!-- .container end -->


<c:import url="/WEB-INF/views/layout/footer.jsp"/>

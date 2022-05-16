<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
</style>

<div class="container">

	<div class="orderStep">
		<ol>
			<li>
				<em>리워드 선택</em>
			</li>
			<li style="padding: 0 80px; box-sizing: content-box;">
				<em>결제 예약</em>
			</li>
			<li class="active">
				<em>결제 완료</em>
			</li>
		</ol>	
	</div>
	
	<div>
		<h4 style="font-weight: bold;">결제 완료</h4>
		<hr>
	</div>


</div> <!-- .container end -->


<c:import url="/WEB-INF/views/layout/footer.jsp"/>

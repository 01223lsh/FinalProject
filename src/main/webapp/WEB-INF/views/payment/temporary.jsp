<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>

<script type="text/javascript">

$(document).ready(function() {
	
})

</script>

<style type="text/css">

.rewardList {
	border: 1px solid #eaeaea;
	padding: 20px 20px 0px 20px;
	width: 310px;
}
.reward {
	border: 1px dashed #eaeaea;
	width: 400px;
	height: 200px;
	margin-bottom: 5px;
	padding: 20px;
}
.rewardInfo {border: 1px dashed #eaeaea;}
dl dt {
	font-size: 25px;
	margin-bottom: 20px;
	color: #4a4a4a;
}
dl dd {color: #4a4a4a;}
#rewardBtn {
	background: #dde4fa;
	margin-bottom: 20px;
}

</style>

<div class="container">

<h1>임시로 생성 (프로젝트 상세보기 리워드 선택창)</h1>
<hr>


<div class="rewardList">
	
	<c:forEach var="i" items="${rewardList }">
	
	
	<button id="rewardBtn" 
	onclick="location.href='/payment/chooseReward?rewardNo=${i.rewardNo}&projectNo=${i.projectNo}'">
		<div class="rewardInfo">
		<dl>
			<dt>리워드 가격: ${i.rewardPrice }</dt>
			<dd>
				<p>rewardName(리워드명): ${i.rewardName }</p>
				<p>rewardAmount(리워드 남은재고): (${i.rewardAmount })</p>
				<p>rewardIntro(리워드 간단설명): ${i.rewardIntro }</p>
			</dd>
		</dl>
		</div>
	</button>
	</c:forEach>
	

</div> <!-- rewardList end -->


</div> <!-- .container end -->


<c:import url="/WEB-INF/views/layout/footer.jsp"/>


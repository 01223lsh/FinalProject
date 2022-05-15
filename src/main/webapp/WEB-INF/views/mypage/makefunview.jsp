<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<c:import url="/WEB-INF/views/layout/mypageheader.jsp" />

<script type="text/javascript">



$(document).ready(function() {
	if("${view.projectStep == 0}"){
		$("#update").show();
	};

	
})

</script>


<style>

button {

	border-radius: 15px;
	background-color: white;
	color: #2E9AFE; 
	width: 70px;
	height: 30px;
	border: 2px solid #81BEF7;
	font-size: 15px;

}


.box {
	border: 1px solid #DDD;
	border-radius: 10px;
	margin-left : 10%;
 	height: 80%; 
	width: 80%;
	margin-bottom: 20px;
	background-color: #f9f9f9;
	flex-direction: column;
}

.cont {

	margin-left: 30px;
	margin-right: 30px;

}

 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}

</style>


<div class="right">
<div id="main" style="text-align: center;" >

<!-- <h3 style="margin-top: 50px;"> 제작한 프로젝트 상세정보 </h3> -->







<br><br>
<div class="box" style="margin-top: 50px;">

<!--첫번째  -->
<div class="item">	
<div class="cont" style="text-align: left; margin-top: 20px;">
	<p style="font-weight: bold; font-size: 17px;" >${category }</p>
	
	<c:if test="${view.projectStep == 0}"><p style="font-weight: bold; font-size: 17px;">펀딩 작성중</p></c:if>
	<c:if test="${view.projectStep == 1}"><p style="font-weight: bold; font-size: 17px;">펀딩 승인대기중</p></c:if>
	<c:if test="${view.projectStep == 2}"><p style="font-weight: bold; font-size: 17px;">펀딩 승인거절</p></c:if>
	<c:if test="${view.projectStep == 3}"><p style="font-weight: bold; font-size: 17px;">펀딩 진행중</p></c:if>
	<c:if test="${view.projectStep == 4}"><p style="font-weight: bold; font-size: 17px;">펀딩 종료</p></c:if>
	
	<span>펀딩No ${view.projectNo }</span><br>
	<a href="/project/view?projectNo=${view.projectNo }"><p style="font-weight: bolder; font-size: 30px;">${view.projectTitle }</p></a> 
	<p style="font-weight: bolder; font-size: 15px;">${view.projectIntro }</p>

		<div>
			<div>
			</div>
			<br>
			<div>
			<span style="float: left;">펀딩 시작일</span>
			<span style="float: right;"><fmt:formatDate value="${view.openDate}" pattern="yy.MM.dd"/></span>
			</div>
			<br>
			<div>
			<span style="float: left;">펀딩 종료일</span>
			<span style="float: right;"><fmt:formatDate value="${view.closeDate}" pattern="yy.MM.dd"/></span>
			</div>
			<br>
			<div>
			<span style="float: left;">진행 상황</span>
			<span style="float: right;">${(view.fundPrice /view.projectPrice)*100 }%</span>
			</div>
			<br>
			<div>
			<span style="float: left;">목표 금액</span>
			<span style="float: right;"><fmt:formatNumber value="${view.projectPrice }" pattern="#,###" />원</span>
			</div>
			<br>
			<div>
			<span style="float: left;">현재 금액</span>
			<span style="float: right;"><fmt:formatNumber value="${view.fundPrice }" pattern="#,###" />원</span>
			</div>
			<br>
			<div>
			<span style="float: left;">예상 배송일</span>
			<span style="float: right;"><fmt:formatDate value="${view.deliveryDate }" pattern="yyyy/MM/dd"/></span>
			</div>
			<br>
		</div>
		
			<hr>
	</div>
</div><!-- .item  -->

<!--두번째  -->
<div class="item">	
	<div class="cont" style="text-align: left;" >
		<p style="font-weight: bolder; font-size: 15px;">리워드 상세정보</p>
			<div>		
			<c:forEach var="r" items="${reward }" begin="0" end="${fn:length(reward)}" >
				 <span style="font-size: 15px;">${r.REWARD_NAME}</span>
				 <span style="font-size: 15px;"> - ${r.REWARD_AMOUNT}개</span>
				 <span style="font-weight: normal; font-size: 15px; float: right; clear: right;" > ${r.REWARD_PRICE}원</span><br>
			</c:forEach>
			</div>
<!-- 		<div class="clearfix"></div> -->
	</div><!--.cont -->
</div><!-- .item  -->

	
<!--세번째  -->
<div class="item">	
	<div class="cont" style="text-align: left;" >
		<hr>
		<p style="font-weight: bold; font-size: 16px;">프로젝트 일정 계획</p>
		<span >${view.schedulePlan}</span><br><br>
		<p style="font-weight: bold; font-size: 16px;">프로젝트 예산 계획</p>
		<span >${view.budgetPlan}</span><br>
		<hr>
		<p style="font-weight: bold; font-size: 16px;">프로젝트 설명</p>
		<span >${view.projectContent}</span>
		
		<hr>
	</div><!-- .cont -->
</div><!-- .item  -->
	
	
	
<!--네번째  -->
<div class="item">	
<div class="cont" style="text-align: left; margin-top: 20px;">
	<p style="font-weight: bold; font-size: 15px;">결제 상세 정보</p>
	
		<div>
			<div>
			<span style="float: left;">예금주</span>
			<span style="float: right;">${seller.accountName}</span>
			</div>
			<br>
			<div>
			<span style="float: left;">은행명</span>
			<span style="float: right;">${seller.bankName}</span>
			</div>
			<br>
			<div>
			<span style="float: left;">계좌번호</span>
			<span style="float: right;">${seller.accountNumber}</span>
			</div>
			<br><br>
			<div>
			<span style="float: left; font-weight: bold;">창작자 소개</span><br>
			<span >${seller.sellerInfo }</span>
			</div>
			
			<br>
		</div>
		
	</div>
</div><!-- .item  -->

	
</div><!--.box  -->
</div><!-- main -->
<br><br>
<div style="text-align: center;">
	<c:if test="${view.projectStep == 0}">
	<a href="/apply/product?projectNo=${view.projectNo }"><button type="button" id="update" style="display: none;">수정</button></a>
	</c:if>
</div>

</div><!-- right -->
</div> <!-- container  -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">


<c:import url="/WEB-INF/views/layout/header.jsp" />
<c:import url="/WEB-INF/views/layout/mypageheader.jsp" />

<script type="text/javascript">

<c:if test = "${deliveryResult eq 1}">
$("#delivery").show();
</c:if>	

<c:if test = "${deliveryResult eq 0}">
$("#delivery").hide();
$(".cont").hide();
</c:if>	
</script>




<style>

.right {
	font-family: 'IBM Plex Sans KR', sans-serif;
}


.box {
	border: 1px solid #DDD;
	border-radius: 10px;
	margin-left : 10%;
 	height: 100% !improtant; 
	width: 80%;
	margin-bottom: 20px;
	background-color: #f9f9f9;
	flex-direction: column;
}

.cont {

	margin-left: 30px;
	margin-right: 30px;
	font-family: 'IBM Plex Sans KR', sans-serif;

}

 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}

#BTN {

	border-radius: 7px;
	background-color: #39AEA9 ;
	color: white; 
	width: 220px;
	height: 50px;
	border: 0px solid #81BEF7; 
	font-size: 17px;
	font-weight: bold;

}

 #BTN:hover { 
 	background-color: #557B83; 
  transition: background-color 0.3s; 
 }

a:visited {
	color: #000;
}
</style>


<div class="right">
<div id="main" style="text-align: center;" >



<div class="box" style="margin-top: 90px;">

<!--첫번째  -->
<div class="item">	
<div class="cont" style="text-align: left; margin-top: 20px;">
	<p style="font-weight: bold;" >${view[0].CATEGORY_NAME }</p>
	
	<c:if test="${view[0].PROJECT_STEP ==3}"><p style="color: blue; font-weight: bold;">펀딩 진행중</p></c:if>
	<c:if test="${view[0].PROJECT_STEP ==4}"><p style="color: tomato; font-weight: bold;">펀딩 종료</p></c:if>
	
	<a href="/project/view?projectNo=${view[0].PROJECT_NO }"><p style="font-weight: bolder; font-size: 30px;">${view[0].PROJECT_TITLE }</p></a> 
	<p style=" font-size: 15px; font-weight: bold;">by ${seller }</p>
		<div>
			<div>
			<span  style="float: left;">펀딩번호</span>
			<span  style="float: right;">${view[0].PROJECT_NO}</span>
			</div>
			<br>
			<div>
			<span style="float: left;">펀딩날짜</span>
			<span style="float: right;"><fmt:formatDate value="${view[0].ORDER_DATE}" pattern="yy.MM.dd"/></span>
			</div>
			<br>
			<div>
			<span style="float: left;">펀딩 종료일</span>
			<span style="float: right;"><fmt:formatDate value="${view[0].CLOSE_DATE}" pattern="yy.MM.dd"/></span>
			</div>
			<br>
			<div>
			<span style="float: left;">결제 상태</span>
			<c:if test="${view[0].ORDER_STATUS==0}"><span style="float: right; color: orange; font-weight: bold;">결제 전</span></c:if>
			<c:if test="${view[0].ORDER_STATUS==1}"><span style="float: right; color: blue; font-weight: bold;">결제 완료</span></c:if>
			<c:if test="${view[0].ORDER_STATUS==2}"><span style="float: right; color: tomato; font-weight: bold;">결제 취소</span></c:if>
			</div>
			<br>
		</div>
			<hr>
	</div>
</div><!-- .item  -->

<!--두번째  -->
<div class="item">	
	<div class="cont" style="text-align: left;" >
		<c:forEach var="v" items="${view }" begin="0" end="${fn:length(view)}" >
		 <span style="font-size: 15px; font-weight: bold;">${v.REWARD_NAME}<span style="font-weight: normal; font-size: 14px;">(${v.REWARD_COUNT}개)</span></span> - <span style="font-size: 15px;">${v.REWARD_INTRO}</span><br> 
		</c:forEach>
		<br>
		<p ><fmt:formatDate value="${view[0].DELIVERY_DATE}" pattern="yy.MM.dd"/>(발송 예정)</p>
		<hr>
	</div><!-- .cont -->
	</div><!-- .item  -->
	
	
<!--세번째  -->
<div class="item">	
	<div class="cont" style="text-align: left;" >
		<p style="font-weight: bolder; font-size: 15px;">결제 내역 / 결제 방법</p>
			<div style="margin-top: 10px; ">
				<div  style="float: left;">
				
				<c:forEach var="v" items="${view }" begin="0" end="${fn:length(view)}" >
				<span>${v.REWARD_NAME} 금액</span><br>
				</c:forEach>
				
				<span>추가후원금</span><br><br>
				<span>최종 결제 금액</span><br><br>
				<span>결제수단</span><br>
				<br>
				</div>	

				<div  style=" text-align: right;">
				<c:forEach var="v" items="${view }" begin="0" end="${fn:length(view)}" >
				<span >(${v.REWARD_PRICE} *${v.REWARD_COUNT})	 &nbsp;&nbsp; &#8361;&nbsp;${v.REWARD_PRICE * v.REWARD_COUNT}</span><br>
				</c:forEach>
				<span>${view[0].ADDTIONAL_FUNDING}</span><br><br>
				<span>${view[0].TOTAL_PRICE}</span><br><br>
				<span>${paymentinfo.paymentMethod}</span><br>
				</div>
				
<!-- 				<div class="clearfix"></div> -->
			</div>
			<hr style="width: 100%;">
	</div><!--.cont -->
	</div><!-- .item  -->
	
<!--네번째  -->
<div class="item" id="delivery">	
	<div class="cont" style="text-align: left; margin-top: 20px;">
<p> </p>
		<p style="font-weight: bolder; font-size: 15px;">배송지 정보</p>
		<p >${view[0].RECIPIENT_NAME}</p>
		<p >${view[0].RECIPIENT_PHONE}</p>
		<p >${view[0].ADDRESS}</p>
		<p >${view[0].ADDRESS_EXTRA}</p>
		<p >${view[0].ADDRESS_DETAIL}</p>
		<p >${view[0].PRECAUTIONS}</p>
	</div><!-- .cont -->
	</div><!-- .item  -->
	
</div><!--.box  -->
<br><br>
<button onclick="history.back(-1);" class="BTN" id="BTN">목록</button>

</div><!-- main -->

<br><br><br><br>
</div><!-- right -->
</div> <!-- container  -->

<%-- <c:import url="/WEB-INF/views/layout/footer.jsp" /> --%>
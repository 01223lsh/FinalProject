<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<c:import url="/WEB-INF/views/layout/mypageheader.jsp" />

<script type="text/javascript">

$(document).ready(function() {
	
	if("${paging.totalCount}"==0) {
		$(".FORM").hide();
		$("#result").show();
	};
});
</script>


<style>

.box {
	border: 1px solid #DDD;
	border-radius: 5px;
	margin-left : 10%;
	height: 200px;
	width: 80%;
	margin-bottom: 20px;
	background-color: #f9f9f9;

}

p {
	font-size: 13px;

}

.cont {

	margin-left: 30px;
	margin-right: 30px;
}

a {
	text-decoration: none;
}


a:active { color:black; }
a:link { color: black; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { color: black; text-decoration: none;}


</style>


<div class="right">
<div id="main" style="text-align: center;" >


<div class="allbox" style="margin-top: 90px;">

<c:forEach items="${list }" var="fund">

<div class="box">
	<div class="cont" style="text-align: left; margin-top: 20px;">
	<p >${fund.categoryName }</p>

	
	<c:if test="${fund.projectStep == 3}"><p>펀딩 진행중</p></c:if>
	<c:if test="${fund.projectStep == 4}"><p>펀딩 종료</p></c:if>
	
	
	<a href="/mypage/joinfunview?orderNo=${fund.orderNo }"><p style="font-weight: bolder; font-size: 25px;">${fund.projectTitle }</p></a>
	<p> <fmt:formatDate value="${fund.orderDate }" pattern="yyyy/MM/dd"/></p>
	<c:if test="${fund.orderStatus == 0 }"><p>결제 전</p></c:if> 
	<c:if test="${fund.orderStatus == 1 }"><p>결제 완료</p></c:if> 
	<c:if test="${fund.orderStatus == 2 }"><p>결제 취소</p></c:if> 
	</div>
</div>

</c:forEach>

<!-- <div> -->
<!-- 	<form action="/mypage/joinfunlist" method="get"> -->
<%-- 	<input type="text" name="search" id="search" placeholder="프로젝트명을 입력하세요"  value="${param.search}" /> --%>
<!-- 	<button>검색</button> -->
<!-- 	</form> -->
<!-- </div> -->

<form action="joinfunlist" method="get">
<div class="FORM">
	<select name="select" id="select" style="border-radius: 1px; width: 80px; margin-right: 10px;">
		<option value="projectTitle" id="projectTitle" <c:if test="${select eq 'projectTitle' }">selected</c:if>>제목</option>
		<option value="projectStep" id="projectStep" style="display: none;"<c:if test="${select eq 'projectStep' }">selected</c:if>>프로젝트 진행상황</option>
	</select>


	<input type="text" name="search" id="search" placeholder="검색어를 입력하세요"  value="${param.search}" />
	<button>검색</button>

</div>
</form>

<h3 id="result" style="display: none;">참여한 프로젝트가 존재하지 않습니다.</h3>


</div><!-- .allbox -->

</div><!-- main -->
</div><!-- right -->
</div> <!-- container  -->

<c:import url="/WEB-INF/views/mypage/joinlistpaging.jsp" />
<c:import url="/WEB-INF/views/layout/footer.jsp" />
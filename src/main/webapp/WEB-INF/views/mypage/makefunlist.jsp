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
.right {
	font-family: 'IBM Plex Sans KR', sans-serif;
}

.box {
	border: 1px solid #DDD;
	border-radius: 5px;
	margin-left : 10%;
	height: 230px;
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

#ptitle {
	text-decoration: none;
}


#ptitle:active { color:black; }
#ptitle:link { color: black; text-decoration: none;}
#ptitle:visited { color: black; text-decoration: none;}
#ptitle:hover { color: black; text-decoration: none;}

button {

	border-radius: 5px;
	background-color: #183F7B;
	color: #fff; 
	width: 85px;
	height: 25px;
	border: 0px solid #538fd9;
	font-size: 15px;
	font-weight: bold;
	margin-left: 10px;
}

.container {

/* 	margin-bottom: 700px; */

}

</style>


<div class="right" >
<div id="main" style="text-align: center;" >



<div class="allbox" style="margin-top: 90px;">
<c:forEach items="${list }" var="fund">

<div class="box">
	<div class="cont" style="text-align: left; margin-top: 20px;">
	<p >${fund.categoryName }</p>

	
	<c:if test="${fund.projectStep == 0}"><p style="font-weight: bold; color: orange;">펀딩 작성중</p></c:if>
	<c:if test="${fund.projectStep == 1}"><p style="font-weight: bold; color: green;">펀딩 승인대기중</p></c:if>
	<c:if test="${fund.projectStep == 2}"><p style="font-weight: bold; color: tomato;">펀딩 승인거절</p></c:if>
	<c:if test="${fund.projectStep == 3}"><p style="font-weight: bold; color: blue;">펀딩 진행중</p></c:if>
	<c:if test="${fund.projectStep == 4}"><p style="font-weight: bold; color: tomato;">펀딩 종료</p></c:if>
	<c:if test="${fund.projectStep == 5}"><p style="font-weight: bold; color: green;">펀딩 진행대기중</p></c:if>
	
	
	<a href="/mypage/makefunview?projectNo=${fund.projectNo }" id="ptitle"><p style="font-weight: bolder; font-size: 25px;">${fund.projectTitle }</p></a>
	<p><fmt:formatDate value="${fund.openDate }" pattern="yyyy/MM/dd"/> - <fmt:formatDate value="${fund.closeDate }" pattern="yyyy/MM/dd"/></p>
	
<%-- 	<p >${fund.projectIntro }</p> --%>
	<p >금액 <fmt:formatNumber value="${fund.fundPrice }" pattern="#,###" />원 / <fmt:formatNumber value="${fund.projectPrice }" pattern="#,###" />원 (${(fund.fundPrice /fund.projectPrice)*100 }%)</p>
	</div>
</div>

</c:forEach>
<br><br>
<!-- <div> -->
<!-- 	<form action="/mypage/makefunlist" method="get"> -->
<%-- 	<input type="text" name="search" id="search" placeholder="프로젝트명을 입력하세요"  value="${param.search}" /> --%>
<!-- 	<button>검색</button> -->
<!-- 	</form> -->
<!-- </div> -->
<br><br><br>
<form action="/mypage/makefunlist" method="get">
<div class="FORM">
	<select name="select" id="select" style="border-radius: 1px; width: 80px; margin-right: 10px;">
		<option value="projectTitle" id="projectTitle" <c:if test="${select eq 'projectTitle' }">selected</c:if>>제목</option>
		<option value="projectStep" id="projectStep" style="display: none;"<c:if test="${select eq 'projectStep' }">selected</c:if>>프로젝트 진행상황</option>
	</select>


	<input type="text" name="search" id="search" placeholder="검색어를 입력하세요"  value="${param.search}" />
	<button>검색</button>

</div>
</form>

<div id="result" style="display: none;">
<img src="/resources/img/mypage/sad.png" alt="안나오네">
<p style="margin-top: 50px; font-size: 20px; font-weight: bold;">제작한 프로젝트가 존재하지 않습니다.</p>
<p style="font-size: 16px; font-weight: bold;">다양하고 재밌는 프로젝트를 제작하시면, 만들고 싶은 상품을 직접 만들 수 있습니다!</p>
</div>



</div><!-- .allbox -->
</div><!-- main --><br><br>

<c:if test="${paging.totalCount ne 0}">
<c:import url="/WEB-INF/views/mypage/makelistpaging.jsp" />
</c:if>
</div><!-- right -->
</div> <!-- container  -->



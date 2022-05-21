<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">

$(document).ready(function() {
// 	if("${grade}"==2  && "${memberNo == qna.memberNo}"){
// 		$("#admindelete").hide();
		
// 	}
// 	if("${grade eq 2}"  && "${memberNo eq qna.memberNo}"){
// 		$("#admindelete").hide();
		
// 	}

// 	if("${reCnt eq 2 && qnare.qnaStep eq 1}"){
// 		$("#review").show();
// 	} 


// 	<c:if test="${grade ==2  && memberNo != qna.memberNo}">
// 		$("#admindelete").hide();
// 	</c:if>	

	//답글 있는 경우 && 답변 step이 1인 경우(답글 1개 체크)
	<c:if test="${reCnt eq 2 && qnare.qnaStep eq 1}">
		$("#review").show();
	</c:if>	

// 	답글 있는 경우 && 답변 step이 1인 경우(답글 1개 체크) && 관리자일 경우
	<c:if test="${reCnt eq 2 && qnare.qnaStep eq 1 && grade == 2}">
		$("#delete").show();
	</c:if>	
	
	
	//관리자인 경우 && 답글 안적은 문의글일 때
	<c:if test="${grade == 2 && reCnt ==1}">
		$("#reply").show();
		$("#delete").show();
	</c:if>	

	//작성자 = 현재 로그인한 사람
	<c:if test="${memberNo == qna.memberNo}">
		$("#update").show();
		$("#delete").show();
	</c:if>
	
	
});


</script>

<style>

.right {
	font-family: 'IBM Plex Sans KR', sans-serif;
}

button {
 	border-radius: 5px;
    border: 0px solid black;
    background-color: #39AEA9;
    color: white;
    width: 70px;
    height: 35px;
    font-weight: bold;
/*     box-shadow: inset 1px 1px 2px 1px rgb(77, 71, 71);  */
}

button:hover {
	background-color: #557B83;
	transition: background-color 0.3s;
}


</style>



<%-- <h1 style="text-align: center;">고객센터d${reCnt } / ${qnare.qnaStep }</h1> --%>
<br>

<!-- <p style="font-size: 20px; font-weight: bold; margin-bottom: 20px; margin-left: 10px;" ma>문의 내역</p> -->
<div id="view"  style="border: 2px solid #A2D5AB; border-radius: 10px; margin-bottom: 30px; width: 60%; margin-left: 20%; margin-right: 20%;">



<div style="margin-left: 20px; margin-bottom: 20px;"><h2 style="font-weight: bold; margin-top: 15px;">${qna.qnaTitle }</h2></div>
<div style="float: left; margin-left: 15px; margin-bottom: 10px;">작성자 : ${qna.nick }</div>
<%-- <div style="float: right;  margin-bottom: 20px; margin-left: 20px; margin-right: 20px;" >조회수 : ${qna.hit }</div> --%>
<div style="float: right;  margin-bottom: 10px; margin-right: 10px;" >작성날짜 : <fmt:formatDate value="${qna.qnaCreateDate }" pattern="yy-MM-dd HH:mm:ss"/></div>
<hr style="color: #DDD; width: 100%">
<div style="clear: both; min-height: 400px; margin-left: 20px; ">${qna.qnaContent }</div>



</div><!-- view -->



<div id="review"  style="border: 2px solid #A2D5AB; border-radius: 10px; margin-bottom: 30px; display: none; width: 60%; margin-left: 20%; margin-right: 20%;">


<div style="margin-left: 20px; margin-bottom: 20px;"><h2 style="font-weight: bold;  margin-top: 15px;">${qnare.qnaTitle }</h2></div>
<div style="float: left; margin-left: 15px; margin-bottom: 10px;">작성자 : ${qnare.nick }</div>
<%-- <div style="float: right;  margin-bottom: 20px; margin-left: 20px; margin-right: 20px;" >조회수 : ${qna.hit }</div> --%>
<div style="float: right;  margin-bottom: 10px; margin-right: 10px;" >작성날짜 : <fmt:formatDate value="${qnare.qnaCreateDate }" pattern="yy-MM-dd HH:mm:ss"/></div>
<hr style="color: #DDD; width: 100%">
<div style="clear: both; min-height: 400px; margin-left: 20px; ">${qnare.qnaContent }</div>



</div><!-- view -->

<div class="button" style="width: 60%; margin-left: 20%; margin-left: 20%;">

<!-- <br><br> -->
<!-- <a href="/qna/list"><button class="pull-left;">목록</button></a> -->
<a href="/qna/list"><button class="btn1">목록</button></a>

<%-- <c:if test="${memberNo == qna.memberNo}"> --%>
<a href="/qna/qnaupdate?qnaNo=${qna.qnaNo }"><button  style="margin-right: 10px; display: none; float: right;" id="update">수정</button></a>
<a href="/qna/qnadelete?qnaNo=${qna.qnaNo }"><button  style="margin-right: 10px; display: none;  float: right;" id="delete">삭제</button></a>

<%-- </c:if> --%>

<%-- <c:if test="${grade == 2 && reCnt ==1}"> --%>
<a href="/qna/qnarewrite?qnaNo=${qna.qnaNo }"><button style="margin-right: 10px; display: none; width: 80px;  float: right;" id="reply" >답변작성</button></a>
<a href="/qna/qnadeleteAd?qnaNo=${qna.qnaNo }"><button style="margin-right: 10px; display: none;  float: right;" id="deletead" >삭제ad</button></a>
<%-- </c:if> --%>

</div><!--.button  -->

</div><!-- container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />
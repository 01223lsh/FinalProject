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

	<c:if test="${grade ==2  && memberNo == qna.memberNo}">
		$("#admindelete").hide();
	</c:if>	


	<c:if test="${reCnt eq 2 && qnare.qnaStep eq 1}">
		$("#review").show();
	</c:if>	


		
// 	if("${reCnt eq 2 && qnare.qnaStep eq 1}"){
// 		$("#review").show();
// 	} 
	

	

})


</script>



<%-- <h1 style="text-align: center;">고객센터d${reCnt } / ${qnare.qnaStep }</h1> --%>
<br>

<!-- <p style="font-size: 20px; font-weight: bold; margin-bottom: 20px; margin-left: 10px;" ma>문의 내역</p> -->
<div id="view"  style="border: 1px solid #DDD; border-radius: 10px; margin-bottom: 30px;">



<div style="margin-left: 20px; margin-bottom: 20px;"><h2 style="font-weight: bold;">${qna.qnaTitle }</h2></div>
<div style="float: left; margin-left: 15px; margin-bottom: 10px;">작성자 : ${qna.nick }</div>
<%-- <div style="float: right;  margin-bottom: 20px; margin-left: 20px; margin-right: 20px;" >조회수 : ${qna.hit }</div> --%>
<div style="float: right;  margin-bottom: 10px; margin-right: 10px;" >작성날짜 : <fmt:formatDate value="${qna.qnaCreateDate }" pattern="yy-MM-dd HH:mm:ss"/></div>
<hr style="color: #DDD; width: 100%">
<div style="clear: both; min-height: 400px; margin-left: 20px; ">${qna.qnaContent }</div>



</div><!-- view -->



<div id="review"  style="border: 1px solid #DDD; border-radius: 10px; margin-bottom: 30px; display: none; ">


<div style="margin-left: 20px; margin-bottom: 20px;"><h2 style="font-weight: bold;">${qnare.qnaTitle }</h2></div>
<div style="float: left; margin-left: 15px; margin-bottom: 10px;">작성자 : ${qnare.nick }</div>
<%-- <div style="float: right;  margin-bottom: 20px; margin-left: 20px; margin-right: 20px;" >조회수 : ${qna.hit }</div> --%>
<div style="float: right;  margin-bottom: 10px; margin-right: 10px;" >작성날짜 : <fmt:formatDate value="${qnare.qnaCreateDate }" pattern="yy-MM-dd HH:mm:ss"/></div>
<hr style="color: #DDD; width: 100%">
<div style="clear: both; min-height: 400px; margin-left: 20px; ">${qnare.qnaContent }</div>



</div><!-- view -->


<br><br>
<a href="/qna/list"><button class="pull-left;">목록</button></a>

<c:if test="${memberNo == qna.memberNo}">
<a href="/qna/qnaupdate?qnaNo=${qna.qnaNo }"><button class="pull-right" style="margin-right: 10px;">수정</button></a>
<a href="/qna/qnadelete?qnaNo=${qna.qnaNo }"><button class="pull-right" style="margin-right: 10px;" id="admindelete">삭제</button></a>

</c:if>

<c:if test="${grade == 2 && reCnt ==1}">
<a href="/qna/qnarewrite?qnaNo=${qna.qnaNo }"><button class="pull-right" style="margin-right: 10px;" id="reply" >답변작성</button></a>
<a href="/qna/qnadelete?qnaNo=${qna.qnaNo }"><button class="pull-right" style="margin-right: 10px;" >삭제</button></a>
</c:if>


</div><!-- container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />
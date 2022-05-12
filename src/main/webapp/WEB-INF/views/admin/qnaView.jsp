<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">


function qnaRewrite(qnaNo){
	console.log(qnaNo)
	$.ajax({
		type : "get"
		,url : "/admin/qnarewrite"
		,data : "qnaNo="+qnaNo
		,dataType : "html"
		,success : function(res){
			$("#resultLayout").html(res)
		},error : function(){
			console.log("qna 답글 실패");
		}
	})
}
function qnaUpdate(qnaNo){
	$.ajax({
		type : "get"
		,url : "/admin/qnaUpdate"
		,data : "qnaNo="+qnaNo
		,dataType : "html"
		,success : function(res){
			$("#resultLayout").html(res)
			
		},error : function(){
			console.log("qna 삭제 실패");
		}
	})
	
}

function qnaDelete(qnaNo){
	if(confirm("복구가 불가능합니다.\n정말 삭제하시겠습니까?")){
		$.ajax({
			type : "post"
			,url : "/admin/qnaDelete"
			,data : "qnaNo="+qnaNo
			,dataType : "html"
			,success : function(res){
				qnaManagement();
				
			},error : function(){
				console.log("qna 삭제 실패");
			}
		})
	}
}
</script>
</head>
<body>
<h1 style="text-align: center;">고객센터 상세페이지</h1>
<br>

<div id="view"  style="border: 1px solid #DDD; border-radius: 10px; margin-bottom: 30px;">



<div style="margin-left: 20px; margin-bottom: 20px;"><h2>${qna.qnaTitle }</h2></div>
<div style="float: left; margin-left: 15px; margin-bottom: 10px;">작성자 : ${qna.nick }</div>
<%-- <div style="float: right;  margin-bottom: 20px; margin-left: 20px; margin-right: 20px;" >조회수 : ${qna.hit }</div> --%>
<div style="float: right;  margin-bottom: 10px; margin-right: 10px;" >작성날짜 : <fmt:formatDate value="${qna.qnaCreateDate }" pattern="yy-MM-dd HH:mm:ss"/></div>
<hr style="color: #DDD; width: 100%">
<div style="clear: both; min-height: 400px; margin-left: 20px; ">${qna.qnaContent }</div>



</div><!-- view -->

<br><br>
<button class="pull-left;" onclick="qnaManagement()">목록</button>
	<c:forEach items="${list}" var="i">
		<c:if test="${ qna.qnaNo eq i.qnaRefer}">
			<button class="pull-right" style="margin-right: 10px;" onclick="qnaRewrite(${qna.qnaNo})">답변작성</button>
		</c:if>
	</c:forEach>
<c:if test="${qna.qnaStep>0 }">
<button class="pull-right" style="margin-right:10px;" onclick="qnaUpdate(${qna.qnaNo})">수정</button>
<button class="pull-right" style="margin-right:10px;" onclick="qnaDelete(${qna.qnaNo})">삭제</button>
</c:if>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	$("#btnQnaWrite").click(function(){
		oEditors.getById["qnaContent"].exec("UPDATE_CONTENTS_FIELD", []);
		$.ajax({
			type : "post"
			,url : "/admin/qnarewrite"
			,data :  {qnaContent:$("#qnaContent").val(),id:+"${id}",nick:"관리자",memberNo:"1",qnaNo:"+${param.qnaNo}",qnaTitle:$("#qnaTitle").val()}
			,dataType : "html"  
			,success : function(res){
				console.log("성공??");
				qnaManagement();

				
			},
			error : function(){
				
				console.log("실패"+data);
			}
		})
	})
})
</script>

<style>
/*
textarea {
	height: 400px;
}
*/
</style>
</head>
<body>





<h1 style="text-align: center; margin-top: 30px;">문의 답변글 작성</h1>
<br>




<div id="wrtie"  style="border: 0px solid #DDD; border-radius: 10px; margin-bottom: 30px; padding-top: 20px;" >

<form method="post" class="form-horizontal" id="qnaWriteForm">
	
	<input type="hidden" id="id" name="id" value="${id }"> 
	<input type="hidden" id="nick" name="nick" value="${nick }"/> 
	<input type="hidden" id="memberNo" name="memberNo" value="${memberNo }"/> 
	<input type="hidden" id="qnaNo" name="qnaNo" value="${param.qnaNo }"/> 
	
<!-- 	<div class="form-group"> -->
<!-- 		<div> -->
<!-- 			<label for="writer_nick" class="col-sm-1 col-sm-offset-1">작성자</label> -->
<!-- 		</div> -->
<!-- 	</div>	 -->
<!-- 	<div class="form-group"> -->
<!-- 		<div class="col-sm-2 col-sm-offset-1"> -->
<%-- 			<input type="text" id="writer_nick" name="writer_nick" class="form-control " readonly="readonly" value="${nick }"> --%>
<!-- 		</div> -->
<!-- 	</div> -->

	<div class="form-group">
		<div class="col-sm-10 col-sm-offset-1">
			<input type="text" id="qnaTitle" name="qnaTitle" class="form-control"  placeholder="제목을 입력하세요" value="ㄴ">
		</div>
	</div>

	<div class="form-group">
		<div class="col-sm-10 col-sm-offset-1">
			<textarea class="form-control" id="qnaContent" name="qnaContent" rows="30"  style="width: 100%;">내용을 입력하세요</textarea>
		</div>
	</div>



	
</form>
<div style="text-align: center; margin-top: 50px; margin-bottom: 100px;" > 
	<button id="btnQnaWrite" name="btnWrite" >작성</button>
	<button type="button" id="cancle" onclick="qnaView(${param.qnaNo})">취소</button>
</div>


<!-- 스마트 에디터 2 로드  -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript"> 
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors
	, elPlaceHolder: "qnaContent"
	, sSkinURI: "/resources/se2/SmartEditor2Skin.html"
	, fCreator: "createSEditor2"
})
</script>

</body>
</html>
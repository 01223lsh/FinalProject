<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:import url="/WEB-INF/views/layout/header.jsp" />




<script type="text/javascript">
function submitContents(elClickedObj) {
	oEditors.getById["qnaContent"].exec("UPDATE_CONTENTS_FIELD", [])
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

$(document).ready(function() {
	$("#btnWrite").click(function() {
		submitContents($("#btnWrite"))
		
		$("form").submit();
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





<h1 style="text-align: center; margin-top: 30px;">문의 답변글 작성</h1>
<br>


<div id="wrtie"  style="border: 0px solid #DDD; border-radius: 10px; margin-bottom: 30px; padding-top: 20px;" >

<form action="/qna/qnarewrite" method="post" class="form-horizontal">
	
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



	<div style="text-align: center; margin-top: 50px; margin-bottom: 100px;" > 
		<button id="btnWrite" name="btnWrite" >작성</button>
		<a href="/qna/list" ><button type="button" id="cancle">취소</button></a>
	</div>
</form>


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


</div><!-- view -->
</div><!-- container -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
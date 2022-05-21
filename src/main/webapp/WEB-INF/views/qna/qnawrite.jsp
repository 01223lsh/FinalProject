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

.right {
	font-family: 'IBM Plex Sans KR', sans-serif;
}

.title {

	width : 60%;
	margin: 0 auto;
	margin-bottom: 20px;
}

.cont {

	width : 60%;
	margin: 0 auto;
}

input {
	width: 100%;
	border-radius: 5px;
	height: 37px;
	border: 2px solid #DDD;
}

button {
    border-radius: 5px;
    border: 0px solid black;
/*     background-color: #183F7B; */
    background-color: #396EB0;
    color: white;
    width: 53px;
    height: 30px;
    font-weight: bold;
    margin-right: 15px;
/*     box-shadow: inset 1px 1px 2px 1px rgb(77, 71, 71); */
}
</style>





<h1 style="text-align: center; margin-top: 30px;">문의글 작성</h1>
<br>


<div id="wrtie"  style="border: 0px solid #DDD; border-radius: 10px; margin-bottom: 30px; padding-top: 20px;" >

<form action="/qna/qnawrite" method="post" class="form-horizontal">
	
	<input type="hidden" id="id" name="id" value="${id }"> 
	<input type="hidden" id="nick" name="nick" value="${nick }"/> 
	<input type="hidden" id="memberNo" name="memberNo" value="${memberNo }"/> 
	
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

	<div class="title">
		<div class="">
			<input type="text" id="qnaTitle" name="qnaTitle" class=""  placeholder="제목을 입력하세요" >
		</div>
	</div>

	<div class="cont">
		<div class="">
			<textarea class="" id="qnaContent" name="qnaContent" rows="30"  style="width: 100%;">내용을 입력하세요</textarea>
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
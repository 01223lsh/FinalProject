<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<!-- 스마트 에디터 2 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript">
function submitContents(elClickedObj) {
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [])
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

$(document).ready(function() {
	$("#btnUpdate").click(function() {
		submitContents($("#btnUpdate"))
		
		$("form").submit();
	})
})
</script>

<script type="text/javascript">
$(document).ready(function() {
	$("#cancel").click(function() {
		history.go(-1)
	})

	
	if( ${empty boardFile} ) {
		$("#newFile").show()
	} else {
		$("#originFile").show()
	}
	
	$("#deleteFile").click(function() {
		$("#originFile").toggleClass("through")
		$("#newFile").toggle();
	})
})
</script>

<style type="text/css">
.through {
	text-decoration: line-through;
}

#deleteFile {
	font-size: 1.5em;
	font-weight: bold;
	color: red;
}

#newFile, #originFile {
	display: none;
}
</style>

<div class="container">

<h1>글 수정</h1>
<hr>

<form action="/board/update" method="post" enctype="multipart/form-data">
<%-- <input type="hidden" name="boardNo" value="${updateBoard.boardNo }"> --%>
<input type="hidden" name="boardNo" value="${param.boardNo }">

<div class="form-group">
	<label for="write">작성자</label>
	<input type="text" id="write" value="${nick }" class="form-control" readonly="readonly">
</div>

<div class="form-group">
	<label for="title">제목</label>
	<input type="text" id="title" name="title" class="form-control" value="${updateBoard.title }">
</div>
<div class="form-group">
	<label for="content">본문</label>
	<textarea rows="10" style="width: 100%;" id="content" name="content">${updateBoard.content }</textarea>
</div>

<div class="form-group">

	<div id="fileBox">
		<div id="originFile">
			<a href="/board/download?fileNo=${boardFile.fileNo }">${boardFile.originName }</a>
			<span id="deleteFile">X</span>
		</div>

		<div id="newFile">
			<hr>
			<label for="file">새로운 첨부파일</label>
			<input type="file" id="file" name="file">
			<small>** 새로운 파일로 첨부하면 기존 파일은 삭제됩니다</small>
		</div>
	</div>

</div>

<div class="text-center">
	<button class="btn btn-primary" id="btnUpdate">수정</button>
	<input type="reset" id="cancel" class="btn btn-danger" value="취소">
</div>
</form>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors
	, elPlaceHolder: "content"
	, sSkinURI: "/resources/se2/SmartEditor2Skin.html"
	, fCreator: "createSEditor2"
})
</script>

</div><!-- .container end -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />

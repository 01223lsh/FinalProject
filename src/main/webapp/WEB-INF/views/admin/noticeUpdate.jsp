<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	if( ${empty notice.fileOrigin}) {
		$("#newFile").show();
	} else {
		$("#originFile").show();
	}
	$("#deleteFile").click(function() {
		$("#originFile").toggleClass("through")
		$("#newFile").toggle();
	})
	$("#btnNoticeUpdate").click(function(){
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

		var form = $("#updateform")[0];
		var data = new FormData(form);
		$("#btnNoticeUpdate").prop("disabled", true);  
// 		위에 코드로 인해 페이지 하나 더 추가 안됨 유용함
		$.ajax({
			type : "post"
			,url : "/admin/noticeUpdate"
			,data : data
			,dataType : "html"
			,contentType : false
	        ,processData : false  
	        ,cache: false  
			,success : function(res){
				noticeManagement();
				console.log("성공");
			},
			error : function(){
				console.log("실패"+data);
			}
		})
	})
})
</script>
</head>
<body>
<div class="container">

<h1>글쓰기</h1>
<hr>

<form enctype="multipart/form-data"  id="updateform" method="post">
<div class="form-group">
	<label for="write">작성자</label>
	<input type="text" id="write" value="관리자" class="form-control" readonly="readonly">
</div>

<div class="form-group">
	<label for="title">제목</label>
	<input type="text" id="title" name="title" class="form-control" value="${notice.title }">
</div>
<div class="form-group">
	<label for="content">본문</label>
	<textarea rows="10" style="width: 100%;" id="content" name="content">${notice.content }</textarea>
</div>

<div class="form-group">

	<div id="fileBox">
		<div id="originFile">
			<a onclick="noticeDownload(${notice.fileNo})">${notice.fileOrigin}</a>
			<span id="deleteFile">X</span>
		</div>

		<div id="newFile">
			<hr>
			<label for="file">새로운 첨부파일</label>
<!-- 			<input type="file" id="file" name="file"> -->
			<input multiple="multiple" type="file" name="file" id="file"/> 
			<small>** 새로운 파일로 첨부하면 기존 파일은 삭제됩니다</small>
		</div>
	</div>

</div>
<div class="text-center">
	<button class="btn btn-primary" id="btnNoticeUpdate">작성</button>
	<button type="reset" onclick="noticeManagement()" class="btn btn-danger" >취소</button>
</div>
<input type="hidden" value="${notice.fileNo }" id="fileNo" name="fileNo">
<input type="hidden" value="${notice.noticeNo }" id="noticeNo" name="noticeNo">
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

</body>


</html>

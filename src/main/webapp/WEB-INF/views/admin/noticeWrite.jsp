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
	$("#btnWrite").click(function(){
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

		var form = $("#writeform")[0];
		var data = new FormData(form);
		$("#btnWrite").prop("disabled", true);  
// 		위에 코드로 인해 페이지 하나 더 추가 안됨 유용함
		$.ajax({
			type : "post"
			,url : "/admin/noticeWrite"
// 			,enctype:"multipart/form-data"
			,data : data
			,dataType : "html"
			,contentType : false
	        ,processData : false  
	        ,cache: false  
			,success : function(res){
				console.log("성공??");
				noticeManagement()

				
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

<form enctype="multipart/form-data"  id="writeform" method="post">
<div class="form-group">
	<label for="write">작성자</label>
	<input type="text" id="write" value="관리자" class="form-control" readonly="readonly">
</div>

<div class="form-group">
	<label for="title">제목</label>
	<input type="text" id="title" name="title" class="form-control">
</div>
<div class="form-group">
	<label for="content">본문</label>
	<textarea rows="10" style="width: 100%;" id="content" name="content"></textarea>
</div>

	<label for="file">첨부파일</label>
	<input type="file" id="file" name="file">

<div class="text-center">
	<button class="btn btn-primary" id="btnWrite">작성</button>
	<button type="reset" onclick="noticeManagement()" class="btn btn-danger" >취소</button>
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

</body>


</html>

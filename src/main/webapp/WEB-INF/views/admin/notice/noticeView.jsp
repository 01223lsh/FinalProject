<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function noticeDelete(noticeNo){
	if(confirm("삭제하시면 복구가 되지 않습니다.\n정말 삭제를 하시겠습니까?")){
		$.ajax({
			type : "post"
			,url : "/admin/notice/noticeDelete"
			,data : "noticeNo="+noticeNo
			,dataType : "html"
			,success : function(res){
				noticeManagement()
			},error : function(request,error){
				console.log("공지사항 삭제 실패");
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				
			}
		})
	}
}
function noticeUpdate(noticeNo){
	$.ajax({
		type : "get"
		,url : "/admin/notice/noticeUpdate"
		,data : "noticeNo="+noticeNo
		,dataType : "html"
		,success : function(res){
			console.log("공지사항 수정 성공");
			$("#resultLayout").html(res);
			
		}
		,error : function(){
			console.log("공지사항 수정 실패");
		}
	})
}
function noticeDownload(fileNo){
	$.ajax({
		type : "post"
		,url : "/download"
		,data : "fileNo="+fileNo
		,dataType : "html"
		,contentType : 'application/x-www-form-urlencoded; charset=UTF-8' //중요
		,success : function(res){
			console.log("성공?")
			window.open("/download/?fileNo="+fileNo);
		},error : function(request, error){
	
			console.log("다운로드 실패")
			
		}	
	})
}
</script>
<style type="text/css">
.noticeView{
	margin: 2px 0;
	padding: 1px 3px;
	border-width: 2px;
	border-color: #aaa;
	text-align: center;
	border-style: solid;
		
}
.notice{
	margin : 60px 100px;
}
.noticeTitle{
	font-size : 24px;
	float : left;
	width : 50%
}
.noticeDate{
	float: right;
    width: 50%;
    height : 100%;
    text-align : right;
 	vertical-align:middle;
}
.noticeimg{
	width : 500px;
}
html { overflow-y:scroll; }

button{   
    background: #527578;
    border: 1px solid #527578;
    color: white;
    border-radius: 5px;}
</style>

</head>

<body>
<br>
<br>
<div class="noticeView" style="width: 800px;
    margin: 0 auto;
    border-radius: 15px;
    border: 1px solid #ddd; margin-bottom: 30px;">
<div style="height:20px; ">
	<div class="noticeTitle" style="text-align: left;" >${notice.title}</div>

	<div class="noticeDate" style="color :#ccc;">작성일자 :<fmt:formatDate value="${notice.regDate}" pattern="yy-MM-dd" /> | 작성자  : 관리자</div>
</div>


<hr>
	<c:forEach items="${listfile}" var="i">
	<c:if test="${not empty i.fileOrigin}"> 
	<img src="/noticeimg/${i.fileStorage}" class="noticeimg"> <br>
	</c:if>
	</c:forEach> 
	<div class="notice Content">${notice.content}</div>
</div>
<div class="text-center">
<button onclick="noticeManagement()">목록</button>
<button onclick="noticeUpdate(${notice.noticeNo})" >수정</button>
<button onclick="noticeDelete(${notice.noticeNo})" >삭제</button>
</div>

</body>
</html>
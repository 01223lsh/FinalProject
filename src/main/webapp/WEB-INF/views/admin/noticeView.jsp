<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.noticeView{
	margin: 2px 0;
		padding: 1px 3px;
		border-width: 2px;
		border-color: #aaa;
		border-style: solid;
		height: 500px;
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


</style>

</head>

<body>
<div class="noticeView">
<div style="height:20px;">
	<div class="noticeTitle" >${notice.title}</div>

	<div class="noticeDate" style="color :#ccc;">작성일자 : ${notice.date} | 작성자  : 관리자</div>
</div>


<hr>
<c:if test="${not empty notice.fileOrigin}">
	<a 
<%-- 	href="/admin/download?notice=${boardFile.fileNo }" --%>
	>${notice.fileOrigin }</a>
</c:if>
	<div class="notice Content">${notice.content}</div>
</div>
</body>
</html>
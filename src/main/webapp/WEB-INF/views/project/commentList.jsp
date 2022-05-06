<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

댓글
<hr>
<c:forEach var="comment" items="${commentList }">
<div>
<p>${comment.commentContent }</p>
<p>${comment.commentWriter }</p>
<p><fmt:formatDate value="${comment.commentDate }" pattern="yyyy.MM.dd"/></p>

</div>
</c:forEach>
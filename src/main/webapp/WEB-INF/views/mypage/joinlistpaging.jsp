<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${not empty param.search }">
<%-- 	<c:set var="searchParam" value="&search=${param.search }" /> --%>
	<c:set var="searchParam" value="&select=${param.select}&search=${param.search }" />
</c:if>

<%-- 	<c:set var="searchParam" value="&select=${paging.select }&search=${paging.search }" /> --%>


<div class="text-center">

	<ul class="pagination">
	
	
	<%-- 첫 페이지로 이동 --%>
	<c:if test="${paging.curPage != 1 }">
		<li><a href="/mypage/joinfunlist?curPage=1${searchParam}">&larr; 처음</a></li>
	</c:if>

	
	<%-- 이전 페이징 리스트로 이동 --%>
	<c:choose>
		<c:when test="${paging.startPage != 1 }">
			<li><a href="/mypage/joinfunlist?curPage=${paging.startPage - paging.pageCount }${searchParam}">&laquo;</a></li>
		</c:when>
		<c:when test="${paging.startPage == 1 }">
			<li class="disabled"><a>&laquo;</a></li>
		</c:when>
	</c:choose>


	<%-- 이전 페이지로 이동 --%>
	<c:if test="${paging.curPage > 1 }">
		<li><a href="/mypage/joinfunlist?curPage=${paging.curPage - 1 }${searchParam}" >&lt;</a></li>
	</c:if>


	<%-- 페이징 번호 리스트 --%> 
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
		<c:if test="${paging.curPage == i }">
			<li class="active"><a href="/mypage/joinfunlist?curPage=${i}${searachParam}"> ${i}</a></li>
		</c:if>
		<c:if test="${paging.curPage != i }">
			<li><a href="/mypage/joinfunlist?curPage=${i }${searchParam }">${i }</a></li>
		</c:if>
	</c:forEach>
	
	
	
	

	
	<%-- 다음 페이지로 이동 --%>
	<c:if test="${paging.curPage < paging.totalPage }">
		<li><a href="/mypage/joinfunlist?curPage=${paging.curPage + 1 }${searachParam}">&gt;</a></li>
	</c:if>
	
	
	<%-- 다음 페이징 리스트로 이동 --%>
	<c:choose>
		<c:when test="${paging.endPage != paging.totalPage }">
			<li><a href="/mypage/joinfunlist?curPage=${paging.startPage + paging.pageCount }${searachParam}">&raquo;</a></li>
		</c:when>
		<c:when test="${paging.endPage == paging.totalPage }">
			<li class="disabled"><a>&raquo;</a></li>
		</c:when>
	</c:choose>
	
	

	
	
	<%-- 마지막 페이지로 이동 --%>
	<c:if test="${paging.curPage != paging.totalPage }">
		<li><a href="/mypage/joinfunlist?curPage=${paging.totalPage }${searachParam}">끝</a></li>
	</c:if>
	
</ul>

</div>
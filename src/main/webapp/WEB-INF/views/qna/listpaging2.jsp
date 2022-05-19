<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

/*  div 사이즈 영역 안에서의 center */
.page{
  text-align: center;  
  width: 50%;}

.paginationmodel {
  list-style: none;
  display: inline-block;
  padding: 0;
  margin-top: 20px;}

.paginationmodel li {
  display: inline;
  text-align: center;}

/*  숫자들에 대한 스타일 지정 */
.paginationmodel a {
  float: left;
  display: block;
  font-size: 14px;
  text-decoration: none;
  padding: 5px 12px;
  color: #96a0ad;
  line-height: 1.5;
  font-size: 20px;
  }

.first{
  margin-right: 15px;}

.last{
  margin-left: 15px;}

.first:hover, .last:hover, .left:hover, .right:hover{
  color: #2e9cdf;}

.paginationmodel a.active {
  cursor: default;
  color: #ffffff;}

.paginationmodel a:active {
  outline: none;}

.modal .num {
  margin-left: 3px;
  padding: 0;
  width: 30px;
  height: 30px;
  line-height: 30px;
  -moz-border-radius: 100%;
  -webkit-border-radius: 100%;
  border-radius: 100%;;}

.modal .num:hover {
  background-color: #2e9cdf;
  color: #ffffff;}

.modal .num.active, .modal .num:active {
  background-color: #2e9cdf;
  cursor: pointer;}

.arrow-left {
  width: 0;
  height: 0;
  border-top: 10px solid transparent;
  border-bottom: 10px solid transparent;
  border-right:10px solid blue; }



</style>



<c:if test="${not empty param.search }">
<%-- 	<c:set var="searchParam" value="&search=${param.search }" /> --%>
	<c:set var="searchParam" value="&select=${param.select }&search=${param.search }" />
</c:if>

<%-- 	<c:set var="searchParam" value="&select=${paging.select }&search=${paging.search }" /> --%>


<div class="page">

	<ul class="paginationmodel">
	
	
	<%-- 첫 페이지로 이동 --%>
	<c:if test="${paging.curPage != 1 }">
		<li><a class="first" href="/qna/list?curPage=1${searchParam}">&larr; 처음</a></li>
	</c:if>

	
	<%-- 이전 페이징 리스트로 이동 --%>
	<c:choose>
		<c:when test="${paging.startPage != 1 }">
			<li><a class="arrow left" href="/qna/list?curPage=${paging.startPage - paging.pageCount }${searchParam}">&laquo;</a></li>
		</c:when>
		<c:when test="${paging.startPage == 1 }">
			<li class="disabled"><a class="arrow left">&laquo;</a></li>
		</c:when>
	</c:choose>


	<%-- 이전 페이지로 이동 --%>
	<c:if test="${paging.curPage > 1 }">
		<li><a href="/qna/list?curPage=${paging.curPage - 1 }${searchParam}" >&lt;</a></li>
	</c:if>


	<%-- 페이징 번호 리스트 --%> 
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
		<c:if test="${paging.curPage == i }">
			<li class="active"><a class="num" href="/qna/list?curPage=${i}${searachParam}"> ${i}</a></li>
		</c:if>
		<c:if test="${paging.curPage != i }">
			<li><a class="num" href="/qna/list?curPage=${i }${searchParam }">${i }</a></li>
		</c:if>
	</c:forEach>
	
	
	
	

	
	<%-- 다음 페이지로 이동 --%>
	<c:if test="${paging.curPage < paging.totalPage }">
		<li><a href="/qna/list?curPage=${paging.curPage + 1 }${searachParam}">&gt;</a></li>
	</c:if>
	
	
	<%-- 다음 페이징 리스트로 이동 --%>
	<c:choose>
		<c:when test="${paging.endPage != paging.totalPage }">
			<li><a class="arrow right" href="/qna/list?curPage=${paging.startPage + paging.pageCount }${searachParam}">&raquo;</a></li>
		</c:when>
		<c:when test="${paging.endPage == paging.totalPage }">
			<li class="disabled"><a class="arrow right">&raquo;</a></li>
		</c:when>
	</c:choose>
	
	<%-- 마지막 페이지로 이동 --%>
	<c:if test="${paging.curPage != paging.totalPage }">
		<li><a class="last" href="/qna/list?curPage=${paging.totalPage }${searachParam}">끝</a></li>
	</c:if>
	
</ul>

</div>
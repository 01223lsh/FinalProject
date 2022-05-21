<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style>

.right {
	font-family: 'IBM Plex Sans KR', sans-serif;
}

.num {

/* 	border: 1px solid black; */
/* 	border-radius: 20px; */
	margin-right: 5px;
	margin-left: 5px;

}

.arrow {

	margin-left: 2px;
	margin-right: 2px;
}


  .num :hover{
    font-size: 5em;
    animation: motion 0.3s /* 속도 */
               linear 0s   /* 처음부터 끝까지 일정 속도로 진행 */
               infinite alternate; /* 무한 반복 */
  }
  @keyframes motion {
	0% {margin-top: 0px;} /* 처음 위치 */
	100% {margin-top: 10px;} /* 마지막 위치 */
  }


.page {
	text-align: center;

}

.pagination {
    display: flex;
    padding-left: 0;
    list-style: none;
    justify-content: center;
}
</style>




<c:if test="${not empty param.search }">
<%-- 	<c:set var="searchParam" value="&search=${param.search }" /> --%>
	<c:set var="searchParam" value="&select=${param.select}&search=${param.search }" />
</c:if>

<%-- 	<c:set var="searchParam" value="&select=${paging.select }&search=${paging.search }" /> --%>


<div class="text-center page">

	<ul class="pagination">
	
	
	<%-- 첫 페이지로 이동 --%>
	<c:if test="${paging.curPage != 1 }">
<%-- 		<li><a href="/mypage/joinfunlist?curPage=1${searchParam}">&larr; 처음</a></li> --%>
		<li><a href="/qna/list?curPage=1${searchParam}">
				<img src="/resources/img/mypage/BSTART.png" alt="안나오네" width="40px;" height="40px;" class="arrow">
			</a>
		</li>
	</c:if>

	
	<%-- 이전 페이징 리스트로 이동 --%>
	<c:choose>
		<c:when test="${paging.startPage != 1 }">
<%-- 			<li><a href="/mypage/joinfunlist?curPage=${paging.startPage - paging.pageCount }${searchParam}">&laquo;</a></li> --%>
			<li><a href="/qna/list?curPage=${paging.startPage - paging.pageCount }${searchParam}">
					<img src="/resources/img/mypage/BLL.png" alt="안나오네" width="40px;" height="40px;" class="arrow">
				</a>
			</li>
		</c:when>
		<c:when test="${paging.startPage == 1 }">
<!-- 			<li class="disabled"><a>&laquo;</a></li> -->
			<li class="disabled">
				<a>
				<img src="/resources/img/mypage/BLL.png" alt="안나오네" width="40px;" height="40px;" class="arrow">
				</a>
			</li>
		</c:when>
	</c:choose>


	<%-- 이전 페이지로 이동 --%>
	<c:if test="${paging.curPage > 1 }">
<%-- 		<li><a href="/mypage/joinfunlist?curPage=${paging.curPage - 1 }${searchParam}" >&lt;</a></li> --%>
		<li>
			<a href="/qna/list?curPage=${paging.curPage - 1 }${searchParam}" >
				<img src="/resources/img/mypage/BL.png" alt="안나오네" width="40px;" height="40px;" class="arrow">
			</a>
		</li>
	</c:if>


	<%-- 페이징 번호 리스트 --%> 
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
		<c:if test="${paging.curPage == i }">
<%-- 			<li class="active"><a class="num" href="/mypage/joinfunlist?curPage=${i}${searachParam}"> ${i}</a></li> --%>
			<li class="active"><a class="num" href="/qna/list?curPage=${i}${searachParam}">
				<img src="/resources/img/mypage/smile.png" alt="안나오네" width="40px;" height="40px;">
	
				</a>
			</li>
		</c:if>
		<c:if test="${paging.curPage != i }">
<%-- 			<li><a class="num" href="/mypage/joinfunlist?curPage=${i }${searchParam }">${i }</a></li> --%>
			<li><a class="num" href="/qna/list?curPage=${i }${searchParam }">
				<img src="/resources/img/mypage/smile.png" alt="안나오네" width="40px;" height="40px;">
				</a>
			</li>
		</c:if>
	</c:forEach>
	
	
	
	

	
	<%-- 다음 페이지로 이동 --%>
	<c:if test="${paging.curPage < paging.totalPage }">
<%-- 		<li><a href="/mypage/joinfunlist?curPage=${paging.curPage + 1 }${searachParam}">&gt;</a></li> --%>
		<li><a href="/qna/list?curPage=${paging.curPage + 1 }${searachParam}">
				<img src="/resources/img/mypage/BR.png" alt="안나오네" width="40px;" height="40px;" class="arrow">
			</a>
		</li>
	</c:if>
	
	
	<%-- 다음 페이징 리스트로 이동 --%>
	<c:choose>
		<c:when test="${paging.endPage != paging.totalPage }">
<%-- 			<li><a href="/mypage/joinfunlist?curPage=${paging.startPage + paging.pageCount }${searachParam}">&raquo;</a></li> --%>
			<li><a href="/qna/list?curPage=${paging.startPage + paging.pageCount }${searachParam}">

				<img src="/resources/img/mypage/BRR.png" alt="안나오네" width="40px;" height="40px;" class="arrow">
				</a>
			</li>
		</c:when>
		<c:when test="${paging.endPage == paging.totalPage }">
<!-- 			<li class="disabled"><a>&raquo;</a></li> -->
			<li class="disabled"><a>
				<img src="/resources/img/mypage/BRR.png" alt="안나오네" width="40px;" height="40px;" class="arrow">
			
				</a>
			</li>
		</c:when>
	</c:choose>
	
	

	
	
	<%-- 마지막 페이지로 이동 --%>
	<c:if test="${paging.curPage != paging.totalPage }">
<%-- 		<li><a href="/mypage/joinfunlist?curPage=${paging.totalPage }${searachParam}">끝</a></li> --%>
		<li><a href="/qna/list?curPage=${paging.totalPage }${searachParam}">
				<img src="/resources/img/mypage/BLAST.png" alt="안나오네" width="40px;" height="40px;" class="arrow">
			</a>
		</li>
	</c:if>
	
</ul>

</div>
<div style="clear: both;"></div>
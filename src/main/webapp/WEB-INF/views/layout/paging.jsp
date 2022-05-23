<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<div class="text-center">
<!-- <nav aria-label="Page navigation example"> -->
<ul class="pagination">

<%-- 첫 페이지로 이동 --%> 
<c:if test="${paging.curPage ne 1}">
	<li class="page-item"><a class="pagingFirst page-link" 
	>처음</a></li>
</c:if>
	
	
<%-- 이전 페이징 리스트로 이동 --%>
<c:choose>
	<c:when test="${paging.curPage < 11}">
		<li class="disabled page-item"><a class="page-link">&laquo;</a></li>
	</c:when>

	<c:otherwise>
		<li  class="page-item">
			<a class="pagingBackAll page-link" 
			>
				&laquo;
			</a>
		</li>
	</c:otherwise>
</c:choose>
	
	<%-- 이전 페이지로 이동 --%>
<c:if test="${paging.curPage > 1 }">
	<li class="page-item">
		<a  class="pagingBack page-link"  
		>
			&lt; 
		</a>
	</li>
</c:if>
	

<%-- 페이징 번호 리스트 --%>
<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
	<c:choose>
		<c:when test="${paging.curPage eq i}">
			<li class="active" page-item">
				<a class="paging${i} page-link"
				 >
					${i }
				</a>
			</li>
		</c:when>
		<c:otherwise>
			<li>
				<a class="paging${i} page-link" 
				>
					${i }
				</a>
			</li>
		</c:otherwise>
	</c:choose>
</c:forEach>
	
<%-- 다음 페이지로 이동 --%>
<c:if test="${paging.curPage < paging.totalPage }">
	<li>
		<a class="pagingGo page-link"  
		>
			&gt; 
		</a>
	</li>
</c:if>
	
<%-- 다음 페이징 리스트로 이동 --%>
<c:choose>
   <c:when test="${paging.endPage eq paging.totalPage }">
      <li class="disabled"><a class="page-link">&raquo;</a></li>
   </c:when>
   
   <c:otherwise>
      <li>
         <a class="pagingGoAll page-link" 
         >
            &raquo;
         </a>
      </li>
   </c:otherwise>
</c:choose>
	
<%-- 마지막 페이지로 이동 --%>
<c:if test="${paging.curPage ne paging.totalPage }">
	<li><a class="pagingLast page-link" 
	>
		끝
	</a>
	</li>
</c:if>
	
</ul>
<!-- </nav> -->
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<div class="text-center">

<ul class="pagination">

<%-- 첫 페이지로 이동 --%> 
<c:if test="${paging.curPage ne 1}">
	<li><a class="pagingFirst">처음</a></li>
</c:if>
	
	
<%-- 이전 페이징 리스트로 이동 --%>
<c:choose>
	<c:when test="${paging.curPage < 11}">
		<li class="disabled"><a>&laquo;</a></li>
	</c:when>

	<c:otherwise>
		<li>
			<a class="pagingBackAll" >
				&laquo;
			</a>
		</li>
	</c:otherwise>
</c:choose>
	
	<%-- 이전 페이지로 이동 --%>
<c:if test="${paging.curPage > 1 }">
	<li>
		<a  class="pagingBack" 	>
			&lt; 
		</a>
	</li>
</c:if>
	

<%-- 페이징 번호 리스트 --%>
<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
	<c:choose>
		<c:when test="${paging.curPage eq i}">
			<li class="active">
				<a class="paging${i}" >
					${i }
				</a>
			</li>
		</c:when>
		<c:otherwise>
			<li>
				<a class="paging${i}" >
					${i }
				</a>
			</li>
		</c:otherwise>
	</c:choose>
</c:forEach>
	
<%-- 다음 페이지로 이동 --%>
<c:if test="${paging.curPage < paging.totalPage }">
	<li>
		<a class="pagingGo">
			&gt; 
		</a>
	</li>
</c:if>
	
<%-- 다음 페이징 리스트로 이동 --%>
<c:choose>
   <c:when test="${paging.endPage eq paging.totalPage }">
      <li class="disabled"><a>&raquo;</a></li>
   </c:when>
   
   <c:otherwise>
      <li>
         <a class="pagingGoAll">
            &raquo;
         </a>
      </li>
   </c:otherwise>
</c:choose>
	
<%-- 마지막 페이지로 이동 --%>
<c:if test="${paging.curPage ne paging.totalPage }">
	<li><a class="pagingLast" >
		끝
	</a>
	</li>
</c:if>
	
</ul>

</div>
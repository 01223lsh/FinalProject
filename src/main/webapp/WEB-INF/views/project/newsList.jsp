<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script type="text/javascript">


function news(no){
$.ajax({
	url:"/project/news/view",
	type:"post",
	data:{newsNo:no},
	dataType: "html",
	success:function(res){
		console.log("성공")
		
		$("#content3_1").html(res);
	},
	error:function(){
		console.log("통신실패");
	}
})
}



		
		$("#newsWrite").on("click",function(){
			
			$.ajax({
				url:"/project/news/write",
				type:"get",
				data:{projectNo:${project.projectNo}},
				dataType: "html",
				success:function(res){
					console.log("성공")
					
        			$("#content3_1").html(res);
				},
				error:function(){
        			console.log("통신실패");
        		}
			})
			
		})
		

	</script>
	
<style>
#news1 a {
	text-decoration: none;
	color: black;
	cursor: pointer;
	}

#newsWrite{
	float: right;
}

</style>

<div id="news1">
<b>- 최근소식</b>
<c:choose>
		<c:when test="${project.projectStep eq 3}">
		<button id="newsWrite" class="btn btn-primary">작성하기</button>
		</c:when>
		<c:when test="${project.projectStep eq 4 }">
		
		</c:when>
	</c:choose>

<br>
<hr>

<c:forEach var="news" items="${newsList }">
<a class="newsContent" onclick="news(${news.newsNo})">

<div>
<b>${news.newsTitle }</b>
<br>
<small><fmt:formatDate value="${news.newsDate }" pattern="yyyy.MM.dd"/></small>
</div>

</a>
<hr>
</c:forEach>

</div>


<br><br><br><br><br><br>
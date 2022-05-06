<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">

	$(document).ready(function() {
		var newsNo = "";
		$(".newsContent").on("click",function(){
			var newsNo = $(this).attr('value');
			console.log(newsNo)
		
			
			$.ajax({
				url:"/project/news/view",
				type:"post",
				data:{newsNo:newsNo},
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
	})
	</script>


<div id="news1">
최근소식
<hr>
<c:forEach var="news" items="${newsList }">
<a href="#" class="newsContent" value="${news.newsNo }">
<div>
<p>${news.newsTitle }</p>
<p><fmt:formatDate value="${news.newsDate }" pattern="yyyy.MM.dd"/></p>
</div>
</a>
</c:forEach>
</div>
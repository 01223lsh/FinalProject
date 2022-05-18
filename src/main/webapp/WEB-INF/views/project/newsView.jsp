<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#newsDelete").on("click",function(){
		
		$.ajax({
			url:"/project/news/delete",
			type:"post",
			data:{newsNo:${news.newsNo}, projectNo:${news.projectNo}},
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

<div>
<b>${news.newsTitle }</b>
<button id="newsDelete" style="float: right;" class="btn btn-danger">삭제</button>
<br>
<small><fmt:formatDate value="${news.newsDate }" pattern="yyyy.MM.dd"/></small>
<br>
<hr>
<div>
${news.newsContent }
</div>
</div>
<br><br><br><br><br><br><br>
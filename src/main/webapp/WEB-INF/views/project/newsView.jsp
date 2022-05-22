<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	$("#newsUpdate").on("click",function(){
		
		$.ajax({
			url:"/project/news/update",
			type:"get",
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

function newsList(no){
			
			$.ajax({
				url:"/project/news/list",
				type:"post",
				data:{projectNo:no},
				dataType: "html",
				success:function(res){
					console.log("성공")
					
					$("#news").css("color", "#A2D5AB");
        			$("#story").css("color", "gray");
        			$("#plan").css("color", "gray");
        			$("#comment").css("color", "gray");
        			$("#contributors").css("color", "gray");
        			$("#content3_1").html(res);
				},
				error:function(){
        			console.log("통신실패");
        		}
			})
		}
</script>

<div>
<b>${news.newsTitle }</b>
<c:choose>
		<c:when test="${project.projectStep eq 3 and project.memberNo eq memberNo}">
		<div style="float: right;">
		<button id="newsUpdate"  class="btn btn-primary" style="background-color: #A2D5AB; border: none; ">수정</button>
		<button id="newsDelete"  class="btn btn-danger" >삭제</button>
		</div>
		</c:when>
		<c:otherwise>
		
		</c:otherwise>
	</c:choose>

<br>
<small><fmt:formatDate value="${news.newsDate }" pattern="yyyy.MM.dd"/></small>
<br>
<hr>
<div style="overflow: hidden;">
${news.newsContent }
</div>
<div style="text-align: center; margin: 15px 0px 10px;">
	<button type="button" class="btn btn-primary" style="width: 106px; height: 41px; background-color: #39AEA9; border: none;" onclick="newsList(${news.projectNo})">목록</button>
</div>
</div>
<br><br><br><br><br><br><br>
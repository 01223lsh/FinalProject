<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">


	
	$("#commentBtn").click(function(){
		
		var comFrom = $("#commentForm").serialize();
		console.log(comFrom);
		
		$.ajax({
			url:"/project/comment/write",
			type:"post",
			data:comFrom,
			datatype:"html",
			success:function(res){
				console.log("성공")
				$("#content3_1").html(res);
			},
			error:function(){
    			console.log("통신실패");
    		}
		})
		
	})
	
		function commentDelete(no){
		

		console.log(no)
		
		$.ajax({
			url:"/project/comment/delete" ,
			type:"post",
			data:{commentNo:no, projectNo:${projectNo}},
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
	

</script>
<style>
#delBtn {
	text-decoration: none;
	color: black;
	cursor: pointer;
	}


</style>
<div>

<b>- 댓글</b>
<br>
<br>

<form id="commentForm">
<input type="hidden" name="projectNo" value="${projectNo }">
<table>
	<tr>
		<td><textarea id="commentContent" name="commentContent" style="width: 500px; height: 80px;"></textarea></td>
		<td><button id="commentBtn" type="button" class="btn btn-primary" style="vertical-align: middle;">작성</button></td>
	</tr>
</table>



</form>
</div>
<hr>
<c:forEach var="comment" items="${commentList }">
<div>
<b>${comment.commentWriter }</b>&nbsp;
<small><fmt:formatDate value="${comment.commentDate }" pattern="yyyy.MM.dd"/></small>
<a id="delBtn" onclick="commentDelete(${comment.commentNo})" style="float: right;">삭제</a>
<br><br>
<p>${comment.commentContent }</p>



</div>
<hr>
</c:forEach>
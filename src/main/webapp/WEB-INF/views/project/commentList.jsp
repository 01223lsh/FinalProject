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
			data:{commentNo:no, projectNo:${project.projectNo}},
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
<div style="height: 180px;">

<b>- 댓글</b><br><br>

					
<form id="commentForm">
<input type="hidden" name="projectNo" value="${project.projectNo }">

<input type="hidden" name="commentWriter" value="${nick }">
<input type="hidden" name="memberNo" value="${memberNo }">

		<textarea id="commentContent" name="commentContent" style="width: 600px; height: 80px; resize: none;"></textarea>
		


		<c:choose>
					<c:when test="${project.projectStep eq 3 and login eq true}">
					<button id="commentBtn" type="button" class="btn btn-primary" style="float: right; width: 106px; height: 41px; background-color: #39AEA9; border: none; ">작성</button>
					</c:when>
					<c:when test="${empty login and project.projectStep eq 3}">
						<button id="modalbtn" type="button" class="btn btn-primary" style="float: right; width: 106px; height: 41px; background-color: #39AEA9; border: none;" onclick="loginModal()">작성</button>
					</c:when>
					<c:otherwise>
					<button type="button" class="btn btn-primary" style="float: right;  width: 106px; height: 41px; background-color: #39AEA9; border: none;" disabled="disabled">작성</button>
					</c:otherwise>
					</c:choose>
	
</form>
</div>


<hr>
<c:forEach var="comment" items="${commentList }">
<div>
<b>${comment.commentWriter }</b>&nbsp;
<small><fmt:formatDate value="${comment.commentDate }" pattern="yyyy.MM.dd"/></small>

<c:if test="${memberNo eq comment.memberNo }">
<a id="delBtn" onclick="commentDelete(${comment.commentNo})" style="float: right;">삭제</a>
</c:if>

<br><br>
<p>${comment.commentContent }</p>



</div>
<hr>
</c:forEach>


<br><br><br><br><br><br><br><br>
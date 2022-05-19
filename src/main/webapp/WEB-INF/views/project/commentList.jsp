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

function loginModal(){
	$(".modal").fadeIn();
}

	$("#modalcancel").click(function(){
		$(".modal").fadeOut();
	})

	

</script>
<style>
#delBtn {
	text-decoration: none;
	color: black;
	cursor: pointer;
	}
	
.modal{
	position: absolute;
	width: 100%; height: 130%;
	background: rgba(0,0,0,0.8);
	top:0; left: 0;
	display: none;
}

.modal_content{
  width:400px; height:200px;
  background:#fff; border-radius:10px;
  position:relative; top:50%; left:50%;
  margin-top:-100px; margin-left:-200px;
  text-align:center;
  box-sizing:border-box; padding:74px 0;
  line-height:23px; 
}


</style>
<div>

<b>- 댓글</b>
<br>
<br>
					
<form id="commentForm">
<input type="hidden" name="projectNo" value="${project.projectNo }">
<input type="hidden" name="commentWriter" value="${nick }">
<table>
	<tr>
		<td><textarea id="commentContent" name="commentContent" style="width: 500px; height: 80px;"></textarea></td>
		<td>
		<c:choose>
					<c:when test="${project.projectStep eq 3 and login eq true}">
					<button id="commentBtn" type="button" class="btn btn-primary" style="vertical-align: middle;">작성</button>
					</c:when>
					<c:when test="${empty login }">
						<button id="modalbtn" type="button" class="btn btn-primary" style="vertical-align: middle;" onclick="loginModal()">작성</button>
					</c:when>
					<c:when test="${project.projectStep eq 4 }">
					</c:when>
					</c:choose>
		</td>
	</tr>
</table>



</form>
</div>
<div class="modal">

	<div class="modal_content">
		<p>로그인이 필요합니다</p>
		<p>로그인페이지로 이동하시겠습니까?</p>
		<hr>
		<a id="modalcancel" type="button">취소</a>
		<a type="button" type="button" href="/login">로그인</a>
	</div>
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
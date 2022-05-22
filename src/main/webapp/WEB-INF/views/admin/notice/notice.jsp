<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" /> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> -->


<script type="text/javascript">

function noticeWrite(){
	$.ajax({
		type : "get"
		,url : "/admin/notice/noticeWrite"
		,dataType  :"html"
		,success : function(res){
			$("#resultLayout").html(res)
		}
		,error : function(){
			console.log("notice write error")
		}
	})
}

var endNo=${paging.endNo/10};
var startPage=${paging.startPage};
var endPage = ${paging.endPage};
var str = "notice";
$(document).ready(function(){
	for(var i = startPage; i <= endPage; i++){
		(function(i){
			$(".paging"+i).click(function(){	
				$.ajax({
					type : "get"
					,url : "/layout/paging2"
					,data : "curPage="+i+"&str="+str
					,dataType : "html"
					,success : function(res){
						console.log("성공");
						$("#resultLayout").html(res)
					},
					error : function(){
						console.log("실패");
					}
				});
			});
		})(i);
	}
	$(".pagingFirst").click(function(){	
		$.ajax({
			type : "get"
			,url : "/layout/paging"
			,data : "curPage="+1+"&str="+str
			,dataType : "html"
			,success : function(res){
				console.log("성공");
				$("#resultLayout").html(res)
			},
			error : function(){
				console.log("실패");
			}
		});
	});
	$(".pagingBackAll").click(function(){
		$.ajax({
			type : "get"
			,url : "/layout/paging"
			,data : "curPage="+ ${paging.startPage - paging.pageCount }+"&str="+str
			,success : function(res){
				console.log("성공");
				$("#resultLayout").html(res)
			},
			error : function(){
				console.log("실패");
			}
		});
	});
	
	$(".pagingGoAll").click(function(){	
		$.ajax({
			type : "get"
			,url : "/layout/paging"
			,data : "curPage="+${paging.startPage + paging.pageCount }+"&str="+str
			,dataType : "html"
			,success : function(res){
				console.log("성공");
				$("#resultLayout").html(res)
			},
			error : function(){
				console.log("실패");
			}
		});
	});
	$(".pagingGo").click(function(){	
		$.ajax({
			type : "get"
			,url : "/layout/paging"
			,data : "curPage="+${paging.curPage + 1 }+"&str="+str
			,dataType : "html"
			,success : function(res){
				console.log("성공");
				$("#resultLayout").html(res)
			},
			error : function(){
				console.log("실패");
			}
		});
	});
	$(".pagingBack").click(function(){	
		$.ajax({
			type : "get"
			,url : "/layout/paging"
			,data : "curPage="+${paging.curPage - 1 } +"&str="+str
			,dataType : "html"
			,success : function(res){
				console.log("성공");
				$("#resultLayout").html(res)
			},
			error : function(){
				console.log("실패");
			}
		});
	});
	$(".pagingLast").click(function(){
		$.ajax({
			type : "get"
			,url : "/layout/paging"
			,data : "curPage="+${paging.totalPage}+"&str="+str
			,dataType : "html"
			,success : function(res){
				console.log("성공");
				$("#resultLayout").html(res)
			},
			error : function(){
				console.log("실패");
			}
		});
	});
	
	
})

</script>
<style type="text/css">
th{
	text-align: center;
}
th, td {
	border-bottom: 1px #DDD solid;
}
td {
	height: 40px;
}
button{   
    background: #527578;
    border: 1px solid #527578;
    color: white;
    border-radius: 5px;}

</style>
</head>
<body>
<br><br><br><br>

<h3 style="text-align: center;" >공지사항</h3>
<hr>
<div style="width: 1070px; margin:0 auto;">
<table style="margin: auto; width: 100%;  border-radius: 10px;  margin-bottom: 20px; background-color: white;">
<tr style="border-bottom: 2px #DDD solid;">
	<th style="width: 5%;">글번호</th>
	<th style="width: 45%">제목</th>
	<th style="width: 10%">작성자</th>
	<th style="width: 10%">작성일</th>
	
</tr>
<c:forEach items="${list}" var="i">
<tr class="noticeView trcss"  onclick="noticeView(${i.noticeNo})">
	<td>${i.noticeNo }</td>
	<td>${i.title }
	<input type="hidden" class="noticeNo" value="${i.noticeNo }"> 
	</td>
	<td>관리자</td>
	<td><fmt:formatDate value="${i.regDate}" pattern="yy-MM-dd" /></td>
	
</tr>

</c:forEach>


</table>
<button onclick="noticeWrite()">작성</button>
</div>

</body>
</html>
<%@ include file="../../../layout/paging.jsp" %>
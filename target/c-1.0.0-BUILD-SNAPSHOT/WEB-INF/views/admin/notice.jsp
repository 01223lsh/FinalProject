<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


<script type="text/javascript">
function noticeView(noticeNo){
	$.ajax({
		type : "post"
		,url : "/admin/noticeView"
		,data : "noticeNo="+noticeNo
		,dataType  :"html"
		,success : function(res){
			console.log("notice view success");
			$("#resultLayout").html(res)
		}
		,error : function(){
			console.log("notice view error")
		}
	})
}
function noticeWrite(){
	$.ajax({
		type : "get"
		,url : "/admin/noticeWrite"
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
var cnt = ${cnt};
var str = "notice";
$(document).ready(function(){
	for(var i = startPage; i <= endPage; i++){
		(function(i){
			$(".paging"+i).click(function(){	
				$.ajax({
					type : "get"
					,url : "/layout/paging"
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
</head>
<body>
<h3>공지사항</h3>
<hr>

<table class="table table-striped table-hover table-condensed">
<tr>
	<th>번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>작성일자</th>
	
</tr>
<c:forEach items="${list}" var="i">
<tr>
	<td>${i.noticeNo }</td>
	<td><a onclick="noticeView(${i.noticeNo})">${i.title }</a></td>
	<td>관리자</td>
	<td>${i.date}</td>
	
</tr>

</c:forEach>


</table>
<button onclick="noticeWrite()">작성</button>
</body>
</html>
<%@ include file="../../layout/paging.jsp" %>
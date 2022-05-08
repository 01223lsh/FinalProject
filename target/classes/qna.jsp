 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function complete(No){
	$.ajax({
		type : "post"
		,url : "/admin/qna"
		,data : "complete="+No
		,dataType :"html"
		,success : function(res){
			$("#resultLayout").html(res)
		}
		,error : function(){
			console.log("qna view error")
		}
	})
	
}
function qnaView(qnaNo){
	console.log(qnaNo);
	$.ajax({
		type : "post"
		,url : "/admin/qnaView?qnaNo="+qnaNo
		,dataType :"html"
		,success : function(res){
			$("#resultLayout").html(res)
		}
		,error : function(){
			console.log("qna view error")
		}
	})
}

var endNo=${paging.endNo/10};
var startPage=${paging.startPage};
var endPage = ${paging.endPage};
var cnt = ${paging.totalCount };
var str = "qna";

$(document).ready(function(){
// 	$("#qnaSearch").click(function(){
		
	
// 		var search = $("#search").val();
// 		console.log(search)
// 		$.ajax({
// 			type : "post"
// 			,url : "/admin/qna"
// 			,data : "search="+search
// 			,dataType :"html"
// 			,success : function(res){
// 				qnaManagement(search);
// 			}
// 			,error : function(){
// 				console.log("qna view error")
// 			}
// 		})
// 	})
	
	for(var i = startPage; i <= endPage; i++){
		(function(i){
			$(".paging"+i).click(function(){	
				$.ajax({
					type : "get"
					,url : "/layout/qnapaging"
					,data :{curPage:i,str:str,complete:${complete}}
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
			,url : "/layout/qnapaging"
			,data : "curPage="+1+"&str="+str+"&complete="+${complete}
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
			,url : "/layout/qnapaging"
			,data : "curPage="+ ${paging.startPage - paging.pageCount }+"&str="+str+"&complete="+${complete}
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
			,url : "/layout/qnapaging"
			,data : "curPage="+${paging.startPage + paging.pageCount }+"&str="+str+"&complete="+${complete}
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
			,url : "/layout/qnapaging"
			,data : "curPage="+${paging.curPage + 1 }+"&str="+str+"&complete="+${complete}
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
			,url : "/layout/qnapaging"
			,data : "curPage="+${paging.curPage - 1 } +"&str="+str+"&complete="+${complete}
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
			,url : "/layout/qnapaging"
			,data : "curPage="+${paging.totalPage}+"&str="+str+"&complete="+${complete}
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
<style>
th{
	text-align: center;
}
th, td {
	border-bottom: 1px #DDD solid;
}
td {
	height: 40px;
}
#unchecked {
    float: left;
    width:33%;
    box-sizing: border-box;
}
#checked{
    float: left;
    width:33%;
    box-sizing: border-box;
}


#checkedAll{
	float: right;
    width: 33%;
    box-sizing: border-box;

}

#center{
	margin:0 auto; 
}

</style>
</head>
<body>





<div class="container">

<div id="qnalist" style="text-align: center;" >

<h1>고객센터 목록페이지</h1>
<hr>
<div class="row container py-3 text-center0" id="center">
	<div class="col text-center" id="unchecked">
		<a onclick="complete(1)"><i class="fa-regular fa-circle-check fa-5x"></i></a>
		<br>
		<span>미답변</span>
	</div>
	<div class="col text-center" id="checked">
		<a onclick="complete(2)"><i class="fa-solid fa-circle-check fa-5x"></i></a>
		<br>
		<span>답변 완료</span>
	</div>
	<div class="col text-center" id="checkedAll">
		<a onclick="complete(3)"><i class="fa-solid fa-list fa-5x"></i></a>
		<br>
		<span>전체</span>
	</div>
</div>
<br>
<table style="margin: auto; width: 100%;  border-radius: 10px;" >

	<tr style="border-bottom: 2px #DDD solid;">
		<th style="width: 5%;">글번호</th>
		<th style="width: 45%">제목</th>
		<th style="width: 10%">작성자</th>
<!-- 		<th style="width: 5%">조회수</th> -->
		<th style="width: 10%">작성일</th>
	</tr>
	
	
	<c:forEach items="${list }" var="qna">
	<tr style=" height: 20px;">
		<td >${qna.qnaNo} </td>
		<td style="text-align: left;"><a onclick="qnaView(${qna.qnaNo })" style="text-decoration: none;">
		<c:if test="${qna.qnaStep>0}">
		<c:forEach begin="0" end="${qna.qnaStep}" >
		&nbsp;&nbsp;
		</c:forEach>
		</c:if>
		${qna.qnaTitle }</a>
		<c:if test="${qna.qnaStep eq 0}">
		<i class="fa-solid fa-volume-off"></i>
			${qna.qnaRefer}
		</c:if>
		</td>
		<td>${qna.nick } </td>
<%-- 		<td>${qna.hit } </td> --%>
		<td><fmt:formatDate value="${qna.qnaCreateDate }" pattern="yy-MM-dd HH:mm:ss"/>  </td>
	</tr>	
	</c:forEach>

</table><br>

<div><!-- searchform -->


<div>

<%-- 	<input type="text" name="search" id="search" placeholder="검색어를 입력하세요"  value="${param.search}" /> --%>
<!-- 	<button id="qnaSearch">검색</button> -->

</div>


</div><!-- searchform -->


<span class="pull-right"> 게시글 수 : ${paging.totalCount }</span>

</div><!-- main -->
</div><!-- container -->


</body>
</html>
<%@ include file="../../layout/qnapaging.jsp" %>
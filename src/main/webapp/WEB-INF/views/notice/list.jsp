<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>Insert title here</title> -->
<!-- <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" /> -->
<!-- <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> --> 
<!-- <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> --> 
<!-- <script src="https://code.jquery.com/jquery-3.6.0.js"></script> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">  -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->


<script type="text/javascript">

function noticeManagement(){
	$.ajax({
		type : "get"
		,url : "/notice/list"
		,data : "str=notice"
		,dataType : "html"
		,success : function(res){
			console.log("공지사항 뷰 성공"),
			$("#resultLayout").html(res)
			
		}
		,error : function(){
			console.log("공지사항 뷰 실패")
		}
	})
}

function noticeView(noticeNo){
	$.ajax({
		type : "post"
		,url : "/notice/view"
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
						location.href="/notice/list?curPage="+i
// 						$("#resultLayout").html(res)
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
.pagination{
	justify-content: center
}
</style>

</head>
<body>
<div  id="resultLayout">
<h3 style="text-align: center;">공지사항</h3>
<hr>

<div style="width: 1070px; margin:0 auto;">
<table style="margin: auto; width: 100%;  border-radius: 10px;  margin-bottom: 20px;">
<tr style="border-bottom: 2px #DDD solid;">
	<th style="width: 5%;">글번호</th>
	<th style="width: 30%">제목</th>
	<th style="width: 10%">작성자</th>
	<th style="width: 10%">작성일</th>
	
</tr>
<c:forEach items="${list}" var="i">
<tr>
	<td style="text-align: center;">${i.noticeNo }</td>
	<td style="width: 30%; text-align: center; "><a onclick="noticeView(${i.noticeNo})">${i.title }</a></td>
	<td style="width: 10%; text-align: center;">관리자</td>
	<fmt:formatDate value = "${i.regDate }" pattern = "yyyy-MM-dd HH:mm:ss" var = "noticeDateView"/>
	<td style="width: 10%; text-align: center;">${noticeDateView}</td>
	
</tr>
</c:forEach>
</div>


</table>
</div>
<%@ include file="../layout/paging.jsp" %>
<%@ include file="../layout/footer.jsp" %>
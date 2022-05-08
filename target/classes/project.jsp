<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
var projectStep =${step};
function categorya(categoryNo){
	console.log(categoryNo)	
	$.ajax({
		type : "post"
		,url : "/admin/project"
		,data : "categoryNo="+categoryNo+"&projectStep="+projectStep
		,dataType : "html"
		,success : function(res){
			$("#resultLayout").html(res)
		},error : function(){
			console.log("프로젝트 카테고리 error");
		}
	})
}
function step(stepe){
	$.ajax({
		type : "post"
		,url : "/admin/project" 
		,data : "projectStep="+stepe
		,datdType :"html"
		,success : function(res){
			console.log("등급별로");
			$("#resultLayout").html(res)
		}
		,error : function(res){
			console.log("오류")
		}
	})

}

var category=${categoryNo};
var endNo=${paging.endNo/10};
var startPage=${paging.startPage};
var endPage = ${paging.endPage};
var cnt = ${cnt};
var str = "project";

$(document).ready(function(){
	for(var i = startPage; i <= endPage; i++){
		(function(i){
			$(".paging"+i).click(function(){	
				$.ajax({
					type : "get"
					,url : "/layout/projectpaging"
					,data : "curPage="+i+"&projectStep="+projectStep+"&categoryNo="+category
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
			,url : "/layout/projectpaging"
			,data : "curPage="+1+"&projectStep="+projectStep+"&categoryNo="+category
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
			,url : "/layout/projectpaging"
			,data : "curPage="+ ${paging.startPage - paging.pageCount }+"&projectStep="+projectStep+"&categoryNo="+category
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
			,url : "/layout/projectpaging"
			,data : "curPage="+${paging.startPage + paging.pageCount }+"&projectStep="+projectStep+"&categoryNo="+category
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
			,url : "/layout/projectpaging"
			,data : "curPage="+${paging.curPage + 1 }+"&projectStep="+projectStep+"&categoryNo="+category
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
			,url : "/layout/projectpaging"
			,data : "curPage="+${paging.curPage - 1 }+"&projectStep="+projectStep+"&categoryNo="+category
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
			,url : "/layout/projectpaging"
			,data : "curPage="+${paging.totalPage}+"&projectStep="+projectStep+"&categoryNo="+category
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
#ing {
    float: left;
    width:33%;
    box-sizing: border-box;
}
#end {
    float: left;
    width:33%;
    box-sizing: border-box;
}


#All{
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
<div class="row container py-3 text-center0" id="center">
	<div class="col text-center" id="ing">
		<a onclick="step(3)"><i class="fa-regular fa-circle-check fa-5x"></i></a>
		<br>
		<span>진행중인 펀딩</span>
	</div>
	<div class="col text-center" id="end">
		<a onclick="step(4)"><i class="fa-solid fa-sack-xmark fa-5x"></i></a>
		<br>
		<span>종료된 펀딩</span>
	</div>
	<div class="col text-center" id="All">
		<a onclick="step(5)"><i class="fa-solid fa-scale-balanced fa-5x"></i></a>
		<br>
		<span>전체</span>
	</div>
	
</div>
<div>

<c:forEach items="${catelist }" var="c">
<a onclick="categorya(${c.categoryNo})">${c.categoryName}</a>
</c:forEach>

</div>
<hr>
<table class="table table-striped table-hover table-condensed">
<tr>
	<th>No</th>
	<th>프로젝트 이름</th>
	<th>펀딩률</th>
	<th>진행 단계</th>
	<th>카테고리</th>
</tr>

	<c:forEach items="${project }" var="i">
	<tr>
	<td>${i.projectNo }</td>
	<td>${i.projectTitle}</td>
	<fmt:parseNumber var="percent" value="${i.fundPrice/i.projectPrice*100}" integerOnly="true" />
	<td>${percent}%</td>
	<td><c:choose>
	<c:when test="${i.projectStep eq '3'}">진행중</c:when>
	<c:when test="${i.projectStep eq '4'}">펀딩 종료</c:when>
	</c:choose></td>
	<td><c:choose>
	<c:when test="${i.categoryNo eq '1'}">홈·리빙</c:when>
	<c:when test="${i.categoryNo eq '2'}">테크·가전</c:when>
	<c:when test="${i.categoryNo eq '3'}">향수·뷰티</c:when>
	<c:when test="${i.categoryNo eq '4'}">잡화</c:when>
	<c:when test="${i.categoryNo eq '5'}">의류</c:when>
	<c:when test="${i.categoryNo eq '6'}">디자인·예술</c:when>
	<c:when test="${i.categoryNo eq '7'}">푸드</c:when>
	<c:when test="${i.categoryNo eq '8'}">반려동물</c:when>
	</c:choose> </td>
	</tr>
	</c:forEach>


</table>

</body>
</html>
<%@ include file="../../layout/paging.jsp" %>
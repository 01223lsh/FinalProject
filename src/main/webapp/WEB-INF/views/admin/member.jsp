<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


<script type="text/javascript"> 

var str = "member";
function grade(grade){
	
	$.ajax({
		type : "post"
		,url : "/admin/member" 
		,data : "grade="+grade
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

var endNo=${paging.endNo/10};
var startPage=${paging.startPage};
var endPage = ${paging.endPage};
var cnt = ${cnt};

var gradep = ${membergrade};




$(document).ready(function(){
	
	$("#memberSearch").click(function(){
		var category = $("#memberCategory").val();
		var content = $("#memberContent").val();	
		$.ajax({
			type : "post"
			,url : "/admin/member" 
			,data : "category="+category+"&content="+content+"&grade=4"
			,dataType : "html"
			,success : function(res){
				console.log("검색 가능");
				$("#resultLayout").html(res);
			}
			,error : function(){
				console.log("검색 오류");
			}
			
		})
var con = ${con};
var cat = ${cat};
		
		$.ajax({
			type : "post"
			,url : "/layout/paging"
			,data : "str="+str+"&content"+content+"&grade="+gradep+"&content="+con+"&category="+cat
			,dataType :"html"
			,seccess : function(res){
				$("#resultLayout").html(res)
			}
			,error : function(){
				console.log("검색페이지 망할")
			}
			
		})
	})
	
	for(var i = startPage; i <= endPage; i++){
		(function(i){
			$(".paging"+i).click(function(){			
				$.ajax({
					type : "get"
					,url : "/layout/paging"
					,data : "curPage="+i+"&str="+str+"&grade="+gradep+"&content="+con+"&category="+cat
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
			,data : "curPage="+1+"&str="+str+"&grade="+gradep+"&content="+con+"&category="+cat
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
			,data : "curPage="+ ${paging.startPage - paging.pageCount }+"&str="+str+"&grade="+gradep+"&content="+con+"&category="+cat
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
			,data : "curPage="+${paging.startPage + paging.pageCount }+"&str="+str+"&grade="+gradep+"&content="+con+"&category="+cat
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
			,data : "curPage="+${paging.curPage + 1 }+"&str="+str+"&grade="+gradep+"&content="+con+"&category="+cat
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
			,data : "curPage="+${paging.curPage - 1 } +"&str="+str+"&grade="+gradep+"&content="+con+"&category="+cat
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
			,data : "curPage="+${paging.totalPage}+"&str="+str+"&grade="+gradep+"&content="+con+"&category="+cat
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
#General {
    float: left;
    width:20%;
    box-sizing: border-box;
}

#Entrepreneur{
    float: left;
    width:20%;
    box-sizing: border-box;
}

#Manager{
    float: left;
    width: 20%;
    box-sizing: border-box;
}
#All{
	float: right;
    width: 20%;
    box-sizing: border-box;

}
#Disabled{
	float: right;
    width: 20%;
    box-sizing: border-box;

}
#center{
	margin:0 auto; 
}
</style>
</head>
<body>



<div class="row container py-3 text-center0" id="center">
	<div class="col text-center" id="General">
	
	
		<a onclick="grade(0)"><i class="fa-solid fa-user fa-5x"></i></a>
		<br>
		<span>일반유저</span>
	</div>
	<div class="col text-center" id="Entrepreneur">
		<a onclick="grade(1)"><i class="fa-solid fa-suitcase fa-5x"></i></a>
		<br>
		<span>사업자</span>
	</div>
	<div class="col text-center" id="Manager">
		<a onclick="grade(2)"><i class="fa-solid fa-clipboard-user fa-5x"></i></a>
		<br>
		<span>관리자</span>
	</div>
	<div class="col text-center" id="All">
		<a onclick="grade(4)"><i class="fa-solid fa-users fa-5x"></i></a>
		<br>
		<span>전체</span>
	</div>
	<div class="col text-center" id="Disabled">
		<a onclick="grade(3)"><i class="fa-solid fa-user-ninja fa-5x"></i></a>
		<br>
		<span>비활성화</span>
	</div>
</div>


<h3>회원 관리</h3>
<hr>

<select id="memberCategory">
	<option value="id">아이디</option>
	<option value="nick">닉네임</option>
	<option value="name">이름</option>
	<option value="email">이메일</option>
	<option value="phone">전화번호</option>
</select>
<input type="text" id="memberContent">
<button id="memberSearch">검색</button>
<br>

<table class="table table-striped table-hover table-condensed">
<tr>
	<th>번호</th>
	<th>아이디</th>
	<th>닉네임</th>
	<th>이름</th>
	<th>이메일</th>
	<th>전화번호</th>
	<th>회원등급</th>
	
</tr>

	<c:forEach items="${list}" var="i">
<tr>
	<td>${i.memberNo }</td>
	<td><a onclick="viewMember(${i.memberNo })">${i.id }</a></td>
	<td>${i.nick}</td>
	<td>${i.name }</td>
	<td>${i.email }</td>
	<td>${i.phone }</td>
	<td>
	<c:choose> 
	<c:when test="${i.grade eq 0}"> 일반유저 </c:when> 
	<c:when test="${i.grade eq 1}"> 사업자 </c:when> 
	<c:when test="${i.grade eq 2}"> 관리자 </c:when>
	<c:when test="${i.grade eq 3}"> 비활성화 </c:when> 
	</c:choose>


	</td>
	

</tr>
	</c:forEach>

</table>
 total : ${total}
</body>
</html>
<%@ include file="../../layout/paging.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"> 


var str = "member";
function grade(grade){
	
	$.ajax({
		type : "post"
		,url : "/admin/member/member" 
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
function viewmember(memberno){
	
	$.ajax({
		type : "get"
		,url : "/admin/member/memberInfo"
		,data : "memberNo="+memberno
		,dataType : "html"
		,success : function(res){
			$("#resultLayout").html(res);
			console.log("뷰 성공")
		}
		,error : function(){
			console.log("뷰실패")
		}
		
	})
	
}



$(document).ready(function(){

	$("#DisabledAllDelete").click(function(){
		
		if(confirm("복구가 불가능합니다.\n정말 삭제하시겠습니까?")){
		
			$.ajax({
				type : "post"
				,url : "/admin/member/member"
				,data : "grade=3&disabled=delete"	
				
				,dataType : "html"
				,success : function(res){
					console.log("삭제 성공")
					$("#resultLayout").html(res);
				}
				,error : function(){
					console.log("삭제 불가")
				}
				
			})
		}
	})
	
	$("#memberSearch").click(function(){
		var cat= $("#memberCategory").val();
		var con = $("#memberContent").val();	
		$.ajax({
			type : "post"
			,url : "/admin/member/member" 
			,data : "category="+cat+"&content="+con+"&grade=4"
			,dataType : "html"
			,success : function(res){
				console.log("검색 가능");
				$("#resultLayout").html(res);
			}
			,error : function(){
				console.log("검색 오류");
			}
			
		})

			console.log(con);
// 		$.ajax({
// 			type : "post"
// 			,url : "/layout/memberpaging"
// 			,data : "str="+str+"&content"+content+"&grade="+gradep+"&content="+con+"&category="+cat
// 			,dataType :"html"
// 			,seccess : function(res){
// 				$("#resultLayout").html(res)
			
// 			}
// 			,error : function(){
// 				console.log("검색페이지 망할")
// 			}
			
// 		})
	})
	
	for(var i = startPage; i <= endPage; i++){
		(function(i){
			$(".paging"+i).click(function(){	
				var con = $("#memberContent").val();
				var cat = $("#memberCategory").val();
				$.ajax({
					type : "post"
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
		var con = $("#memberContent").val();
		var cat = $("#memberCategory").val();
		$.ajax({
			type : "post"
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
		var con = $("#memberContent").val();
		var cat = $("#memberCategory").val();	
		$.ajax({
			type : "post"
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
		var con = $("#memberContent").val();
		var cat = $("#memberCategory").val();
		$.ajax({
			type : "post"
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
		var con = $("#memberContent").val();
		var cat = $("#memberCategory").val();
		$.ajax({
			type : "post"
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
		var con = $("#memberContent").val();
		var cat = $("#memberCategory").val();
		$.ajax({
			type : "post"
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
		var con = $("#memberContent").val();
		var cat = $("#memberCategory").val();
		$.ajax({
			type : "post"
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
<hr>





<select id="memberCategory">
	<option value="id" <c:if test="${cat eq 'id'}">selected</c:if>>아이디</option>
	<option value="nick" <c:if test="${cat eq 'nick'}">selected</c:if>>닉네임</option>
	<option value="name" <c:if test="${cat eq 'name'}">selected</c:if>>이름</option>
	<option value="email" <c:if test="${cat eq 'email'}">selected</c:if>>이메일</option>
	<option value="phone" <c:if test="${cat eq 'phone'}">selected</c:if>>전화번호</option>
</select>
<input type="text" id="memberContent" value="${con }">
<button id="memberSearch">검색</button>

<c:if test="${membergrade eq '3' }"> 
<button id="DisabledAllDelete">비활성화 유저 삭제</button>
</c:if>
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
<tr onclick="viewmember(${i.memberNo})">
	<td>${i.memberNo }</td>
	<td><a  style="color : blue;">${i.id }</a>
	<input type="hidden" class="viewmemberno" value="${i.memberNo}"/>
	</td>
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
<%@ include file="../../../layout/paging.jsp" %>
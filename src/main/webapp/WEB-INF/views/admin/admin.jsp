<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
function viewMember(memberno){
	$.ajax({
		type : "get"
		,url : "/admin/memberInfo"
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
function memberManagement(){
	$.ajax({
		type : "get"
		,url : "/admin/member"
		,data : "grade=4"+"&str=member"
		,dataType : "html"
		,success : function(res){
			console.log("회원관리 뷰 성공")
			$("#resultLayout").html(res)
			
		}
		,error : function(){
			console.log("회원관리 뷰 실패")
		}
	})

}




</script>

</head>
<body>

<button  onclick="memberManagement()">회원관리</button><br>
<button>프로젝트 관리</button><br>
<button>프로젝트 승인</button><br>
<br><br>


<div id="resultLayout"></div>
</body>
</html>
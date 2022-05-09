<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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
function noticeManagement(){
	$.ajax({
		type : "get"
		,url : "/admin/notice"
		,data : "str=notice"
		,dataType : "html"
		,success : function(res){
			console.log("공지사항 뷰 성공")
			$("#resultLayout").html(res)
			
		}
		,error : function(){
			console.log("공지사항 뷰 실패")
		}
	})

}
function projectManagement(){
	$.ajax({
		type : "get"
		,url : "/admin/project"
		,data : "str=poject&projectStep=5&categoryNo=0"
		,dataType : "html"
		,success : function(res){
			console.log("공지사항 뷰 성공")
			$("#resultLayout").html(res)
			
		}
		,error : function(){
			console.log("공지사항 뷰 실패")
		}
	})
}

/* edit by young */
function approveProject() {
    $.ajax({
        type : "get"
        ,url : "/admin/approveProject"
        ,data : "str=approveProject"
        ,dataType : "html"
        ,success : function(res){
            console.log("공지사항 뷰 성공")
            $("#resultLayout").html(res)

        }
        ,error : function(){
            console.log("공지사항 뷰 실패")
        }
    })
}
function qnaManagement(searchtest){
	$.ajax({
		type : "get"
		,url : "/admin/qna"
		,data : {str:"qna",search:searchtest,complete:"3"}
		,dataType : "html"
		,success : function(res){
			console.log("공지사항 뷰 성공")
			$("#resultLayout").html(res)
			
		}
		,error : function(){
			console.log("공지사항 뷰 실패")
		}
	})
}



</script>
<style>
nav{ 
    width:200px; 
    background-color:#eee; 
    border-right:1px solid #ddd;
    /* height:100% 그냥 적용 안됨. 부모개념이 있어야 채워질 수 있음 */
    /*공중에 떠서 공간을 차지하지 않음*/
    height:100% /*fixed를 해서 높이 100%가 가능해짐*/
}
h1{ font-size:18px;  padding:20px; }
	.menu {}
    .menu li {}

    
.menu li a {
    height:30px;
    line-height:30px;
    display:block;
    padding:0 20px;
    font-size:12px;
    color:#555;
}
.menu li a:hover { background-color:yellowgreen; color:white;}

#center{
	margin:0 auto; 
}
#menu {
    width:15%;
    box-sizing: border-box;
}

#managerLayout{
	width: 100%;
    margin: 0px auto;
    display: flex;
}
#Layout{
    width:80%;
    box-sizing: border-box;
}
</style>

</head>
<body>

<!-- <button  onclick="memberManagement()">회원관리</button><br> -->
<!-- <button>프로젝트 관리</button><br> -->
<!-- <button>프로젝트 승인</button><br> -->
<br><br>
<div id="managerLayout">
<div  id="menu">
<nav >
    관리자 페이지 <!-- h1태그 검색사이트가 좋아함. 문서상에 1개만 있는 것을 권장한다. -->
    <ul class="menu">
        <li><a onclick="memberManagement()">회원관리</a></li>
        <li><a onclick="projectManagement()">프로젝트 목록</a></li>
        <%-- edit by young --%>
        <li><a onclick="approveProject()">프로젝트 승인</a></li>
        <li><a onclick="noticeManagement()">공지사항</a></li>
        <li><a onclick="qnaManagement()">문의 게시판</a></li>
    </ul>
 
</nav>
</div>
<div id="Layout">
<div id="resultLayout"><h3>관리자님 안녕하세요.</h3></div>
</div>
</div>
</body>
</html>
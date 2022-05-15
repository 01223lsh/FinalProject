<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Crowd Funding</title>
<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<script type="text/javascript">
function logout(){
	$.ajax({
		type:"post"
		,url : "/member/logout"
		,success : function(res){
			console.log("성공")
		} ,error : function(){
			console.log("실패")
			
		}
		
	})
}


/* alert('${sessionScope.Id}');
 */
</script>
 <!-- <style type="text/css">

     /*캐러셀(이미지슬라이드) 이미지 크기변경 */
      .carousel-inner{
        width:auto;
        height:980px; /* 이미지 높이 변경 */
      }
      .carousel-item{
        width: auto;
        height:80%;
      }
      .d-block {
        display:block;
        width: auto;
        height: 80%;
      }
      </style>  -->
      
      <style type="text/css">
      	.nav-login {
/*       		position: fixed; */
/*       		height: 60px;   	 */
/*       	    margin-right: auto!important; */
      		margin-right: 10px;
      	}
      	.nav-login button{
/*       		text-decoration: none; */
      		margin:10px;
/*       		color: rgb(0, 0, 0);  */
/*       		font-family: Georgia, "Malgun Gothic", serif; */
		    padding: 0.32rem 0.6rem!important;
		    font-size: 12px!important;
      	}
      	
      	.navbar-brand:hover {
			color: #646b72 !important;
      	}
      	
      .navbar-brand {
			 font-size: 12pt;
			 font-weight : bold;
      	
      	}

		.nav-item a {
			 font-size: 12pt;
			 font-weight : bold;
		}

		.nav-item a:hover {
			color: #646b72 !important;
		} 
		
		.nav-link {
			color: black;
			font-size: 15pt;
		}
		
		.d-flex button {
			width: 70px;
			height: 30px;
			margin:10px;
			 padding: 0.32rem 0.6rem!important;
			 font-size: 12px!important;
		}
		
		.d-flex input {
			width: 250px;
			height: 30px;
			margin:10px;
			 padding: 0.32rem 0.6rem!important;
		}
		
		.container {
	 		flex-direction: row-reverse; 
		}
		
	 	.menubar {
			border-bottom: 1px solid #ccc;
		} 
		
		</style>


</head>
<body>

 

<!-- <ul class="nav justify-content-center">
  <li class="nav-item">
    <strong><a class="nav-link" href="#">홈</a></strong>
  </li>
  <li class="nav-item">
    <strong><a class="nav-link" href="#">진행중인 프로젝트</a></strong>
  </li>
  <li class="nav-item">
    <strong><a class="nav-link" href="#">고객센터</a></strong>
  </li>
</ul> -->

<!-- <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="nav-link" href="#">홈</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
     <a class="nav-link" href="#">프로젝트</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
     <a class="nav-link" href="#">고객센터</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
     <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link"  href="#"></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"></a>
        </li>
      </ul>
       <form class="d-flex">
		  <button type="button" class="btn btn-outline-success">로그인</button>
		  <button type="button" class="btn btn-outline-success">회원가입</button>
      		
      </form>
      
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="검색어를 입력하세요." aria-label="Search">
        <button class="btn btn-outline-success" type="submit" width="50">검색</button>
      </form>
    </div>
</nav> -->


<nav class="navbar navbar-expand-lg navbar-light bg-light">
   <div class="nav-login collapse navbar-collapse">
<!-- 	<ul style="list-style-type: none;"> -->
			<a href="/member/main" class="me-auto mb-2 mb-lg-0"><img src="/resources/jpg/KakaoTalk_20220107_230043280.jpg" width = "100" height="50"></img></a>
		    <c:choose>
			<c:when test="${empty login }">
				<button type="button" class="btn btn-outline-secondary">회원가입</button><button type="button" class="btn btn-outline-secondary"><a href="/member/login">로그인</a></button>
			</c:when>
			<c:when test="${sessionScope.login eq true && sessionScope.grade eq '2'}">
<!-- 				<a href="#" >로그아웃</a> | <a href="#">관리자 페이지</a> | <a href="/chat/room/enter/1">채팅</a> -->
				<button type="button" class="btn btn-outline-secondary" onclick="logout()">로그아웃</button><button type="button" class="btn btn-outline-secondary">관리자페이지</button><button type="button" class="btn btn-outline-secondary">채팅</button>
			</c:when>
			<c:otherwise>
				<button type="button" class="btn btn-outline-secondary" onclick="logout()">로그아웃</button><button type="button" class="btn btn-outline-secondary">마이페이지</button><button type="button" class="btn btn-outline-secondary">채팅</button>
			</c:otherwise>
		 	</c:choose>
	</div>
</nav>
<div class="menubar">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="/member/main">홈</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/project/list">프로젝트</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/qna/list">고객센터</a>
       
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="notice/list">공지사항</a>
       
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"></a>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true"></a>
        </li>
      </ul>
      
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="검색어를 입력하세요." aria-label="Search">
        <button class="btn btn-outline-primary" type="submit">검색</button>
      </form>
    </div>
  </div>
</nav>
</div>
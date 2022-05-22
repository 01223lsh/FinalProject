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

<!-- 안쓰는 라이브러리 모음 확인 후 삭제 요망 -->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> 
<script src="https://kit.fontawesome.com/c3d0d95309.js" crossorigin="anonymous"></script> -->

<!-- JQuery 2.2.4 -->
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- 부트스트랩 5.1.3 CSS, JS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- Fontawesome 라이브러리 -->
<script src="https://kit.fontawesome.com/c3d0d95309.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">

<!-- mypage font -->
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">

<!-- 알림 아이콘 -->
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>



<!-- <script type="text/javascript">


/* alert('${sessionScope.Id}');
 */
</script> -->
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
      
      a:link { color: white; text-decoration: none;} 
      a:visited { color: white; text-decoration: none;} 
      a:hover { color: white; text-decoration: none;}
      
      
      
      	.nav-login_h {
/*       		position: fixed; */
/*       		height: 60px;   	 */
/*       	    margin-right: auto!important; */
      		margin-right: 10px;
      	}
      	.nav-login_h button{
/*       		text-decoration: none; */
      		margin:10px;
/*       		color: rgb(0, 0, 0);  */
/*       		font-family: Georgia, "Malgun Gothic", serif; */
		    padding: 0.32rem 0.6rem!important;
		    font-size: 12px!important;
		     border: 0;
		     font-weight : bold;
      	}
      	
      	.nav-login_h button:hover {
			background-color: #39AEA9 !important;
			font-weight : bold;
			color: #557B83 !important;
		}
      	
      	/* .navbar-brand_h:hover {
			color: #646b72 !important;
      	} */
      	
      .navbar-brand_h {
      		 color: white;
			 font-size: 12pt;
			 font-weight : bold;
      	
      	}

		.nav-item_h a {
			 font-size: 12pt;
			 font-weight : bold;
			 color: #ffffff;
			 
		}

		 .nav-item_h a:hover {
			color: #557B83 !important;
		}  
		
		.nav-link {
			color: white;
			font-size: 15pt;
		}
		
		.d-flex button {
			width: 70px;
			height: 30px;
			margin:10px;
			 padding: 0.32rem 0.6rem!important;
			 font-size: 12px!important;
			 border: 0;
			 color: #ffffff;
			 font-weight : bold;
		}
		
		.d-flex button:hover {
			background-color: #39AEA9 !important;
			color: #557B83 !important;
		}
		
		.d-flex input {
			width: 250px;
			height: 30px;
			margin:10px;
			 padding: 0.32rem 0.6rem!important;
		}
		
		.container {
	 		flex-direction: row-reverse; 
	 		 font-family: 'IBM Plex Sans KR', sans-serif; 
		}
		
	 	.menubar_h {
			border-bottom: 50px solid #ffffff;
		} 
		
		#navbar_h {
		background-color: #39AEA9 !important;
		}
		
		#menu_h {
		background-color: #39AEA9 !important;
		
		}
		
		.container-fluid a {
		margin: 12px;
		}
		
		.container-fluid a:hover {
		color: #557B83 !important;
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

<nav class="navbar navbar-expand-lg navbar-light bg-light" id="navbar_h">
   <div class="nav-login_h collapse navbar-collapse">
<!-- 	<ul style="list-style-type: none;"> -->
			<a href="/member/main" class="me-auto mb-2 mb-lg-0"><img src="/resources/jpg/LogoWhale2.png" width = "100" height="80"></img></a>
		    <c:choose>
			<c:when test="${empty login }">
				<button type="button" class="btn btn-outline-secondary"><a href="/member/join_step1">JOIN</a></button><button type="button" class="btn btn-outline-secondary"><a href="/member/login">LOGIN</a></button>
			</c:when>
			<c:when test="${sessionScope.login eq true && sessionScope.grade eq '2'}">
<!-- 				<a href="#" >로그아웃</a> | <a href="#">관리자 페이지</a> | <a href="/chat/room/enter/1">채팅</a> -->
				<button type="button" class="btn btn-outline-secondary"><a href="/member/logout">LOGOUT</a></button><button type="button" class="btn btn-outline-secondary"><a href="/mypage/mypagemain">MYPAGE</a></button><button type="button" class="btn btn-outline-secondary"><a href="/admin/main">ADMINPAGE</a></button>
			</c:when>
			<c:otherwise>
				<button style="background-color: #39AEA9;" class="project_button"  onclick=" "><span><ion-icon size="large" name="notifications-outline"></ion-icon></span></button>
				<button type="button" class="btn btn-outline-secondary"><a href="/member/logout">LOGOUT</a></button><button type="button" class="btn btn-outline-secondary"><a href="/mypage/mypagemain">MYPAGE</a></button>
			</c:otherwise>
		 	</c:choose>
	</div>
</nav>
<div class="menubar_h">
<nav class="navbar navbar-expand-lg navbar-light bg-light" id="menu_h">
  <div class="container-fluid">
    <a class="navbar-brand_h" href="/member/main">MAIN</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item_h">
          <a class="nav-link active" aria-current="page" href="/project/list"  style="color: #ffffff;">PROJECT</a>
        </li>
        <li class="nav-item_h">
          <a class="nav-link active" aria-current="page" href="/qna/list" style="color: #ffffff;">QnA</a>
       
        </li>
        <li class="nav-item_h">
          <a class="nav-link active" aria-current="page" href="/notice/list" style="color: #ffffff;">NOTICE</a>
       
        </li>
        <li class="nav-item_h">
          <a class="nav-link active" aria-current="page" href="/main/guide" style="color: #ffffff;">GUIDE</a>
       
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"></a>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true"></a>
        </li>
      </ul>
      
      <div class="form-inline text-center">
      <form class="d-flex" action="/member/main" method="POST" >
        <input class="form-control me-2" placeholder="Please enter a search keyword" type="text" id="search" name="keyword" />
        <button id="btnSearch" class="btn btn-outline-primary" type="submit">SEARCH</button>
      </form>
      </div>
    </div>
  </div>
</nav>
</div>


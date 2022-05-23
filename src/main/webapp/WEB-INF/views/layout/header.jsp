<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cloud Funding</title>
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

<!-- 부트스트랩 5.1.3 CSS, JS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- Fontawesome 라이브러리 -->
<script src="https://kit.fontawesome.com/c3d0d95309.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">

<!-- login, join font-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@500&display=swap" rel="stylesheet">



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
      
      #login:link { color: white; text-decoration: none;} 
      #login:visited { color: white; text-decoration: none;}  
      #login:hover { color: white; text-decoration: none;}
      #main_h:link { color: white; text-decoration: none;} 
      #main_h:visited { color: white; text-decoration: none;}  
      #main_h:hover { color: white; text-decoration: none;}
      
      
      	.nav-login_h {
/*       		position: fixed; */
/*       		height: 60px;   	 */
/*       	    margin-right: auto!important; */
      		margin-right: 10px;
      	}
      	.nav-login_h_button{
/*       		text-decoration: none; */
      		margin:10px;
/*       		color: rgb(0, 0, 0);  */
/*       		font-family: Georgia, "Malgun Gothic", serif; */
		    padding: 0.32rem 0.6rem;
		    font-size: 12px!important;
		    border: 0;
		    font-weight : bold;
      	}
      	
      	.nav-login_h_button:hover {
			background-color: #39AEA9 !important;
			font-weight : bold;
			color: #557B83 ;
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
			 padding: 0.32rem 0.6rem!;
			 font-size: 12px!important;
			 border: 0;
			 color: #ffffff;
			 font-weight : bold;
		}
		
/* 		.d-flex button:hover { */
/* 			background-color: #39AEA9 ; */
/* 			color: #557B83 ; */
/* 		} */
		
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
		
	 	/* .menubar_h {
			border-bottom: 50px solid #ffffff;
		}  */
		
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
		
		/* 알림창 관련 css start */
		.project_button {
			border: none;
		    background: transparent !important;
		    outline: none;
		    color: rgb(255,255, 255);
		/*     font-weight: bold; */
		    font-size: 1rem;
		    cursor: pointer;
/* 		    line-height: 58px !important; */
		    padding: 0px 1rem !important;
		}
		
		.project_button span:hover, .project_button span:active {
			color: rgb(150, 150, 150);
		}
		
		.header_alert{
		    display: none; 
		    position: absolute;
		    min-width: 240px;
		    width:345px;
		    height: auto;
		    font-size: 12px;
		/*     border: 2px solid #39AEA9; */
		    border: 2px solid  #E5EFC1;
		    z-index: 1000;
		    text-align: left;
		    background-color: rgb(255,255,255);
		/*     #E5EFC1; */
			top: 60px;
			right: 40px;
			z-index: 1000;
		}
		
		.header_alert_title {
			flex: 1;
			font-size: 16px !important;
			font-weight: 700;
		/* 	display: block; */
		}
		
		.header_alert_btn {
			position: absolute;
 		    top: 50%; 
		    right: 0;
		    margin: -18px 0 0 0 !important;
		}
		
		.header_alert_deleteAll {
		/* 	min-width: 30px; */
		/*     min-height: 30px; */
		/*     margin: 2px; */
		/*     display: inline-block; */
		     border: none; 
		/*     text-align: center; */
		/*     color: white; */
		     background-color: #E5EFC1 !important; 
		/*     vertical-align: middle; */
		/*     border-radius: 3px; */
		/*     box-sizing: border-box !important; */
		}
		
		.header_alert_box {
			position: relative;
		    width: 100%;
		    max-height: 300px;
		    overflow-y: auto;
		    background-color: rgb(255,255,255); 
		    margin-bottom: 10px !important;
		}
		
		.header_alert_box li{
			position: relative;
		    padding: 10px;
		    margin: 3px;
		}
		
		.header_alert h1{
		    display: flex;
		    position: relative;
		    padding: 10px !important;
		    margin: 0 !important;
		    font-size: 14px;
		    flex-direction: row;
		    background-color: #E5EFC1 !important; 
		}
		
		
		.header_alert ul {
			padding: 0;
		    margin: 0;
		    list-style: none;
		}
			
		.header_alert_content a {
			display:block;
			margin-bottom: 10px;
		}
		
		.header_alert_info {
			position: relative;
		    width: 100%;
		    display: flex;
		    padding-right: 72px;
		    flex-direction: row;
		    box-sizing: border-box
		}
		
		.info_box{
			flex: 1;
		    margin-right: 10px;
		    overflow: hidden;
		}
		
		.header_alert_delete_div {
			position: absolute;
		    top: 0;
		    right: 0;
		}
		
		.header_alert_delete {
			min-width: 40px;
		    min-height: 30px;
		    padding: 0 !important;
		    margin: 0 !important; 
		/*     font-size: 12px !important; */
		/*     line-height: 22px; */
		/*     text-transform: capitalize; */
		/*     display: inline-block; */
		    border: none; 
		/*     text-align: center; */
		/*     color: white; */
		     background-color: transparent !important; 
		/*     vertical-align: middle; */
		/*     border-radius: 3px; */
		/*     box-sizing: border-box !important; */
		}
		
		#unread {
			display:none;
			position: absolute;
		    top: 24px;
		    right: 21px;
		/*     width: 16px; */
		/*     height: 16px; */
		    line-height: 12px;
		    font-size: 13px;
		    font-weight: bold;
		    border-radius: 50%;
		    border: 3px solid red; 
		    background-color: #ff3c64;
		    box-sizing: border-box;
		    text-align: center;
		}
		
		.header_alert_deleteAll:hover, .header_alert_deleteAll:active {
		    opacity: 0.4; 
		/* 	background-color: rgb(250, 250, 250); */
		}
		
		.header_alert_delete:hover, .header_alert_delete:active {
		    opacity: 0.4; 
		/* 	background-color: rgb(250, 250, 250); */
		}
		
		
		::-webkit-scrollbar { width: 11px; } 
		::-webkit-scrollbar-track { background-color: rgb(245, 245, 245); border-radius: 9px; } 
		::-webkit-scrollbar-thumb { background-color: rgb(210, 210, 210); border-radius: 9px; }
		
		/* 	padding: 17px 24px; */

		

				
		
		
		</style>

<script type="text/javascript">
//알림 리스트
function alertList() {
// 	debugger;
	$.ajax({
		url : "/alert/list",
		type : "post",
		contentType: false,
	    processData: false,
		cache : false
	}).done(function(result) {
			console.log("결과확인");
	 		var html = jQuery('<div>').html(result);
			var contents = html.find("div#alertLoad").html();
			$("#alertView").html(contents);
			$('.header_alert').css('display', 'block');
	})			
}

//알림 가리기
function alertNone() {
	$('.header_alert').css('display', 'none');
}

//알림 삭제
function alertDelete(number) {
	//넘길 데이터를 담아주는 객체
	var formData = new FormData();
	
	//입력 데이터들 json 직렬화
	var form = 
	{
			"alertNo" : number,
	}
	
	$.ajax({
		type:"POST"
		,url:"/alert/delete"
		,data: JSON.stringify(form)
		,contentType: "application/json"
		,success: function(data){
			alertList();
		}
		,error: function(e) {
			alert("error!");
		}
	})
	
}

//알림 전체 삭제
function alertDeleteAll() {
	
	$.ajax({
		type:"POST"
		,url:"/alert/deleteAll"
		,success: function(data){
			alertList();
		}
		,error: function(e) {
			alert("error!");
		}
	})
	
}

//안 읽은 알림수
function unreadNo() {
// 	debugger;
	$.ajax({
		url : "/alert/unread",
		type : "post",
		contentType: false,
	    processData: false,
		cache : false
	}).done(function(result) {
			console.log("결과확인");
	 		var html = jQuery('<div>').html(result);
			var contents = html.find("div#alertUnread").html().trim();
				console.log(contents);
// 				alert(contents);
			if(contents == ""){
				$('#unread').css('display', 'none');
				return;
			}
			$('#unread').css('display', 'block');
			$("#unread").html(contents);
	})	
	

}

//알림창 띄우기
function showUnread(result) {
	$('#unread').html(result);
}

//3초마다 반복
function getInfiniteAlert() {
	setInterval(function() {
		unreadNo();
	}, 3000);
}

//함수 실행
$(function(){
// 	unreadNo();
	getInfiniteAlert();
})

</script>

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

			<a href="/member/main" class="me-auto mb-2 mb-lg-0" style="margin-left: 15px;"><img src="/resources/jpg/LogoWhale2.png" width = "100" height="80"></img></a>
		    <c:choose>
			<c:when test="${empty login }">
<!-- 				<button type="button" class="btn btn-outline-secondary"><a href="/member/join_step1" id="login">JOIN</a></button> -->
				<button type="button" class="btn btn-outline-secondary" onclick="location.href='/member/join_step1'" id="join" style="color : white">JOIN</button>
<!-- 				<button type="button" class="btn btn-outline-secondary"><a href="/member/login" id="login">LOGIN</a></button> -->
				<button type="button" class="btn btn-outline-secondary" onclick="location.href='/member/login'" id="login" style="color : white">LOGIN</button>
			</c:when>
			<c:when test="${sessionScope.login eq true && sessionScope.grade eq '2'}">
<!-- 				<a href="#" >로그아웃</a> | <a href="#">관리자 페이지</a> | <a href="/chat/room/enter/1">채팅</a> -->
				<button type="button" class="btn nav-login_h_button"><a href="/member/logout" id="login">LOGOUT</a></button><button type="button" class="btn  nav-login_h_button"><a href="/mypage/mypagemain" id="login">MYPAGE</a></button><button type="button" class="btn  nav-login_h_button"><a href="/admin/main" id="login">ADMINPAGE</a></button>
			</c:when>
			<c:when test="${sessionScope.login eq true && sessionScope.grade eq '1'}">
				<button type="button" class="btn nav-login_h_button"><a href="/apply/category" id="login">CREATE PROJECT</a></button>
				<button type="button" class="btn  nav-login_h_button"><a href="/member/logout" id="login">LOGOUT</a></button><button type="button" class="btn nav-login_h_button"><a href="/mypage/mypagemain">MYPAGE</a></button>
				<button class="project_button"  onclick="alertList()"><ion-icon size="large" name="notifications-outline"></ion-icon><span id="unread"></span></button>
				<div id="alertView" class="header_alert active">
					<!-- 동적생성 -->
				</div>
			</c:when>
			<c:otherwise>
				<button type="button" class="btn nav-login_h_button"><a href="/member/logout" id="login">LOGOUT</a>
				</button><button type="button" class="btn nav-login_h_button"><a href="/mypage/mypagemain" id="login">MYPAGE</a></button>
				<button class="project_button"  onclick="alertList()"><ion-icon size="large" name="notifications-outline"></ion-icon><span id="unread"></span></button>
				<div id="alertView" class="header_alert active">
					<!-- 동적생성 -->
				</div>
			</c:otherwise>
		 	</c:choose>
		 	
	</div>
</nav>
<div class="menubar_h">
<nav class="navbar navbar-expand-lg navbar-light bg-light" id="menu_h">
  <div class="container-fluid">
    <a class="navbar-brand_h" href="/member/main" id="main_h">MAIN</a>
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


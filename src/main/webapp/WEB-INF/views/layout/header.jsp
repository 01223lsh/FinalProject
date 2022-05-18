<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파이널프로젝트</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">

.header {
	text-align: center;
	background-color: #CEE3F6;
}

.footer {
	text-align: center;
}

button {
	color: black;
}

.container {
	position: relative;
	border: 0px solid black;
	height: 1500px;;
}

/*
.wrap {

position: relative;
}
*/
html, body {
	height: 100%;
}
body {
	min-height: 100%;
}

</style>


</head>
<body>

<div class="wrap">

<header class="header">
	<h1><a href="/mypage/main">나는 헤더 self_01</a></h1>
</header>


<div class="container">
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- 폰트  -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@500&display=swap" rel="stylesheet">

<style type= "text/css">

#header{
border: 1px solid red;
text-align: center;'
}

* {
font-family: 'Noto Sans KR', sans-serif; 
}


/*       a:link { color: #ccc; text-decoration: none;}  */
/*       a:visited { color: #ccc; text-decoration: none;}  */
/*       a:hover { color: #ccc; text-decoration: none;} */
      
      
      
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



<nav class="navbar navbar-expand-lg navbar-light bg-light">
   <div class="nav-login collapse navbar-collapse">
<!-- 	<ul style="list-style-type: none;"> -->
<!-- 			<a href="/member/main" class="me-auto mb-2 mb-lg-0"><img src="/resources/jpg/KakaoTalk_20220107_230043280.jpg" width = "100" height="50"></img></a> -->
		    <c:choose>
			<c:when test="${empty login }">
				<button type="button" class="btn btn-outline-secondary"><a href="/member/join_step1">회원가입</a></button><button type="button" class="btn btn-outline-secondary"><a href="/member/login">로그인</a></button>
			</c:when>
			<c:when test="${sessionScope.login eq true && sessionScope.grade eq '2'}">
<!-- 				<a href="#" >로그아웃</a> | <a href="#">관리자 페이지</a> | <a href="/chat/room/enter/1">채팅</a> -->
				<button type="button" class="btn btn-outline-secondary"><a href="/member/logout">로그아웃</a></button><button type="button" class="btn btn-outline-secondary"><a href="/mypage/mypagemain">마이페이지</a></button><button type="button" class="btn btn-outline-secondary"><a href="/admin/main">관리자페이지</a></button><button type="button" class="btn btn-outline-secondary"><a href="/chatting/room">채팅</a></button>
			</c:when>
			<c:otherwise>
				<button type="button" class="btn btn-outline-secondary"><a href="/member/logout">로그아웃</a></button><button type="button" class="btn btn-outline-secondary"><a href="/mypage/mypagemain">마이페이지</a></button><button type="button" class="btn btn-outline-secondary"><a href="/member/login">채팅</a></button>
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




</body>
</html>
>>>>>>> origin/fund/login

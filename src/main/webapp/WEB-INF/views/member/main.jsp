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
      
      	.navbar-brand a :hover {
			color: #0a58ca;
      	}

		.nav-item :hover {
			color: #0a58ca;
		} 
		
		.nav-link {
			color: black;
			font-size: 15pt;
		}
		
		.caption li {
			font-size: 9pt;
			color: #9e9e9e;
			font-weight: bold;
			 list-style:none;
		}
		
		.caption strong {
			font-size: 10pt;
		
		}
		
		.caption p {
			color: red;
			font-size: 9.5pt;
			font-weight: bold;
		}
		
		.thumbnail {
			magin: auto 0;
			padding: 20;
		
		}
		.d-flex button {
			width: 70px;
		}
		
		.container {
	 		flex-direction: row-reverse; 
		}
		
		</style>


</head>
<body>
<ul style="list-style-type: none;">
<li><a href="/member/main"><img src="/resources/jpg/KakaoTalk_20220107_230043280.jpg" width = "100" height="50"></img></a></li>
 </ul>
 <div class="container">
	<div class="item"><button>helloflex</button></div>
	<div class="item"><button>helloflex</button></div>
	<div class="item"><button>helloflex</button></div>
</div>

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
  <div class="container-fluid">
    <a class="navbar-brand" href="#">홈</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">프로젝트</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">고객센터</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"></a>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true"></a>
        </li>
      </ul>
      <div>
		<c:if test="${empty login  }">
			<button><a href="#">회원가입</a></button> | <button><a href="#">로그인</a></button>
		</c:if>
		<c:if test="${login eq true && session.memberId != admin }">
			<button><a href="#">로그아웃</a></button> | <button><a href="/chat/room/enter/1">채팅</a></button> |
		</c:if>
		<c:if test="${login eq true && session.memberId eq admin }" >
			<button><a href="#">관리자 페이지</a></button> | <button><a href="/chat/room/enter/1">채팅</a></button>
		</c:if>
		<%-- <c:if test="${session.memberId eq admin}">
			<a href="#">회원가입</a> | <a href="#">로그인</a> | <a href="#">관리자 페이지</a>
		</c:if> --%>
    <%--   <c:choose>
		<c:when test="${empty login }">
			<a href="#">회원가입</a> | <a href="#">로그인</a> | <a href="#">관리자 페이지</a>
		</c:when>
		<c:when test="${login eq true }">
			<a href="#">로그아웃</a> | <a href="/chat/room/enter/1">채팅</a>
		</c:when>
		<c:when test="${empty login }">
			<a href="#">회원가입</a> | <a href="#">로그인</a> | <a href="#">관리자 페이지</a>
		</c:when>
	   </c:choose> --%>
	   </div>
      
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="검색어를 입력하세요." aria-label="Search">
        <button class="btn btn-outline-success" type="submit">검색</button>
      </form>
    </div>
  </div>
</nav>



<div class="container">
<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/resources/jpg/vegan.JPG" class="d-block w-100" alt="이미지 로드에 실패하였습니다" style="width:980px; height:300px;">
      <div class="carousel-caption d-none d-md-block">
        <h5>달콤하게 떠먹는 비건식</h5>
        <p>우유 없는 초코 & 카라멜 비건 아이스크림</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="/resources/jpg/perfume.JPG" class="d-block w-100" alt="이미지 로드에 실패하였습니다" style="width:400px; height:300px;">
      <div class="carousel-caption d-none d-md-block">
        <h5>포근하고 달콤한 향기</h5>
        <p>부드러운 느낌의 프루티-플로럴 계열의 향수</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="/resources/jpg/perfume.JPG"" class="d-block w-100" alt="이미지 로드에 실패하였습니다" style="width:400px; height:300px;">
      <div class="carousel-caption d-none d-md-block">
        <h5>Third slide label</h5>
        <p>Some representative placeholder content for the third slide.</p>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</div><br><br>

<div class="container">
			<h5><strong>주목할 만한 프로젝트</strong></h5><br>
    <div class="row">
       <div class="col-sm-6 col-md-3">
            <div class="thumbnail">
                <a href="#"><img src="/resources/jpg/KakaoTalk_20220107_230043280.jpg" alt="..." style="width:150px; height:150px;"></a>
                <div class="caption" style="width:150px; height:150px;">
                  <li>푸드 ㅣ 마카롱</li>
                  <strong>맛있는 비건 마카롱 건강하게 즐겨보세요~</strong>
                  <p>798% 달성</p>
                </div>
            </div>
        </div>
         <div class="col-sm-6 col-md-3">
            <div class="thumbnail">
                <a href="#"><img src="/resources/jpg/KakaoTalk_20220107_230043280.jpg" alt="..." style="width:150px; height:150px;"></a>
                <div class="caption" style="width:150px; height:150px;">
                  <li>푸드 ㅣ 마카롱</li>
                  <strong>맛있는 비건 마카롱 건강하게 즐겨보세요~</strong>
                  <p>798% 달성</p>
                </div>
            </div>
        </div>
         <div class="col-sm-6 col-md-3">
            <div class="thumbnail">
                <a href="#"><img src="/resources/jpg/KakaoTalk_20220107_230043280.jpg" alt="..." style="width:150px; height:150px;"></a>
                <div class="caption" style="width:150px; height:150px;">
                  <li>푸드 ㅣ 마카롱</li>
                  <strong>맛있는 비건 마카롱 건강하게 즐겨보세요~</strong>
                  <p>798% 달성</p>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-3">
            <div class="thumbnail">
                <a href="#"><img src="/resources/jpg/KakaoTalk_20220107_230043280.jpg" alt="..." style="width:150px; height:150px;"></a>
                <div class="caption" style="width:150px; height:150px;">
                  <li>푸드 ㅣ 마카롱</li>
                  <strong>맛있는 비건 마카롱 건강하게 즐겨보세요~</strong>
                  <p>798% 달성</p>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
 <div class="col-sm-6 col-md-3">
            <div class="thumbnail">
                <a href="#"><img src="/resources/jpg/KakaoTalk_20220107_230043280.jpg" alt="..." style="width:150px; height:150px;"></a>
                <div class="caption" style="width:150px; height:150px;">
                  <li>푸드 ㅣ 마카롱</li>
                  <strong>맛있는 비건 마카롱 건강하게 즐겨보세요~</strong>
                  <p>798% 달성</p>
                </div>
            </div>
        </div>
       <div class="col-sm-6 col-md-3">
            <div class="thumbnail">
                <a href="#"><img src="/resources/jpg/KakaoTalk_20220107_230043280.jpg" alt="..." style="width:150px; height:150px;"></a>
                <div class="caption" style="width:150px; height:150px;">
                  <li>푸드 ㅣ 마카롱</li>
                  <strong>맛있는 비건 마카롱 건강하게 즐겨보세요~</strong>
                  <p>798% 달성</p>
                </div>
            </div>
        </div>
       <div class="col-sm-6 col-md-3">
            <div class="thumbnail">
                <a href="#"><img src="/resources/jpg/KakaoTalk_20220107_230043280.jpg" alt="..." style="width:150px; height:150px;"></a>
                <div class="caption" style="width:150px; height:150px;">
                  <li>푸드 ㅣ 마카롱</li>
                  <strong>맛있는 비건 마카롱 건강하게 즐겨보세요~</strong>
                  <p>798% 달성</p>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-3">
            <div class="thumbnail">
                <a href="#"><img src="/resources/jpg/KakaoTalk_20220107_230043280.jpg" alt="..." style="width:150px; height:150px;"></a>
                <div class="caption" style="width:150px; height:150px;">
                  <li>푸드 ㅣ 마카롱</li>
                  <strong>맛있는 비건 마카롱 건강하게 즐겨보세요~</strong>
                  <p>798% 달성</p>
                </div>
            </div>
        </div>
    </div>
</div>



<!-- <div class="container">
    <div class="row">
        <div class="col-sm-6 col-md-3">
            <div class="thumbnail">
                <img src="/resources/jpg/KakaoTalk_20220107_230043280.jpg" alt="..." style="width:150px; height:200px;">
                <div class="caption">
                  <h3>Thumbnail label</h3>
                  <p>...</p>
                  <p><a href="#" class="btn btn-primary" role="button">Button</a></p>
                </div>
              </div>
        </div>
        <div class="col-sm-6 col-md-3"></div>
        <div class="col-sm-6 col-md-3"></div>
        <div class="col-sm-6 col-md-3"></div>
    </div>
    <div class="row">
        <div class="col-sm-6 col-md-3"></div>
        <div class="col-sm-6 col-md-3"></div>
        <div class="col-sm-6 col-md-3"></div>
        <div class="col-sm-6 col-md-3"></div>
    </div>
</div> -->
</body>
</html>
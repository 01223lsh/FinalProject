<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/c3d0d95309.js" crossorigin="anonymous"></script>

<style>
  /* 마감된 프로젝트 표시 */
  #project-status {
    color: white;
    background: red;
    padding: 3px 5px;
    font-weight: 700;
    font-size: 12px;
    border-radius: 15px;
  }
  #category-section .container {
    overflow: auto;
  }
  #category-section .row {
    flex-flow: nowrap;
  }
</style>

<script>

$(document).ready(function() {

	// 검색어 입력
	$("input[name=keyword]").on("keyup", function(key) {
		if (key.keyCode == 13) {
			getList('${pagination.category}');
		}
	})
	// 필터 선택
	$("select[name=filter]").change(function() {
		getList('${pagination.category}');
	})
	// 정렬 선택
	$("select[name=order]").change(function() {
		getList('${pagination.category}');
	})
	// 필터, 정렬 조건 유지
	setCondition()	
	
	
})



// 프로젝트 리스트 조회
function getList(category) {
	var curPage = '${pagination.curPage}';
	var keyword = $("input[name=keyword]").val();
	if (category === undefined) var category = '';
	var category = category; 
	var filter = $("select[name=filter]").val();
	var order = $("select[name=order]").val();
	
	console.log(
		'cuarPage: ' + curPage
		+ ' / keyward: ' + keyword
		+ ' / category: ' + category
		+ ' / filter: ' + filter
		+ ' / order: ' + order
	)
	
	location.href="/project/list?curPage=" + curPage + "&keyword=" + keyword + "&category=" + category + "&filter=" + filter + "&order=" + order;
	
}
// 정렬 조건 유지
function setCondition() {
    const selectOrder = document.querySelector("select[name=order]")
    const selectFilter = document.querySelector("select[name=filter]")

    for (i = 0; i < selectOrder.length; i++) {
        if (selectOrder.options[i].value == '${pagination.order}') {
            selectOrder.options[i].selected = true
            break
        }
    }
    
    for (i = 0; i < selectFilter.length; i++) {
        if (selectFilter.options[i].value == '${pagination.filter}') {
        	selectFilter.options[i].selected = true
            break
        }
    }
}
// 카테고리 이동 - 중도 포기 그냥 scroll로 하자
// function nextCategory() {
//   const row = document.querySelector("#category-section .row");
//   const parentX = document.querySelector("#category-section .container").getBoundingClientRect().x;
//   const childX = document.querySelector("#category-section .row").getBoundingClientRect().x;
//   const parentR = document.querySelector("#category-section .container").getBoundingClientRect().right;
//   const childR = document.querySelector("#category-section .row").getBoundingClientRect().right;
//
//   const parent = document.querySelector("#category-section .container");
//   const child = document.querySelector("#category-section .row");
//
//   console.log("P-x: ", parentX)
//   console.log("C-x: ", childX)
//   console.log("P-right: ", parentR)
//   console.log("C-right: ", childR)
//
//   console.log("parent: ", parent.clientWidth)
//   console.log("child: ", child.clientWidth)
//
//   row.style.transform = 'translateX(' + (childX - parentX - 100) + 'px)';
// }
</script>
</head>
<body>

<!-- header -->
<header>

  <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
    <div class="container py-2">
      <a class="navbar-brand" href="#">크라우드 펀딩</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Link</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              Dropdown
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li><a class="dropdown-item" href="#">Action</a></li>
              <li><a class="dropdown-item" href="#">Another action</a></li>
              <li><hr class="dropdown-divider"></li>
              <li><a class="dropdown-item" href="#">Something else here</a></li>
            </ul>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled">Disabled</a>
          </li>
        </ul>
        <div class="col-md-3 text-end">
          <button type="button" class="btn btn-outline-primary me-2">Login</button>
          <button type="button" class="btn btn-primary">Sign-up</button>
        </div>
      </div>
    </div>
  </nav>

</header>
<!-- /header -->

<main>

<!-- 카테고리 -->
<section id="category-section">
  <div class="container py-5">
    <div class="row">
      <div class="col text-center" onclick="getList()">
        <div><img src="/resources/img/project/category/all.svg" style="withd: 800px; height: 60px"></div>
        <span>전체</span>
      </div>
      
      <c:forEach var="c" items="${cList}">
      <div class="col text-center me-4" onclick="getList('${c.categoryNo}')">
        <div><img src="/resources/img/project/category/${c.categoryNo}.svg"  style="withd: 80px; height: 60px"></div>
        <span>${c.categoryName}</span>
      </div>
      </c:forEach>

    </div>
  </div>
</section>

<!-- /카테고리 -->


<!-- 프로젝트 목록 -->
<section>

<div class="album py-5 bg-light">

  <!-- 프로젝트 목록 네비게션바 -->
  <div class="container">
    <div class="row">
      <div class="col-auto me-auto">
        <input class="form-control" list="datalistOptions" placeholder="Type to search..." name="keyword">
        <datalist id="datalistOptions">
          <!-- <option value="추천 검색어1">
          <option value="추천 검색어2"> -->
        </datalist>
      </div>
      <div class="col-auto">
        <select class="form-select" name="filter">
		  <option value="" selected>선택안됨</option>
          <option value="3">진행중</option>
          <option value="4">종료된</option>
        </select>
      </div>
      <div class="col-auto">
        <select class="form-select" name="order">
          <option value="" selected>선택안됨</option>
          <option value="open_date">오픈일</option>
          <option value="close_date">마감일</option>
        </select>
      </div>
    </div>

    <hr>
  </div>
  <!-- /프로젝트 목록 네비게션바 -->

  <div class="container">
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

		<c:forEach var="p" items="${list}">
      <div class="col" style="max-width: 250px;">
        <div class="card shadow-sm">
          <img src="${p.projectImage }" style="min-height: 250px;">
          <div class="card-body">
            <strong>${p.projectTitle}</strong>
            <c:if test="${p.projectStep eq 4}">
              <span id="project-status">마감</span>
            </c:if>
            <p class="card-text">${p.projectIntro}</p>
            <progress value="${p.sum}" max="${p.projectPrice}"></progress>
            <div class="row fs-6">
              <div class="col d-flex">
                <span style="margin-right: 10px;">
                	<fmt:formatNumber value="${p.sum / p.projectPrice}" type="percent"/>
                </span>
                <span>
	                <fmt:formatNumber value="${p.projectPrice}" pattern="#,###"/>
                </span>
              </div>
              <div class="col text-end">
                <span>
                <fmt:formatDate value="${p.closeDate}" pattern="yy/MM/dd"/>
                </span>
              </div>
            </div>
          </div>
        </div>
      </div>
      </c:forEach>

    </div>
  </div>

</div>

</section>
<!-- /프로젝트 목록 -->

</main>

<!-- footer-->
<div class="container">
  <footer class="py-3 my-4">
    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Home</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Features</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Pricing</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">FAQs</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">About</a></li>
    </ul>
    <p class="text-center text-muted">&copy; 2021 Company, Inc</p>
  </footer>
</div>
<!-- /footer-->



</body>
</html>
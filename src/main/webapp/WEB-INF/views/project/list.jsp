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

<style>
  .section-img {
    padding: 3px;
  }
  .section-img img {
    width: 100%;
    object-fit: cover;
  }
  .section-body {
    display: flex;
    flex-direction: column;
    /*justify-content: space-around;*/
    min-height: 220px;
  }
  [class^="body"] {
    margin: 5px 0;
  }
  .section-body .body-title {
    margin: 5px 0;
    font-size: 14px;
    height: 40px;
    overflow: hidden;
  }
  .section-body .body-intro {
    font-size: 12px;
    height: 55px;
    overflow: hidden;
  }
  .section-body .body-progress {
    flex-grow: 1;
  }
  .section-body .body-progress progress {
    width: 100%;
  }
  .section-body .body-etc {
    flex-grow: 1;
  }
  .section-body .body-etc span {
    font-size: 12px;
  }
  .section-body .body-etc div:nth-child(2) {
    display: flex;
    justify-content: flex-end;
  }
  .section-body .body-etc div:first-child > span:first-child{
    color: red;
  }
  #category-section img {
    padding: 15px;
  }
</style>

<script>

$(document).ready(function() {
	// 필터, 정렬 조건 불러오기
	setCondition()
	// 검색어 입력
	$("input[name=keyword-list]").on("keyup", function(key) {
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
})
// 프로젝트 리스트 조회
function getList(cate, page) {
	let curPage;
    let category;
    // 현재 페이지 매개변수가 전달되지 않아 undefine 일 떄 기본값 설정
    if (page == undefined) {
      curPage = 1;
    } else {
      curPage = page
    }
    // 카테고리 매개변수가 전달되지 않아 undefine 일 떄 기본값 설정
	if (cate === undefined) {
      category = '';
    } else {
      category = cate;
    }

	let keyword = $("input[name=keyword-list]").val();
	let filter = $("select[name=filter]").val();
	let order = $("select[name=order]").val();
	
	console.log(
		'curPage: ' + curPage
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

</script>
</head>
<body>

<!-- header -->
<%@include file="/WEB-INF/views/layout/header.jsp" %>

<main>

<!-- 카테고리 -->
<section id="category-section">
  <div class="container py-5">
    <div class="row">
      <div class="col text-center" onclick="getList()">
      <div><img src="/resources/img/project/category/all.svg" style="height: 60px"></div>
        <span>전체</span>
      </div>
      
      <c:forEach var="c" items="${cList}">
      <div class="col text-center me-4" onclick="getList('${c.categoryNo}')">
      <div><img src="/resources/img/project/category/${c.categoryNo}.svg"  style="height: 60px"></div>
        <span>${c.categoryName}</span>
      </div>
      </c:forEach>

    </div>
  </div>
</section>

<!-- 프로젝트 목록 -->
<section>

<div class="album py-5 bg-light">

  <!-- 프로젝트 목록 네비게션바 -->
  <div class="container">
    <div class="row">
      <div class="col-auto me-auto">
        <input class="form-control" list="datalistOptions" placeholder="Type to search..." name="keyword-list" value="${paramData.keyword }">
        <datalist id="datalistOptions">
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
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" style="margin: 0 auto;">

      <c:forEach var="p" items="${list}">
      <%-- 테스트 영역 --%>
      <div class="col" style="max-width: 250px;">
        <!-- 카드 영역 -->
        <div class="card shadow-sm card-section" data-projectNo="${p.projectNo}" onclick="location.href='/project/view?projectNo=${p.projectNo}'">
          <!-- 카드 이미지 -->
          <div class="section-img">
            <img src="${p.projectImage}" style="min-height: 250px;">
          </div>
          <!-- 카드 몸통 -->
          <div class="card-body section-body">
            <!-- 타이틀 영역 -->
            <div class="body-title">
              <strong>${p.projectTitle}</strong>
              <c:if test="${p.projectStep eq 4}">
                <span id="project-status">마감</span>
              </c:if>
            </div>
            <!-- 인트로 영역 -->
            <div class="body-intro">
              <p class="card-text">${p.projectIntro}</p>
            </div>
            <!-- 진행바 영역 -->
            <div class="body-progress">
              <progress value="${p.sum}" max="${p.projectPrice}"></progress>
            </div>
            <!-- 기타 정보 영역 -->
            <div class="row fs-6 body-etc">
              <div class="col d-flex">
                <span style="margin-right: 10px;"><fmt:formatNumber value="${p.sum / p.projectPrice}" type="percent"/></span>
                <span><fmt:formatNumber value="${p.projectPrice}" pattern="#,###"/></span>
              </div>
              <div class="col text-end">
                <span><fmt:formatDate value="${p.closeDate}" pattern="yy/MM/dd"/></span>
              </div>
            </div>
          </div>
        </div>
      </div>
      </c:forEach>

    </div>
  </div>

  <%-- 페이지네이션 --%>
  <div class="container">
    <!-- 페이지네이션 -->
    <div class="row justify-content-center" style="margin-top: 20px;">
      <div class="col-auto">
        <nav aria-label="Page navigation example">
          <ul class="pagination">
            <!-- 이전 -->
            <c:if test="${pagination.curPage gt 1}">
              <li class="page-item">
                <a class="page-link" href="javascript:void(0);" onclick="getList('${pagination.category}', ${pagination.curPage - 10})">
                  <span aria-hidden="true">&laquo;</span>
                </a>
              </li>
              <li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="getList('${pagination.category}', ${pagination.prevPage})">Prev</a></li>
            </c:if>

            <!-- 페이지들 -->
            <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="i">
              <c:choose>
                <c:when test="${pagination.curPage eq i }">
                  <li class="page-item active">
                    <a class="page-link" href="javascript:void(0);" onclick="getList('${pagination.category}', ${i})">${i}</a>
                  </li>
                </c:when>
                <c:otherwise>
                  <li class="page-item">
                      <%-- <a class="page-link" href="/board/list?curPage=${i}">${i}</a> --%>
                    <a class="page-link" href="javascript:void(0);" onclick="getList('${pagination.category}', ${i})">${i}</a>
                  </li>
                </c:otherwise>
              </c:choose>
            </c:forEach>

            <!-- 다음 -->
            <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.curPage lt pagination.pageCnt}">
              <li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="getList('${pagination.category}', ${pagination.nextPage})">Next</a></li>
              <li class="page-item">
                <a class="page-link" href="javascript:void(0);" onclick="getList('${pagination.category}', ${pagination.curPage + 10})">
                  <span aria-hidden="true">&raquo;</span>
                </a>
              </li>
            </c:if>

          </ul>
        </nav>
      </div>
    </div>
  </div>
  <%-- 페이지네이션 --%>

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
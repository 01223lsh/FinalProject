<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 <%@ include file="../layout/funding_header.jsp" %>

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
    height: 40px;
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
	
	location.href="/project/listsearch?curPage=" + curPage + "&keyword=" + keyword + "&category=" + category + "&filter=" + filter + "&order=" + order;
	
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
        <input class="form-control" list="datalistOptions" placeholder="Type to search..." name="keyword" value="${paramData.keyword }">
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
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" style="margin: 0 auto;">

      <%--<c:forEach var="p" items="${list}">
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
      </c:forEach>--%>
     
		
     <%--  <c:forEach var="p" items="${list}"> --%>
      <c:forEach var="p" items="${list }" begin="0" end="9" >
      <%-- 테스트 영역 --%>
      <div class="col" style="max-width: 250px;">
        <!-- 카드 영역 -->
        <div class="card shadow-sm card-section">
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

</div>

</section>
<!-- /프로젝트 목록 -->

</main>





<%@ include file="../layout/funding_footer.jsp" %>
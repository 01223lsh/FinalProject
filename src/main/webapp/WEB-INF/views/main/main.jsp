<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../layout/funding_header.jsp" %>

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

<main>

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


<!-- 프로젝트 목록 -->
<%-- <section>

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
  </div> --%>
  <!-- /프로젝트 목록 네비게션바 -->


      <%-- <c:forEach var="p" items="${list}"> --%>
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
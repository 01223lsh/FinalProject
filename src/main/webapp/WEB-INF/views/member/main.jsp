<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 <%@ include file="../layout/header.jsp" %>

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
  
  .main_pr {
  	position: absolute;
  	left : 21%;
  	
  	 
  }
  
  .main_pr span {
  	color: #39AEA9 !important;
  	width: 250px;
  	background-color: #ffffff !important;
  	 font-size: 20px !important;
  	 font-weight : bold !important;
  
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
  #carousel {
  border-top: 50px solid #ffffff;
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
// 	// 필터, 정렬 조건 유지
// 	setCondition()	
	
	
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
// function setCondition() {
//     const selectOrder = document.querySelector("select[name=order]")
//     const selectFilter = document.querySelector("select[name=filter]")

//     for (i = 0; i < selectOrder.length; i++) {
//         if (selectOrder.options[i].value == '${pagination.order}') {
//             selectOrder.options[i].selected = true
//             break
//         }
//     }
    
//     for (i = 0; i < selectFilter.length; i++) {
//         if (selectFilter.options[i].value == '${pagination.filter}') {
//         	selectFilter.options[i].selected = true
//             break
//         }
//     }
// }

</script>
</head>
<body>


<main>

<div class="container" id="carousel">
<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <a href="/project/view?projectNo=228"><img src="/resources/jpg/KakaoTalk_20220521_195002834.jpg" class="d-block w-100" alt="이미지 로드에 실패하였습니다" style="width:980px; height:300px;"></a>
      <div class="carousel-caption d-none d-md-block">
        <h5>[압생트] 왜곡을 비워내는 잔</h5>
        <p>마지막 잔에는 사물의 원래 모습을 그대로 보게 된다. 그것은 세상에서 가장 끔찍한 일이다. - Oscar Wilde -</p>
      </div>
    </div>
    <div class="carousel-item">
      <a href="/project/view?projectNo=231"><img src="/resources/jpg/KakaoTalk_20220521_195639447.png" class="d-block w-100" alt="이미지 로드에 실패하였습니다" style="width:400px; height:300px;"></a>
      <div class="carousel-caption d-none d-md-block">
        <h5>일상 속 작은 쉼, 필름 힐링엽서</h5>
        <p>C'est toujours par hasard qu'on accomplit son destin - Le Festin -</p>
      </div>
    </div>
    <div class="carousel-item">
      <a href="/project/view?projectNo=232"><img src="/resources/jpg/KakaoTalk_20220521_200629599.png" class="d-block w-100" alt="이미지 로드에 실패하였습니다" style="width:400px; height:300px;"></a>
      <div class="carousel-caption d-none d-md-block">
        <h5>「 Rêve bleu : ’푸른 꿈’이라는 뜻 」</h5>
        <p>푸른 꿈을 꾸었다. 푸른 바다와 강을 헤엄치고 푸른 숲을 걷는.</p>
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
<section>

 	  <div class="main_pr">
     <h4><span class="badge bg-secondary">주목할 만한 프로젝트</span></h4>
	  </div>
	  
	   

 <div class="album py-5">

  <div class="container">
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" style="margin: 0 auto;">


     <%--  <c:forEach var="p" items="${list}"> --%>
      <c:forEach var="p" items="${list }" begin="0" end="9" >
      <%-- 테스트 영역 --%>
      <div class="col" style="max-width: 250px;">
        <!-- 카드 영역 -->
        <div class="card shadow-sm card-section" onclick="location.href='/project/view?projectNo=${p.projectNo}'">
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




<%@ include file="../layout/footer.jsp" %>

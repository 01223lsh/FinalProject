<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../layout/header.jsp" %>

 <!-- jQuery 2.2.4 -->
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
	 -->
	<style type="text/css">
	
	/* #navbar-example { position: relative; padding: 1rem; margin: 0rem -0.75rem 0; border: solid #dee2e6; border-width: 1px 0 0; } */
 	#navbar-example { position: absolute; top: 230px; left: 25px; } 
	#scrollspy-example p { margin-bottom: 1.5em; }
	</style> 

<!-- <script type="text/javascript">
var scrollSpy = new bootstrap.ScrollSpy(document.body, {
	  target: '#navbar-example'
	})
	
var dataSpyList = [].slice.call(document.querySelectorAll('[data-bs-spy="scroll"]'))
dataSpyList.forEach(function (dataSpyEl) {
  bootstrap.ScrollSpy.getInstance(dataSpyEl)
    .refresh()
})

var firstScrollSpyEl = document.querySelector('[data-bs-spy="scroll"]')
firstScrollSpyEl.addEventListener('activate.bs.scrollspy', function () {
  // do something...
})
</script> -->


</head>
<body data-bs-spy="scroll" data-bs-target="#navbar-example">
<div id="navbar-example">

	<div class="row">
	<div class="col-4">

		<div id="list-example" class="list-group">
  			<a class="list-group-item list-group-item-action" href="#list-item-1"><span class="badge bg-secondary"> 공통</span>&nbsp;크라우드 펀딩이란?</a>
  			<a class="list-group-item list-group-item-action" href="#list-item-2"><span class="badge bg-secondary"> 펀딩 참여자</span>&nbsp;결제 및 리워드</a>
		  <a class="list-group-item list-group-item-action" href="#list-item-3"><span class="badge bg-secondary"> 펀딩 개설자</span>&nbsp;펀딩 개설 절차</a>
		</div>
	</div>


<div class="col-6">
	<div data-bs-spy="scroll" data-bs-target="#list-example" data-bs-offset="0" class="scrollspy-example" tabindex="0">

  <h3 id="list-item-1"><span class="badge bg-secondary"> 공통</span>&nbsp;크라우드 펀딩이란?</h3>
  <hr>
   <p>자금을 필요로 하는 개인이나 기업, 단체를 위해 불특정 다수(Crowd)가 온라인을 통해 자금을 모으는 활동(Funding)을 일컫습니다.</p>
   <p>누구나 아이디어를 내어 크라우드펀딩을 진행해볼 수 있고, 아이디어에 공감하는 후원자들을 통해 아이디어를 발전시킬 자금도 모을 수 있답니다.</p><br>
   <img src="/resources/jpg/guide1.jpg" style="width:750px; height:500px;"><br><br><br>
   
     <h4><span class="badge bg-secondary"> 공통</span>&nbsp;FAQ</h4><hr>
  <div class="accordion" id="accordionPanelsStayOpenExample">
  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="false" aria-controls="panelsStayOpen-collapseOne">
        <strong>[공통]&nbsp;</strong>  크라우드펀딩 개설자, 참여자(투자자)는 무엇인가요?
      </button>
    </h2>
    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne">
      <div class="accordion-body">
        <li>크라우드펀딩 개설자(진행자)는 구체화된 아이디어를 프로젝트를 만들어 소개합니다. 아이디어가 실현될 수 있도록 적극적인 프로젝트 홍보 활동과 더불어 후원자들과 지속적인 관계 맺을 수 있습니다.</li><br>
		<li>프로젝트 참여자는 다양한 프로젝트의 혁신적인 제품과 서비스를 미리 접하고 아이디어가 실현되는 과정을 직접 경험할 수 있습니다.</li>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
       <strong>[공통]&nbsp;</strong> 후원형의 진행방식은 어떤 것이 있고, 어떤 차이가 있나요?
      </button>
    </h2>
    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
      <div class="accordion-body">
        <li>후원형 크라우드펀딩은 무조건리워드(Keep it all), 성공해야 리워드 (All or nothing)방식으로 나뉠 수 있습니다.</li><br>
		<li>무조건리워드(Keep it all) 방식은 목표금액 달성여부와 관계없이 참여와 동시에 결제가 이뤄지며(가상계좌는 별도 입금 필요), 참여자는 예정된 리워드를 받을 수 있습니다.</li><br>
		<li>반면, 성공해야 리워드(All or nothing)방식은 목표금액에 100% 달성되어야만 마감일 이후 예약 결제, 결제 완료된 참여자에게는 리워드가 제공됩니다. (예약 결제로 카드결제만 가능) 목표금액 미 달성 시 예약 결제 자동 취소, 리워드 제공이 불가합니다.</li><br>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
        <strong>[공통]&nbsp;</strong> 회원가입을 해야만 참여(투자)할 수 있나요?
      </button>
    </h2>
    <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
      <div class="accordion-body">
      <li>펀딩은 온라인 크라우드펀딩 플랫폼이기 때문에 회원가입을 필수로 하셔야만 참여(투자)가 가능하며 기존에 네이버와 페이스북 등의 계정이 있으시다면 별도의 이메일 인증단계를 거치지 않는 상대적으로 간편한 SNS 회원가입 및 로그인을 이용해주세요.</li>
      </div>
    </div>
  </div>
</div>
   <br><br>
  <h3 id="list-item-2"><span class="badge bg-secondary"> 펀딩 참여자</span>&nbsp;결제 및 리워드</h3><br><br>
  
  <h4>결제</h4><hr>
  <ul style="list-style-type: decimal;">

  	<li>‘참여하기’ 버튼 혹은 금액대별 리워드 선택</li><br>
	<li>결제 방식 선택 후 리워드 수령자 정보 입력</li><br>
	<li>결제 진행(가상계좌의 경우 별도의 입금 절차 진행)</li><br>
	<li>참여 완료창 확인(참여 완료 문자 및 메일 확인)</li>
	</ul><br>
 
 	<h4>리워드</h4><hr><br>
	<h5>1. 리워드 배송 시기</h5><br>
	<li>크라우드펀딩플랫폼은 쇼핑몰이 아닙니다. 리워드는 프로젝트 개설자가 약속한 기간에 배송이 진행됩니다.</li><br>
	<li>배송이 시작된 프로젝트는 마이페이지▶참여 프로젝트 ▶ 상세보기에서 배송형인 경우 송장번호로 배송조회가 가능하며, 배송형이 아닌 경우 제공여부 확인이 가능합니다.</li><br>
	<li>프로젝트 개설자가 약속한 기간에 배송이 되지 않는다면 1차적으로 프로젝트 개설자에게 문의해주세요. 참여한 프로젝트 개설자에게 메시지 혹은 프로필 내 연락처로 문의해주세요.</li>
	<br>
	
	<h5>2. 리워드 변경</h5><br>
	<li>다른 금액대의 리워드로 변경하고 싶다면 환불 및 결제 취소 후에 원하는 금액대의 리워드를 다시 선택하여 결제하면 됩니다.</li><br>
	<li>한번 선택한 리워드 옵션은 변경이 불가합니다. 변경이 필요하다면 환불 및 결제 취소 후에 재참여하시거나 프로젝트 개설자에게 별도로 문의해주세요.</li><br>
	<li>리워드 수령지, 수령자 정보 변경을 원하시면 마이페이지 ▶ 참여 프로젝트 ▶ 자세히 보기 ▶ 배송지 수정을 통해 변경하세요.</li>
	<br><br><br>
	<h4><span class="badge bg-secondary"> 펀딩 참여자</span>&nbsp;FAQ</h4><hr>
  <div class="accordion" id="accordionPanelsStayOpenExample">
  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingFour">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseFour" aria-expanded="true" aria-controls="panelsStayOpen-collapseFour">
        <strong>[결제]&nbsp;</strong>  결제 완료는 어떻게 하나요?
      </button>
    </h2>
    <div id="panelsStayOpen-collapseFour" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingFour">
      <div class="accordion-body">
      <li>가상계좌 입금의 경우 입금계좌번호는 이메일 및 문자로로 안내됩니다. 계좌 확인 후 가상계좌 유효기간 내에 입금하면 참여가 완료됩니다.</li>
		<li>기타 카드결제, 실시간이체의 경우는 참여와 함께 결제가 진행되며, 참여자응원글과 마이페이지-참여 프로젝트 목록에 프로젝트 정보가 보인다면 정상적으로 결제가 완료된 상태입니다.</li><br>
      	<li>카드예약결제로 진행되며, 참여 프로젝트 마감일 기준 목표금액 100% 이상 도달 해야지만 결제가 진행됩니다. 1차 결제는 마감일 +2일차 오전에 진행되며 카드잔액 부족 및 카드번호 불일치로 결제가 되지 못 할 경우 1차 결제 후 최대 5일간 재결제가 이뤄집니다.</li><br>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingFive">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseFive" aria-expanded="false" aria-controls="panelsStayOpen-collapseFive">
       <strong>[결제]&nbsp;</strong> 후원형의 진행방식은 어떤 것이 있고, 어떤 차이가 있나요?
      </button>
    </h2>
    <div id="panelsStayOpen-collapseFive" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingFive">
      <div class="accordion-body">
		<li>목표금액 달성여부와 관계없이 참여와 동시에 결제가 이뤄지며(가상계좌는 별도 입금 필요), 참여자는 예정된 리워드를 받을 수 있습니다.</li><br>
		<li>반면, 성공해야 리워드(All or nothing)방식은 목표금액에 100% 달성되어야만 마감일 이후 예약 결제, 결제 완료된 참여자에게는 리워드가 제공됩니다. (예약 결제로 카드결제만 가능) 목표금액 미 달성 시 예약 결제 자동 취소, 리워드 제공이 불가합니다.</li>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingSix">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseSix" aria-expanded="false" aria-controls="panelsStayOpen-collapseSix">
        <strong>[결제]&nbsp;</strong> 입력한 신용(체크)카드정보를 변경하고 싶은데 어떻게 하나요?
      </button>
    </h2>
    <div id="panelsStayOpen-collapseSix" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingSix">
      <div class="accordion-body">
      <li>펀딩 마이페이지 ▶ 지불정보 설정 페이지에서 지불정보(카드번호)를 변경할 수 있습니다.</li><br>
      <li>프로젝트에 참여했는데 입력한 카드에서 출금이 실패되었다면 펀딩 마감일 +2일부터 5일간 결제를 다시 진행합니다. 펀딩 마감 후 결제가 진행되지 않은 경우 지불정보를 확인하여 변경하실 수 있습니다.</li><br>
      <li>등록된 지불정보 삭제를 원할 경우 지불정보 설정페이지에서 '지불정보 삭제'를 클릭해주세요. 결제 대기중인 프로젝트가 없는 경우, 예약결제실패의 경우는 결제 재요청기간 이후에 지불정보 삭제가 가능합니다.</li>
      </div>
    </div>
  </div>
 <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingSeven">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseSeven" aria-expanded="false" aria-controls="panelsStayOpen-collapseSeven">
        <strong>[결제]&nbsp;</strong> 참여 및 결제 취소는 어떻게 하나요?
      </button>
    </h2>
    <div id="panelsStayOpen-collapseSeven" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingSeven">
      <div class="accordion-body">
      <li>펀딩기간 내 마이페이지 ▶ 참여 프로젝트에서 ‘결제 취소하기’ 버튼을 클릭합니다.</li><br>
      <li>카드결제의 경우 당일 결제 후 취소에는 즉시환불 되며 결제일 이후 취소할 경우 영업일 기준 3~5일이 소요될 수 있습니다. 카드와 계좌이체 결제의 경우 결제 계좌로 환불이 이뤄지며 가상계좌의 경우 오마이컴퍼니 가상잔고로 환불 금액이 입금됩니다. 가상잔고로 입금된 금액은 다른 프로젝트 참여 시 결제금으로 사용가능하며, 출금신청을 할 경우 회원 계좌로 환불 처리됩니다.</li><br>
		<li>결제 취소는 펀딩종료일 1일 전까지 가능하며, 펀딩종료일 당일 및 펀딩마감 이후에는 취소가 불가능합니다. 또한 펀딩기간 중 리워드가 배송된 경우에도 취소가 불가능하오니 이 점 양해바랍니다. </li><br>
      	<li>펀딩기간 내 리워드가 배송되는 프로젝트에 참여 시 마이페이지▶ 참여 프로젝트▶ 상세보기 클릭 후 배송이 시작되어 송장번호가 입력되어 있거나, 제공완료 상태라면 결제 취소가 불가능합니다.</li>
    </div>
  </div>
</div>
 <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingEight">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseEight" aria-expanded="false" aria-controls="panelsStayOpen-collapseEight">
        <strong>[결제]&nbsp;</strong> 참여 및 결제한 영수증이 필요합니다.
      </button>
    </h2>
    <div id="panelsStayOpen-collapseEight" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingEight">
      <div class="accordion-body">
      <li>[카드결제 참여] 영수증(카드매출전표)은 직접 결제시 이용한 카드사에서 결제내역조회를 통해 확인하시기 바랍니다.</li><br>
      <li>[현금결제 참여] 오마이컴퍼니는 크라우드펀딩 중개업자로서 펀딩금은 펀딩수수료를 제외하고 프로젝트 개설자에게 전달합니다. 따라서 펀딩에서는 직접 현금영수증을 발급하지 않으며 필요시엔 프로젝트 개설자에게 문의 바랍니다.</li>
    </div>
  </div>
</div>
<div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingNine">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseNine" aria-expanded="false" aria-controls="panelsStayOpen-collapseNine">
        <strong>[리워드]&nbsp;</strong> 리워드는 언제 배송되나요?
      </button>
    </h2>
    <div id="panelsStayOpen-collapseNine" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingNine">
      <div class="accordion-body">
      <li>크라우드펀딩은 쇼핑몰이 아닙니다. 프로젝트가 성공하여 리워드가 준비될 때까지는 시간이 걸릴 수 있습니다. 리워드는 프로젝트 개설자가 약속한 기간에 배송이 진행됩니다. 마이페이지▶ 참여프로젝트▶ 자세히보기▶ 주문상품정보에 배송 예정일을 확인해주세요.</li><br>
      <li>배송이 시작된 프로젝트는 마이페이지▶ 참여프로젝트▶ 자세히보기▶ 주문내역에서 배송형인 경우 송장번호로 배송조회가 가능하며, 배송형이 아닌 경우 제공여부를 확인할 수 있습니다.</li>
    </div>
  </div>
</div>
<div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingTen">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTen" aria-expanded="false" aria-controls="panelsStayOpen-collapseTen">
        <strong>[리워드]&nbsp;</strong> 리워드를 변경하고 싶어요.
      </button>
    </h2>
    <div id="panelsStayOpen-collapseTen" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTen">
      <div class="accordion-body">
      <li>다른 금액대의 리워드로 변경하고 싶다면 환불 및 결제 취소 후에 원하는 금액대의 리워드를 다시 선택하여 결제하면 됩니다.</li><br>
      <li>리워드 수령지, 수령자 정보 변경을 원하시면 마이페이지▶ 참여 프로젝트▶ 자세히 보기▶ 배송지 수정을 통해 변경해주세요. 변경을 원하시는 시점이 참여한 프로젝트의 리워드 배송이 이미 시작된 것 같다면 프로젝트 개설자에게 별도로 문의해주세요.(해당 프로젝트 리워드 제공 예정일 확인)</li>
    </div>
  </div>
</div>
   <br><br><br>
	
  <h3 id="list-item-3"><span class="badge bg-secondary"> 펀딩 개설자</span>&nbsp;펀딩 개설 절차</h3><br><br>
  
  <h4>프로젝트 신청</h4><hr><br>
  <h5>1) 신청하기 전, 체크리스트</h5><br>
  <ul style="list-style-type: square;">

  	<li>참여자 분들에게 제공할 리워드(제품 or 서비스)가 구체적으로 준비되어 있다</li><br>
	<li>리워드와 관련한 소개 글과 사진, 영상 자료가 충분히 준비되어 있다</li><br>
	<li>프로젝트를 진행하는 목적과 동기가 분명하고, 이를 잘 설명할 수 있다</li>
	</ul><br>

	<h5>2) 프로젝트 기간 및 목표금액 설정</h5><br>
	<h5>기간</h5><br>
	
  <p>많은 분들이 보통 30일에서 40일 사이의 기간을 설정하고 있으며, 최대 90일까지 설정 가능합니다. 준비 기간 내 피드백 반영까지 고려하여 여유 있게 프로젝트 시작일정을 설정해 주시고,프로젝트 및 정산 상황에 따라 적절한 마감일정을 설정해 주세요. 오랫동안 진행한다고 해서 프로젝트가 반드시 성공하는 것은 아닙니다.</p>
   <img src="/resources/jpg/guide_2.JPG" style="width:750px; height:200px;"><br><br>
 
 	<h5>목표금액</h5><br>
	
	<p>목표금액은 프로젝트 성공기준을 나눌 수 있는 중요한 지표로, 어떻게 설정하느냐에 따라 프로젝트 성공과 실패를 나눌 수 있는 기준이 되며 목표금액을 설정하는 기준은 크게 아래 2가지로 나뉠 수 있습니다.</p>   
 
 	<h5>1. 프로젝트를 실행하기 위한 필요한 대략적인 예산에 따라 목표금액 설정</h5><br>
	
 	 <ul style="list-style-type: upper-roman;">

  	<li>프로젝트를 실행하기 위해 최소 어느정도의 금액이 필요한지 계산하기 위해선 먼저 최소제작(진행)수량을 파악합니다.</li><br>
	<li>리워드로 제공할 상품의 제작 및 배송비(×수량)를 계산합니다.</li><br>
	<li>프로젝트를 담당하는 개설자의 인건비를 계산합니다.</li><br>
	<li>외 추가 참여금액이나 리워드 없이 펀딩등 프로젝트 모집금액을 사용할 개발 및 개선비를 계산합니다.</li><br>
	<li>기타 최종 결제 실패 금액, 교환 및 환불을 필요로 하는 경우 예상되는 금액등 예비 비용을 리워드 제작에 필요한 금액의 10% 내외로 계산합니다.</li><br>
	<li>위 금액을 합산한 금액으로 목표금액을 설정하실 수 있습니다.</li>
	</ul><br>
 
 	<h5>2. 프로젝트 참여가 예상되는 인원에 따라 목표금액 설정</h5><br>
  	<p>프로젝트를 진행한다는 것을 알리면 내 주변에 참여 가능한 인원을 예상해볼 수 있습니다.</p>
   <img src="/resources/jpg/guide3.JPG" style="width:750px; height:500px;"><br><br>
  
  <h5>3) 프로젝트 스토리 구성</h5><br>

	<h5>이름</h5><br>
  	<li>먼저 프로젝트의 이름을 지어주세요. 리워드로 제공되는 제품이나 서비스의 이름도 좋아요. 꼭 멋지고 대단한 이름이 아니더라도 괜찮습니다. 이름을 지어주는 것 만으로도 나의 프로젝트는 세상에 나갈 준비를 마쳤답니다.</li><br>
  	
  	<h5>제목</h5><br>
  	<li>프로젝트의 제목은 한눈에 알아볼 수 있도록 만드는 것이 좋습니다. 위에서 이름을 만들었다면, 이름에 설명하는 문구만 추가해도 제목으로 활용할 수 있습니다. 즉, 「프로젝트의 핵심 내용+이름」이라고 할 수 있겠죠.하지만 정답이 있는 것은 아니에요! 개설자님만의 개성이 담긴 멋진 제목을 만들 수도 있어요.</li><br>
  	
  	<h5>스토리</h5><br>
	<li>프로젝트 스토리를 적는 일은 생각보다 어렵지 않아요. 아래 네 가지 질문에 대답하다 보면 자연스럽게 개설자님만의 이야기가 완성될 거에요. 단순히 정보를 전달하기보다는 누군가와 이야기한다는 느낌으로 글을 쓴다면 더 좋을 거예요.</li><br>  
    <ul style="list-style-type: none;">
  	<h6><strong>Q1. 이 프로젝트는 어떻게 기획하게 되었나요?</strong></h6>
	<li>프로젝트를 기획하게 된 계기와 이유를 소개해주세요. 크고 거창한 계기가 아니어도 괜찮습니다. 누구나 공감할 만한 주제와 계기라면 그걸로 충분합니다.</li><br>  
  
  	<h6><strong>Q2. 모집된 돈은 언제 어떻게 사용되나요?</strong></h6>
	<li>펀딩을 통해 모은 자금을 어떻게 사용할 예정인지 구체적으로 소개해주세요. 일정과 항목별 자금 사용 계획이 있다면 더 좋아요.</li><br>  
  	
  	<h6><strong>Q3. 참여자에게는 어떤 리워드를 제공하나요?</strong></h6>
	<li>프로젝트에 참여해 주신 분들에게 보낼 리워드를 자세히 소개해주세요. 사진이나 영상자료를 적극 활용한다면 더욱 좋답니다.</li><br>  
 
 	<h6><strong>Q4. 이 프로젝트의 개설자는 누구인가요?</strong></h6>
	<li>참여자들은 프로젝트가 누구의 손에서 탄생했는지 궁금해 할거에요. 개설자님 혹은 프로젝트팀을 소개해주세요. 위의 Q1과 묶어서 한번에 소개해도 좋습니다.</li><br>  
 	<h5>4) 프로젝트 리워드 설계</h5><br>
 	<p>같은 리워드라도 어떻게 설계하느냐에 따라 다른 결과를 가져올 수 있답니다. 리워드를 설계하는 기본 축은 가격과 구성이에요. 어떤 가격에 어떤 구성의 리워드를 제공할지 먼저 결정하고 난 후, 그에 적절한 이미지 자료와 선택 가능한 옵션을 설정하는 것이 더욱 효과적이랍니다.</p><br>
  
  	<h5>가격</h5><br>
	<li>리워드의 가격은 최소 1,000원부터 100만원 이상도 가능합니다. 다양한 가격대 중 나의 프로젝트와 리워드에 맞는 금액대는 얼마일까요? 크라우드펀딩은 단기간 이벤트성으로 진행하는만큼 앞서 설정한 목표금액과 주요 타겟을 고려해 적절한 리워드 가격을 설정해보세요.</li><br>  
  	
  	<h5>구성</h5><br>
	<p>리워드의 가격은 최소 1,000원부터 100만원 이상도 가능합니다. 다양한 가격대 중 나의 프로젝트와 리워드에 맞는 금액대는 얼마일까요? 크라우드펀딩은 단기간 이벤트성으로 진행하는만큼 앞서 설정한 목표금액과 주요 타겟을 고려해 적절한 리워드 가격을 설정해보세요.</p><br>  
 
 	<h6>- 리워드 옵션</h6><br>
 	<li>종류, 디자인, 색상, 사이즈 등 참여자가 직접 선택할 수 있는 다양한 옵션을 제공하세요. 펀딩 결제 시 리워드 옵션에 입력 가능하도록 되어 있답니다.</li><br>
  	
  	<h6>- 얼리버드 혜택</h6><br>
 	<li>크라우드펀딩은 오픈 초반에 확산시키는 것이 중요합니다. 얼리버드 참여자를 위한 리워드를 설계해 오픈 직후 참여를 이끌어보세요. 얼리버드 혜택으로는 선착순 한정 특별 리워드를 제공할 수도 있고, 선착순 한정 특별 할인가로 제공하는 방법도 있습니다.</li><br>
  	
  	<h5>배송일정</h5><br>
  	<li>리워드 제작과 배송작업 등의 일정을 고려해 실제로 참여자가 리워드를 받아볼 수 있는 일정을 공지해 주세요. 또한 배송 방법, 배송비, 배송업체, 배송관련 문의를 할 수 있는 연락처를 함께 적어주세요. 정확하고 꼼꼼한 배송정책이 참여자에게 신뢰를 주어 더욱 성공적인 프로젝트로 이어질 수 있답니다.</li><br>
  	
  	<h5>환불 및 교환정책</h5><br>
  	<li>환불 및 교환정책은 리워드 수령에 관한 예상치 못한 문제가 발생하였을 때 대응하기 위해 꼭 필요합니다. 오마이컴퍼니 플랫폼 기본 정책에서 프로젝트를 진행하는 개설자분이 프로젝트에 맞게 일부 수정하여 정책을 세우실 수 있습니다.</li><br>
 
 	<h5>플랫폼 기본 정책</h5><br>
 	<h5>공통</h5><br>
  	<li>환불은 펀딩종료일 1일 전까지 가능하며, 펀딩종료일 당일 및 펀딩마감 이후에는 환불이 불가능합니다. 또한 펀딩기간 중 리워드가 배송된 경우에도 환불이 불가능하오니 이 점 양해해주세요.</li><br>
  	<li>펀딩 종료일 이후 단순 변심으로 인한 환불 및 교환은 불가능합니다.</li><br>
  	<li>지속적인 리워드 배송 지연 및 개설자의 개인적인 사유로 리워드 제공이 이루어지지 않는 경우 개설자가 직접 참여자의 환불계좌를 받아 참여금액의 100%를 환불해드리겠습니다.</li><br>
  	<li>환불 및 교환 관련 문의가 있을 시 프로젝트 상단 'Q&A'에 질문을 등록해주세요.</li><br>
 	
 	<h5>제품형 리워드</h5><br>
  	<li>파손, 불량품 수령 시 00일 이내로 교환이 가능하며, 이 경우 발생하는 배송비는 개설자가 부담합니다.</li><br>
  	<li>참여자의 배송지 기재 오류, 참여자가 개설자에게 사전 고지 없이 배송지를 수정해 배송사고가 발생할 경우, 재 발송에 따른 배송비 부담은 참여자에게 있습니다.</li><br>
 
 	<h5>서비스형 리워드</h5><br>
  	<li>현장수령을 원칙으로 할 시, 참여자 외 제 3자에게 양도가 가능/불가능 합니다.</li><br>
  	<li>현장수령을 원칙으로 할 시, 펀딩 참여 후 현장수령이 불가능 하다고 판단되면 환불 가능/불가능 합니다.(불가능 시 다른 대체 제품 배송 가능 여부)</li><br>
 
 	<h5>사진</h5><br>
 	<p>리워드를 구체적으로 설계했다면 이제 소개할 일만 남았습니다. 사진이나 동영상같은 다양한 이미지 자료를 활용해 참여자들에게 리워드를 자세히 설명해주세요.</p><br>
 	
 	<h6>-제품 리워드</h6><br>
 	<p>제품을 다양한 각도에서 찍어주세요. 제품을 자세하게 살펴볼 수 있는 이미지부터 실제 그 제품을 사용하는 이미지까지 사진은 다양하게 준비하는 것이 좋습니다.</p><br>
 	
 	<h6>-체험형 서비스 리워드</h6><br>
 	<p>제품 리워드와는 달리 형태가 없는 리워드라도 서비스를 체험하는 사진이나 동영상으로 표현해보세요. 혹은 서비스나 체험 내용을 쿠폰형 이미지로 만드는 것도 좋은 방법이에요.</p><br>
 	
 	<h5>후기</h5><br>
 	<p>제품을 이미 사용해본 사람들의 후기가 있다면 적극 활용해주세요. 없다면 주변의 친구나 지인에게 부탁해도 좋아요. 펀딩 진행 중에 리워드를 제공하는 프로젝트라면, 먼저 리워드를 받아보시는 참여자 분들께 후기를 요청하는 것도 좋은 방법입니다</p><br>
 	
  	<h5>이벤트</h5><br>
 	<p>크라우드펀딩을 통해 다양한 이벤트를 기획해볼 수 있습니다. 펀딩 중에는 참여자 대상 혹은 프로젝트를 널리 알려주는 분들을 대상으로, 펀딩 종료 후에는 리워드 수령 이후 피드백을 받아볼 수 있는 창구로 이벤트를 활용할 수 있습니다.</p><br>
 	
 	<h3>프로젝트 심사</h3><hr><br>
 	<h4>1) 프로젝트 심사 내용</h4><br>
 	<li>크라우드펀딩은 단순 자금 조달을 넘어 대중과 소통하며 대중의 공감을 얻는 과정입니다. 심사 가이드는 개설자님의 펀딩 프로젝트가 더 많은 사람들의 공감과 후원을 받을 수 있도록 도와드리기 위한 것이니 조금 시간이 걸리더라도 심사 가이드를 꼼꼼히 확인해보시고 프로젝트를 준비해주세요.</li><br>
 	
 	<h4>1) 프로젝트 심사 기간</h4><br>
 	<li>프로젝트 신청 후 프로젝트 검토는 영업일 기준 3~5일이 소요됩니다. 접수된 프로젝트는 프로젝트 매니저가 검토 후 진행이 가능한지 확인합니다. 피드백은 회원가입 및 프로젝트 신청 시 기입한 이메일로 발송됩니다</li><br>
 	<li>프로젝트 심사와 피드백 반영을 고려한 통상적으로 프로젝트 신청 후 오픈까지는 1~2주가 소요됩니다. 희망하시는 프로젝트 오픈 시점을 고려하여 프로젝트를 미리 준비해주세요.</li><br>
 	
 	<h3>펀딩 진행</h3><hr><br>
 	<h4>1) 프로젝트 운영</h4><br>
 	<li>개설자 정보: 개설자의 이메일, 연락처, SNS 주소 등 변경이 필요할 때 수정합니다.</li><br>
 	<li>프로젝트관리: 참여자 응원글에 댓글, Q&A에 답변, 최근소식에 게시물을 업로드 합니다.
최근 소식은 참여자가 궁금해 하는 질문만 모은 글 / 프로젝트 및 리워드 제작 과정/ 펀딩 달성률에 관한 감사 인사/ 리워드 배송 안내/ 펀딩금 사용내역 보고 등을 업로드 하여 꾸준히 참여자분들과 소통해주세요.</li><br>
	<li>통계: 일별, 리워드별, 결제수단별 참여수와 금액을 확인할 수 있습니다.</li><br>
	<li>참여/투자자 정보: 리워드 배송을 위한 참여자 정보를 확인하고, 메시지보내기 기능을 통해 배송안내를 할 수 있습니다.</li><br>
 	<li>정산: 정산 서류 확인이 가능하며, 정산 완료 시 정산서 파일 다운로드가 가능합니다.</li><br>
 	<li>리워드 제공관리: 약속한 리워드 제공일에 맞추어 리워드 제공여부를 관리합니다. 배송형 리워드라면 택배사와 송장번호를, 배송형 리워드가 아닌 경우엔 제공여부를 체크합니다.</li><br>
 	
 	<h4>2) 프로젝트 홍보</h4><br>
 	<li>SNS를 활용하여 많은 사람들에게 프로젝트를 공유하세요.</li><br>
 	<li>발급받은 포인트가 있다면 포인트를 활용하여 홍보를 할 수 있습니다.</li><br>
 	
 	<h3>정산 및 리워드 배송</h3><hr>
 	<h4>1) 정산 시기</h4><br>
 	<li>프로젝트 마감일 이후 7~10일 이내로 수수료를 제외한 실제 정산되는 금액과 전체 참여자 정보가 포함된 정산서를 이메일로 전달합니다.</li><br>
 	<li>정산서 확인 회신 및 정산서류 전달 시점 익일 이후 매주 화, 목요일 정산이 진행됩니다.</li><br>
 	<li>정산 전 리워드 배송이 필요하다면 개설자 전용 페이지 ▶ 참여/투자자 정보, 리워드 제공관리 참여정보에서 결제 완료한 분들의 정보 확인이 가능합니다.</li><br>
 	<li>프로젝트 신청 시 업로드 한 정산 계좌로 정산이 됩니다. 정산 계좌 변경이 필요하다면 02-388-2556번으로 연락주시기 바랍니다.</li><br>
 	
 	<h4>2) 리워드 배송</h4><br>
 	<li>약속한 기간 내 배송이 시작되면 참여자분에게 메일 또는 문자로 배송안내를 하세요.</li><br>
 	<li>배송된 리워드는 개설자 전용 페이지 ▶ 리워드 제공관리에서 배송형 리워드인 경우 택배사와 송장번호를 입력하며, 배송형 리워드가 아닌 경우 제공여부를 체크하여 저장합니다.</li><br>
 	<li>리워드 배송 완료 후(서비스의 경우 제공 완료 후) 오마이컴퍼니에 펀딩 후기를 전달해 주세요. 펀딩 후기는 오마이컴퍼니 메인 내 인터뷰 카테고리와 SNS 등에 업로드될 예정이며, 프로젝트 내용과 개설자에 대하여 2차적인 홍보 효과를 누릴 수 있습니다.</li><br><br>
 	
 	
  	
 <h4><span class="badge bg-secondary"> 펀드 개설자</span>&nbsp;FAQ</h4><hr>
    <div class="accordion" id="accordionPanelsStayOpenExample">
  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingEleven">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseEleven" aria-expanded="true" aria-controls="panelsStayOpen-collapseEleven">
        <strong>[프로젝트 신청]&nbsp;</strong>  프로젝트 내용에 들어가는 컨텐츠에 제한이 있나요?
      </button>
    </h2>
    <div id="panelsStayOpen-collapseEleven" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingEleven">
      <div class="accordion-body">
      <li>프로젝트 내용에 들어가는 이미지는 고화질의 실사 이미지 혹은 컨셉 사진을 지향합니다.</li><br>
      <li>폰트와 이미지는 저작권이 있으므로 무료 폰트와 이미지 위주로 사용하여 주세요.</li><br>
      <li>기사, 영상 등 인터넷에서 첨부한 자료도 저작권이 있으므로 저작권자에게 사용 가능 여부 확인 후 꼭 출처를 명확히 밝혀주시기 바랍니다.</li><br>
      <li>프로젝트 내용에 대한 저작권 관련된 분쟁이 있을 시 프로젝트 개설자에게 법적책임이 있습니다.</li>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingTwelve">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwelve" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwelve">
       <strong>[프로젝트 신청]&nbsp;</strong>사회적경제나 가치에 대한 내용과 관련된 프로젝트만 진행할 수 있나요?
      </button>
    </h2>
    <div id="panelsStayOpen-collapseTwelve" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwelve">
      <div class="accordion-body">
		<li> 아닙니다. 사회적 가치를 지니고 있지 않은 제품 및 서비스 중심의 프로젝트도 진행할 수 있습니다. 단, 제품 및 서비스에 대한 스토리(프로젝트 개설 동기)가 충분히 안내되어야 합니다. 단순히 자금 조달을 목적으로 하는 것이 아닌 대중들이 충분히 공감할 수 있는 스토리로 구성해 주세요.</li>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingThirteen">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThirteen" aria-expanded="false" aria-controls="panelsStayOpen-collapseThirteen">
        <strong>[프로젝트 신청]&nbsp;</strong> 목표금액을 얼마나 설정해야할지 모르겠어요.
      </button>
    </h2>
    <div id="panelsStayOpen-collapseThirteen" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThirteen">
      <div class="accordion-body">
      <li>평균적으로 50만원에서 300만원 이내의 목표금액을 많이 설정하고 계십니다. 단, 이는 평균적인 금액이며 진행하시려는 프로젝트에 따라 목표금액은 달라집니다. 1천만원 이상의 목표금액을 설정하실 예정이라면 구체적인 사용계획(항목별 비용 및 사용일정)을 나타내어 해당 목표금액의 설정 이유를 명확히 안내해주세요.</li><br>
      <li>설정가능한 최대 목표금액은 없습니다. 다만 펀딩방식을 성공해야리워드(All or nothing)방식으로 진행하신다면 목표금액 미달 시 (예약)결제가 이뤄지지 않으므로 프로젝트를 진행할 수 없게 됩니다. 진행하시려는 프로젝트의 모든 금액을 크라우드펀딩으로 조달하려 하기보다는 작은 규모의 프로젝트부터 시작하여 여러 차례 프로젝트를 진행해보시는 것을 권장드립니다.</li><br>
      <li>목표금액을 달성한 후에도 마감일까지 계속해서 추가 모집을 할 수 있습니다.</li>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingFourteen">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseFourteen" aria-expanded="true" aria-controls="panelsStayOpen-collapseFourteen">
        <strong>[펀딩 진행]&nbsp;</strong> 펀딩 진행 기간 중에 프로젝트 내용과 리워드를 변경하고 싶어요.
      </button>
    </h2>
    <div id="panelsStayOpen-collapseFourteen" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingFourteen">
      <div class="accordion-body">
      <li>펀딩이 시작되면 목표 금액, 리워드, 진행 방식 등은 변경할 수 없지만 프로젝트 내용 일부, 대표 이미지, 영상은 수정할 수 있습니다. 수정사항이 있으신 경우 오마이컴퍼니 관리자문의 혹은  이메일(reward@ohmycompany.com)로 전달해 주시기 바랍니다.</li><br>
      <li>프로젝트 변경 내용과 관련하여 참여자 입장에서 인지해야할 내용이 있다면, 마이페이지▶개설 프로젝트▶ 개설자전용페이지 이동▶ 프로젝트 관리▶ 최근소식에 해당 내용을 등록하여 다시한번 안내해주세요. 최근소식에 게시물 등록 시 기존 참여자분들에게 카카오톡 알림톡으로 알림이 갑니다.</li>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingFifteen">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseFifteen" aria-expanded="false" aria-controls="panelsStayOpen-collapseFifteen">
       <strong>[펀딩 진행]&nbsp;</strong> 프로젝트 참여 시 결제가 잘 되지 않는다는 문의가 있어요.
      </button>
    </h2>
    <div id="panelsStayOpen-collapseFifteen" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingFifteen">
      <div class="accordion-body">
		<li> 로그인▶ 마이페이지▶ 관리자문의 혹은 1:1 문의를 통해 정확히 어떤 단계에서 결제가 되지 않았는지 기재해주시면 신속히 답변 드리겠습니다.</li>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingSixteen">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseSixteen" aria-expanded="false" aria-controls="panelsStayOpen-collapseSixteen">
        <strong>[정산]&nbsp;</strong> 약속된 기간 내에 리워드 배송을 하지 못하면 어떻게 하나요?
      </button>
    </h2>
    <div id="panelsStayOpen-collapseSixteen" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingSixteen">
      <div class="accordion-body">
      <li> 배송일이 지연될 경우, 배송 예정일 전에 참여자 분들에게 양해의 메시지(메일, 문자 등)을 보내주시거나, 마이페이지▶개설 프로젝트▶ 개설자전용페이지 이동▶ 프로젝트 관리▶ 최근소식에 해당 내용을 등록하여 안내해주세요. 최근소식에 게시물 등록 시 기존 참여자분들에게 카카오톡 알림톡으로 알림이 갑니다.</li><br>
      <li>부득이하게 배송이 계속 지연되거나 리워드 제공이 불확실한 경우, 프로젝트 개설자가 참여자 분들에게 환불 계좌를 받아 펀딩 금액의 100%를 직접 환불해주어야 합니다.
      </li><br>
      <li>기본적으로 리워드 배송에 대한 법적 책임은 프로젝트 개설자에게 있습니다.</li>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingSeventeen">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseSeventeen" aria-expanded="false" aria-controls="panelsStayOpen-collapseSeventeen">
       <strong>[공통]&nbsp;</strong> 후원형의 진행방식은 어떤 것이 있고, 어떤 차이가 있나요?
      </button>
    </h2>
    <div id="panelsStayOpen-collapseSeventeen" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingSeventeen">
      <div class="accordion-body">
        <li>후원형 크라우드펀딩은 무조건리워드(Keep it all), 성공해야 리워드 (All or nothing)방식으로 나뉠 수 있습니다.</li><br>
		<li>무조건리워드(Keep it all) 방식은 목표금액 달성여부와 관계없이 참여와 동시에 결제가 이뤄지며(가상계좌는 별도 입금 필요), 참여자는 예정된 리워드를 받을 수 있습니다.</li><br>
		<li>반면, 성공해야 리워드(All or nothing)방식은 목표금액에 100% 달성되어야만 마감일 이후 예약 결제, 결제 완료된 참여자에게는 리워드가 제공됩니다. (예약 결제로 카드결제만 가능) 목표금액 미 달성 시 예약 결제 자동 취소, 리워드 제공이 불가합니다.</li>
      </div>
    </div>
  </div>
  
 
  </div>
  </div>
  </div>
  </div>
		
</div>
</div>
</div>
</body>
</html>










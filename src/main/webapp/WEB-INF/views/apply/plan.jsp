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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!--  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" /> -->
<style type="text/css">

body {
	margin: 0;
	height: 100%;
}

input::placeholder {
	color: rgb(200, 200, 200);
}

textarea::placeholder {
	color: rgb(200, 200, 200);
}

.editor_top {
	background: rgb(255, 255, 255);
}

.projectEditor {
	background: rgb(252, 252, 252);
}

.top_nav {
	position: fixed;
    top: 0px;
    z-index: 100;
    width: 100%;
    height: 60px;
    background: rgb(255, 255, 255);
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    padding: 0px 16px;
    box-shadow: none;
    transform: translateY(0px);
}

.top_nav_in {
 	width:1080px; 
	height: 100%;
    margin: 0px auto;
    display: flex;
    justify-content: space-between;
    position: relative;
}

.top_nav_button {
	position: relative;
    z-index: 1;
    display: flex;
    align-items: center;
}

.submit_button {
	font-weight: 500;
    background: rgb(248, 100, 83);
    align-items: center;
    display: inline-flex;
    width: 112px;
    height: 40px;
    color: rgb(255, 255, 255);
    justify-content: center;
    font-size: 12px !important;
    line-height: 20px !important;
    cursor: pointer;
    white-space: nowrap;
    border-radius: 4px;
    margin: 0px;
    border: 0px;
    outline: none;
    border-radius: 4px;
    margin: 0px;
    border: 0px;
    outline: none;
}



.editor_topContent{
	margin: 64px auto 0px;
	display: block;
}

.editor_title {
	padding: 39px 15px 21px;
	margin: 0px auto;
	width:1080px;
	font-weight: 700;
	font-size: 32px;
	line-height:44px;
}

.editor_shadow {
	width:auto;
	box-shadow: 0 4px 7px -4px rgb(230, 230, 230);
	margin: 0px;
	padding: 0px;
}

.editor_menu {
	display: flex;
	align-items: center;
	justify-content: space-between;
	overflox-x: auto;
	width: 1080px;
	margin: 0px auto;
	padding: 0px;
}

.editor_menu ul {
/*  	list-style: none;  */
	align-items: center;
	display: flex;
	padding: 0px;
	margin: 0px;
	height:60px;
	display: flex;
	white-space: nowrap;
/* 	float: left; */
}

.editor_menu li {
	font-size: 14px;
	line-height: 1.7em;
	display: flex;
	position: relative;
	height: 100%;
	margin: 0px 16px;
}

.editor_menu a {
	display: flex;
	align-items: center;
	left:0; right:0; margin-left:auto; margin-right:auto;
	text-decoration: none;
	color: rgb(0, 0, 0);
	font-family: Georgia, "Malgun Gothic", serif;
	margin-left: auto;
    margin-right: auto;
}

.pick ::after {
	content: "";
	position: absolute;
	left: 0px;
	bottom: 0px;
	display: block;
	width: 100%;
	height: 2px;
	background: rgb(248, 100, 83);
}

.editor_main{
	width: 100%;
	max-width: 1080px;
	margin: 0px auto;
}

.editor_planMain{
	padding: 84px 0px 0px;
}

.projectItem_project{
	display: flex;
	padding-bottom: 48px;
	margin-bottom: 56px;
/* 	-webkit-box-pack: justify; */
	justify-content: space-between;
	border-bottom: 1px solid rgb(240, 240, 240);
}

.projectItem_projectInfo dl{
    margin: 0px 0px 14px;
    width: 370px;
}
.projectItem_projectInfo dt{
	font-weight: 700;
    margin-bottom: 12px;
    font-size: 16px !important;
    line-height: 24px !important;
}

.projectItem_projectInfo dd{
	font-weight: 400;
    color: rgb(109, 109, 109);
    margin: 0px;
    font-size: 13px !important;
    line-height: 24px !important;;
}

.projectItem_input{
	display: flex;
    justify-content: flex-start;
    align-items: center;
    border-radius: 4px;
    background: rgb(255, 255, 255);
    padding: 0px 0px;
/*     border: 1px solid rgb(240, 240, 240); */
    border:none; 
    background: transparent;
}

.projectItem_projectform {
	width: 100%;
/* 	display: flex; */
    justify-content: space-between;
    width: 630px;
}


.projectItem_input_title {
	width: 100%;	
    background: transparent; 
    border: 0px;
    padding: 11px 0px;
/*     box-sizing: border-box;  */
    height: 100%;
    outline: none;
    margin: 0px;
    appearance: none !important;
}

.projectItem_category {
	display: flex;
	padding-bottom: 48px;
    margin-bottom: 56px;
    justify-content: space-between;
/*     border-bottom: 1px solid rgb(240, 240, 240) */
}

.projectItem_textarea textarea {
	width: 100%;
	height: 104px;
	border: 1px solid reb(229, 229, 229);
	resize: none;
	padding: 10px 16px;
	box-sizing: border-box;
	border-radius: 4px;
	outline: none;
	font-size: 14px;
	line-height: 1.7em;
}

.projectItem_price {
	background: rgb(255, 255, 255);
    border: 1px solid rgb(234, 234, 234);
    border-radius: 4px;
    padding: 32px 24px 24px;
    width: 100%;
}

.projectItem_price p{
	font-weight: bold;
    font-size: 11px;
    line-height: 18px;
    letter-spacing: -0.005em;
    margin-bottom: 8px;
    color: rgb(61, 61, 61);
    display: flex;
    margin: 0em 0em 1em;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

.input_price_input {
	display: flex;
    justify-content: flex-start;
    align-items: center;
    border-radius: 4px;
    background: rgb(255, 255, 255);
    padding: 0px 18px;
    border: 1px solid rgb(240, 240, 240);
}

.input_price_input span {
	flex: 1 1 0%;
    border: 0px;
    text-align: right;
    padding: 0px;
    background: transparent;
	max-height: 44px;
    min-width: 100px;
    display: flex;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    align-items: center;
    border-radius: 4px;
}

#projectPrice {
	text-align: inherit;
    font-weight: 400;
    font-size: 14px !important;
    line-height: 24px !important;
    width: 100%;
    background: transparent;
    border: 0px;
    padding: 11px 0px;
    box-sizing: border-box;
    height: 100%;
    outline: none;
    margin: 0px;
    appearance: none !important;
    
}

#projectPrice 
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

    
.projectItem_priceAmount {
	background: rgb(255, 255, 255);
    border-radius: 4px;
    padding: 25px 22px 15px;
    margin-top: 8px;
}

.projectItem_TotalAmount {
	display: flex;
    justify-content: space-between;
    text-align: initial;
    color: rgb(61, 61, 61);
    font-size: 12px;
    line-height: 19px;
    letter-spacing: -0.01em;
    border-bottom: 1px solid rgb(234, 234, 234);
    padding-bottom: 16px;
    margin-bottom: 11px;
}

.projectItem_TotalAmount span {
	padding-bottom: 0px;
	padding-top: 5px;
}



</style>

<script type="text/javascript">


//저장하기
function applySubmit(){
//	debugger;
	
	//콤마 제거 및 인트형 변환
	var uncommaPrice = uncomma( $('#projectPrice').val() );
	
	//각 날짜들의 date형 값을 string으로 변환
//	var stringOpen = $('#openDate').val();
	var stringOpen = $.datepicker.formatDate("yy-mm-dd",$("#openDate").datepicker("getDate")); 
  StringOpen = $("#openDate").val();
	
//	var	stringOpen = $(openDate	).serialize();
	
//	var stringClose = $('#closeDate').val();
	var stringClose = $.datepicker.formatDate("yy-mm-dd",$("#closeDate").datepicker("getDate")); 
  stringClose = $("#closeDate").val();
	
//	var stringClose = $(closeDate ).serialize();
	
	var stringDelivery = $.datepicker.formatDate("yy-mm-dd",$("#deliveryDate").datepicker("getDate")); 
  stringDelivery = $("#deliveryDate").val();
	
 	alert(stringOpen);
	
	
	//입력 데이터들 json 파싱
	var form = 
//		$("#whiteForm").serialize();
	{
			"projectNo" : ${projectInfo.projectNo},
			"projectPrice" : uncommaPrice,
			"openDate" : stringOpen,
			"closeDate" : stringClose,
			"deliveryDate" : stringDelivery
			
	}
	
	$.ajax({
		type:"POST"
		,url:"/apply/plan"
		,data: JSON.stringify(form)
		,contentType: "application/json"
		,success: function(data){
			alert("계획정보 저장완료")
			let url = '/apply/plan?projectNo=${projectInfo.projectNo}';
			location.assign(url);

		}
		,error: function(e) {
			alert("error!");
		}
	})

}

// //변수 date값을 string으로
// function toStringDate(source){
// 	var date = new Date(source);
// 	const year = date.getFullYear();
// 	const month = CF_leftPad(date.getMonth() + 1);
// 	const day = CF_leftPad(date.getDate());
// 	return [year, month, day].join('-');
// }

// //두자리수 날짜 변경
// function CF_leftPad(value){
// 	if (Number(value) >= 10) {
// 		return value;
// 	}
// 	return "0" + value;
// }


function applyProduct(){
	$.ajax({
		type:"get"
		,url:"/apply/product?projectNo=${projectInfo.projectNo}"
		,success: function(data){
			let url = '/apply/product?projectNo=${projectInfo.projectNo}';
			location.assign(url);
		}
	})
}
function applyPlan(){
	$.ajax({
		type:"get"
		,url:"/apply/plan?projectNo=${projectInfo.projectNo}"
		,success: function(){
			let url = '/apply/plan?projectNo=${projectInfo.projectNo}';
			location.assign(url);
		}
	})
}
function applyContent(){
	$.ajax({
		type:"get"
		,url:"/apply/content?projectNo=${projectInfo.projectNo}"
		,success: function(){
			let url = '/apply/content?projectNo=${projectInfo.projectNo}';
			location.assign(url);
		}
	})
}
function applyReward(){
	$.ajax({
		type:"get"
		,url:"/apply/reward?projectNo=${projectInfo.projectNo}"
		,success: function(){
			let url = '/apply/reward?projectNo=${projectInfo.projectNo}';
			location.assign(url);
		}
	})
}

//컴마제거 및 int형으로 변환
function uncomma(str) {
	str = "" + str.replace(/,/gi, ''); 
	str = str.replace(/(^\s*)|(\s*$)/g, ""); 
	return (new Number(str));//문자열을 숫자로 반환 
}

//저장된 날짜값이 없다면
<c:if test = "${projectInfo.openDate ne null}">
function planDate (date) {
	var closeDate = $('#closeDate');
	var deliveryDate = $('#deliveryDate');
	var openDate = $('#openDate').datepicker('getDate');
	var minDate = $('#openDate').datepicker('getDate');
	closeDate.datepicker('setDate', minDate);
	deliveryDate.datepicker('setDate', minDate);
	openDate.setDate(openDate.getDate() + 60);
	closeDate.datepicker('option', 'maxDate', openDate);
	closeDate.datepicker('option', 'minDate', minDate);
	deliveryDate.datepicker('option', 'minDate', minDate);
}
</c:if>

//펀딩 기간
function period() {
	
	var openPeriod = new Date($('#openDate').datepicker('getDate'));
		alert(openPeriod.getTime());
	var closePeriod = new Date($('#closeDate').datepicker('getDate'));
	
	var periodMs = closePeriod.getTime() - openPeriod.getTime();		
//		blur
	var fundingPeriod = periodMs / (1000*60*60*24);
	
	//예상 수령액 보여주는 함수
//		$("#eceipts").html(price + "원").css('color', 'rgb(218, 74, 73)'); 
	
	//플랫폼 수수료 보여주는 함수
	$("#period").html(fundingPeriod + "일"); 
}



$(function() {
	
	//화면 로드했을 때 실행
	loadPrice();
	period();
	<c:if test = "${projectInfo.openDate eq null}">
	 	//초기값을 오늘 날짜로 설정
	    $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
	</c:if>
	
	//금액 ',' 표시 / 수령액, 수수료 대입
	function loadPrice(){
		let price = Math.floor($("#projectPrice").val() * 0.95) + "";			
		let commission = Math.floor($("#projectPrice").val() * 0.05) + "";			
		
		//컴마 찍어주는 함수
		$("#projectPrice").val($("#projectPrice").val().replace(/\,/g, '').replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,').replace(/(^0+)/, ""));
		price = price.toString().replace(/\,/g, '').replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		commission = commission.toString().replace(/\,/g, '').replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		

		//예상 수령액 보여주는 함수
		$("#eceipts").html(price + "원").css('color', 'rgb(218, 74, 73)'); 
		
		//플랫폼 수수료 보여주는 함수
		$("#commission").html(commission + "원"); 
	};
	
	//금액이 입력될 때 마다 실행
	//금액 ',' 표시 / 수령액, 수수료 대입
	$("#projectPrice").on("keyup", function(e){

		price = Math.floor($("#projectPrice").val() * 0.95) + "";			
		commission = Math.floor($("#projectPrice").val() * 0.05) + "";			
		
		//컴마 찍어주는 함수
		$(this).val($(this).val().replace(/\,/g, '').replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,').replace(/(^0+)/, ""));
		price = price.toString().replace(/\,/g, '').replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		commission = commission.toString().replace(/\,/g, '').replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		
	
		//예상 수령액 보여주는 함수
		$("#eceipts").html(price + "원").css('color', 'rgb(218, 74, 73)'); 
		
		//플랫폼 수수료 보여주는 함수
		$("#commission").html(commission + "원"); 
	});
	
	
	
	
	//모든 datepicker 설정
    $.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd' //Input Display Format 변경
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true //콤보박스에서 년 선택 가능
        ,changeMonth: true //콤보박스에서 월 선택 가능                
        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
        ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
    });

	//오픈일 설정
	$("#openDate").datepicker({
        minDate: "+14D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
   		,onSelect: function (date) {
   			var closeDate = $('#closeDate');
   			var deliveryDate = $('#deliveryDate');
   			var openDate = $(this).datepicker('getDate');
   			var minDate = $(this).datepicker('getDate');
   			closeDate.datepicker('setDate', minDate);
   			deliveryDate.datepicker('setDate', minDate);
   			openDate.setDate(openDate.getDate() + 60);
   			closeDate.datepicker('option', 'maxDate', openDate);
   			closeDate.datepicker('option', 'minDate', minDate);
   			deliveryDate.datepicker('option', 'minDate', minDate);
   		}
	});

	
	//종료일 설정
	$("#closeDate").datepicker();
	
	//배송일 설정
	$("#deliveryDate").datepicker();
	
	//펀딩 기간
	$("#openDate, #closeDate").change(function(e){

// 		var openPeriod = new Date(${openDateView });
		openPeriod = new Date($("#openDate").datepicker("getDate"));
			alert(openPeriod.getTime());
// 		var closePeriod = new Date(${closeDateView });
		closePeriod = new Date($("#closeDate").datepicker("getDate"));
		
		periodMs = closePeriod.getTime() - openPeriod.getTime();		
// 		blur
		fundingPeriod = periodMs / (1000*60*60*24);
		
		//예상 수령액 보여주는 함수
// 		$("#eceipts").html(price + "원").css('color', 'rgb(218, 74, 73)'); 
		
		//플랫폼 수수료 보여주는 함수
		$("#period").html(fundingPeriod + "일"); 
	});
	
	
	
});






</script>

</head>
<body>

<div class="projectEditor">
	<div class="editor_top">
		<div class="top_nav"> 
			<div class="top_nav_in">
				<a href="/member/main">대충 뒤로가기</a>
				<div class="top_nav_button">
					<button class="submit_button" onclick="applySubmit()"><span style=" color: rgb(255, 255, 255);">저장</span></button>
				</div>
			</div>
		</div>
		<div class="editor_topContent">
			<div class="editor_title">프로젝트 기획</div>
			<div class="editor_shadow">
				<div class="editor_menu">
					<ul>
					<li><a href="javascript:void(0);" onclick="applyProduct();" >기본정보</a></li>
					<li class="pick"><a href="javascript:void(0);" onclick="applyPlan();" >펀딩 계획</a></li>
					<li><a href="javascript:void(0);" onclick="applyContent();" >프로젝트 계획</a></li>
					<li><a href="javascript:void(0);" onclick="applyReward();" >리워드 구성</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="editor_main">
		<div class="editor_planMain">
<!-- 			<form enctype="multipart/form-data" id="writeForm"> -->
			<div class="projectItem_project">
				<div class="projectItem_projectInfo">
					<dl>
						<dt>목표 금액</dt>
						<dd>프로젝트를 완수하기 위해 필요한 금액을 설정해주세요.</dd>
					</dl>
				</div>
				<div class="projectItem_projectform">
					<div class="projectItem_price">
						<p>목표금액</p>
						<div class="input_price">
							<div class="input_price_input">
								<span>
									<input type="text" 
									placeholder="50만원 이상의 금액을 입력해주세요"
									autocomplete="off" autocapitalize="off" 
									onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
									id="projectPrice" name="projectPrice" maxlength="14"
									value="${projectInfo.projectPrice}">
									원
								</span>
							</div>
						</div>
						<div class="projectItem_priceAmount">
							<div class="projectItem_TotalAmount">
								<span>목표 금액 달성 시 예상 수령액</span>
								<em id = "eceipts">원</em>
							</div>
							<div class="projectItem_TotalAmount">
								<span>플랫폼 수수료(총 모금액의 5%+VAT)</span>
								<em id = "commission">원</em>
							</div>
<!-- 							<div class="commission"></div> -->
<!-- 							<div class="commission"></div> -->
						</div>	
					</div>				
				</div>

			</div>
			<div class="projectItem_project">
				<div class="projectItem_projectInfo">
					<dl>
						<dt>펀딩 일정</dt>
						<dd>설정한 일시가 되면 펀딩이 시작됩니다. 펀딩 신청 전까지 
							날짜를 변경할 수 있고, 펀딩 신청 후 날짜 변경은 불가능 합니다.</dd>
					</dl>
				</div> 
				<div class="projectItem_projectform">
					<div class="projectItem_openPlan">
						<p>시작일</p>
						<fmt:formatDate value = "${projectInfo.openDate }" pattern = "yyyy-MM-dd" var = "openDateView"/>
						<p><input type="text" id="openDate" name="openDate" value="${openDateView }"></p>
					</div>			
					<div class="projectItem_period">
						<p>펀딩 기간</p>
						<p id="period">일</p>
					</div>	
					<div class="projectItem_closePlan">
						<p>종료일</p>
						<fmt:formatDate value = "${projectInfo.closeDate }" pattern = "yyyy-MM-dd" var = "closeDateView"/>
						<p><input type="text" id="closeDate" name="closeDate" 
						value="${closeDateView}"></p>
					</div>
					<div class="projectItem_deliveryPlan">
						<p>배송예상일</p>
						<fmt:formatDate value = "${projectInfo.deliveryDate }" pattern = "yyyy-MM-dd" var = "deliveryDateView"/>
						<p><input type="text" id="deliveryDate" name="deliveryDate" 
						value="${deliveryDateView}"></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


</body>
</html>
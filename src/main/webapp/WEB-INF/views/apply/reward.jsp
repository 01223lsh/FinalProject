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
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>



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
	SSposition: relative;
    z-index: 1;
    display: flex;
    align-items: center;
}

.submit_button {
	font-weight: 500;
    background: #A2D5AB;
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
    margin-right: 12px !important;
    border: 0px;
    outline: none;
    border-radius: 4px;
    margin: 0px;
    border: 0px;
    outline: none;
}

.apply_button {
	font-weight: 500;
    background: #39AEA9;
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

.submit_button:hover, .submit_button:active {
    opacity: 0.6;
}

.apply_button:hover, .apply_button:active {
    opacity: 0.6;
}

.project_button {
	border: none;
    background: transparent;
    outline: none;
    color: black;
/*     font-weight: bold; */
    font-size: 1rem;
    cursor: pointer;
    padding: 0px 1rem;
}

.project_button span:hover, .project_button span:active {
	color: rgb(150, 150, 150);
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

.editor_main{
	width: 100%;
	max-width: 1080px;
	margin: 0px auto;
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

::-webkit-scrollbar { width: 11px; } 
::-webkit-scrollbar-track { background-color: rgb(240, 240, 240); border-radius: 9px; } 
::-webkit-scrollbar-thumb { background-color: rgb(210, 210, 210); border-radius: 9px; }


.projectItem_projectInfo {
	padding: 40px 12px 24px;
	height: 750px;
	overflow: scroll;
	overflow-x: hidden;
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

.projectItem_createItem {
	flex: 1 1 0%;
    margin-top: 60px;
    padding: 44px 48px;
    border: 1px solid rgb(240, 240, 240);
    border-radius: 4px;
    box-sizing: border-box;
    background: rgb(255, 255, 255);
}

.createItem_top {
	margin-bottom: 12px !important;
    font-weight: 700;
    margin: 0px;
    word-break: break-all;
    white-space: normal;
    font-size: 16px !important;
    line-height: 24px !important;
    font-family: NotoSansKR, "SF Pro Text", "Segoe UI", "Helvetica Neue", Arial, sans-serif !important;
}

.projectItem_createItem p {
	font-weight: 400;
    color: rgb(109, 109, 109);
    margin: 0px;
    word-break: break-all;
    white-space: normal;
    font-size: 14px !important;
    line-height: 24px !important;
    font-family: NotoSansKR, "SF Pro Text", "Segoe UI", "Helvetica Neue", Arial, sans-serif !important;
}

.projectItem_createItem section {
	padding: 32px 0px;
    border-bottom: 1px solid rgba(240, 240, 240, 0.4);
    margin: 0px;
}

.createItem_sectionTitle {
/* 	display: flex; */
    flex-wrap: wrap;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: start;
    justify-content: flex-start;
    color: rgb(61, 61, 61);
    margin: 0px 0px 14px;
}

.createItem_input_rewardName {
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

.createItem_rewardName {
	display: flex;
    width: 100%;
    justify-content: flex-start;
    align-items: center; 
    border-radius: 4px;
    background: rgb(255, 255, 255);
    padding: 0px 18px;
    border: 1px solid rgb(230, 230, 230);
}

.createItem_rewardName span {
	flex: 1 1 0%;
    border: 0px;
    text-align: left;
    padding: 0px;
    background: transparent;
}

.rewardList {
	padding: 0px;
    list-style: none;
    overflow: hidden;
    min-height: 90px;
    height: auto;
    border-radius: 4px;
    position: relative;
    background: rgb(255, 255, 255);
    border: 1px solid rgb(240, 240, 240);
    box-sizing: border-box;
    margin: 0px 0px 12px;
}

.defaultReward {
	width: 100%;
    min-height: 90px;
    padding: 24px 28px;
    text-align: left;
    box-sizing: border-box;
    border: 0px;
    background: transparent;
}

.projectItem_projectInfo ul {
	margin: 0px;
    padding: 0px;
    list-style: none;
}

.projectItem_projectInfo strong{
	display: block;
    font-weight: 700;
    color: rgb(61, 61, 61);
    margin: 0px 0px 8px;
    max-width: 222px;
    font-size: 20px !important;
    line-height: 28px !important;
    font-family: NotoSansKR, "SF Pro Text", "Segoe UI", "Helvetica Neue", Arial, sans-serif !important;

}
.projectItem_projectInfo span{
	display: block;
    font-weight: 400;
    color: rgb(109, 109, 109);
    margin: 10px 0px 0px;
    font-size: 12px !important;
    line-height: 20px !important;
    font-family: NotoSansKR, "SF Pro Text", "Segoe UI", "Helvetica Neue", Arial, sans-serif !important;
	
}

.createItem_inputAmount {
	border: 1px solid rgb(230, 230, 230);
    color: rgb(13, 13, 13);
    background: rgb(255, 255, 255);
    padding: 0px 0px 0px 12px;
    max-height: 44px;
    min-width: 100px;
    display: flex;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    -webkit-box-align: center;
    align-items: center;
    border-radius: 4px;
}

.createItem_inputTail {
	display: flex;
    width: 60px;
    height: 50px;
    flex-wrap: wrap;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    color: rgb(109, 109, 109);
    background: rgb(251, 251, 252);
    border-left: 1px solid rgb(242, 242, 242);
    border-radius: 0px 2px 2px 0px;
}

.introAlert {
	color: rgb(218, 74, 73); 
	display: none;
}

.deleteAlert {
	color: rgb(218, 74, 73); 
	display: none;
}
.createItem_lastButton{
	display: flex;
    flex-wrap: wrap;
    margin: 22px 0px 0px;
}


.lastSubmitButton {
	cursor: pointer;
    display: inline-flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    height: 44px;
    white-space: nowrap;
    border-radius: 4px;
    margin: 0px;
    border: 0px;
    outline: none;
    font-weight: normal;
    box-sizing: border-box;
    padding: 0px 24px;
    background-color: #39AEA9;
    color: rgb(255, 255, 255);
    flex: 1 1 0%;
/*     margin: 0px 0px 0px 10px; */
    font-size: 12px;
    line-height: 20px;
}

.introDeleteButton {
	cursor: pointer;
    display: inline-flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    height: 44px;
    white-space: nowrap;
    border-radius: 4px;
    margin: 0px;
    border: 0px;
    outline: none;
    font-weight: normal;
    box-sizing: border-box;
    padding: 0px 24px;
    background-color: rgb(255, 255, 255);
/*     color: rgb(255, 255, 255); */
    flex: 1 1 0%;
/*     margin: 0px 0px 0px 10px; */
    font-size: 14px;
    line-height: 20px;
     border: 1px solid rgb(220, 220, 220);
}

.introDeleteButton:hover, .introDeleteButton:active {
/*     opacity: 0.6; */
	background-color: rgb(250, 250, 250);
}

.lastSubmitButton:hover, .lastSubmitButton:active {
    opacity: 0.6;
}

.rewardDeleteButton {
	display: flex;
    justify-content: center;
    align-items: center;
    width: 40px;
    height: 32px;
    border-radius: 4px;
    font-weight: 400;
    color: rgb(61, 61, 61);
    position: absolute;
    top: 24px;
    right: 28px;
    background: rgb(255, 255, 255);
    border: 1px solid rgb(240, 240, 240);
    font-size: 11px !important;
    font-family: NotoSansKR, "SF Pro Text", "Segoe UI", "Helvetica Neue", Arial, sans-serif !important;
    line-height: 32px !important;
}

.rewardDeleteDiv {
	display: inline-flex;
    align-self: center;
    cursor: pointer;
	font-size: 8px;
}

.rewardDeleteButton:hover, .rewardDeleteButton:active {
	background: rgb(247,247,247);
}
.rewardDeleteDiv svg {
/* 	width: 1em; */
/*     height: 1em; */
}


</style>

<script type="text/javascript">

//펀딩 신청하기
function applyDo() {
	debugger;
	if(!'${projectInfo.projectTitle}') {
		alert("프로젝트 제목을 입력해주세요.")
		return;
	}
	if(!'${projectInfo.projectIntro}') {
		alert("프로젝트 소개글 요약을 입력해주세요.")
		return;
	}
	if(!'${projectInfo.projectImage}') {
		alert("프로젝트 대표사진을 올려주세요.")
		return;
	}
	if(!'${projectInfo.talkTime}') {
		alert("창작자 채팅 가능 시간을 입력해주세요.")
		return;
	}
	if('${projectInfo.projectPrice}' == 0) {
		alert("프로젝트 목표금액을 입력해주세요.")
		return;
	}
	if(!'${projectInfo.budgetPlan}') {
		alert("프로젝트 예산 계획을 입력해주세요.")
		return;
	}
	if(!'${projectInfo.openDate}') {
		alert("프로젝트 오픈일을 입력해주세요.")
		return;
	}
	if(!'${projectInfo.closeDate}') {
		alert("프로젝트 종료일을 입력해주세요.")
		return;
	}
	if(!'${projectInfo.deliveryDate}') {
		alert("프로젝트 예상 배송 시작일을 입력해주세요.")
		return;
	}
	
	var sysDate = new Date();
	
	<fmt:formatDate value = "${projectInfo.openDate }" var = "openDateApply"/>
	var openDate = new Date('${openDateApply}');
	
	<fmt:formatDate value = "${projectInfo.closeDate }" var = "closeDateApply"/>
	var closeDate = new Date('${closeDateApply}');

	<fmt:formatDate value = "${projectInfo.deliveryDate }" var = "deliveryDateApply"/>
	var deliveryDate = new Date('${deliveryDateApply}');
	
	if(sysDate > openDate) {
		alert("프로젝트 오픈일을 수정해주세요.")
		return;
	}
	
	if(sysDate > closeDate) {
		alert("프로젝트 종료일을 수정해주세요.")
		return;
	}
	
	if(openDate > closeDate) {
		alert("프로젝트 종료일을 수정해주세요.")
		return;
	}
	
	if(closeDate > deliveryDate) {
		alert("프로젝트 배송 시작일을 수정해주세요.")
		return;
	}
	
	$.ajax({
		type:"get"
		,url:"/apply/final?projectNo=${projectInfo.projectNo}"
		,success: function(data){
// 			var resultNo = ${result }
// 			if(resultNo == 1) {
// 				alert("리워드를 추가해주세요.")
// 			};
			
			let url = '/member/main';
			location.assign(url);
		}
		,error: function(e) {
			alert("리워드 정보를 입력해주세요.");
		}
	})
}
	


//저장하기
function applySubmit(){
// 	debugger;
	//넘길 데이터를 담아주는 객체
	var formData = new FormData();
	
	//콤마 제거 및 인트형 변환
	var uncommaRewardPrice = uncomma( $('#rewardPrice').val() );
	
	// rewardIntro값 textarea에 저장
	rewardIntroAdd() 
	
	//입력 데이터들 json 직렬화
	var form = 
	{
			"projectNo" : ${projectInfo.projectNo},
			"rewardName" : $('#rewardName').val().trim(),
			"rewardIntro" : $('#rewardIntro').val(),
			"rewardAmount" : $('#rewardAmount').val(),
			"rewardPrice" : uncommaRewardPrice
	}
	
	$.ajax({
		type:"POST"
		,url:"/apply/reward"
		,data: JSON.stringify(form)
		,contentType: "application/json"
		,success: function(data){
			alert("리워드 저장완료")
			let url = '/apply/reward?projectNo=${projectInfo.projectNo}';
			location.assign(url);
		}
		,error: function(e) {
			alert("모든 정보를 입력해주세요.");
		}
	})
}

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

// 옵션 삭제(HTML 요소 삭제)
function deleteOption(target) {
    const targetOption = $(target).parents(".reward-option")
    targetOption.remove()
}

function deleteButton(btnDelete){ 
	$(this).parent().remove();
	return false; 
};  

// function renderReward(rewardPrice, rewardInfo, rewardContent, rewardNo) {
//     // 템플릿 복제
//     const template = $("#").val();
//     template.removeAttr("id")
//     template.css("display", "flex")
//     template.addClass("my-reward")
//     // 리워드 금액, 리워드 설명 데이터 삽입
//     template.children().eq(0).find("p").text(rewardPrice)
//     template.children().eq(1).find("p").text(rewardInfo)
//     // 리워드 옵션 데이터 삽입
//     const contentArr = rewardContent.split(";")
//     for (let i in contentArr) {
//         if (contentArr[i] != "") {
//             const li = $("<li>" + contentArr[i] +"</li>");
//             template.children().eq(1).find("ul").append(li)
//         }
//     }
//     // 리워드 식별값 주입
//     template.find("button").attr("data-rewardNo", rewardNo)
//     // 리워드 생성 결과 영역에 데이터 표시
//     const result = $("#item-area")
//     result.append(template)
// }


$(function(){     

// 	$("#btnAdd").on("click", function(){ 
// 		var newRow = $("#formList>li:last").clone(); 
// 		newRow.insertAfter($("#formList>li:last"));
// 		return false;
// 	}); 
	
	$("#rewardAmount").on("keyup", function(e){
		
		$(this).val($(this).val().replace(/\,/g, '').replace(/(^0+)/, ""));
		
	});

	$("#rewardPrice").on("keyup", function(e){
		
		$(this).val($(this).val().replace(/\,/g, '').replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,').replace(/(^0+)/, ""));
		
	});
	
	
});


//리워드 구성 개수
let rIntroNo = 0;

// rewardIntro li값 추가
function addFunc() {
// 	debugger;
// 	alert(rIntroNo);
    var rewardIntro = $('#rewardIntroInput').val().trim();
    if (rewardIntro == "") {
		return;    	
    }
  
	if (rIntroNo == 0) {
		
		$("#rewardIntro_placeHolder").remove();
	}
	
	if (rIntroNo > 7) {
		rewardIntroAdd();
		introAlert();
		$('#rewardIntroInput').val('');
		return
	}
    
    // 리워드 구성 개수
    rIntroNo = rIntroNo + 1;
    const li = $("<li>" + rewardIntro +"</li>");
 	$('#show_rewardIntro').find("ul").append(li);
   	// 리워드 식별값 주입
//     template.find("button").attr("data-rewardNo", rewardNo)
    // 리워드 생성 결과 영역에 데이터 표시
//     const result = $("#item-area")
//     result.append(template)

	$('#rewardIntroInput').val('');
}

//리워드 구성 마지막 요소 삭제
function deleteLastIntro() {
// 	debugger;
	if(rIntroNo == 0) {
		deleteAlert();
		return;
	}
	rIntroNo = rIntroNo - 1;
	$(".removeIntro li:last-child").remove()
// 	document.getElementById("show_rewardIntro").remove;
// 	alert(document.getElementById("show_rewardIntro").val);
}


// 요소 3초간 보여주기 사라지게 하기 
function introAlert() {
	$('.introAlert').css('display', 'block');
	setTimeout(function(){ $('.introAlert').css('display', 'none');}, 3000);
}
function deleteAlert() {
	$('.deleteAlert').css('display', 'block');
	setTimeout(function(){ $('.deleteAlert').css('display', 'none');}, 3000);
}




// rewardIntro에 값 넣기 
function rewardIntroAdd() {
// 	debugger;
	const rewardIntro = document.getElementById("show_rewardIntro");
	document.getElementById("rewardIntro").value = rewardIntro.innerHTML;
// 	alert(document.getElementById("rewardIntro").value);
}

//리워드 삭제
function rewardDelete(number) {
    debugger;
	//넘길 데이터를 담아주는 객체
	var formData = new FormData();
	
	//입력 데이터들 json 직렬화
	var form = 
	{
			"projectNo" : ${projectInfo.projectNo},
			"rewardNo" : number,
	}
	
	$.ajax({
		type:"POST"
		,url:"/apply/rewardDelete"
		,data: JSON.stringify(form)
		,contentType: "application/json"
		,success: function(data){
			alert("리워드 삭제완료")
			let url = '/apply/reward?projectNo=${projectInfo.projectNo}';
			location.assign(url);
		}
		,error: function(e) {
			alert("error!");
		}
	})
}

</script>

</head>
<body>

<div class="projectEditor">
	<div class="editor_top">
		<div class="top_nav"> 
			<div class="top_nav_in">
				
				<button class="project_button"  onclick="location.href='/mypage/mypagemain' "><span><ion-icon size="large" name="arrow-back-outline"></ion-icon></span></button>
				
				<div class="top_nav_button">
					<button class="submit_button" type="button"  onclick="applySubmit()"><span style=" color: rgb(255, 255, 255);">저장</span></button>
					<button class="apply_button" type="button"  onclick="applyDo()"><span style=" color: rgb(255, 255, 255);">프로젝트 신청</span></button>
				</div>
			</div>
		</div>
		<div class="editor_topContent">
			<div class="editor_title">프로젝트 기획</div>
			<div class="editor_shadow">
				<div class="editor_menu">
					<ul>
					<li><a href="javascript:void(0);" onclick="applyProduct();" >기본정보</a></li>
					<li><a href="javascript:void(0);" onclick="applyPlan();" >펀딩 계획</a></li>
					<li><a href="javascript:void(0);" onclick="applyContent();" >프로젝트 계획</a></li>
					<li class="pick"><a href="javascript:void(0);" onclick="applyReward();" >리워드 구성</a></li>
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
						<dt>내가 만든 리워드</dt>
						<dd></dd>
					</dl>
					<ul class="projectItem_rewardUl">
						<li class="rewardList">
							<div class="defaultReward">
								<strong>1,000원+</strong>
								<span>선물 없이 후원하기</span>
							</div>
						</li>
						<c:forEach items="${rewardList }" var="reward">
						<li class="rewardList">
<!-- 						<button> -->
								<div class="defaultReward">
									<strong>${reward.rewardPrice }원+</strong>
									<span>${reward.rewardName }</span>
									<span>${reward.rewardIntro }</span>
								</div>
<!-- 						</button> -->
							<button type="button" class="rewardDeleteButton" onclick="rewardDelete(${reward.rewardNo});">
								<div class="rewardDeleteDiv">
									<svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd"><path d="M9 3h6v-1.75c0-.066-.026-.13-.073-.177-.047-.047-.111-.073-.177-.073h-5.5c-.066 0-.13.026-.177.073-.047.047-.073.111-.073.177v1.75zm11 1h-16v18c0 .552.448 1 1 1h14c.552 0 1-.448 1-1v-18zm-10 3.5c0-.276-.224-.5-.5-.5s-.5.224-.5.5v12c0 .276.224.5.5.5s.5-.224.5-.5v-12zm5 0c0-.276-.224-.5-.5-.5s-.5.224-.5.5v12c0 .276.224.5.5.5s.5-.224.5-.5v-12zm8-4.5v1h-2v18c0 1.105-.895 2-2 2h-14c-1.105 0-2-.895-2-2v-18h-2v-1h7v-2c0-.552.448-1 1-1h6c.552 0 1 .448 1 1v2h7z"/></svg>
								</div>
							</button>
						</li>
						</c:forEach>
					</ul>
				</div>
				<div class="projectItem_projectform">
					<div class="projectItem_createItem">
						<div class="createItem_top">리워드 만들기</div>
						<p class="Text-sc-1cqgvse-0 iALKZT" style="color: #6d6d6d;" >
							리워드는 후원자에게 프로젝트의 가치를 전달하는 수단입니다. 다양한 금액대로 여러 개의 리워드를 만들어주세요. 펀딩 성공률이 높아지고, 더 많은 후원 금액을 모금할 수 있어요.
						</p>
						<section>
							<div class="createItem_sectionTitle">
								<p style="font-weight: 700;  color: rgb(0, 0, 0);">리워드 설명</p>
								<p>리워드에 대한 설명을 입력해주세요.</p>
							</div>
								
							<div class="createItem_rewardName">
								<span>
									<input  type="text" class="createItem_input_rewardName" inputmode="text" 
									placeholder="선물세트A, 배송비 포함" id="rewardName" name="rewardName" 
									autocomplete="off" autocapitalize="off">
								</span>
							</div>
						</section>
						<section>
							<div class="createItem_sectionTitle">
								<p style="font-weight: 700;  color: rgb(0, 0, 0);">리워드 품목</p>
								<p>특별한 물건부터 의미있는 경험까지 리워드을 구성할 아이템을 만들어 보세요.</p>
							</div>
							<div>
								<textarea id="rewardIntro" name="rewardIntro" style="display: none;"></textarea>
								<div class="createItem_rewardName" id="show_rewardIntro" style="height: 230px; padding-right:0px;">
									<p id="rewardIntro_placeHolder" style="color: rgb(200, 200, 200); font-size: px important!; ">리워드를 구성하는 아이템을 추가해주세요.</p>
									<ul class="removeIntro" >
									</ul>
								</div>
								<div class="createItem_rewardName" style="padding-right: 0px !important;">
									<span style="flex: 20 !important;">
									    <input  type="text" class="createItem_input_rewardName" inputmode="numeric" 
										placeholder="리워드를 구성하는 아이템을 입력하고 ENTER를 눌러주세요." id="rewardIntroInput" name="rewardIntroInput" 
										onKeyPress="if( event.keyCode==13 ){addFunc();}" autocomplete="off" autocapitalize="off" style="font-size: 16px;">
									</span>
									<button class="introDeleteButton" onclick="deleteLastIntro()">
										<span style="flex: 20 !important;">삭제</span>
									</button>
								</div>		
								<span class="introAlert">리워드 구성은 8개를 넘을 수 없습니다.</span>
								<span class="deleteAlert">더 이상 삭제할 수 없습니다.</span>
								
<!-- 								<ul class="form_list"> -->
<!-- 								    <li><a href="#" id="btnAdd" class="btn btn_add">추가</a></li> -->
<!-- 								</ul> -->
							</div>
						</section>
						<section>
							<div class="createItem_sectionTitle">
								<p style="font-weight: 700;  color: rgb(0, 0, 0);">수량 제한</p>
								<p>리워드에 수량 제한을 설정하여 펀딩 초반에 후원을 빠르게 끌어 낼 수 있습니다. </p>
							</div>
							<div class="createItem_rewardName" style="height: 56px; padding-right:0px; width:70%;">
								<span class="createItem_inputAmount">
									<input  type="text" class="createItem_input_rewardName" inputmode="numeric" 
									placeholder="최대 2000개까지 입력가능합니다." id="rewardAmount" name="rewardAmount" 
									onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
									autocomplete="off" autocapitalize="off" style="font-size: 16px;">
								</span>
								<div class="createItem_inputTail">개</div>
							</div>
						</section>						
						<section>
							<div class="createItem_sectionTitle">
								<p style="font-weight: 700;  color: rgb(0, 0, 0);">리워드 가격</p>
								<p>후원자가 얼마의 금액을 후원하고 이 리워드를 받게 할 것인지 정해주세요.</p> 
								<p>후원자는 최소 후원금액에 자유롭게 금액을 더해 후원할 수 있습니다.</p>
								<p>배송이 필요한 리워드는 배송비를 포함해주세요.</p>
							</div>
							<div class="createItem_rewardName" style="height: 56px; padding-right:0px;">
								<span class="createItem_inputAmount">
									<input  type="text" class="createItem_input_rewardName" inputmode="numeric" 
									placeholder="1000원 이상의 금액을 입력해주세요." id="rewardPrice" name="rewardPrice" 
									onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
									autocomplete="off" autocapitalize="off" 
									 style="font-size: 16px;">
								</span>
								<div class="createItem_inputTail">원</div>
							</div>
						</section>		
						<div class="createItem_lastButton">
							<button class="lastSubmitButton" onclick="applySubmit()">
								<span>저장</span>
							</button>
						</div>				
					</div>				
				</div>
			</div>
		</div>
	</div>		
</div>


</body>
</html>
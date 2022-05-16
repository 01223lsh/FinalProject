<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

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



</style>

<script type="text/javascript">

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

$(function(){     
	$(document).ready(function(){ //탑승자정보입력 삭제 
		$("#formList>li>#btnDelete").on("click", function(){ 
			$(this).parent().remove();
			return false; 
		}); //탑승자정보입력 추가 (마지막 li 복사해서 마지막에 추가) 
		$("#btnAdd").on("click", function(){ 
			var newRow = $("#formList>li:last").clone(); 
			newRow.insertAfter($("#formList>li:last")); 
		}); 
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
						<dt>프로젝트 소개</dt>
						<dd>무엇을 만들기 위한 프로젝트인지 분명히 알려주세요.</dd>
					</dl>
				</div>
				<div class="projectItem_projectform">
					<div class="projectItem_createItem">
						<div class="createItem_top">선물 만들기</div>
						<p type="p2" color="#6d6d6d" class="Text-sc-1cqgvse-0 iALKZT">
							리워드는 후원자에게 프로젝트의 가치를 전달하는 수단입니다. 다양한 금액대로 여러 개의 리워드를 만들어주세요. 펀딩 성공률이 높아지고, 더 많은 후원 금액을 모금할 수 있어요.
						</p>
						<section>
							<div class="createItem_sectionTitle">
								<p style="font-weight: 700;  color: rgb(0, 0, 0);">리워드 설명</p>
								<p>선물에 대한 설명을 입력해주세요.</p>
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
							<div>
								<textarea id="rewardIntro" name="rewardIntro" style="display: none;"></textarea>		
								<ul id="formList" class="form_list">
								    <li>내용<a href="#" id="btnDelete" class="btn btn_del">삭제</a></li>
								    <li>내용<a href="#" id="btnDelete" class="btn btn_del">삭제</a></li>
								    <li>내용<a href="#" id="btnDelete" class="btn btn_del">삭제</a></li>
								</ul>
								
								<ul class="form_list">
								    <li><a href="#" id="btnAdd" class="btn btn_add">추가</a></li>
								</ul>
								


							</div>
						</section>
						
					</div>				
				</div>
			</div>
		</div>
	</div>		
</div>


</body>
</html>
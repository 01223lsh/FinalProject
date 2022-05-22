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
    box-sizing: border-box;  
    height: 100%;
    outline: none;
    margin: 0px;
    appearance: none !important;
}

.projectItem_title {
	display: flex;
    width: 100%;
    justify-content: flex-start;
    align-items: center;
    border-radius: 4px;
    background: rgb(255, 255, 255);
    padding: 0px 18px;
    border: 1px solid rgb(230, 230, 230);
}

.projectItem_title span {
	flex: 1 1 0%;
    border: 0px;
    text-align: left;
    padding: 0px;
    background: transparent;
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
	border: 1px solid rgb(230, 230, 230);
	resize: none;
	padding: 10px 16px;
	box-sizing: border-box;
	border-radius: 4px;
	outline: none;
	font-size: 16px;
	line-height: 1.7em;
}

.projectItem_select_img img {
	width: 250px;
}


</style>

<script type="text/javascript">

//저장하기
function applySubmit(){
// 	debugger;
	//넘길 데이터를 담아주는 객체
	var formData = new FormData();
	
	//입력 데이터들 json 직렬화
	var form = 
// 		$("#whiteForm").serialize();
	{
			"projectNo" : ${projectInfo.projectNo},
			"categoryNo" : $('#categoryNo').val(),
			"projectTitle" : $('#projectTitle').val().trim(),
			"projectIntro" : $('#projectIntro').val().trim(),
			"talkTime" : $('#talkTime').val().trim()
	}
	
	//formData에 'projectPhoto'라는 키값으로 append 
	formData.append('file', $('#file')[0].files[0]);
	
	//'projectUpdate'라는 이름으로 위에서 담은 data를 formData에 append / type은 json
	formData.append('projectUpdate', new Blob([ JSON.stringify(form) ], {type: "application/json"}));
	
	$.ajax({
		type:"POST"
		,url:"/apply/product"
		,data: formData
		,contentType: false
		,processData: false
		,enctype: 'multipart/form-data'
		,success: function(data){
			alert("제품정보 저장완료")
			let url = '/apply/product?projectNo=${projectInfo.projectNo}';
			location.assign(url);

		}
		,error: function(e) {
			alert("error!");
		}
	})

// 	$.ajax({
// 		type:"POST"
// 		,url:"/apply/product"
// 		,data: JSON.stringify(form)
// 		,contentType: "application/json"
// 		,success: function(data){
// 			alert("제품정보 저장완료")
// 		}
// 	})
}

//상단 메뉴바
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

$(function() {
	//카테고리 기본값 불러오기
	$("#categoryNo").val("${projectInfo.categoryNo}").prop("selected", true);

	//소개글 활성화
	$('#projectIntro').keyup(function (e) { 
		let content = $(this).val(); 
		
		// 글자수 세기 - projectIntro
		if (content.length == 0 || content == '') { 
			$('#textCount_projectIntro').text('0자'); 
			$('.submit_button').attr('disabled', 'disabled');
		} else if(content.length < 10 && content.length > 0) { 
			$('.projectItem_textarea_projectIntro').css('color', 'rgb(218, 74, 73)');
			$('.projectItem_textarea_projectIntro textarea').css('border', '1px solid rgb(218, 74, 73)');
			$('#textCount_projectIntro').text(content.length + '자');
			$('.submit_button').css('background', 'rgb(229, 229, 229)');
			$('.submit_button').attr('disabled', 'disabled');
			$('.submit_button').css('cursor', 'default');
		} else { 
			$('.projectItem_textarea_projectIntro').css('color', 'initial');
			$('.projectItem_textarea_projectIntro textarea').css('border', '1px solid rgb(230, 230, 230)');
			$('.item-intro-limit_projectIntro').css('display', 'none');
			$('#textCount_projectIntro').text(content.length + '자');
			$('.submit_button').css('background', 'rgb(248, 100, 83)');
			$('.submit_button').removeAttr('disabled');
			$('.submit_button').css('cursor', 'pointer');
		}
		
		// 글자수 제한 
		if (content.length > 50) { 
			// 50자 부터는 타이핑 되지 않도록 
			$(this).val($(this).val().substring(0, 50)); 
			// 50자 넘으면 알림창 뜨도록 
// 			alert('글자수는 50자까지 입력 가능합니다.'); 
		}; 
	});
	
	// 채팅 시간 활성화
	$('#talkTime').keyup(function (e) { 
		let content = $(this).val(); 
		// 글자수 세기 - talkTime
		if (content.length == 0 || content == '') { 
			$('#textCount_talkTime').text('0자'); 
			$('.submit_button').attr('disabled', 'disabled');
		} else if(content.length < 10 && content.length > 0) { 
			$('.projectItem_textarea_talkTime').css('color', 'rgb(218, 74, 73)');
			$('.projectItem_textarea_talkTime textarea').css('border', '1px solid rgb(218, 74, 73)');
			$('#textCount_talkTime').text(content.length + '자');
			$('.submit_button').css('background', 'rgb(229, 229, 229)');
			$('.submit_button').attr('disabled', 'disabled');
			$('.submit_button').css('cursor', 'default');
		} else { 
			$('.projectItem_textarea_talkTime').css('color', 'initial');
			$('.projectItem_textarea_talkTime textarea').css('border', '1px solid rgb(230, 230, 230)');
			$('.item-intro-limit_talkTime').css('display', 'none');
			$('#textCount_talkTime').text(content.length + '자');
			$('.submit_button').css('background', 'rgb(248, 100, 83)');
			$('.submit_button').removeAttr('disabled');
			$('.submit_button').css('cursor', 'pointer');
		}
		
		// 글자수 제한 
		if (content.length > 50) { 
			// 50자 부터는 타이핑 되지 않도록 
			$(this).val($(this).val().substring(0, 50)); 
			// 50자 넘으면 알림창 뜨도록 
// 			alert('글자수는 50자까지 입력 가능합니다.'); 
		}; 
	});
	
	
	$("#file").change(function(){
		if(this.files && this.files[0]) {
			var reader = new FileReader;
			reader.onload = function(data) {
				$(".projectItem_select_img img").attr("src", data.target.result).width(250);
			}
			reader.readAsDataURL(this.files[0]);
		}
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
					<li class="pick"><a href="javascript:void(0);" onclick="applyProduct();" >기본정보</a></li>
					<li><a href="javascript:void(0);" onclick="applyPlan();" >펀딩 계획</a></li>
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
						<dt>프로젝트 카테고리</dt>
						<dd>프로젝트 성격과 가장 일치하는 카테고리를 선택해주세요.</dd>
					</dl>
				</div>
				<div class="projectItem_projectform">
					<p>카테고리</p>
					<div class="projectItem_category">
						<span>
							<select name="categoryNo" id="categoryNo" value="${projectInfo.categoryNo }">
								<option value="1">홈·리빙</option>
								<option value="2">테크·가전</option>
								<option value="3">향수·뷰티</option>
								<option value="4">잡화</option>
								<option value="5">의류</option>
								<option value="6">디자인·예술</option>
								<option value="7">푸드</option>
								<option value="8">반려동물</option>
							</select>
						
<!-- 						<input readonly type="text" inputmode="text"  -->
<!-- 								autocomplete="off" autocapitalize="off" value="" -->
<!-- 								style="cursor: default;"> -->
						</span>
					</div>				
				</div>
			</div>
			<div class="projectItem_project">
				<div class="projectItem_projectInfo">
					<dl>
						<dt>프로젝트 제목</dt>
						<dd>프로젝트 주제, 창작물의 특징이 드러나는 멋진 제목을 붙여주세요.</dd>
					</dl>
				</div>
				<div class="projectItem_projectform">
					<p>제목</p>
					<div class="projectItem_input">
						<div class="projectItem_title">
							<span>
								<input  type="text" class="projectItem_input_title" inputmode="text" 
								placeholder="제목을 입력해주세요" id="projectTitle" name="projectTitle" 
								autocomplete="off" autocapitalize="off"  value= "${projectInfo.projectTitle}">
							</span>
						</div>
					</div>				
				</div>
			</div>
			<div class="projectItem_project">
				<div class="projectItem_projectInfo">
					<dl>
						<dt>프로젝트 요약</dt>
						<dd>후원자 분들이 프로젝트를 빠르게 이해할 수 있도록 명확하고 간략하게 소개해주세요.</dd>
					</dl>
				</div>
				<div class="projectItem_projectform">
					<p>소개글</p>
					<div class="projectItem_textarea projectItem_textarea_projectIntro">
						<span>
							<textarea placeholder="프로젝트 요약을 입력해주세요." id="projectIntro" name="projectIntro" maxlength="200">${projectInfo.projectIntro}</textarea>		
							<span id=item-intro-limit_projectIntro>최소 10자이상 입력해주세요.</span>
							<span id="textTotal_projectIntro">/ 50자</span>		
							<span id="textCount_projectIntro">0자</span>
						</span>
					</div>				
				</div>
			</div>
			<div class="projectItem_project">
				<div class="projectItem_projectInfo">
					<dl>
						<dt>프로젝트 대표이미지</dt>
						<dd>후원자들이 프로젝트의 내용을 쉽게 파악하고 좋은 인상을 받을 수 있도록 이미지 가이드라인을 따라주세요.</dd>
					</dl>
				</div>
				<div class="projectItem_projectform">
					<p>대표이미지</p>
					<div class="projectItem_image">
						<input type="file" name="file" id="file" accept=".jpg, .jpeg, .png">
						<div class="projectItem_select_img">
<%-- 							<img src="${pageContext.servletContext.getRealPath("/")"+"${projectInfo.projectImage}"/> --%>
<%-- 							<img src="<%=request.getRealPath("/")%> +"${projectInfo.projectImage}"/> --%>
							<img src="${projectInfo.projectImage}">
						</div>
					</div>				
				</div>
			</div>
			<div class="projectItem_project">
				<div class="projectItem_projectInfo">
					<dl>
						<dt>창작자 채팅 가능시간</dt>
						<dd>창작자와 펀딩 참여자간 실시간 채팅이 가능합니다. 실시간 채팅이 가능한 시간을 적어주세요. 신청 이후에도 언제든지 수정 가능합니다.</dd>
					</dl>
				</div>
				<div class="projectItem_projectform">
					<p>채팅 가능시간</p>
					<div class="projectItem_textarea projectItem_textarea_talkTime">
						<span>
							<textarea placeholder="예시) 월, 수, 금 19:00 ~ 21:00" id="talkTime" name="talkTime" maxlength="50">${projectInfo.talkTime}</textarea>		
							<span id=item-intro-limit_talkTime>최소 10자이상 입력해주세요.</span>
							<span id="textTotal_talkTime">/ 50자</span>		
							<span id="textCount_talkTime">0자</span>
						</span>
					</div>					
				</div>
			</div>
<!-- 			</form> -->
		</div>
	</div>
</div>


</body>
</html>
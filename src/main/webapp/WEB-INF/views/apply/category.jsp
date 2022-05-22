<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
input[type=radio]{display:none; margin:10px; }
input[type=radio]+label{
display:inline-block;
margin:2px;
padding: 8px 19px;
background-color: #ffffff;
border: 1px solid rgb(240, 240, 240);
font-size: 13px !important;
width: 110px;
text-align: center;
}
input[type=radio]:checked+label{
background-image:none;
background-color:#f86453;
color:#fff;
}

html {
	height: 100%;
}

body{
	height: 100%;
	margin: 0px;
    padding: 0px;
    overflow-x: hidden;
    min-width: 320px;
}

.all {
	display: flex;
	flex-direction: column;
    min-height: 100%;
    height: 100%;
}

.header1 {
	position: fixed;
    width: 100%;
}
.header2 {
	position: relative;
    z-index: 9999;
}
.header3 {
	height: 100px;
	width: 100%;
/*     background-color: rgb(255, 255, 255); */
    background-color: #39AEA9;
    display: flex;
/*     -webkit-box-align: center; */
    align-items: center;
    position: relative;
    box-shadow: rgb(10 10 10 / 10%) 0px 1px 2px 0px;
    z-index: 999;
}
.header4 {
	position: relative;
    width: 100%;
    height: auto;
    margin: 0px auto;
    padding: 0px;
    width: 1160px;
}
.header5 {
	display: flex;
/*     -webkit-box-align: center; */
    align-items: center;
/*     -webkit-box-pack: justify; */
    justify-content: space-between;
    position: relative;
    height: 100%;
    max-height: 70px;
}

.header_project {
	flex: 1 0 25%;
    text-align: center;
    display: flex;
}
.header_logo {
	width: 10rem;
    position: absolute;
    inset: 0px;
    margin: 0px auto;
    padding: 0px 1rem;
    cursor: pointer;
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
}
.header_side {
	text-align: right;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: end;
    justify-content: flex-end;
}

.project_button {
	border: none;
    background: transparent;
    outline: none;
    color: rgb(255,255, 255);
/*     font-weight: bold; */
    font-size: 1rem;
    cursor: pointer;
    line-height: 58px;
    padding: 0px 1rem;
}

.project_button span:hover, .project_button span:active {
	color: rgb(150, 150, 150);
}

.apply{
	display: flex;
	flex-grow: 1;
	padding-top: 100px;
    overflow: hidden;
	width: 100%;
}


.apply-back{
    display: block;
    width: 400x;
    height: 100%;
	flex-grow: 1;
/*     display:flex;  */
    position: relative;
/*     background-image: url(https://tumblbug-assets.s3-ap-northeast-1.amazonaws.com/static_assets/editor-start-image-03.jpg); */
/* 	background-image: user */
/*     background: url(https://kajabi-storefronts-production.global.ssl.fastly.net/kajabi-storefronts-production/blogs/30034/images/YIHaFaIQeWQ5u7uk4u2g_Montessori-Rhyming-Objects-Set.png) 0% 0% / cover no-repeat rgb(237, 229, 227);  */
    background: url(https://source.unsplash.com/featured/?{object}) 0% 0% / cover no-repeat rgb(237, 229, 227);  
/*     background: url(https://tumblbug-assets.s3-ap-northeast-1.amazonaws.com/static_assets/editor-start-image-03.jpg) 0% 0% / cover no-repeat rgb(237, 229, 227);  */
}

@media screen and (max-width: 1000px) { 
	.apply-back { display: none; } 
	.right-content { left: 70px !important;}
}


.item {
/*     display:flex;  */
    position: relative; 
/*     left: 5%; */
    top:100px;  
/*     overflow:auto;  */
	width:550px;
 	margin: 0 auto; 
/*  	text-align: justify;  */
}

.item-category{
	display: block;
	min-width: 350px;
	margin-bottom: 50px;
	
/*     position: fixed; */
/* 	flex:1; */
}

.right-content-all {
    -webkit-box-flex: 1;
    flex-grow: 1;
    overflow-y: auto;
}

.right-content{
/* 	flex:1; */
/*     position: relative;  */
/*     left: 610px; */
/* 	width:auto; */
	
	width: 450px;
    padding: 40px 0px 63px;
    margin:50px auto;
    flex-grow: 1;
}

.item-intro{
	display: none;
}

.item-intro textarea{
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

#item-intro-limit{
	font-size: 14px !important;
	
}


#textTotal, #textCount{
	font-size: 14px !important;
	float: right;
}

.item-intro-text{ 
	margin-bottom: 50px;
}

.button-next{
	background: rgb(229, 229, 229);
	color: rgb(255, 255, 255);
	border: none;
	align-items: center;
	height: 40px;
	border-radius:4px;
	box-sizing: border-box;
	justify-content: center;
/* 	text-align: right; */
/*  	disabled: disabled;  */
} 


/* textarea{ */
/* 	border: 1px solid rgb(218, 74, 73); */
/* } */

</style>	
<script type="text/javascript">
function applyCategory(){
	var form = {
		"categoryNo" : $(':input[name=categoryNo]:checked').val(),
		"projectIntro" : $('#projectIntro').val().trim()
	}
	console.log(form);
	
// 	var categoryNo = $(':input[name=category]:checked').val();
// 	var projectIntro = $('#projectIntro').val().trim();
	
	
	$.ajax({
		type:"POST"
		,url:"/apply/category"
		,data: JSON.stringify(form)
		,contentType: "application/json"
		,success: function(data){
// 			$("")
			alert("프로젝트 생성!")
			console.log(data);
			let url = '/apply/product?projectNo='+data;
			location.replace(url);
		}
	})
}
// var chatContent = $('#chatContent').val().trim();
// $.ajax({
// 		type: "POST",
// 		url: "./chatSubmitServlet",
// 		data: {
// 			fromID: encodeURIComponent(fromID),
// 			toID: encodeURIComponent(toID),
// 			chatContent: encodeURIComponent(chatContent),
// 		},
// 		success: function(result) {
// 			if(result == 1) {
// 				autoClosingAlert('#successMessage', 2000);
// 			} else if (result == 0) {
// 				autoClosingAlert('#dangerMessage', 2000);
// 			} else {
// 				autoClosingAlert('#warningMessage', 2000)
// 			}
// 		}
// });

$(function() {
	//소개글 활성화
	$('input.item-category, input').one('click', function() {
		$('.item-intro').css('display', 'block');
		$('.button-next').attr('disabled', 'disabled');
	});
	
	$('#projectIntro').keyup(function (e) { 
		let content = $(this).val(); 
		
		// 글자수 세기
		if (content.length == 0 || content == '') { 
			$('#textCount').text('0자'); 
		} else if(content.length < 10 && content.length > 0) { 
			$('.item-intro-text').css('color', 'rgb(218, 74, 73)');
			$('.item-intro-text textarea').css('border', '1px solid rgb(218, 74, 73)');
			$('#textCount').text(content.length + '자'); 
			$('.button-next').css('background', 'rgb(229, 229, 229)');
			$('.button-next').attr('disabled', 'disabled');
		} else {
			$('.item-intro-text').css('color', 'initial');
			$('.item-intro-text textarea').css('border', '1px solid rgb(0, 0, 0)');
			$('.item-intro-limit').css('display', 'none');
			$('#textCount').text(content.length + '자'); 
			$('.button-next').css('background', 'rgb(255, 87, 87)');
			$('.button-next').removeAttr('disabled');
			$('.button-next').css('cursor', 'pointer');
// 			$('.button-next: hover').css('color', 'rgb(255,192,192)');
		}
		
		
		// 글자수 제한 
		if (content.length > 50) { 
			// 200자 부터는 타이핑 되지 않도록 
			$(this).val($(this).val().substring(0, 50)); 
			// 200자 넘으면 알림창 뜨도록 
// 			alert('글자수는 50자까지 입력 가능합니다.'); 
		}; 
	});

	
});



</script>

</head>
<body>
	<div class="all">
		<div class="header1">
			<div class="header2">
				<div class="header3">
					<div class="header4">
						<div class="header5">
							<div class="header_project">
								<button class="project_button"  onclick="location.href='/project/list'"><span style="">프로젝트 둘러보기</span></button>
							</div>
							<div class="header_logo">
								<a href="/member/main" class="me-auto mb-2 mb-lg-0"><img src="/resources/jpg/LogoWhale2.png" width = "100" height="80"></img></a>
							</div>
							<div class="header_side">
								<button class="project_button"  onclick=""><span><ion-icon size="large" name="notifications-outline"></ion-icon></span></button>
								<button class="project_button"  onclick="location.href='/mypage/mypagemain' "><span>${sessionScope.nick}</span></button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="apply">
			<div class="apply-back"></div>
			<div class="right-content-all">
				<div class="right-content">
					<div class="item">
						<h3 style= "font-size: 24px !important;">카테고리를 선택해주세요.</h3>
			 			<p style="color:rgb(109, 109, 109); font-size: 14px !important;">나중에 변경 가능하니 걱정마세요.</p>
					</div>
					<div class="item item-category">
						<input type="radio" class="rounded-pill" id="radio1" name="categoryNo" value= 1><label class="rounded-pill"  for="radio1">홈·리빙</label>
						<input type="radio" class="rounded-pill" id="radio2" name="categoryNo" value= 2><label class="rounded-pill"  for="radio2">테크·가전</label>
						<input type="radio" class="rounded-pill" id="radio3" name="categoryNo" value= 3><label class="rounded-pill"  for="radio3">향수·뷰티</label>
						<input type="radio" class="rounded-pill" id="radio4" name="categoryNo" value= 4><label class="rounded-pill"  for="radio4">잡화</label>
						<input type="radio" class="rounded-pill" id="radio5" name="categoryNo" value= 5 ><label class="rounded-pill"  for="radio5">의류</label>
						<input type="radio" class="rounded-pill" id="radio6" name="categoryNo" value= 6 ><label class="rounded-pill"  for="radio6">디자인·예술</label>
						<input type="radio" class="rounded-pill" id="radio7" name="categoryNo" value= 7 ><label class="rounded-pill"  for="radio7">푸드</label>
						<input type="radio" class="rounded-pill" id="radio8" name="categoryNo" value= 8 ><label class="rounded-pill"  for="radio8">반려동물</label>
					</div>
					<div class="item-intro">
						<div class="item">
							<h3 style= "font-size: 24px !important;">프로젝트를 간단하게 소개해주세요!</h3>
			 				<p style="color:rgb(109, 109, 109); font-size: 14px !important;">나중에 변경 가능하니 걱정마세요.</p>
							
							<div class="item-intro-text" style="width: 100%;">
								<textarea placeholder="프로젝트 요약을 입력해주세요." id="projectIntro" name="projectIntro" maxlength="200"></textarea>		
								<span id="item-intro-limit">최소 10자이상 입력해주세요.</span>
								<span id="textTotal">/ 50자</span>		
								<span id="textCount">0자</span>
							</div>
							<button class="button-next" onclick="applyCategory()">다음단계</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		
		
</body>
</html>
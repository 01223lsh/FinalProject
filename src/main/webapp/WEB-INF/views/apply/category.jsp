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

.apply{
	display: flex;
	flex-grow: 1;
}


.apply-back{
    display: block;
    width: 600px;
    height: 100%;
    display:flex; 
    position: fixed;
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
    left: 5%;
    top:100px;  
/*     overflow:auto; */
	width:550\x;
/* 	margin: 0 auto; */
/* 	text-align: justify; */
}

.item-category{
	display: block;
	min-width: 350px;
	margin-bottom: 50px;
	
/*     position: fixed; */
/* 	flex:1; */
}

.right-content{
/* 	flex:1; */
    position: relative; 
    left: 610px;
	width:auto;
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
	<div class="apply">
		<div class="apply-back"></div>
		<div class="right-content">
			<div class="item">
				<h3 style= "font-size: 24px !important;">카테고리를 선택해주세요.</h3>
	 			<p style="color:rgb(109, 109, 109); font-size: 14px !important;">나중에 변경 가능하니 걱정마세요.</p>
			</div>
			
			<div class="item item-category">
				<input type="radio" class="rounded-pill" id="radio1" name="categoryNo" value= 1><label class="rounded-pill"  for="radio1">뷰티</label>
				<input type="radio" class="rounded-pill" id="radio2" name="categoryNo" value= 2><label class="rounded-pill"  for="radio2">디자인 문구</label>
				<input type="radio" class="rounded-pill" id="radio3" name="categoryNo" value= 3><label class="rounded-pill"  for="radio3">푸드</label>
				<input type="radio" class="rounded-pill" id="radio4" name="categoryNo" value= 4><label class="rounded-pill"  for="radio4">잡화</label>
				<input type="radio" class="rounded-pill" id="radio5" name="categoryNo" value= 5 ><label class="rounded-pill"  for="radio5">굿즈</label>
			</div>
			
			<div class="item-intro">
				<div class="item">
					<h3 style= "font-size: 24px !important;">프로젝트를 간단하게 소개해주세요!</h3>
	 				<p style="color:rgb(109, 109, 109); font-size: 14px !important;">나중에 변경 가능하니 걱정마세요.</p>
					
					<div class="item-intro-text">
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
	
		
		
</body>
</html>
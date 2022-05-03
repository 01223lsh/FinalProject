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
    display: block;
    width: 438px;
    height: 100%;
    display:flex; 
    position: fixed;
/*     background-image: url(https://tumblbug-assets.s3-ap-northeast-1.amazonaws.com/static_assets/editor-start-image-03.jpg); */
/* 	background-image: user */
/*     background: url(https://kajabi-storefronts-production.global.ssl.fastly.net/kajabi-storefronts-production/blogs/30034/images/YIHaFaIQeWQ5u7uk4u2g_Montessori-Rhyming-Objects-Set.png) 0% 0% / cover no-repeat rgb(237, 229, 227);  */
    background: url(https://tumblbug-assets.s3-ap-northeast-1.amazonaws.com/static_assets/editor-start-image-03.jpg) 0% 0% / cover no-repeat rgb(237, 229, 227); 
}


.item {
    display:flex; 
    position: relative; 
    left: 5%;
    top:100px;  
/*     overflow:auto; */
	with:600px;
/* 	margin: 0 auto; */
/* 	text-align: justify; */
}

.item category{
	display: block;
	min-width: 500px;
/*     overflow:auto; */
	margin-bottom: 50px;
/*     position: fixed; */
/* 	flex:1; */
}

.right-content{
/* 	flex:1; */
    position: relative; 
    left: 438px;
	width:auto;
}




</style>
<script type="text/javascript">
	
</script>

</head>
<body>
		<div class="apply"></div>
		<div class="right-content">		
			<div class="item">
				<h3>카테고리를 선택해주세요.</h3>
				<p>나중에 변경 가능하니 걱정마세요.</p>
				
			</div>
			<div class="item category">
				<input type="radio" class="rounded-pill" id="radio1" name="radios"><label class="rounded-pill"  for="radio1">뷰티</label>
				<input type="radio" class="rounded-pill" id="radio2" name="radios"><label class="rounded-pill"  for="radio2">디자인 문구</label>
				<input type="radio" class="rounded-pill" id="radio3" name="radios"><label class="rounded-pill"  for="radio3">푸드</label>
				<input type="radio" class="rounded-pill" id="radio4" name="radios"><label class="rounded-pill"  for="radio4">잡화</label>
				<input type="radio" class="rounded-pill" id="radio5" name="radios"><label class="rounded-pill"  for="radio5">굿즈</label>
			</div>
			
			<div class="item intro">
				<div class="item">
					<h3>프로젝트를 간단하게 소개해주세요!</h3>
				</div>
				
				<div></div>
							
			</div>
			
		</div>
		
		
		
		
		
</body>
</html>
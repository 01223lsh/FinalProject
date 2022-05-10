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


</script>

</head>
<body>

<div class="projectEditor">
	<div class="editor_topContent">
		<div class="editor_title">프로젝트 기획</div>
	</div>
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


</body>
</html>
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
<!-- <script src="//cdn.ckeditor.com/4.18.0/standard/ckeditor.js"></script> -->
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/31.1.0/classic/ckeditor.js"></script> -->
<!-- <script src="[ckeditor-build-path]/ckeditor.js"></script> -->
<!-- <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script> -->
<!-- <link href="summernote-bs5.css" rel="stylesheet"> -->
<!-- <script src="summernote-bs5.js"></script> -->
<script src="/resources/js/ckeditor/ckeditor.js"></script>
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
	position: relative;
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



</style>

<script type="text/javascript">

//?????? ????????????
function applyDo() {
	debugger;
	if(!'${projectInfo.projectTitle}') {
		alert("???????????? ????????? ??????????????????.")
		return;
	}
	if(!'${projectInfo.projectIntro}') {
		alert("???????????? ????????? ????????? ??????????????????.")
		return;
	}
	if(!'${projectInfo.projectImage}') {
		alert("???????????? ??????????????? ???????????????.")
		return;
	}
	if(!'${projectInfo.talkTime}') {
		alert("????????? ?????? ?????? ????????? ??????????????????.")
		return;
	}
	if('${projectInfo.projectPrice}' == 0) {
		alert("???????????? ??????????????? ??????????????????.")
		return;
	}
	if(!'${projectInfo.budgetPlan}') {
		alert("???????????? ?????? ????????? ??????????????????.")
		return;
	}
	if(!'${projectInfo.openDate}') {
		alert("???????????? ???????????? ??????????????????.")
		return;
	}
	if(!'${projectInfo.closeDate}') {
		alert("???????????? ???????????? ??????????????????.")
		return;
	}
	if(!'${projectInfo.deliveryDate}') {
		alert("???????????? ?????? ?????? ???????????? ??????????????????.")
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
		alert("???????????? ???????????? ??????????????????.")
		return;
	}
	
	if(sysDate > closeDate) {
		alert("???????????? ???????????? ??????????????????.")
		return;
	}
	
	if(openDate > closeDate) {
		alert("???????????? ???????????? ??????????????????.")
		return;
	}
	
	if(closeDate > deliveryDate) {
		alert("???????????? ?????? ???????????? ??????????????????.")
		return;
	}
	
	$.ajax({
		type:"get"
		,url:"/apply/final?projectNo=${projectInfo.projectNo}"
		,success: function(data){
// 			var resultNo = ${result }
// 			if(resultNo == 1) {
// 				alert("???????????? ??????????????????.")
// 			};
			
			let url = '/member/main';
			location.assign(url);
		}
		,error: function(e) {
			alert("????????? ????????? ??????????????????.");
		}
	})
}


//????????????
function applySubmit(){
	debugger;
	var form = {
		"projectNo" : ${projectInfo.projectNo},
		"projectContent" : CKEDITOR.instances.projectContent.getData(),
		"budgetPlan" : $('#budgetPlan').val().trim(),
		"schedulePlan" : $('#schedulePlan').val().trim()
	}
	console.log(form);
	
	$.ajax({
		type:"POST"
		,url:"/apply/content"
		,data: JSON.stringify(form)
		,contentType: "application/json"
		,success: function(data){
// 			$("")
			alert("???????????? ?????? ????????????!")
			console.log(data);
			let url = '/apply/content?projectNo='+data;
			location.replace(url);
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


// $(function() {
// // 	$("#projectContent").
// // CKEDITOR.replace('projectContent');
// 	CKEDITOR.replace('projectContent', { 
// // 		filebrowserImageUploadUrl: '/apply/ck/upload'
// 		filebrowserUploadUrl: '/apply/ck/upload'
// 		, language: 'ko' 
// // 		, font_names: '?????? ??????/Malgun Gothic;??????/Gulim;??????/Dotum;??????/Batang;??????/Gungsuh;Arial/Arial;Comic Sans MS/Comic Sans MS;Courier New/Courier New;Georgia/Georgia;Lucida Sans Unicode/Lucida Sans Unicode;Tahoma/Tahoma;Times New Roman/Times New Roman;MS Mincho/MS Mincho;Trebuchet MS/Trebuchet MS;Verdana/Verdana'
// // 		, font_defaultLabel: '?????? ??????/Malgun Gothic'
// // 		, fontSize_defaultLabel: '12'
// // 		, skin: 'office2013'
// 	});

	
	
	





// 	ClassicEditor 
// 		.create( document.querySelector( '#projectContent' ) ) 
// // 			ckfinder: {
// // 				UploadUrl: '/common/ckeditor/fileUpload'
// // 			}
// 		.catch( error => { 
// 			console.error( error );
// 		} );

// 	 $('#projectContent').summernote({
// // 	        placeholder: 'Hello stand alone ui',
// // 	        tabsize: 2,
// // 	        height: 120,
// // 	        lang: 'ko-KR', // default: 'en-US'
// // 	        toolbar: [
// // 	          ['style', ['style']],
// // 	          ['font', ['bold', 'underline', 'clear']],
// // 	          ['color', ['color']],
// // 	          ['para', ['ul', 'ol', 'paragraph']],
// // 	          ['table', ['table']],
// // 	          ['insert', ['link', 'picture', 'video']],
// // 	          ['view', ['fullscreen', 'codeview', 'help']]
// // 	        ]
//         height: 500,                 // ????????? ??????
//         minHeight: null,             // ?????? ??????
//         maxHeight: null,             // ?????? ??????
//         focus: true,                  // ????????? ????????? ???????????? ????????? ??????
//         lang: "ko-KR",					// ?????? ??????
//         toolbar: [
//            // [groupName, [list of button]]
//            ['fontname', ['fontname']],
//            ['fontsize', ['fontsize']],
//            ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
//            ['color', ['forecolor','color']],
//            ['table', ['table']],
//            ['para', ['ul', 'ol', 'paragraph']],
//            ['height', ['height']],
//            ['insert',['picture','link','video']],
//            ['view', ['fullscreen', 'help']]
//         ],
//    	  	fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','?????? ??????','??????','?????????','??????','?????????','?????????'],
//     	fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
//       	callbacks: {
// 	        onImageUpload : function(files, editor, welEditable){
// 	          // ?????? ?????????(?????????????????? ?????? ????????? ??????)
// 	          for (var i = files.length - 1; i >= 0; i--) {
// 	              uploadSummernoteImageFile(files[i], this);
// 	          }
// 	        }
// 	    }
// 	 });

//     function uploadSummernoteImageFile(file, el) {
//         var data = new FormData();	
//         data.append("file",file);
//         $.ajax({
//         	url: '/../summer_image.do',
//         	type: "POST",
//          	enctype: 'multipart/form-data',
//           	data: data,
//           	cache: false,
//           	contentType : false,
//           	processData : false,
//           	success : function(data) {
//                     var json = JSON.parse(data);
//                     $(el).summernote('editor.insertImage',json["url"]);
//                         jsonArray.push(json["url"]);
//                         jsonFn(jsonArray);
//           	},
//           	error : function(e) {
//            	   console.log(e);
//           	}
//        	});
//    	}

// })


</script>

</head>
<body>

<div class="projectEditor">
	<div class="editor_top">
		<div class="top_nav"> 
			<div class="top_nav_in">
				<button class="project_button"  onclick="location.href='/mypage/mypagemain' "><span><ion-icon size="large" name="arrow-back-outline"></ion-icon></span></button>
				<div class="top_nav_button">
					<button class="submit_button" type="button"  onclick="applySubmit()"><span style=" color: rgb(255, 255, 255);">??????</span></button>
					<button class="apply_button" type="button"  onclick="applyDo()"><span style=" color: rgb(255, 255, 255);">???????????? ??????</span></button>
				</div>
			</div>
		</div>
		<div class="editor_topContent">
			<div class="editor_title">???????????? ??????</div>
			<div class="editor_shadow">
				<div class="editor_menu">
					<ul>
					<li><a href="javascript:void(0);" onclick="applyProduct();" >????????????</a></li>
					<li><a href="javascript:void(0);" onclick="applyPlan();" >?????? ??????</a></li>
					<li class="pick"><a href="javascript:void(0);" onclick="applyContent();" >???????????? ??????</a></li>
					<li><a href="javascript:void(0);" onclick="applyReward();" >????????? ??????</a></li>
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
						<dt>???????????? ??????</dt>
						<dd>????????? ????????? ?????? ?????????????????? ????????? ???????????????.</dd>
					</dl>
				</div>
				<div class="projectItem_projectform">
					<p>??????</p>
					<div class="projectItem_textarea">
						<span>
							<textarea placeholder="???????????? ????????? ??????????????????." id="projectContent" name="projectContent" maxlength="1000">${projectInfo.projectContent}</textarea>		
						</span>
					</div>				
				</div>

			</div>
			<div class="projectItem_project">
				<div class="projectItem_projectInfo">
					<dl>
						<dt>???????????? ??????</dt>
						<dd>?????? ?????? ????????? ????????? ????????? ????????? ????????? ??????????????? ???????????????. 
							'?????????', '?????????' ??? ?????? ???????????? ???????????? ?????????.</dd>
					</dl>
				</div>
				<div class="projectItem_projectform">
					<p>??????</p>
					<div class="projectItem_textarea">
						<span>
							<textarea placeholder="???????????? ?????? ????????? ??????????????????." id="budgetPlan" name="budgetPlan" maxlength="1000">${projectInfo.budgetPlan}</textarea>		
						</span>
					</div>				
				</div>
			</div>
			<div class="projectItem_project">
				<div class="projectItem_projectInfo">
					<dl>
						<dt>???????????? ??????</dt>
						<dd>?????? ????????? ???????????? ????????? ?????? ???????????????. ???????????? ????????? ????????? 
							?????? ????????? ???????????? ??? ??? ????????? ?????????. ?????? ?????? ????????? ?????? ??????
							??? ????????? ???????????????.</dd>
					</dl>
				</div>
				<div class="projectItem_projectform">
					<p>??????</p>
					<div class="projectItem_textarea">
						<span>
							<textarea placeholder="???????????? ????????? ??????????????????." id="schedulePlan" name="schedulePlan" maxlength="1000">${projectInfo.schedulePlan}</textarea>		
						</span>
					</div>				
				</div>
			</div>	
		</div>
	</div>
</div>

<script type="text/javascript">

$(function() {
// 	$("#projectContent").
// CKEDITOR.replace('projectContent');
	CKEDITOR.replace('projectContent', { 
// 		filebrowserImageUploadUrl: '/apply/ck/upload'
		filebrowserUploadUrl: '/apply/ck/upload'
		, language: 'ko' 
// 		, font_names: '?????? ??????/Malgun Gothic;??????/Gulim;??????/Dotum;??????/Batang;??????/Gungsuh;Arial/Arial;Comic Sans MS/Comic Sans MS;Courier New/Courier New;Georgia/Georgia;Lucida Sans Unicode/Lucida Sans Unicode;Tahoma/Tahoma;Times New Roman/Times New Roman;MS Mincho/MS Mincho;Trebuchet MS/Trebuchet MS;Verdana/Verdana'
// 		, font_defaultLabel: '?????? ??????/Malgun Gothic'
// 		, fontSize_defaultLabel: '12'
// 		, skin: 'office2013'
	});
})

 </script> 


</body>
</html>
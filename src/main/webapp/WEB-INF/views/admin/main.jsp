<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ include file="../../layout/admin_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/exceljs/4.2.0/exceljs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.0/FileSaver.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script> -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@500&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/gh/emn178/chartjs-plugin-labels/src/chartjs-plugin-labels.js"></script>
<script type="text/javascript">
function projectView(projectNo){
	console.log(projectNo + "test");
	$.ajax({
		type: "get"
		,url : "/admin/project/view"
		,data : {projectNo:projectNo}
		,dataType : "html"
		,success  : function(res){
			console.log("프로젝트 상세보기 성공")
			$("#resultLayout").html(res);
		},error : function(){
			console.log("프로젝트 상세 보기 실패")
		}
		
	})
}
function projectNoSelect(projectNo){
	$.ajax({
		success : function(){
			console.log("버튼 조작 성공")
			dis(projectNo);
			
		},error : function(){
			console.log("버튼 조작 실패")
		}
	})
}
function dis(projectNo){
    if($('.pro'+projectNo).css('display') == 'none'){
    $('.pro'+projectNo).show();
    
    }else{
    $('.pro'+projectNo).hide();
    }
}
function MnoticeView(noticeNo){
	noticeView(noticeNo);
}
function noticeView(noticeNo){
	$.ajax({
		type : "post"
		,url : "/admin/notice/noticeView"
		,data : "noticeNo="+noticeNo
		,dataType  :"html"
		,success : function(res){
			console.log("notice view success");
			$("#resultLayout").html(res)
		}
		,error : function(){
			console.log("notice view error")
		}
	})
}
$(document).ready(function(){
	$(".MnoticeManagement").click(function(){
		noticeManagement();
	})	
	$(".MqnaManagement").click(function(){
		qnaManagement();
	})	
	$(".monthChart").click(function(){
		chartManagement();
	})
	$(".MprojectCategoryChart").click(function(){
		projectManagement();
	})
	$(".Mprojectmanagement").click(function(){
		projectManagement();
	})
	
	
})

function chartDate(){
	var selectDate = document.getElementById("#chartDate");
	var dayType = $("#chartDate option:selected").val();
	var chartCheck=1;
	if(dayType==7){
		chartCheck=0;
	}
	if(dayType==0){
		dayType=7
	}
	console.log(dayType)
	$.ajax({
		type : "get"
		,url : "/admin/chart/chart"
		,data : "dayType="+dayType+"&chartCheck="+chartCheck
		,dataType : "html"
		,success : function(res){
			$("#resultLayout").html(res)
		},error : function(){
			console.log("차트 변경 실패");
		}
		
	})
}
function qnaView(qnaNo){

	console.log(qnaNo);
	$.ajax({
		type : "post"
		,url : "/admin/qna/qnaView?qnaNo="+qnaNo
		,dataType :"html"
		,success : function(res){
			$("#resultLayout").html(res)
		}
		,error : function(){
			console.log("qna view error")
		}
	})
}
function memberManagement(){
	$.ajax({
		type : "get"
		,url : "/admin/member/member"
		,data : "grade=4"+"&str=member"
		,dataType : "html"
		,success : function(res){
			$("#resultLayout").html(res)
			
		}
		,error : function(){
			console.log("회원관리 뷰 실패")
		}
	})

}
function chartManagement(){
	$.ajax({
		type : "get"
		,url : "/admin/chart/chart"
		,data : "dayType=7&chartCheck=0"
		,dataType : "html"
		,success : function(res){
			$("#resultLayout").html(res)
			
		}
		,error : function(){
			console.log("회원관리 뷰 실패")
		}
	})

}
function noticeManagement(){
	$.ajax({
		type : "get"
		,url : "/admin/notice/notice"
		,data : "str=notice"
		,dataType : "html"
		,success : function(res){
			console.log("공지사항 뷰 성공")
			$("#resultLayout").html(res)
			
		}
		,error : function(){
			console.log("공지사항 뷰 실패")
		}
	})

}
function projectManagement(){
	$.ajax({
		type : "get"
		,url : "/admin/project/project"
		,data : "str=poject&projectStep=5&categoryNo=0"
		,dataType : "html"
		,success : function(res){
			console.log("공지사항 뷰 성공")
			$("#resultLayout").html(res)
			
		}
		,error : function(){
			console.log("공지사항 뷰 실패")
		}
	})
}

/* edit by young */
function approveProject() {
    $.ajax({
        type : "get"
        ,url : "/admin/approved/approveProject"
        ,data : {}
        ,dataType : "html"
        ,success : function(res){
            console.log("공지사항 뷰 성공")
            $("#resultLayout").html(res)

        }
        ,error : function(){
            console.log("공지사항 뷰 실패")
        }
    })
}
function qnaManagement(searchtest){
	$.ajax({
		type : "get"
		,url : "/admin/qna/qna"
		,data : {str:"qna",search:searchtest,complete:"3"}
		,dataType : "html"
		,success : function(res){
			console.log("공지사항 뷰 성공")
			$("#resultLayout").html(res)
			
		}
		,error : function(){
			console.log("공지사항 뷰 실패")
		}
	})
}





</script>
<style>
/* div{ */
/* 	border: 1px solid; */
/* } */
.mainTotal{
	min-width: 132px !important;
	min-height: 98px !important;
}

body{
	background-color: #f9f9f9;
 	font-family: 'Noto Serif KR', serif;

}


html { overflow-y:scroll; }
#btn_chart_excel_download {
    border: 0;
    background-color: #007f1b;
    color: white; 
    font-weight:bold; 
    padding: 5px; 
	border-radius: 10px;
	float : right;
}

nav{ 
    width:200px; 
    background-color:#527578; 
    border-right:1px solid #ddd;
    /* height:100% 그냥 적용 안됨. 부모개념이 있어야 채워질 수 있음 */
    /*공중에 떠서 공간을 차지하지 않음*/
    height:100%; /*fixed를 해서 높이 100%가 가능해짐*/
}
h1{ font-size:18px;  padding:20px; }
.menu {
	min-width: 200px;
	min-height: 800px;	
	list-style: none;	
}
    .menu li {}

    
.menu li a {
    height:30px;
    line-height:30px;
    display:block;
/*     padding:0 20px; */
    font-size:12px;
    color:#fff;
}
.menu li a:hover { background-color:#b3b1b2;; color:white;}

#center{
	margin:0 auto; 
}
#menu {
    width:15%;
    box-sizing: border-box;
    min-width: 200px;
	min-height: 800px;
    
}

#managerLayout{
	width: 100%;
    margin: -20px auto;
    display: flex;
}
#Layout{
    width:80%;
    box-sizing: border-box;
}
#chart-line{
	width: 700px;
	height: 700px;
}
.Mtotal>div{
	float: left;
    width: 12%;
    margin : 1px auto;
    text-align: center;

}
.MprojectCategoryChart{
	float: left;
    width: 33%;
    margin: 0;
    text-align: center;
    height: 150px;
    min-width: 415px;
    min-height: 150px;
}
.noticeTabletr{
	border: 1px solid #ddd;
}
.monthChart{
	float: left;
    width: 59%;
    text-align: center;
    margin: 0.5% 0.5%;
    min-width: 900px;
    min-height: 450px;
}
.prjectCategorychartAndNotice>div{
 	width:32%; 
 	height:150px;	
 	float: left;
 	margin: 0.5% 0.5%;
 	
    display: flex;
    background-color: white;
 	
}
.projectMoney {display:none}
.Mtotal>div{
	border: 1px solid white;
	background-color: white;
}
.Mtotal{
	min-width: 1520px;
	min-height: 100px;
}
.Mnotice>table{
	width: 100%;
}
.Mnotice{
	min-width: 500px;
	min-height: 150px;
}
.Mqna>table{
	width : 100%;

}
.Mqna{
	min-width: 480px;
	min-height: 150px;
}
.projectOrder{
	float: left;
	width: 39%;
	margin: 0.5% 0.5%;
	min-width: 590px;
	min-height: 440px;
}
.monthChartAndOrder>div{
	background-color: white;
}
::-webkit-scrollbar {
width: 11px;
}
::-webkit-scrollbar-track {
background-color: #b3b1b2;
border-radius: 9px;
}
::-webkit-scrollbar-thumb {
background-color: #527578;
border-radius: 9px;
}

.mainCnt{
	display: flex;
  justify-content : center;
}
.downarrow>i,.downarrow>div{

	color : #FF9696;
	font-size: 11px;
}
.uparrow>i,.uparrow>div{

	color : #84978F;
	font-size: 11px;
}
.downarrow>i:hover{
	color : #FF9696;
}
.uparrow>i:hover{
	color : #84978F;
}
.menu li i{
	color:white;
}
.noticeTabletr:hover {
	background-color : #DCDCDC;
}

</style>


</head>
<body >

<div id="managerLayout" style="height:100%">
<div  id="menu" >
<nav >
   <h1  ><a href="" style="color:#fff;">관리자 페이지</a> </h1>
    <ul class="menu">
        <li><a onclick="memberManagement()"><i class="fa-solid fa-user" ></i>&nbsp;&nbsp;회원관리</a></li>
        <li><a onclick="projectManagement()"><i class="fa-solid fa-briefcase"></i>&nbsp;&nbsp;프로젝트 목록</a></li>
        <%-- edit by young --%>
        <li><a onclick="approveProject()"><i class="fa-solid fa-list-check"></i>&nbsp;&nbsp;프로젝트 승인</a></li>
        <li><a onclick="noticeManagement()"><i class="fa-solid fa-paste"></i>&nbsp;&nbsp;공지사항</a></li>
        <li><a onclick="qnaManagement()"><i class="fa-solid fa-q"></i>&nbsp;&nbsp;문의 게시판</a></li>
<!--         <li><a onclick="chartManagement()">통계</a></li> -->
    </ul>
 
</nav>
</div>
<br><br>
	<div id="Layout">
		<div id="resultLayout">
		<br><br>
			<div class="Mtotal" style="display: flex; height: 100px;">
				<div class="Mnormal mainTotal">
				<div><i class="fa-solid fa-user"></i>
					일반 회원</div>
					<br>
					<div style="font-size: 20px;">${admin.normalCnt }</div>
					<div class="mainCnt ">
						<c:choose>
							<c:when test="${admin.normalCnt ne cnt.normalCnt }">
								<c:if test="${admin.normalCnt - cnt.normalCnt lt 0 }">
									<div class="downarrow" style="font-size: 11px;"><i class="fa-solid fa-caret-down" ></i></div>
									<div class="degree" style="font-size: 11px;margin-top:2px;">
										${(admin.normalCnt - cnt.normalCnt) * -1 } 
									</div>
									<div class="guide" style="font-size: 9px; color:#ccc;margin-top: 4px;">compared to yesterday</div>
								</c:if>
								<c:if test="${admin.normalCnt - cnt.normalCnt gt 0 }">
									<div class="uparrow" style="font-size: 11px;"><i class="fa-solid fa-caret-up" ></i></div>
									<div class="degree" style="font-size: 11px;margin-top:2px;">
										${admin.normalCnt - cnt.normalCnt } 
									</div>
									<div class="guide" style="font-size: 9px; color:#ccc;margin-top: 4px;">compared to yesterday</div>
								</c:if>
							</c:when>
							<c:when test="${ admin.normalCnt - cnt.normalCnt eq 0}">
								<div style="color:#ccc;">-</div>
							</c:when>
						</c:choose>
					</div>
				</div>
				<div class="Mbuisness mainTotal">
				<div><i class="fa-solid fa-briefcase"></i>
					사업자</div> 
					<br>
					<div style="font-size: 20px;"> ${admin.buisnessCnt }</div>
					<div class="mainCnt ">
						<c:choose>
							<c:when test="${admin.buisnessCnt ne cnt.buisnessCnt }">
								<c:if test="${admin.buisnessCnt - cnt.buisnessCnt lt 0 }">
									<div class="downarrow" style="font-size: 11px;"><i class="fa-solid fa-caret-down" ></i></div>
									<div class="degree" style="font-size: 11px;margin-top:2px;">
										${(admin.buisnessCnt - cnt.buisnessCnt) * -1 } 
									</div>
									<div class="guide" style="font-size: 9px; color:#ccc;margin-top: 4px;">compared to yesterday</div>
								</c:if>
								<c:if test="${admin.buisnessCnt - cnt.buisnessCnt gt 0 }">
									<div class="uparrow" style="font-size: 11px;"><i class="fa-solid fa-caret-up" ></i></div>
									<div class="degree" style="font-size: 11px;margin-top:2px;">
										${admin.buisnessCnt - cnt.buisnessCnt } 
									</div>
									<div class="guide" style="font-size: 9px; color:#ccc;margin-top: 4px;">compared to yesterday</div>
								</c:if>
							</c:when>
							<c:when test="${ admin.buisnessCnt - cnt.buisnessCnt eq 0}">
								<div style="color:#ccc;">-</div>
							</c:when>
						</c:choose>
				</div>
				</div>
				<div class="Mdisabled mainTotal">
				<div><i class="fa-solid fa-user-ninja"></i>
					탈퇴 </div>
					<br>
					<div style="font-size: 20px;"> ${admin.disabledCnt }</div>
					<div class="mainCnt ">
						<c:choose>
							<c:when test="${admin.disabledCnt ne cnt.disabledCnt }">
								<c:if test="${admin.disabledCnt - cnt.disabledCnt lt 0 }">
									<div class="downarrow" style="font-size: 11px;"><i class="fa-solid fa-caret-down" ></i></div>
									<div class="degree" style="font-size: 11px;margin-top:2px;">
										${(admin.disabledCnt - cnt.disabledCnt) * -1 } 
									</div>
									<div class="guide" style="font-size: 9px; color:#ccc;margin-top: 4px;">compared to yesterday</div>
								</c:if>
								<c:if test="${admin.disabledCnt - cnt.disabledCnt gt 0 }">
									<div class="uparrow" style="font-size: 11px;"><i class="fa-solid fa-caret-up" ></i></div>
									<div class="degree" style="font-size: 11px;margin-top:2px;">
										${admin.disabledCnt - cnt.disabledCnt } 
									</div>
									<div class="guide" style="font-size: 9px; color:#ccc;margin-top: 4px;">compared to yesterday</div>
								</c:if>
							</c:when>
							<c:when test="${ admin.disabledCnt - cnt.disabledCnt eq 0}">
								<div style="color:#ccc;">-</div>
							</c:when>
						</c:choose>
				</div>
				</div>
				<div class="MuserAll mainTotal">
				<div><i class="fa-solid fa-users"></i>
					전체 유저</div>
					<br> 
					<div style="font-size: 20px;"> ${admin.userAllCnt }</div>
					<div class="mainCnt ">
						<c:choose>
							<c:when test="${admin.userAllCnt ne cnt.userAllCnt }">
								<c:if test="${admin.userAllCnt - cnt.userAllCnt lt 0 }">
									<div class="downarrow" style="font-size: 11px;"><i class="fa-solid fa-caret-down" ></i></div>
									<div class="degree" style="font-size: 11px;margin-top:2px;">
										${(admin.userAllCnt - cnt.userAllCnt) * -1 } 
									</div>
									<div class="guide" style="font-size: 9px; color:#ccc;margin-top: 4px;">compared to yesterday</div>
								</c:if>
								<c:if test="${admin.userAllCnt - cnt.userAllCnt gt 0 }">
									<div class="uparrow" style="font-size: 11px;"><i class="fa-solid fa-caret-up" ></i></div>
									<div class="degree" style="font-size: 11px;margin-top:2px;">
										${admin.userAllCnt - cnt.userAllCnt } 
									</div>
									<div class="guide" style="font-size: 9px; color:#ccc;margin-top: 4px;">compared to yesterday</div>
								</c:if>
							</c:when>
							<c:when test="${ admin.userAllCnt - cnt.userAllCnt eq 0}">
								<div style="color:#ccc;">-</div>
							</c:when>
						</c:choose>
				</div>
				</div>
				<div class="Mapproved mainTotal">
				<div><i class="fa-solid fa-check"></i>
					승인 프로젝트 </div> 
					<br>
					<div style="font-size: 20px;"> ${admin.approvedCnt }</div>
				</div>
				<div class="Mwaiting">
				<div><i class="fa-regular fa-credit-card"></i>
					진행 대기 프로젝트 </div>
					<br>
					<div style="font-size: 20px;">${admin.waitingCnt }</div>
					<div class="mainCnt ">
						<c:choose>
							<c:when test="${admin.waitingCnt ne cnt.waitingCnt }">
								<c:if test="${admin.waitingCnt - cnt.waitingCnt lt 0 }">
									<div class="downarrow" style="font-size: 11px;"><i class="fa-solid fa-caret-down" ></i></div>
									<div class="degree" style="font-size: 11px;margin-top:2px;">
										${(admin.waitingCnt - cnt.waitingCnt) * -1 } 
									</div>
									<div class="guide" style="font-size: 9px; color:#ccc;margin-top: 4px;">compared to yesterday</div>
								</c:if>
								<c:if test="${admin.waitingCnt - cnt.waitingCnt gt 0 }">
									<div class="uparrow" style="font-size: 11px;"><i class="fa-solid fa-caret-up" ></i></div>
									<div class="degree" style="font-size: 11px;margin-top:2px;">
										${admin.waitingCnt - cnt.waitingCnt } 
									</div>
									<div class="guide" style="font-size: 9px; color:#ccc;margin-top: 4px;">compared to yesterday</div>
								</c:if>
							</c:when>
							<c:when test="${ admin.waitingCnt - cnt.waitingCnt eq 0}">
								<div style="color:#ccc;">-</div>
							</c:when>
						</c:choose>
				</div>
				</div>
				<div class="Mproceeding mainTotal">
				<div><i class="fa-solid fa-sack-dollar"></i>
					진행 프로젝트</div>  
					<br>
					<div style="font-size: 20px;">${admin.proceedingCnt }</div>
					<div class="mainCnt ">
						<c:choose>
							<c:when test="${admin.proceedingCnt ne cnt.proceedingCnt }">
								<c:if test="${admin.proceedingCnt - cnt.proceedingCnt lt 0 }">
									<div class="downarrow" style="font-size: 11px;"><i class="fa-solid fa-caret-down" ></i></div>
									<div class="degree" style="font-size: 11px;margin-top:2px;">
										${(admin.proceedingCnt - cnt.proceedingCnt) * -1 } 
									</div>
									<div class="guide" style="font-size: 9px; color:#ccc;margin-top: 4px;">compared to yesterday</div>
								</c:if>
								<c:if test="${admin.proceedingCnt - cnt.proceedingCnt gt 0 }">
									<div class="uparrow" style="font-size: 11px;"><i class="fa-solid fa-caret-up" ></i></div>
									<div class="degree" style="font-size: 11px;margin-top:2px;">
										${admin.proceedingCnt - cnt.proceedingCnt } 
									</div>
									<div class="guide" style="font-size: 9px; color:#ccc;margin-top: 4px;">compared to yesterday</div>
								</c:if>
							</c:when>
							<c:when test="${ admin.proceedingCnt - cnt.proceedingCnt eq 0}">
								<div style="color:#ccc;">-</div>
							</c:when>
						</c:choose>
				</div>
				</div>
				<div class="MprojectAll mainTotal">
				<div><i class="fa-solid fa-hand-holding-dollar"></i>
					총 프로젝트  </div>
					<br>
					<div style="font-size: 20px;">${admin.projectAllCnt }</div>
					<div class="mainCnt ">
						<c:choose>
							<c:when test="${admin.projectAllCnt ne cnt.projectAllCnt }">
								<c:if test="${admin.projectAllCnt - cnt.projectAllCnt lt 0 }">
									<div class="downarrow" style="font-size: 11px;"><i class="fa-solid fa-caret-down" ></i></div>
									<div class="degree" style="font-size: 11px;margin-top:2px;">
										${(admin.projectAllCnt - cnt.projectAllCnt) * -1 } 
									</div>
									<div class="guide" style="font-size: 9px; color:#ccc;margin-top: 4px;">compared to yesterday</div>
								</c:if>
								<c:if test="${admin.projectAllCnt - cnt.projectAllCnt gt 0 }">
									<div class="uparrow" style="font-size: 11px;"><i class="fa-solid fa-caret-up" ></i></div>
									<div class="degree" style="font-size: 11px;margin-top:2px;">
										${admin.projectAllCnt - cnt.projectAllCnt } 
									</div>
									<div class="guide" style="font-size: 9px; color:#ccc;margin-top: 4px;">compared to yesterday</div>
								</c:if>
							</c:when>
							<c:when test="${ admin.projectAllCnt - cnt.projectAllCnt eq 0}">
								<div style="color:#ccc;">-</div>
							</c:when>
						</c:choose>
				</div>
				</div>
			
			</div>
			<br>
			<div class="prjectCategorychartAndNotice"  style="min-width: 1520px;">
			
				<div class="MprojectCategoryChart">
					<canvas id="mychart"></canvas>
				</div>
				<div class="Mnotice" style="overflow:scroll; width:33%; height:150px; overflow-x: hidden; ">
				<div style=" position: absolute; z-index: 999; background-color: #DCDCDC;width: 25.9%;  text-align: center; min-width: 486px; min-height: 20px; "  class="MnoticeManagement">공지사항 리스트</div>
					<table class="MnoticeList">
						<tr style="border-bottom: 2px solid #ddd;">
						
							<td style="width: 10%;">.</td><td style="width: 76%;"></td><td></td>
						</tr>
						<c:forEach items="${notice}" var='i'>
						<tr class="noticeTabletr" onclick="MnoticeView(${i.noticeNo})">
						
							<td>${i.noticeNo }</td><td>${i.title}</td><td style="font-size: 12px;">${i.regDate }</td>
						</tr>
						</c:forEach>
					</table>
					
				</div>
				<div class="Mqna" style="overflow:scroll; overflow-x: hidden;">
				<div style=" position: absolute; z-index: 999; background-color: #DCDCDC; width:  25.1%;  text-align: center;min-width: 470px; min-height: 20px;" class="MqnaManagement">문의게시판 답변 안한 리스트</div>

						<table class="MqnaList">
							<tr style="border-bottom: 2px solid #ddd;">
								<td style="width: 10%;">.</td><td style="width: 76%;"></td><td style="width: 17%;" ></td>
							</tr>
							<c:forEach items="${qnalist}" var='i'>
							<tr class="noticeTabletr" onclick="qnaView(${i.qnaNo})">
								<td>${i.qnaNo }</td><td>${i.qnaTitle}</td>
								<td style="font-size: 12px;"><fmt:formatDate value="${i.qnaCreateDate }" pattern="yyyy-MM-dd"/>  </td>
							</tr>
							</c:forEach>
						</table>
					</div>
			</div>
			<br>
			<br>
			<br>
			<div class="monthChartAndOrder" style="min-width: 1530px;">
				<div class="monthChart">
					<canvas id="monthchart"></canvas>
				</div>
				<div class="projectOrder" style="overflow:scroll; height: 449px; overflow-x: hidden;">
				<div style=" position: absolute; z-index: 999; background-color: #DCDCDC; width: 30.65%;  text-align: center; min-width:580px;min-height: 20px; " class="Mprojectmanagement" >프로젝트 펀딩률</div>
					<table style="    width: 100%;">
					<tr style="border-bottom: 1px solid #ddd;">
						<th style="width: 8%;">.</th>
						<th style="width: 50%;"></th>
						<th style="width: 19%;"></th>
						<th style="width: 10%;"></th>
						<th style="width: 7%;"></th>
					</tr>
					<c:forEach items="${projectList }" var="i">
						<tr style="border-bottom: 1px solid #ddd;" class="noticeTabletr">
							<td>${i.projectNo }</td>
							<td  onclick="projectView(${i.projectNo})">${i.projectTitle } </td>
							<td>${i.paymentTotal}</td>
							<td><fmt:formatNumber value="${i.paymentTotal / i.projectPrice}" type="percent"/></td>
							<td>
							<c:if test="${i.paymentTotal ne 0}">
								<button onclick="projectNoSelect(${i.projectNo})" >
								<i class="fa-solid fa-caret-down caretBottom(${i.projectNo })" ></i>
							</button>
							</c:if>
							</td>
						</tr>
							<c:forEach items="${projectinfoList}" var="j">
								<c:if test="${j.projectNo eq i.projectNo}">
									
									<tr style="border-bottom: 1px solid #ddd; background-color: #F5F5F5;">
										<td colspan=5 style="font-size: 13px; text-align: left;" class="projectMoney pro${j.projectNo }" >
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											${j.id }(${j.nick })&nbsp;&nbsp; |&nbsp;&nbsp; ${j.email} &nbsp;&nbsp;| &nbsp;&nbsp;
										 	펀딩 금액 : ${j.paymentTotal }&nbsp;&nbsp;
										 	| &nbsp;&nbsp;&nbsp;&nbsp;날짜 : ${j.orderDate  }
										 </td>
									</tr>
								</c:if>
							</c:forEach>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>



<script type="text/javascript">

	var categoryCnt = new Array();
	var categoryName = new Array();
	<c:forEach items="${category}" var='i'>
		categoryCnt.push('${i.categoryCnt}')
		categoryName.push('${i.categoryName}')
	</c:forEach>
	var dataset = {
		    labels: categoryName,
		    backgroundColor: ['#527578', '#84978F', '#ADA692', '#B3B1B2','#218559','#21B6A8','#177F75','#66A7C5'],//라벨별 컬러설정
		    borderColor: '#22252B',
		    data: categoryCnt
		}
	var labels=categoryName;
	var datasets={ datasets:[dataset], labels:categoryName }


		  
	var config = {
		   type: 'pie',
		   data: datasets, //데이터 셋 
		   options: {
			   title: {
				   responsive: true,
			        display: true,
			        text: '프로젝트 카테고리 별 '
			      },
		       responsive: true,
		       maintainAspectRatio: false, //true 하게 되면 캔버스 width,height에 따라 리사이징된다.
		       legend: {
		           position: 'right',
		           fontColor: 'black',
		           align: 'center',
		           display: true,
		           fullWidth: true,
		           labels: {
		               fontColor: 'rgb(0, 0, 0)'
		           }
		       }
		      
	    }
	}
	var canvas=document.getElementById('mychart');
	var pieChart = new Chart(canvas,config);
	var allcnt = new Array();
	var allDate = new Array();
	var buisnesscnt = new Array();
	var normalcnt = new Array();

	<c:forEach items="${monthChart}" var='i'>
		allcnt.push('${i.cnt}')
		allDate.push('${i.regDate}')
		buisnesscnt.push('${i.buisnesscnt}')
		normalcnt.push('${i.normalcnt}')
		 
		
	</c:forEach>
	const ctx = document.getElementById('monthchart'); // getContext('2d') 를 하는 경우가 있는데 없어야 엑셀다운가능

	new Chart(document.getElementById("monthchart"), {
    	type: 'line',
    	data: {
      	labels: allDate,
      	datasets: [{ 
          data: allcnt
       	  ,label: "회원가입 수",
          borderColor: "#E5AE86",
//           fill: start
     	   },{
 	      data: normalcnt
          ,label: "일반 회원가입 수",
          borderColor: "#DFD27C",
//          fill: start
        	},{
       	  data: buisnesscnt
          ,label: "사업자 회원가입 수",
          borderColor: "#B7A6AD",
       //        fill: start
       }]  
    },
    options: {
      title: {
        display: true,
        text: '30일 회원 가입 현황 그래프'
      }
    }
 });

</script>
</body>
</html>
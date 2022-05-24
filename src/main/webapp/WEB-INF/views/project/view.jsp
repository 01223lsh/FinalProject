<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!--부트스트랩-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!--폰트-->
<link rel="preconnect" href="https://fonts.gstatic.com/%22%3E">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->

<script src="https://kit.fontawesome.com/dd18300701.js"
	crossorigin="anonymous"></script>






<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	$(document).ready(function() {
		
		$(".bgimg").css("background-image",'url("${project.projectImage}")');

		
		$("#plan").on("click",function(){
			
			$.ajax({
				url:"/project/plan",
				type:"post",
				data:{projectNo:${project.projectNo }},
				dataType: "html",
				success:function(res){
					console.log("성공")
					
					$("#plan").css("color", "#A2D5AB");
        			$("#story").css("color", "gray");
        			$("#news").css("color", "gray");
        			$("#comment").css("color", "gray");
        			$("#contributors").css("color", "gray");
        			$("#content3_1").html(res);
				},
				error:function(){
        			console.log("통신실패");
        		}
			})
		})
		
		$("#story").on("click", function(){
			
			
			$.ajax({
				url:"/project/content",
				type:"post",
				data:{projectNo:${project.projectNo }},
				dataType: "html",
				success:function(res){
					console.log("성공")
			
			$("#story").css("color", "#A2D5AB");
			$("#plan").css("color", "gray");
			$("#news").css("color", "gray");
			$("#comment").css("color", "gray");
			$("#contributors").css("color", "gray");
			$("#content3_1").html(res);
				},
				error:function(){
        			console.log("통신실패");
        		}
		})
		
		})
	
		$("#news").on("click",function(){
			
			$.ajax({
				url:"/project/news/list",
				type:"post",
				data:{projectNo:${project.projectNo }},
				dataType: "html",
				success:function(res){
					console.log("성공")
					
					$("#news").css("color", "#A2D5AB");
        			$("#story").css("color", "gray");
        			$("#plan").css("color", "gray");
        			$("#comment").css("color", "gray");
        			$("#contributors").css("color", "gray");
        			$("#content3_1").html(res);
				},
				error:function(){
        			console.log("통신실패");
        		}
			})
		})
			
			$("#comment").on("click",function(){
			
			$.ajax({
				url:"/project/comment/list",
				type:"post",
				data:{projectNo:${project.projectNo }},
				dataType: "html",
				success:function(res){
					console.log("성공")
					
					$("#comment").css("color", "#A2D5AB");
        			$("#story").css("color", "gray");
        			$("#news").css("color", "gray");
        			$("#plan").css("color", "gray");
        			$("#contributors").css("color", "gray");
        			$("#content3_1").html(res);
				},
				error:function(){
        			console.log("통신실패");
        		}
			})
			})
			
			$("#contributors").on("click",function(){
			
			$.ajax({
				url:"/project/contributors",
				type:"post",
				data:{projectNo:${project.projectNo }},
				dataType: "html",
				success:function(res){
					console.log("성공")
					
					$("#contributors").css("color", "#A2D5AB");
        			$("#story").css("color", "gray");
        			$("#news").css("color", "gray");
        			$("#plan").css("color", "gray");
        			$("#comment").css("color", "gray");
        			$("#content3_1").html(res);
				},
				error:function(){
        			console.log("통신실패");
        		}
			})
			})
			
			
		
	})
	
	function updatetalk(){
		$("#upmodal").fadeIn();
	}
	
	function upclose(){
		$("#upmodal").fadeOut();
	}
	
	
	
	function loginModal(){
		$(".modal").fadeIn();
	}

		function loginModalClose(){
			$(".modal").fadeOut();
		}
	
	</script>
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

div {
	border: px solid white;
}

#outer {
	width: 1000px;
	overflow: hidden;
	height: auto;
	text-align: center;
	margin: auto;
}

#category {
	width: auto;
	height: 45px;
	background-color: #A2D5AB;
	display: inline-block;
	margin: 50px 0px 20px 0px;
	padding: 5px 10px 5px 10px;
	font-size: 17px;
	border-radius: 5px;
}

#category>p {
	font-weight: 500;
	color: white;
	margin-top: 3px;
}

#content1 {
	height: 530px;
	margin-bottom: 20px;
}

#content1>h2 {
	margin-bottom: 15px;
}

#content1_1 {
	margin-top: 50px;
	margin-left: 30px; float : left;
	width: 480px;
	height: 330px;
	display: flex;
	float: left;
}

/*content1_2*/
#content1_2 {
	float: left;
	margin-left: 30px;
}

#content1_2_4 {
	width: 340px;
	margin: 0px 0px;
}

.viewdl {
	margin: 0px;
	display: flex;
}

.viewdt {
	width: 60px;
	margin-right: 20px;
	font-weight: 700;
	color: rgb(61, 61, 61);
	font-size: 12px;
	line-height: 20px;
}

.viewdd {
	margin: 0px;
	display: flex;
	font-weight: 400;
	color: rgb(61, 61, 61);
	font-size: 13px;
	line-height: 22px;
}

#progress {
	height: 10px;
	margin-bottom: 0;
}

#progress-bar {
	background-color: #A2D5AB;
	border-radius: 5px;
}

#btn-success1 {
	width: 360px;
	height: 45px;
	background-color: #39AEA9;
	font-size: 19px;
	border: none;
}

#chatbtn {
	width: 160px;
	height: 36px;
	background-color: rgb(240, 240, 240);
}

#btn-success1:hover {
	background-color: #A2D5AB;
	transition: .6s;
}

/*content2*/
#content2{
	height: auto;
}
#content2>ul {
	list-style-type: none;
}

#content2>ul>li {
	float: left;
	margin-left: 50px;
}

#content2>ul>li>a {
	text-decoration: none;
	color: lightslategray;
	cursor: pointer;
}

/*content3*/
#content3 {
	width: 1000px;
}

#content3_1 {
	float: left;
	min-height: 400px;
}

#content3_1 {
	width: 600px;
	margin-left: 50px;
	text-align: left;
}

#content3_2 {
	width: 300px;
	margin-left: 30px;
	text-align: left;
	float: right;
	padding: 16px 21px;
	border: 1px solid rgb(239,239,239);
	box-shadow: rgb(0 0 0 / 10%) 0px 1px 0px, rgb(0 0 0 / 4%) 0px 2px 4px;
}

/*reward*/
#reward {
	width: 300px;
	margin-left: 30px;
	text-align: left;
	float: right;
}



#reward a {
	list-style: none;
	text-decoration: none;
	color: black;
}

.reward_1{
	border: 1px solid rgb(239, 239, 239);
	border-radius: 4px;
    box-shadow: rgb(0 0 0 / 10%) 0px 1px 0px, rgb(0 0 0 / 4%) 0px 2px 4px;
    padding: 20px;
}



a.disabled {
	pointer-events: none;
	cursor: default;
}

#upmodal {
	position: absolute;
	width: 100%; 
	height: 1000%;
	background: rgba(0,0,0,0.8);
	top:0; left: 0;
	display: none;
}

#upmodal_content {
	position: fixed;
  width:400px; height:200px;
  background:#fff; border-radius:10px;
  top:0; left:0; bottom:0; right:0;
  margin: auto;
  text-align:center;
  box-sizing:border-box; padding:50px 0;
  line-height:23px; 
}

#chatbtn{
	text-decoration: none;
	display: flex;
	width: 50%;
	height: 36px;
	border: 1px solid rgb(240, 240, 240);
	border-radius: 4px;
	cursor: pointer;
	justify-content: center;
	align-items: center;
	color: rgb(0, 0, 0);
	font-weight: 400;
	font-size: 12px;
}

.contentTitle{
	font-weight: 700; 
	font-size: 18px; 
	padding: 5px 0px 10px;
}

#upmodalbtn2{
	text-decoration: none;
	width: 40%;
	height: 36px;
	border: 1px solid rgb(240, 240, 240);
	border-radius: 4px;
	cursor: pointer;
	justify-content: center;
	align-items: center;
	color: white;
	background-color: grey;
	font-weight: 400;
}

#upmodalbtn1{
	text-decoration: none;
	width: 40%;
	height: 36px;
	border: 1px solid rgb(240, 240, 240);
	border-radius: 4px;
	cursor: pointer;
	justify-content: center;
	align-items: center;
	color: white;
	background-color: #39AEA9;
	font-weight: 400;
}

.modal{
	position: absolute;
	width: 100%; 
	height: 1000%;
	background: rgba(0,0,0,0.8);
	top:0; left: 0;
	display: none;
}

.modal_content{
	position: fixed;
  width:400px; height:250px;
  background:#fff; border-radius:10px;
  top:0; left:0; bottom:0; right:0;
  margin: auto;
  text-align:center;
  box-sizing:border-box; padding:74px 0;
  line-height:23px; 
}

#modalcancel{
	text-decoration: none;
	width: 40%;
	height: 36px;
	border: 1px solid rgb(240, 240, 240);
	border-radius: 4px;
	cursor: pointer;
	justify-content: center;
	align-items: center;
	color: white;
	background-color: grey;
	font-weight: 400;
	
}

#toLogin{
	text-decoration: none;
	width: 40%;
	height: 36px;
	border: 1px solid rgb(240, 240, 240);
	border-radius: 4px;
	cursor: pointer;
	justify-content: center;
	align-items: center;
	color: white;
	background-color: #39AEA9;
	font-weight: 400;
}

.bgimg{
	position: relative;
	    background-size: cover;
    -webkit-filter: blur(10px);
    background-position: 50% 30%;
     height: 180px;
     background-color: #39AEA9; 
     background-image:linear-gradient( rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.3) );
     

}

.title:before,
.title .bgimg{display:none!important}
 @supports (-webkit-filter: blur(10px)) {
.title .bgimg {
      top: -20px;
      bottom: -20px;
      display: block !important;
      background-position:50% 30%;
      background-repeat:no-repeat;
      background-size: cover;
      -webkit-filter: blur(10px);
      z-index: 1;
      }
      .title:before {
      /* display: block !important; */
      content: '';
      clear: both;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      z-index: 2;
   }
</style>
</head>
<body>

		<div><%@include file="/WEB-INF/views/layout/header.jsp" %></div>
		<div class="title" style="height: 185px; overflow: hidden;">
		<div class="bgimg"></div>
		<div style="position: relative;top: -195px; z-index: 1; text-align: center;">
		<div id="category">
			<p>
				<c:choose>
					<c:when test="${project.categoryNo eq 1}">홈·리빙</c:when>
					<c:when test="${project.categoryNo eq 2}">테크·가전</c:when>
					<c:when test="${project.categoryNo eq 3}">향수·뷰티</c:when>
					<c:when test="${project.categoryNo eq 4}">잡화</c:when>
					<c:when test="${project.categoryNo eq 5}">의류</c:when>
					<c:when test="${project.categoryNo eq 6}">디자인·예술</c:when>
					<c:when test="${project.categoryNo eq 7}">푸드</c:when>
					<c:when test="${project.categoryNo eq 8}">반려동물</c:when>

				</c:choose>
			</p>
			</div>
			
			<h2>
				<b style="color: white;">${project.projectTitle }</b>
			</h2>
			</div>
		</div>
		<br>
		<div id="outer">
		<div id="content1">

			
			<br>

			<div id="content1_1">
				<img src="${project.projectImage }" style="width: 480px; height: 330px;">

			</div>


			<div id="content1_2">

				<div
					style="display: block; margin: 0px 0px 8px; padding: 0px; text-align: left;">

					<div id="content1_2_1" style="margin-bottom: 20px;">
						<c:choose>
							<c:when test="${d > 0}">
								<b style="font-size: 32px;">${d }</b>
								<small>일 남음</small>
								
								
							</c:when>
							<c:when test="${d <= 0 }">
								<b style="font-size: 32px;">종료</b>
							</c:when>
						</c:choose>
					</div>


					<div class="progress" id="progress">

						<div class="progress-bar"
							style="font-size:0; width:${Math.round(project.sum div project.projectPrice *100)}%; background-color: #39AEA9;"></div>
					</div>

					<div id="content1_2_2" style="margin-bottom: 20px;">
						<b style="font-size: 32px;">${Math.round(project.sum div project.projectPrice *100)}</b>
						<small>% 달성</small>
					</div>


					<div id="content1_2_3" style="margin-bottom: 20px;">
						<b style="font-size: 32px;"><fmt:formatNumber type="number"
								value="${project.sum }" /></b><small>원 펀딩</small>

					</div>
					
					<div id="content1_2_5" style="margin-bottom: 20px;">
						<b style="font-size: 32px;">${contributors }</b><small>명 후원</small>
					</div>
				</div>

				<div id="content1_2_4" style="margin-bottom: 20px; border-top: 1px solid rgb(244, 244, 244); padding: 15px 0px 5px; ">
					<div id="">
						<dl class="viewdl">
							<dt class="viewdt">목표금액</dt>
							<dd class="viewdd">${project.projectPrice }원</dd>
						</dl>
						<dl class="viewdl">
							<dt class="viewdt">펀딩기간</dt>
							<dd class="viewdd">
								<fmt:formatDate value="${project.openDate }"
									pattern="yyyy.MM.dd" />
								~
								<fmt:formatDate value="${project.closeDate }"
									pattern="yyyy.MM.dd" />
							</dd>
						</dl>
						<dl class="viewdl">
							<dt class="viewdt">배송일</dt>
							<dd class="viewdd">
								<fmt:formatDate value="${project.deliveryDate }"
									pattern="yyyy.MM.dd" />
								에 배송진행
							</dd>
						</dl>
					</div>
				</div>


				<c:choose>
					<c:when test="${project.projectStep eq 3 and login eq true}">
						<a href="/payment/chooseReward?projectNo=${project.projectNo}"
							type="button" class="btn btn-success" id="btn-success1">펀딩하기</a>
					</c:when>
					<c:when test="${project.projectStep eq 3 and empty login}">
						<a href="#" type="button" class="btn btn-success" id="btn-success1" onclick="loginModal()">펀딩하기</a>
						
					</c:when>
					<c:otherwise>
						<a href="" type="button" class="btn btn-success disabled"
							id="btn-success1">펀딩하기</a>
					</c:otherwise>
				</c:choose>




			</div>
		</div>




		<hr>
		<div id="content2">
			<ul>
				<li><a id="story" style="color: #A2D5AB;"><b>소개
					</b></a></li>
				<li><a id="plan"><b>계획</b></a></li>
				<li><a id="news"><b>최근소식</b></a></li>
				<li><a id="comment"><b>댓글</b></a></li>
				<li><a id="contributors"><b>후원자</b></a></li>

			</ul>
		</div>
		<br>
		<hr>





		<div id="content3">
			<div id="content3_1">
				<b>- 프로젝트 소개</b><br><br>
				<div> 
				${project.projectContent } 
				
				</div>
			</div>

			
			<div id="content3_2">
				<div style="padding: 5px 0px 20px; font-weight: bolder;">
					창작자 소개
				</div>
				<div style=" font-weight: bolder; font-size: 14px;">
					${seller.nick }
				
				</div>
				<div style="color: rgb(112, 112, 112); padding: 15px 0px 15px; font-size: 13px; line-height: 22px;">
					${seller.memberSeller.sellerInfo }
				
				</div>
				<div>
					<div style="font-weight: bolder; font-size: 14px;">대화가능시간&nbsp;
					<c:if test="${project.projectStep eq 3 and memberNo eq project.memberNo }">
					<button onclick="updatetalk()" style="border:1px solid white; background-color: white; font-size:13px;">수정</button>
					</c:if></div>
					<div style="color: rgb(112, 112, 112); padding: 15px 0px 15px; font-size: 13px; line-height: 22px;">${project.talkTime }</div>
					
				</div>
				<div>
					<c:choose>
					<c:when test="${project.projectStep eq 3 and login eq true }">
<%-- 					<a type="button" id="chatbtn" href="/chat/room/enter/${project.projectNo }">대화하기</a> --%>
					<a type="button" id="chatbtn" href="javascript:void(0)" onclick='window.open("/chat/room/enter/${project.projectNo }","_blank","width=500px, height=800px;");'>대화하기</a>
					</c:when>
					<c:when test="${project.projectStep eq 3 and empty login }">
					<a type="button" id="chatbtn" href="#" onclick="loginModal()">대화하기</a>
					</c:when>
					<c:otherwise></c:otherwise>
					</c:choose>
				</div>
			</div>


			<div id="upmodal">

				<div id="upmodal_content">
					<p>대화가능 시간을 입력해주세요.</p>
					<form action="/project/talktime" method="post">
						<input type="hidden" name="projectNo"
							value="${project.projectNo }">
						<input type="text" id="time" name="talkTime" value="${project.talkTime }">
						<div style="margin-top: 10px;">
						<button id="upmodalbtn2" type="button" onclick="upclose()">취소</button>
						<button id="upmodalbtn1">변경</button>
						
						</div>
					</form>



					<hr>

				</div>
			</div>



			
					<div id="reward">
						<br> <b>- 리워드 선택</b> <br>
						<c:choose>
							<c:when test="${login eq true and grade eq 0}">
						
						<c:forEach var="reward" items="${rewardList }">
							
				
									<c:choose>
									<c:when test="${reward.rewardAmount eq 0}">
									<a>
								
								<div id="reward_1" class="reward_1" style="opacity: 0.5;">
									
									</c:when>
									<c:otherwise>
									<a href="/payment/chooseReward?projectNo=${project.projectNo }&rewardNo=${reward.rewardNo }">
								
								<div id="reward_1" class="reward_1">
									</c:otherwise>
									</c:choose>
									
									<div style="font-size: 24px; line-height: 36px; margin: 0px 0px 6px;">
									${reward.rewardPrice }원 +</div>
									 <div style="font-size: 13px; line-height: 20px; margin-bottom: 6px;">
									 ${reward.rewardName }</div>
									<div style="font-size: 12px;line-height:19px; margin: 0px 0px 4px;">
									${reward.rewardIntro }</div>
									
									<c:choose>
									<c:when test="${reward.rewardPrice eq 1000}">
									
									</c:when>
									<c:otherwise>
									<em style=" font-weight: 500; background:#E7F9F9; color: #39AEA9; font-style: normal; font-size: 12px;">
									현재 ${reward.rewardAmount }개 남음</em>
									
									</c:otherwise>
									</c:choose>
										
								</div>
							</a>
							<br>
							</c:forEach>
							
							
							</c:when>
							
							<c:when test="${empty login }">
							<c:forEach var="reward" items="${rewardList }">
							
							<c:choose>
									<c:when test="${reward.rewardAmount eq 0}">
									<a>
								
								<div id="reward_1" class="reward_1" style="opacity: 0.5;">
									
									</c:when>
									<c:otherwise>
									<a href="#" onclick="loginModal()">
								
								<div id="reward_1" class="reward_1">
									</c:otherwise>
									</c:choose>
									
									
									
									
									
									
									<div style="font-size: 24px; line-height: 36px; margin: 0px 0px 6px;">
									${reward.rewardPrice }원 +</div>
									 <div style="font-size: 13px; line-height: 20px; margin-bottom: 6px;">
									 ${reward.rewardName }</div>
									<div style="font-size: 12px;line-height:19px; margin: 0px 0px 4px;">
									${reward.rewardIntro }</div>
									
									<c:choose>
									<c:when test="${reward.rewardPrice eq 1000}">
									
									</c:when>
									<c:otherwise>
									<em style=" font-weight: 500; background:#E7F9F9; color: #39AEA9; font-style: normal; font-size: 12px;">
									현재 ${reward.rewardAmount }개 남음</em>
									
									</c:otherwise>
									</c:choose>
									

								</div>
							</a>
							<br>
							</c:forEach>
							
							
							</c:when>
							<c:otherwise>
								
							
							</c:otherwise>
							
							</c:choose>
							<br>
						

					</div>
				


		</div>

	</div>
	
	
<div class="modal">

	<div class="modal_content">
		<p>로그인이 필요합니다</p>
		<p>로그인페이지로 이동하시겠습니까?</p>
		<div style="border-top: 1px solid #d6d6d6; padding-top: 20px; text-align: center; ">
		<a id="modalcancel" type="button" onclick="loginModalClose()">취소</a>
		<a id="toLogin" type="button" href="/member/login" style="">로그인</a>
		</div>
	</div>
</div>

<div><%@include file="/WEB-INF/views/layout/footer.jsp" %></div>

</body>
</html>
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
		

		
		$("#plan").on("click",function(){
			
			$.ajax({
				url:"/project/plan",
				type:"post",
				data:{projectNo:${project.projectNo }},
				dataType: "html",
				success:function(res){
					console.log("성공")
					
					$("#plan").css("color", "rgb(116, 152, 107)");
        			$("#story").css("color", "gray");
        			$("#news").css("color", "gray");
        			$("#comment").css("color", "gray");
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
			
			$("#story").css("color", "rgb(116, 152, 107)");
			$("#plan").css("color", "gray");
			$("#news").css("color", "gray");
			$("#comment").css("color", "gray");
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
					
					$("#news").css("color", "rgb(116, 152, 107)");
        			$("#story").css("color", "gray");
        			$("#plan").css("color", "gray");
        			$("#comment").css("color", "gray");
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
					
					$("#comment").css("color", "rgb(116, 152, 107)");
        			$("#story").css("color", "gray");
        			$("#news").css("color", "gray");
        			$("#plan").css("color", "gray");
        			$("#content3_1").html(res);
				},
				error:function(){
        			console.log("통신실패");
        		}
			})
			})
			
			
		
	})
	
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
	background-color: rgb(225, 212, 169);
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
	height: 410px;
	margin-bottom: 20px;
}

#content1>h2 {
	margin-bottom: 15px;
}

#content1_1>img {
	float: left;
	width: 480px;
	height: 330px;
	margin-left: 50px;
}

/*content1_2*/
#content1_2 {
	float: left;
	margin-left: 40px;
}

#content1_2_1, #content1_2_2, #content1_2_3, #content1_2_4 {
	float: left;
}

#progress {
	height: 10px;
	margin-bottom: 0;
}

#progress-bar {
	background-color: rgb(116, 152, 107);
	border-radius: 5px;
}

#btn-success1 {
	width: 360px;
	height: 45px;
	background-color: rgb(116, 152, 107);
	font-size: 19px;
	border: none;
}

#chatbtn{
	width: 160px;
	height: 36px;
	background-color: rgb(240, 240, 240);

}




#btn-success1:hover {
	background-color: rgb(78, 104, 72);
	transition: .6s;
}



/*content2*/
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
#content3{
	width: 1000px;
}

#content3_1 {
	float: left;
}

#content3_1 {
	width: 600px;
	margin-left: 50px;
	text-align: left;
}


#content3_2{
	width: 300px;
	margin-left: 50px;
	text-align: left;
	float: right;
	padding-left: 10px;
	padding-bottom: 10px;
	border: 1px solid black;
}



/*reward*/
#reward {
	width: 300px;
	margin-left: 50px;
	text-align: left;
	float: right;
}

#reward div {
	background-color: rgb(250, 250, 250);
	box-shadow: 4px 4px 4px rgb(206, 204, 204);
}

#reward a {
	list-style: none;
	text-decoration: none;
	color: black;
}


.reward_1 {
	padding: 30px;
	border-radius: 5px;
	cursor: pointer;
}



.reward_1 * {
	padding-bottom: 10px;
}

a.disabled{
	pointer-events: none;
	cursor: default;
}



</style>
</head>
<body>


	<div id="outer">
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
		<br>

		<div id="content1">
			<input type="hidden" value="3">
			<h2>
				<b>${project.projectTitle }</b>
			</h2>
			<br>

			<div id="content1_1">
				 <img src="/resources/mi.jpg">
			</div>

			<div id="content1_2">
				<div id="content1_2_1">
					<b>남은 기간</b><br>
					<c:choose>
					<c:when test="${d > 0}">
					<b style="font-size: 25px;">${d }</b><small>일 남음</small>
					</c:when>
					<c:when test="${d <= 0 }"><b style="font-size: 25px;">종료</b></c:when>
					</c:choose>
				
				</div>
				<br> <br><br>
				<div id="content1_2_4"><b>모인 금액</b></div><br>
				<div class="progress" id="progress">
					
					<div class="progress-bar"
						style="font-size:0; width:${Math.round(project.fundPrice div project.projectPrice *100)}%; background-color: rgb(116, 152, 107);"></div>
				</div>

				<div id="content1_2_2" style="margin-top: 5px;">
					<b style="font-size: 25px;">${Math.round(project.fundPrice div project.projectPrice *100)} </b><small>% 달성</small>
				</div>
				<br> <br>

				<div id="content1_2_3">
					<b style="font-size: 25px;"><fmt:formatNumber type="number"
							value="${project.fundPrice }" /></b><small>원 펀딩</small>
				</div>
				<br> <br> 
				<c:choose>
					<c:when test="${project.projectStep eq 3}">
					<a href="/payment/chooseReward?projectNo=${project.projectNo}" type="button" class="btn btn-success"
					id="btn-success1">펀딩하기</a>
					</c:when>
					<c:when test="${project.projectStep eq 4 }">
					<a href="" type="button" class="btn btn-success disabled"
					id="btn-success1">펀딩하기</a></c:when>
					</c:choose>
					 <br> <br>



			</div>
		</div>




		<hr>
		<div id="content2">
			<ul>
				<li><a id="story" style="color: rgb(116, 152, 107);"><b>소개
					</b></a></li>
				<li><a id="plan"><b>계획</b></a></li>
				<li><a id="news" ><b>최근소식</b></a></li>
				<li><a id="comment"><b>댓글</b></a></li>
				
			</ul>
		</div>
		<br>
		<hr>
		
	
	


		<div id="content3">
			<div id="content3_1">
				<b>-프로젝트 소개</b>
				<br><br>
				${project.projectContent }
			</div>
			
			
			<div id="content3_2">
			<b style="font-size: 15px;">창작자 소개</b>
			<br><br>
			<b style="font-size: 15px;">${seller.nick }</b>
			<br>
			<p>${seller.memberSeller.sellerInfo }</p>
			<p>대화가능시간</p>
			<a type="button" id="chatbtn" href="">대화하기</a>
			</div>
			

			<c:choose>
					<c:when test="${project.projectStep eq 3}">
					<div id="reward">
			<br>
			<b>- 리워드 선택</b>
			<a href="/payment/chooseReward?projectNo=${project.projectNo}">
					<div id="reward_1" class="reward_1">

						 <b
							style="font-size: 17px;">1000원</b><br> <br>
							<span>선물 없이 후원하기</span>
						

					</div>
					</a>
					<br>
				<c:forEach var="reward" items="${rewardList }">
				
				<a href="/payment/chooseReward?projectNo=${project.projectNo }&rewardNo=${reward.rewardNo }">
					<div id="reward_1" class="reward_1">
						
						 <b style="font-size: 17px;">${reward.rewardPrice }원 </b><br> <br>
							<span>${reward.rewardName }</span><br>
							<small>${reward.rewardIntro }</small>
					
					</div>
					</a>
					<br>
				</c:forEach>
				
			</div>
					</c:when>
					<c:when test="${project.projectStep eq 4}">
					
					</c:when>
					</c:choose>
			

		</div>

	</div>


</body>
</html>
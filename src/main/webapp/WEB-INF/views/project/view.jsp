<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
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
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js%22%3E"></script>
<script src="https://kit.fontawesome.com/dd18300701.js"
	crossorigin="anonymous"></script>






<meta charset="UTF-8">
<title>Insert title here</title>
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


#btn-success1:hover {
	background-color: rgb(78, 104, 72);
	transition: .6s;
}

.btn-outline-secondary {
	width: 110px;
	height: 50px;
	border-color: lightgray;
}

.btn-outline-secondary:hover {
	background-color: #fff !important;
	color: #000 !important;
}

.btn-outline-secondary>img {
	width: 35px;
	height: 35px;
	margin-top: -2px;
	float: left;
}

.btn-outline-secondary>p {
	margin-top: 5px;
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
}

/*content3*/
#content3_1, #content3_2 {
	float: left;
}

#content3_1,#content3_2 {
	width: 480px;
	margin-left: 50px;
	text-align: left;
}

#content3_1>img {
	width: 480px;
	height: 330px;
}



/*reward*/
#reward {
	width: 360px;
	margin-left: 50px;
	text-align: left;
	float: left;
}

#reward>div {
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

#reward>div:hover {
	background-color: rgba(250, 250, 250, 0.726);
}

.reward_1 * {
	padding-bottom: 10px;
}


</style>
</head>
<body>


	<div id="outer">
		<div id="category">
			<p>${project.categoryNo }</p>
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
					남은 기간<br>
					<b style="font-size: 25px;">${d }</b>일 남음
				</div>
				<br> <br><br>
				<div id="content1_2_4">모인 금액</div><br>
				<div class="progress" id="progress">
					
					<div class="progress-bar"
						style="font-size:0; width:${Math.round(project.fundPrice div project.projectPrice *100)}%; background-color: rgb(116, 152, 107);"></div>
				</div>

				<div id="content1_2_2" style="margin-top: 5px;">
					<b style="font-size: 25px;">${Math.round(project.fundPrice div project.projectPrice *100)} </b>% 달성
				</div>
				<br> <br>

				<div id="content1_2_3">
					<b style="font-size: 25px;"><fmt:formatNumber type="number"
							value="${project.fundPrice }" /></b>원 펀딩
				</div>
				<br> <br> <a href="" type="button" class="btn btn-success"
					id="btn-success1">펀딩하기</a> <br> <br>









			</div>
		</div>



		






		<hr>
		<div id="content2">
			<ul>
				<li><a id="story" href="#" style="color: rgb(116, 152, 107);"><b>소개
					</b></a></li>
				<li><a id="author" href="#"><b>계획</b></a></li>
				<li><a id="news" href="#"><b>최근소식</b></a></li>
				<li><a id="comment" href="#"><b>댓글</b></a></li>
				
			</ul>
		</div>
		<br>
		<hr>
		
	


		<div id="content3">
			<div id="content3_1">
				${project.projectContent }
			</div>
			

			<div id="reward">
<%-- 				<c:forEach var="r" items="${ list }"> --%>
					<div id="reward_1" class="reward_1">

						<a href="pay.me?rno=<%--리워드번호 --%>"> <b
							style="font-size: 17px;">(금액)원 펀딩 </b><br> <br>
							<span>설명글</span>
						</a>

					</div>
					<br>
<%-- 				</c:forEach> --%>
			</div>

		</div>

	</div>




</body>
</html>
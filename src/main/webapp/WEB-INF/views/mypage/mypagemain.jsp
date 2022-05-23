<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">


<c:import url="/WEB-INF/views/layout/header.jsp" />
<c:import url="/WEB-INF/views/layout/mypageheader.jsp" />

<script type="text/javascript">

$(document).ready(function() {

	
	if("${grade ==0 && grade==3}"){
		$(".FinalUser").show();
		$(".user1").show();
		$(".user2").show();
		$(".userqna").show();
		$(".borderSeller").hide();
		$(".admin").hide();

	};
	
	if("${grade}"==1){
		$(".borderSeller").show();
		$(".FinalSeller").show();
		$(".seller1").show();
		$(".seller2").show();
		$(".seller3").show();
		$(".seller4").show();
		$(".seller5").show();
		$(".sellerqna").show();
		$(".FinalUser").hide();
		$(".borderUser").hide();
		$(".admin").hide();

		
	};
	
	if("${grade}"==2){

		$(".FinalUser").hide();
		$(".user1").hide();
		$(".user2").hide();
		$(".userqna").show();
		$(".borderSeller").hide();
		$(".borderSeller").hide();
		$(".FinalSeller").hide();
		$(".seller1").hide();
		$(".seller2").hide();
		$(".seller3").hide();
		$(".seller4").hide();
		$(".seller5").hide();
		$(".sellerqna").hide();
		$(".FinalUser").hide();
		$(".borderUser").hide();
		$(".border2").hide();
		$(".admin").show();
		
		
		
	};
	
	
})



</script>


<style>

.right {
	font-family: 'IBM Plex Sans KR', sans-serif;
}

.border {
	border: 2px solid #39AEA9;
	border-radius: 8px;
	margin-left : 15%;
	height: 150px;
	width: 70%;
}

.borderUser {
	border: 4px solid #A2D5AB;
	border-radius: 8px;
	margin-left : 15%;
	height: 150px;
	width: 70%;
}

.borderSeller {
	border: 4px solid #A2D5AB;
	border-radius: 8px;
	margin-left : 15%;
	height: 300px;
	width: 70%;
}

.border2 {
	border: 4px solid #A2D5AB;
	border-radius: 8px;
	margin-left : 15%;
	height: 230px;
	width: 70%;
}
/*
.user {
	display: none;
}

.seller {
	display: none;
}
*/

button {

	border: none;
	background-color: #FFF;
	font-size: 23px;

}

 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}

.etcBtn a {
	position: relative;
    text-decoration: none;
    color: #000000;
    /*텍스트에서 밑줄 간격 띄우기*/
    padding-bottom: 10px;
}

.etcBtn a:before {

    content: '';
    position: absolute; /*부모 요소에는 position: relative를 주어야 함*/
    background-color: #538fd9;
    height: 3px;

    width: 0; /*초기에 보이지 않도록*/
    bottom: 0; /*a태그 아래에 위치*/
    transition: 0.7s; /*애니메이션 동작 실행 시간 정의*/

}

.etcBtn a:hover:before {
    width: 100%;
}

.etcBtn {
	display: inline-block;
	margin-right: 30px;
	font-weight: bold;

}

#main {

/* 	border: 2px solid #DDD; */
	border-radius: 8px;
	margin-left : 10%;
	height: 100%;
	width: 80%;
	font-family: 'IBM Plex Sans KR', sans-serif;

}


</style>


<div class="right">
<div id="main" style="text-align: center;" >




<div style="margin-top: 30px;">
<p style="font-size: 20px; font-weight: bolder; margin-top: 40px; display: inline-block;">${nick }님, 안녕하세요! </p>
<img src="/resources/img/mypage/smile.png" alt="안나오네" height="25px" width="25px;" style="margin-top: -10px;">
</div><br><br>
<%-- <span>안녕하세요! 등급확인을 해보죠 ${grade }</span> --%>



<div class="borderUser">

<!-- 일반회원 - 참여중인 프로젝트 -->
<div class="FinalUser">
<div class="user1" style="display: none;">
	<div id="first" style="height: 150px; width: 33%; float: left; ">
		<div style="height: 80px; line-height: 100px; ">
		
			<c:choose>
			<c:when test="${joinCnt == 0}"><strong><span style="font-size: 45px;">${joinCnt}</span></strong></c:when>
			<c:otherwise><a href="/mypage/joinfunlist?select=projectStep&search=3" ><strong><span style="font-size: 45px;">${joinCnt}</span></strong></a></c:otherwise>
			</c:choose>
		
		</div>
			<hr>
		<div>	
			<span style="font-size: 18px; line-height: 0px; font-weight: bold; line-height: 20px;">참여중인 프로젝트</span>
		</div>
	</div>
	<div style="border: 1px solid #DDD; float: left; width: 0.1px; height: 150px; "></div>
</div>	

<!-- 일반회원 - 참여했던 프로젝트 -->
<div class="user2" style="display: none;">
	<div id="first" style="height: 150px; width: 33%; float: left; ">
		<div style="height: 80px; line-height: 100px; ">
			<c:choose>
			<c:when test="${joinendCnt == 0}"><strong><span style="font-size: 45px;">${joinendCnt}</span></strong></c:when>
			<c:otherwise><a href="/mypage/joinfunlist?select=projectStep&search=4" ><strong><span style="font-size: 45px;">${joinendCnt}</span></strong></a></c:otherwise>
			</c:choose>
		</div>
			<hr>
		<div>	
			<span style="font-size: 18px; line-height: 0px; font-weight: bold; line-height: 20px;">참여했던 프로젝트</span>
		</div>
	</div>
	<div style="border: 1px solid #DDD; float: left; width: 0.1px; height: 150px;"></div>
</div>

<div class="userqna" style="display: none;">
<div id="first" style="height: 150px; width: 33%; float: left;">
		<div style="height: 80px; line-height: 100px; ">
		
			<c:choose>
			<c:when test="${qnaCnt == 0}"><strong><span style="font-size: 45px;">${qnaCnt}</span></strong></c:when>
			<c:otherwise><a href="/qna/list?select=nick&search=${nick }" ><strong><span style="font-size: 45px;">${qnaCnt }</span></strong></a></c:otherwise>
			</c:choose>
		
		
		</div>
			<hr>
		<div>	
			<span style="font-size: 18px; line-height: 0px; font-weight: bold; line-height: 20px;">나의 문의사항</span>
		</div>
	</div>

</div>
</div>

</div><!-- .boderUser -->


<!-- 판매자 - 작성중인 프로젝트	 -->
<div class="borderSeller">
<div class="FinalSeller">
<div class="seller1" style="display: none;">
	<div id="first" style="height: 150px; width: 33%; float: left; border-bottom: 3px solid #A2D5AB;">
		<div style="height: 80px; line-height: 100px; ">
		
		
			<c:choose>
			<c:when test="${makefund0 == 0}"><strong><span style="font-size: 45px;">${makefund0}</span></strong></c:when>
			<c:otherwise><a href="/mypage/makefunlist?select=projectStep&search=0" ><strong><span style="font-size: 45px;">${makefund0 }</span></strong></a></c:otherwise>
			</c:choose>
		
			
		</div>
			<hr>
		<div>	
			<span style="font-size: 18px; line-height: 0px; font-weight: bold; line-height: 20px;">작성중인 프로젝트</span>
		</div>
	</div>
	<div style="border: 1px solid #DDD; float: left; width: 0.1px; height: 150px; "></div>
</div>		


<!-- 판매자 - 승인대기 프로젝트 -->
<div class="seller2" style="display: none;">
	<div id="first"  style="height: 150px; width: 33%; float: left; border-bottom: 3px solid #A2D5AB;">
		<div style="height: 80px; line-height: 100px; ">
		
			<c:choose>
			<c:when test="${makefund1 == 0}"><strong><span style="font-size: 45px;">${makefund1}</span></strong></c:when>
			<c:otherwise><a href="/mypage/makefunlist?select=projectStep&search=1" ><strong><span style="font-size: 45px;">${makefund1 }</span></strong></a></c:otherwise>
			</c:choose>
		
		</div>
			<hr>
		<div>	
			<span style="font-size: 18px; line-height: 0px; font-weight: bold; line-height: 20px;">승인 대기중 프로젝트</span>
		</div>
	</div>
	<div style="border: 1px solid #DDD; float: left; width: 0.1px; height: 150px;"></div>
</div>

<!-- 판매자 - 승인거절된 프로젝트 -->
<div class="seller3" style="display: none;">
	<div id="first"  style="height: 150px; width: 33%; float: left; border-bottom: 3px solid #A2D5AB;">
		<div style="height: 80px; line-height: 100px; ">
		
			<c:choose>
			<c:when test="${makefund2 == 0}"><strong><span style="font-size: 45px;">${makefund2}</span></strong></c:when>
			<c:otherwise><a href="/mypage/makefunlist?select=projectStep&search=2" ><strong><span style="font-size: 45px;">${makefund2 }</span></strong></a></c:otherwise>
			</c:choose>
		
		</div>
			<hr>
		<div>	
			<span style="font-size: 18px; line-height: 0px; font-weight: bold; line-height: 20px;">승인 거절된 프로젝트</span>
		</div>
	</div>
<!-- 	<div style="border: 1px solid #DDD; float: left; width: 0.1px; height: 150px;"></div> -->
</div>
<!-- <hr style="margin-bottom: 150px"> -->

<!-- 판매자 - 진행대기중 프로젝트 -->
<div class="seller2" style="display: none;">
	<div id="first"  style="height: 150px; width: 33%; float: left; ">
		<div style="height: 80px; line-height: 100px; ">
		
			<c:choose>
			<c:when test="${makefund5 == 0}"><strong><span style="font-size: 45px;">${makefund5}</span></strong></c:when>
			<c:otherwise><a href="/mypage/makefunlist?select=projectStep&search=5" ><strong><span style="font-size: 45px;">${makefund5 }</span></strong></a></c:otherwise>
			</c:choose>
		
		</div>
			<hr>
		<div>	
			<span style="font-size: 18px; line-height: 0px; font-weight: bold; line-height: 20px;">진행 대기중 프로젝트</span>
		</div>
	</div>
	<div style="border: 1px solid #DDD; float: left; width: 0.1px; height: 150px;"></div>
</div>


<!-- 판매자 - 진행중인 프로젝트 -->
<div class="seller4" style="display: none;">
	<div id="first"  style="height: 150px; width: 33%; float: left; ">
		<div style="height: 80px; line-height: 100px; ">
		
			<c:choose>
			<c:when test="${makefund3 == 0}"><strong><span style="font-size: 45px;">${makefund3}</span></strong></c:when>
			<c:otherwise><a href="/mypage/makefunlist?select=projectStep&search=3" ><strong><span style="font-size: 45px;">${makefund3 }</span></strong></a></c:otherwise>
			</c:choose>
		
		</div>
			<hr>
		<div>	
			<span style="font-size: 18px; line-height: 0px; font-weight: bold; line-height: 20px;">진행중인 프로젝트</span>
		</div>
	</div>
	<div style="border: 1px solid #DDD; float: left; width: 0.1px; height: 150px;"></div>
</div>

<!-- 판매자 - 종료된 프로젝트 -->
<div class="seller5" style="display: none;">
	<div id="first"  style="height: 150px; width: 33%; float: left; ">
		<div style="height: 80px; line-height: 100px; ">
		
			<c:choose>
			<c:when test="${makefund4 == 0}"><strong><span style="font-size: 45px;">${makefund4}</span></strong></c:when>
			<c:otherwise><a href="/mypage/makefunlist?select=projectStep&search=4" ><strong><span style="font-size: 45px;">${makefund4 }</span></strong></a></c:otherwise>
			</c:choose>
		
			
		</div>
			<hr>
		<div>	
			<span style="font-size: 18px; line-height: 0px; font-weight: bold; line-height: 20px;">종료된 프로젝트</span>
		</div>
	</div>
<!-- 	<div style="border: 1px solid #DDD; float: left; width: 0.1px; height: 150px;"></div> -->
</div>

<!-- <div class="sellerqna" style="display: none;"> -->
<!-- <div id="first" style="height: 150px; width: 33%; float: left;"> -->
<!-- 		<div style="height: 80px; line-height: 100px; "> -->
			
<%-- 			<c:choose> --%>
<%-- 			<c:when test="${qnaCnt == 0}"><strong><span style="font-size: 45px;">${qnaCnt}</span></strong></c:when> --%>
<%-- 			<c:otherwise><a href="/qna/list?select=nick&search=${nick }" ><strong><span style="font-size: 45px;">${qnaCnt }</span></strong></a></c:otherwise> --%>
<%-- 			</c:choose> --%>
			
<!-- 		</div> -->
<!-- 			<hr> -->
<!-- 		<div>	 -->
<!-- 			<span style="font-size: 18px; line-height: 0px;">나의 문의사항</span> -->
<!-- 		</div> -->
<!-- 	</div> -->

<!-- </div> -->

</div>
</div><!-- boderSeller -->

<br>
<div class="border2" style="margin-top: 20px;">
	<div id="first" style="height: 280px; width: 100%;">
		<div style="height: 10%; line-height: 40px;">
			<span style="font-size: 18px; font-weight: bold;">나의 최근 문의내역</span>
		</div>
			<hr style="margin-bottom: 5px; height: 3px; color: #A2D5AB">
		<div>	
		
			<c:forEach var="q" items="${qnalist }" begin="0" end="${fn:length(qnalist)}" >
			
			<a href="/qna/view?qnaNo=${q.QNA_NO }" ><span style="font-size: 15px; line-height: 20px; float: left; margin-left: 10px;">${q.QNA_TITLE }</span></a>
			
<%-- 			<c:if test="${q.QNA_REFER >1 }"><span style="font-size: 15px; line-height: 20px; float: right; margin-right: 10px; color: tomato; ">답변완료</span></c:if> --%>
<%-- 			<c:if test="${q.QNA_REFER <1 }"><span style="font-size: 15px; line-height: 20px; float: right; margin-right: 10px; color: tomato; "></span></c:if> --%>
<%-- 			<a href="/qna/view?qnaNo=${q.QNA_NO }" ><span style="font-size: 15px; line-height: 20px; float: right; margin-right: 10px; color: tomato; ">답변확인</span></a> --%>
			
			
			<span style="font-size: 15px; line-height: 20px; float: right; margin-right: 10px;"><fmt:formatDate value="${q.QNA_CREATE_DATE}" pattern="yy.MM.dd"/></span>
			<br>
			<hr style="margin-top: 5px; margin-bottom: 5px;">		
			
			</c:forEach>
		</div>
	</div>
</div>


<div class="admin">
	<p style="font-weight: bold; font-size: 20px;" >${nick }님, 관리자는 마이페이지에서 정보수정만 가능합니다.</p>

</div>
<br>
<!-- <div style="clear: both;"></div> -->

<div style="margin-top: 50px; text-align: center;" class="etcBtn">
	<img src="/resources/img/mypage/notice2.png" alt="안나오네" height="40px" width="40px;" style="margin-top: -10px;">
	<a href="/notice/list"><button style="font-weight: bold;">공지사항</button></a>
</div>
<div style="margin-top: 50px; text-align: center;" class="etcBtn">
	<img src="/resources/img/mypage/guide.png" alt="안나오네" height="35px" width="35px;" style="margin-top: -10px;">
	<a href="/main/guide"><button  style="font-weight: bold;">이용가이드</button></a>
</div>
<div style="margin-top: 50px; text-align: center;" class="etcBtn">
	<img src="/resources/img/mypage/cs.png" alt="안나오네" height="35px" width="35px;" style="margin-top: -15px;">
	<a href="/qna/list"><button  style="font-weight: bold;">고객센터</button></a>
</div>


</div><!-- main -->
</div><!-- right -->
</div> <!-- container  -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />
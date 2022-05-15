<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt" %>

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

.border {
	border: 1px solid #81BEF7;
	border-radius: 15px;
	margin-left : 15%;
	height: 150px;
	width: 70%;
}

.borderUser {
	border: 1px solid #81BEF7;
	border-radius: 15px;
	margin-left : 15%;
	height: 150px;
	width: 70%;
}

.borderSeller {
	border: 1px solid #81BEF7;
	border-radius: 15px;
	margin-left : 15%;
	height: 300px;
	width: 70%;
}

.border2 {
	border: 1px solid #81BEF7;
	border-radius: 15px;
	margin-left : 10%;
	height: 210px;
	width: 80%;
}
/*
.user {
	display: none;
}

.seller {
	display: none;
}
*/

 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}


button {
	background-color: white; 
	border: 0px solid #81BEF7;
	margin-right: 40px;
	width: 120px;
	height: 50px;
	border-radius: 8px;
	font-size: 18px;
/* 	font-weight: bold; */
	color: black;
}


</style>


<div class="right">
<div id="main" style="text-align: center;" >





<p style="font-size: 20px; font-weight: bolder; margin-top: 80px;">${nick }님, 안녕하세요!</p><br><br>
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
			<span style="font-size: 18px; line-height: 0px;">참여중인 프로젝트</span>
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
			<span style="font-size: 18px; line-height: 0px;">참여했던 프로젝트</span>
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
			<span style="font-size: 18px; line-height: 0px;">나의 문의사항</span>
		</div>
	</div>

</div>
</div>

</div><!-- .boderUser -->


<!-- 판매자 - 준비중인 프로젝트	 -->
<div class="borderSeller">
<div class="FinalSeller">
<div class="seller1" style="display: none;">
	<div id="first" style="height: 150px; width: 33%; float: left; border-bottom: 1px solid #DDD;">
		<div style="height: 80px; line-height: 100px; ">
		
		
			<c:choose>
			<c:when test="${makefund0 == 0}"><strong><span style="font-size: 45px;">${makefund0}</span></strong></c:when>
			<c:otherwise><a href="/mypage/makefunlist?select=projectStep&search=0" ><strong><span style="font-size: 45px;">${makefund0 }</span></strong></a></c:otherwise>
			</c:choose>
		
			
		</div>
			<hr>
		<div>	
			<span style="font-size: 18px; line-height: 0px;">작성중인 프로젝트</span>
		</div>
	</div>
	<div style="border: 1px solid #DDD; float: left; width: 0.1px; height: 150px; "></div>
</div>		


<!-- 판매자 - 제작한 프로젝트 -->
<div class="seller2" style="display: none;">
	<div id="first"  style="height: 150px; width: 33%; float: left; border-bottom: 1px solid #DDD;">
		<div style="height: 80px; line-height: 100px; ">
		
			<c:choose>
			<c:when test="${makefund1 == 0}"><strong><span style="font-size: 45px;">${makefund1}</span></strong></c:when>
			<c:otherwise><a href="/mypage/makefunlist?select=projectStep&search=1" ><strong><span style="font-size: 45px;">${makefund1 }</span></strong></a></c:otherwise>
			</c:choose>
		
		</div>
			<hr>
		<div>	
			<span style="font-size: 18px; line-height: 0px;">승인대기중 프로젝트</span>
		</div>
	</div>
	<div style="border: 1px solid #DDD; float: left; width: 0.1px; height: 150px;"></div>
</div>

<div class="seller3" style="display: none;">
	<div id="first"  style="height: 150px; width: 33%; float: left; border-bottom: 1px solid #DDD;">
		<div style="height: 80px; line-height: 100px; ">
		
			<c:choose>
			<c:when test="${makefund2 == 0}"><strong><span style="font-size: 45px;">${makefund2}</span></strong></c:when>
			<c:otherwise><a href="/mypage/makefunlist?select=projectStep&search=2" ><strong><span style="font-size: 45px;">${makefund2 }</span></strong></a></c:otherwise>
			</c:choose>
		
		</div>
			<hr>
		<div>	
			<span style="font-size: 18px; line-height: 0px;">승인 거절된 프로젝트</span>
		</div>
	</div>
<!-- 	<div style="border: 1px solid #DDD; float: left; width: 0.1px; height: 150px;"></div> -->
</div>
<!-- <hr style="margin-bottom: 150px"> -->
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
			<span style="font-size: 18px; line-height: 0px;">진행중인 프로젝트</span>
		</div>
	</div>
	<div style="border: 1px solid #DDD; float: left; width: 0.1px; height: 150px;"></div>
</div>

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
			<span style="font-size: 18px; line-height: 0px;">종료된 프로젝트</span>
		</div>
	</div>
	<div style="border: 1px solid #DDD; float: left; width: 0.1px; height: 150px;"></div>
</div>

<div class="sellerqna" style="display: none;">
<div id="first" style="height: 150px; width: 33%; float: left;">
		<div style="height: 80px; line-height: 100px; ">
			
			<c:choose>
			<c:when test="${qnaCnt == 0}"><strong><span style="font-size: 45px;">${qnaCnt}</span></strong></c:when>
			<c:otherwise><a href="/qna/list?select=nick&search=${nick }" ><strong><span style="font-size: 45px;">${qnaCnt }</span></strong></a></c:otherwise>
			</c:choose>
			
		</div>
			<hr>
		<div>	
			<span style="font-size: 18px; line-height: 0px;">나의 문의사항</span>
		</div>
	</div>

</div>

</div>
</div><!-- boderSeller -->

<!-- <div class="border2" style="margin-top: 30px;"> -->
<!-- 	<div id="first" style="height: 280px; width: 100%;"> -->
<!-- 		<div style="height: 10%; line-height: 40px;"> -->
<!-- 			<span style="font-size: 18px; font-weight: bold;">나의 최근 문의내역</span> -->
<!-- 		</div> -->
<!-- 			<hr style="margin-bottom: 5px;"> -->
<!-- 		<div>	 -->
		
<%-- 			<c:forEach var="q" items="${qnalist }" begin="0" end="${fn:length(qnalist)}" > --%>
			
<%-- 			<a href="/qna/view?qnaNo=${q.QNA_NO }" ><span style="font-size: 15px; line-height: 20px; float: left; margin-left: 10px;">${q.QNA_TITLE }</span></a> --%>
			
<%-- 			<c:if test="${q.QNA_REFER >1 }"><span style="font-size: 15px; line-height: 20px; float: right; margin-right: 10px; color: tomato; ">답변완료</span></c:if> --%>
<%-- 			<c:if test="${q.QNA_REFER <1 }"><span style="font-size: 15px; line-height: 20px; float: right; margin-right: 10px; color: tomato; "></span></c:if> --%>
<%-- 			<a href="/qna/view?qnaNo=${q.QNA_NO }" ><span style="font-size: 15px; line-height: 20px; float: right; margin-right: 10px; color: tomato; ">답변확인</span></a> --%>
			
			
<%-- 			<span style="font-size: 15px; line-height: 20px; float: right; margin-right: 10px;"><fmt:formatDate value="${q.QNA_CREATE_DATE}" pattern="yy.MM.dd"/></span> --%>
<!-- 			<br> -->
<!-- 			<hr style="margin-top: 5px; margin-bottom: 5px;">		 -->
			
<%-- 			</c:forEach> --%>
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->


<div class="admin">
	<p style="font-weight: bold; font-size: 20px;" >${nick }님, 관리자는 마이페이지에서 정보수정만 가능합니다.</p>

</div>
<br>
<!-- <div style="clear: both;"></div> -->

<div style="margin-top: 50px; text-align: center;">
	<button>공지사항 </button>
	<button>이용가이드 </button>
	<button>고객센터 </button>
</div>


</div><!-- main -->
</div><!-- right -->
</div> <!-- container  -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />
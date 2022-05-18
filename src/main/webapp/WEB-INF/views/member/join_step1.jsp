<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />



<style type="text/css">
div.top-text {
	margin: 0px 0px 50px;
	color : #2775C4;
	height: 74.4;
/*     text-align: center; */
    font-size: 30px;
}

.step-list {
	list-style-type: none;
}

.step-list li strong {
/* 	color: white; */
	font-weight: 300;
}

.step-list li.on strong {
 	background: #2775C4;
    margin: 0px;
    padding: 17px 118px;
    color: white;
    font-size: 16px;
}

.step-list li.off strong {
 	background: #bfc4ca;
    margin: 0px;
    padding: 17px 118px;
    color: white;
    font-size: 16px;
}


.step-list li {
	float: left;
	width: 33%;
	text-align: center;
	line-height: 50px;
}

.step1 {
	margin: 24px;
    padding: 54px;
	text-align: center; 
}

.join-wrap {
	margin: 20px;
}


 .box bg-1 { margin: 15px 0 112px 224px; }
 
 
 
 
/* ================= btn custom  =================  */ 

/* Saqui */
.button.button--saqui {
  overflow: hidden;
  color: #fff;
  background: #37474f;
  -webkit-transition: background-color 0.3s ease-in, color 0.3s ease-in;
  transition: background-color 0.3s ease-in, color 0.3s ease-in;
}
.button--saqui.button--inverted {
  background: #fff;
  color: #37474f;
}
.button--saqui::after {
  content: attr(data-text);
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  padding: 1em 2em;
  color: #37474f;
  -webkit-transform-origin: -25% 50%;
  transform-origin: -25% 50%;
  -webkit-transform: rotate3d(0, 0, 1, 45deg);
  transform: rotate3d(0, 0, 1, 45deg);
  -webkit-transition: -webkit-transform 0.3s ease-in;
  transition: transform 0.3s ease-in;
}
.button--saqui.button--inverted::after {
  color: #fff;
}
.button--saqui:hover::after,
.button--saqui:hover {
  -webkit-transition-timing-function: ease-out;
  transition-timing-function: ease-out;
}
.button--saqui:hover {
  background-color: #7986cb;
  color: #7986cb;
}
.button--saqui.button--inverted:hover {
  background-color: #3f51b5;
  color: #3f51b5;
}
.button--saqui:hover::after {
  -webkit-transform: rotate3d(0, 0, 1, 0deg);
  transform: rotate3d(0, 0, 1, 0deg);
}

/* ========================================== */

*This was all taken from https://tympanus.net/Development/ButtonStylesInspiration/ but I needed to see it in CodePen
*/
@import url(https://fonts.googleapis.com/css?family=Raleway:200,300,400,500,600);
@font-face {
  font-weight: normal;
  font-style: normal;
  font-family: 'codropsicons';
  src: url("../fonts/codropsicons/codropsicons.eot");
  src: url("../fonts/codropsicons/codropsicons.eot?#iefix") format("embedded-opentype"), url("../fonts/codropsicons/codropsicons.woff") format("woff"), url("../fonts/codropsicons/codropsicons.ttf") format("truetype"), url("../fonts/codropsicons/codropsicons.svg#codropsicons") format("svg");
}
*,
*:after,
*:before {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}
.cf:before,
.cf:after {
  content: '';
  display: table;
}
.cf:after {
  clear: both;
}
.support {
  font-weight: bold;
  padding: 2em 0 0 0;
  font-size: 1.4em;
  color: #ee2563;
  display: none;
}
a {
  color: #7986cb;
  text-decoration: none;
  outline: none;
}
a:hover,
a:focus {
  color: #3f51b5;
}
.hidden {
  position: absolute;
  width: 0;
  height: 0;
  overflow: hidden;
  pointer-events: none;
}
.container {
  margin: 0 auto;
  text-align: center;
  overflow: hidden;
}
.content h2 {
  margin: 0 0 2em;
}
.content p {
  margin: 1em 0;
  padding: 0 0 2em;
  font-size: 0.85em;
}
.box {
  padding: 4.5em 0;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-flex-wrap: wrap;
  -ms-flex-wrap: wrap;
  flex-wrap: wrap;
  -webkit-justify-content: center;
  justify-content: center;
}


/* Related demos */
.content--related {
  text-align: center;
  font-weight: 600;
}
.media-item {
  display: inline-block;
  padding: 1em;
  margin: 1em 0 0 0;
  vertical-align: top;
  -webkit-transition: color 0.3s;
  transition: color 0.3s;
}
.media-item__img {
  opacity: 0.8;
  max-width: 100%;
  -webkit-transition: opacity 0.3s;
  transition: opacity 0.3s;
}
.media-item:hover .media-item__img,
.media-item:focus .media-item__img {
  opacity: 1;
}
.media-item__title {
  font-size: 0.85em;
  margin: 0;
  padding: 0.5em;
}
@media screen and (max-width:50em) {
  .codrops-header {
    padding: 3em 10% 4em;
  }
}
@media screen and (max-width:40em) {
  .codrops-header h1 {
    font-size: 2.8em;
  }
}

/* Common button styles */
.button {
  float: left;
  min-width: 150px;
  max-width: 250px;
  display: block;
  margin: 1em;
  padding: 1em 2em;
  border: none;
  background: none;
  color: inherit;
  vertical-align: middle;
  position: relative;
  z-index: 1;
  -webkit-backface-visibility: hidden;
  -moz-osx-font-smoothing: grayscale;
}
.button:focus {
  outline: none;
}
.button > span {
  vertical-align: middle;
}

/* Text color adjustments (we could stick to the "inherit" but that does not work well in Safari) */
.bg-1 .button {
    color: white;
    border-color: #37474f;
    width: 300px;
    height: 77px;
    font-size: 21px;
}

/* Typography and Roundedness */
.button--text-upper {
  letter-spacing: 2px;
  text-transform: uppercase;
}
.button--text-thick {
  font-weight: 600;
}
.button--round-l {
  border-radius: 40px;
}

/* Borders */
.button--border-thin {
  border: 1px solid;
}
.button--border-medium {
  border: 2px solid;
}
.button--border-thick {
  border: 3px solid;
}
  
</style>



<script type="text/javascript">
$(document).ready(function(){
	
	
	//--------사업자 인증-----------
	$("#certify").click(function() {
// 		window.alert("메세지창 열림");

		var input = prompt('사업자번호를 입력해주세요', '사업자 번호 입력');
// 		alert(input);
// 		document.write(input);

		var data = {
// 				"b_no": ["8518700622"] 
			    "b_no": [input] 
		   };
		   
		$.ajax({
		  url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=BQTBKoZ%2BPyo%2BKblU%2FvyBqrZGloHKViIkdq2j46P2kIyPDwhHt77dSjDlR7ct3%2FcjNjgOPce9b1aqnViDg734Jw%3D%3D",  
		  type: "POST",
		  data: JSON.stringify(data), // json 을 string으로 변환하여 전송
		  dataType: "JSON",
		  contentType: "application/json",
		  accept: "application/json",
		  success: function(result) {
		      console.log("사업자번호 확인 완료")
		       console.log(result.status_code); //OK

			  console.log(result);
		      console.log(result["data"][0]["tax_type"]); 
		      //=> 국세청에 등록되지 않은 사업자등록번호입니다. 일 때 실패
		      
		      if(result["data"][0]["tax_type"] == '국세청에 등록되지 않은 사업자등록번호입니다.'){
		    	  console.log("사업자 번호 아님")
		    	  alert('국세청에 등록되지 않은 사업자등록번호입니다.\n다시 한번 확인해주세요.');
		    	  
		      } else {
		    	  console.log("사업자 번호 맞음")
		    	  window.location.href = 'http://localhost:8088/member/join_step2_seller';
		      }
		  },
		  error: function(result) {
		      console.log("사업자번호 확인 실패")
		      console.log(result.responseText); //responseText의 에러메세지 확인
		  }
		})
	}) //#certify end
	
	
	
}) //document end



</script>




<div class="container">

	<div class="join-wrap">
		<ol class="step-list">
			<li class="on">
				<strong>STEP1<span>  회원구분</span></strong>
			</li>
			<li class="off">
				<strong>STEP2<span>  약관동의</span></strong>
			</li>
			<li class="off">
				<strong>STEP3<span>  정보입력</span></strong>
			</li>
		</ol>
	</div>
	
	
	<div class="step1">
		 <section class="content">
		        <div class="box bg-1">
		          <button class="button button--saqui button--round-l button--text-thick" data-text="일반 회원가입" onClick="location.href='/member/join_step2_consumer'">일반 회원가입</button>
		          <button class="button button--saqui button--round-l button--text-thick" data-text="판매자 회원가입">판매자 회원가입</button>
		        </div>
		</section>
	</div>
</div>


<c:import url="/WEB-INF/views/layout/footer.jsp" />
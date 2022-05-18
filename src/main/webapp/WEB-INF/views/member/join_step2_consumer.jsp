<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
*{margin: 0;padding: 0;box-sizing: border-box}
body{background-color: #f7f7f7;}
ul>li{list-style: none}
a{text-decoration: none;}
.clearfix::after{content: "";display: block;clear: both;}

#joinForm{width: 460px;margin: 0 auto;}
ul.join_box{border: 1px solid #ddd;background-color: #fff;}
.checkBox,.checkBox>ul{position: relative;}
.checkBox>ul>li{float: left;}
.checkBox>ul>li:first-child{width: 85%;padding: 15px;font-weight: 600;color: #888;}
.checkBox>ul>li:nth-child(2){position: absolute;top: 50%;right: 30px;margin-top: -12px;}
.checkBox textarea{width: 96%;height: 90px; margin: 0 2%;background-color: #f7f7f7;color: #888; border: none;}
.footBtwrap{margin-top: 30px;}
.footBtwrap>li{float: left;width: 50%;height: 60px;}
.footBtwrap>li>input{    
	display: block;
    width: 95%;
    height: 100%;
    font-size: 20px;
    text-align: center;
    line-height: 60px;
    color: white;
    padding: 0px;
} 

.footBtwrap clearfix {
	background: red;
}

/* display: block; */
/*     width: 100%; */
/*     height: 100%; */
/*     font-size: 20px; */
/*     text-align: center; */
/*     line-height: 60px;} */



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
/* 	text-align: center; */
	line-height: 50px;
}

.agreement {
	margin: 24px;
    padding: 54px;
/* 	text-align: center;  */
}

.form-group {
	text-align: center;
 }
 
 h3 {
    text-align: center;
    margin: 17px;
    font-size: 24px;
}
 
 li{
     text-align: -webkit-center;
 }
 
 .join-wrap {
	margin: 20px;
}
 
 


</style>


<script type="text/javascript">
function selectAll(selectAll)  {
	  const checkboxes 
	     = document.querySelectorAll('input[type="checkbox"]');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
	}


function checkSelectAll(checkbox)  {
	  const selectall 
	    = document.querySelector('input[name="chkAll"]');
	  
	  if(checkbox.checked === false)  {
	    selectall.checked = false;
	  }
	}

	function selectAll(selectAll)  {
	  const checkboxes 
	     = document.getElementsByName('chk');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
	}
	
//알림창
//체크박스가 체크되었는지 판별
	$(document).ready(function(e) {	
		$("#fpmgBt2").click(function(){
		if($("#check02").is(":checked") && $("#check03").is(":checked") && $("#check04").is(":checked")) {
				$(location).attr("href","/member/join_step3_consumer");
			} else {
				if(!$("#check02").is(":checked"))
				{
					alert("이용약관을 동의하셔야 합니다.");
					$('#check02').focus();  // 해당 체크박스로 포커스 이동.
					return;
				}
				if(!$("#check03").is(":checked"))
				{
					alert("개인정보 수집 및 이용 약관에 동의하셔야 합니다.");
					$('#check03').focus();
					return;
				}
				if(!$("#check04").is(":checked"))
				{
					alert("위치정보 이용약관에 동의하셔야 합니다.");
					$('.check04').focus();
					return;
				}
			}
		});
	});
	
$(document).ready(function() {	
	
	//뒤로가기
	$("#fpmgBt1").click(function() {
	history.go(-1)
	})
});

</script>


<div class="container">

<h3><strong>약관동의</strong></h3>
<hr>

<div class="join-wrap">

	<ol class="step-list">
		<li class="off">
			<strong>STEP1<span>  회원구분</span></strong>
		</li>
		<li class="on">
			<strong>STEP2<span>  약관동의</span></strong>
		</li>
		<li class="off">
			<strong>STEP3<span>  정보입력</span></strong>
		</li>
	</ol>
	
</div>


<div class="agreement">


<form action="" id="joinForm">

            <ul class="join_box">
            
                <li class="checkBox check01">
                    <ul class="clearfix">
                        <li>이용약관, 개인정보 수집 및 이용,
                            위치정보 이용약관(선택), 프로모션 안내
                            메일 수신(선택)에 모두 동의합니다.</li>
                        <li class="checkAllBtn">
                            <input type="checkbox" name="chkAll" id="chk" class="chkAll" value="selectall" onclick="selectAll(this)" />
                        </li>
                    </ul>
                </li>
                
                
                <li class="checkBox check02">
                    <ul class="clearfix">
                        <li>이용약관 동의(필수)</li>
                        <li class="checkBtn" >
                            <input type="checkbox" name="chk" id="check02" value="check02" onclick='checkSelectAll(this)'> 
                        </li>
                    </ul>
                    <textarea name="" id="">펀딩 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 펀딩 서비스의 이용과 관련하여 펀딩 서비스를 제공하는 펀딩 주식회사(이하 ‘펀딩’)와 이를 이용하는 펀딩 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 펀딩 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.</textarea>
                </li>
                
                
                <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>개인정보 수집 및 이용에 대한 안내(필수)</li>
                        <li class="checkBtn" >
                            <input type="checkbox" name="chk" id="check03" value="check03" onclick='checkSelectAll(this)'>
                        </li>
                    </ul>
                    <textarea name="" id="">와디즈(주)(이하 “회사")가 제공하는 서비스에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 이용 목적, 보유 및 이용 기간을 안내 드리오니 확인 후 동의하여 주시기 바랍니다. 1. 수집하는 개인정보 회사는 서비스 가입 및 이용 등을 위해 아래와 같은 개인정보를 수집합니다. 공통 회원 서비스 이름, 닉네임, ID(이메일 주소 / SNS 연동정보), 비밀번호, 기기 정보(IP, 모바일 광고식별자), 휴대전화 번호, 프로필 사진, 회사 및/ 학교 정보, 관심사</textarea>
                </li>
                
                <li class="checkBox check04">
                    <ul class="clearfix">
                        <li>펀딩·스토어 서비스 서포터 이용약관(필수)</li>
                        <li class="checkBtn" >
                            <input type="checkbox" name="chk" id="check04" value="check04" onclick='checkSelectAll(this)'>
                        </li>
                    </ul>
                    <textarea name="" id="">본 장의 약관은 와디즈 주식회사(이하 "회사")와 회사가 제공하는 리워드형 크라우드펀딩 중개 서비스를 이용하는 서포터 간의 서비스 이용에 관한 권리·의무 관련 사항을 정함을 그 목적으로 합니다.서비스 : 회원가입약관에 따른 회원이 전자적 시스템에 접속하여 홈페이지에서 온라인상의 거래 등을 할 수 있게 본 약관에 따라 회사가 제공하는 리워드형 크라우드펀딩 중개서비스를 말합니다.</textarea>
                </li>
                
                
            </ul>
            
            <ul class="footBtwrap clearfix">
<!--                 <li><button id="fpmgBt1"  class="btn btn-warning" >뒤로가기</button></li> 비동의  -->
				<li><input type="button" id="fpmgBt1" class="btn btn-warning" value="뒤로가기"></li>
<!--                 <li><button class="fpmgBt2">다음단계로</button></li>  -->
<!--                 <li><span class="fpmgBt2">다음단계로</span></li> 동의  -->
				<li><input type="button" id="fpmgBt2" class="btn btn-primary" value="다음단계로"></li>
            </ul>
        </form>
        
</div>

</div>




<c:import url="/WEB-INF/views/layout/footer.jsp" />
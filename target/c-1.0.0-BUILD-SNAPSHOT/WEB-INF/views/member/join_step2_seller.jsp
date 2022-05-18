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
.footBtwrap{margin-top: 15px;}
.footBtwrap>li{float: left;width: 50%;height: 60px;}
.footBtwrap>li>button{display: block; width: 100%;height: 100%; font-size: 20px;text-align: center;line-height: 60px;}
.fpmgBt1{background-color: #fff;color:#888}
.fpmgBt2{background-color: lightsalmon;color: #fff
display: block;
    width: 100%;
    height: 100%;
    font-size: 20px;
    text-align: center;
    line-height: 60px;}


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
		$(".fpmgBt2").click(function(){
		if($("#check02").is(":checked") && $("#check03").is(":checked") && $("#check04").is(":checked")) {
				$(location).attr("href","/member/join_step3_seller");
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

</script>

<h1>판매자 회원가입 약관</h1>

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
                    <textarea name="" id="">여러분을 환영합니다.
					펀딩 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 펀딩 서비스의 이용과 관련하여 펀딩 서비스를 제공하는 펀딩 주식회사(이하 ‘펀딩’)와 이를 이용하는 펀딩 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 펀딩 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
			       </textarea>
                </li>
                
                
                <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>개인정보 수집 및 이용에 대한 안내(필수)</li>
                        <li class="checkBtn" >
                            <input type="checkbox" name="chk" id="check03" value="check03" onclick='checkSelectAll(this)'>
                        </li>
                    </ul>
                    <textarea name="" id="">여러분을 환영합니다.
					펀딩 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 펀딩 서비스의 이용과 관련하여 펀딩 서비스를 제공하는 펀딩 주식회사(이하 ‘펀딩’)와 이를 이용하는 펀딩 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 펀딩 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
   				   </textarea>
                </li>
                
                <li class="checkBox check04">
                    <ul class="clearfix">
                        <li>위치정보 이용약관 동의(선택)</li>
                        <li class="checkBtn" >
                            <input type="checkbox" name="chk" id="check04" value="check04" onclick='checkSelectAll(this)'>
                        </li>
                    </ul>
                    <textarea name="" id="">여러분을 환영합니다.
					펀딩 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 펀딩 서비스의 이용과 관련하여 펀딩 서비스를 제공하는 펀딩 주식회사(이하 ‘펀딩’)와 이를 이용하는 펀딩 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 펀딩 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
    			   </textarea>
                </li>
                
                
            </ul>
            <ul class="footBtwrap clearfix">
                <li><button class="fpmgBt1">뒤로가기</button></li> <!-- 비동의  -->
<!--                 <li><button class="fpmgBt2">다음단계로</button></li>  -->
                <li><span class="fpmgBt2">다음단계로</span></li> <!-- 동의  -->
            </ul>
        </form>




<c:import url="/WEB-INF/views/layout/footer.jsp" />
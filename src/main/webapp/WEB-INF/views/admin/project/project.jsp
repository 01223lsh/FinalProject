<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->
<script type="text/javascript">


var projectStep =${step};
function categorya(categoryNo){
	
	  var btn = document.getElementsByClassName("btncate");

      function handleClick(event) {
        console.log(event.target);
//         console.log(this);
        // 콘솔창을 보면 둘다 동일한 값이 나온다

        console.log(event.target.classList);

        if (event.target.classList[1] === "clicked") {
          event.target.classList.remove("clicked");
        } else {
          for (var i = 0; i < btn.length; i++) {
            btn[i].classList.remove("clicked");
          }

          event.target.classList.add("clicked");
        }
      }

      function init() {
        for (var i = 0; i < btn.length; i++) {
          btn[i].addEventListener("click", handleClick);
        }
      }

      init();
	console.log(categoryNo)	
	$.ajax({
		type : "post"
		,url : "/admin/project/project"
		,data : "categoryNo="+categoryNo+"&projectStep="+projectStep
		,dataType : "html"
		,success : function(res){
			console.log(this);
			$("#resultLayout").html(res)
			$(".category"+categoryNo).css("background-color","#b3b1b2");
		},error : function(){
			console.log("프로젝트 카테고리 error");
		}
	})
}
function step(stepe){
	$.ajax({
		type : "post"
		,url : "/admin/project/project" 
		,data : "projectStep="+stepe
		,datdType :"html"
		,success : function(res){
			console.log("등급별로");
			$("#resultLayout").html(res)
			$(".category"+categoryNo).css("background-color","#b3b1b2");
		}
		,error : function(res){
			console.log("오류")
		}
	})

}

var category=${categoryNo};
var endNo=${paging.endNo/10};
var startPage=${paging.startPage};
var endPage = ${paging.endPage};
var str = "project";

$(document).ready(function(){

	for(var i = startPage; i <= endPage; i++){
		(function(i){
			$(".paging"+i).click(function(){	
				$.ajax({
					type : "get"
					,url : "/layout/projectpaging"
					,data : "curPage="+i+"&projectStep="+projectStep+"&categoryNo="+category
					,dataType : "html"
					,success : function(res){
						console.log("성공");
						$("#resultLayout").html(res)
						
					},
					error : function(){
						console.log("실패");
					}
				});
			});
		})(i);
	}
	$(".pagingFirst").click(function(){	
		$.ajax({
			type : "get"
			,url : "/layout/projectpaging"
			,data : "curPage="+1+"&projectStep="+projectStep+"&categoryNo="+category
			,dataType : "html"
			,success : function(res){
				console.log("성공");
				$("#resultLayout").html(res)
			},
			error : function(){
				console.log("실패");
			}
		});
	});
	$(".pagingBackAll").click(function(){
		$.ajax({
			type : "get"
			,url : "/layout/projectpaging"
			,data : "curPage="+ ${paging.startPage - paging.pageCount }+"&projectStep="+projectStep+"&categoryNo="+category
			,success : function(res){
				console.log("성공");
				$("#resultLayout").html(res)
			},
			error : function(){
				console.log("실패");
			}
		});
	});
	
	$(".pagingGoAll").click(function(){	
		$.ajax({
			type : "get"
			,url : "/layout/projectpaging"
			,data : "curPage="+${paging.startPage + paging.pageCount }+"&projectStep="+projectStep+"&categoryNo="+category
			,dataType : "html"
			,success : function(res){
				console.log("성공");
				$("#resultLayout").html(res)
			},
			error : function(){
				console.log("실패");
			}
		});
	});
	$(".pagingGo").click(function(){	
		$.ajax({
			type : "get"
			,url : "/layout/projectpaging"
			,data : "curPage="+${paging.curPage + 1 }+"&projectStep="+projectStep+"&categoryNo="+category
			,dataType : "html"
			,success : function(res){
				console.log("성공");
				$("#resultLayout").html(res)
			},
			error : function(){
				console.log("실패");
			}
		});
	});
	$(".pagingBack").click(function(){	
		$.ajax({
			type : "get"
			,url : "/layout/projectpaging"
			,data : "curPage="+${paging.curPage - 1 }+"&projectStep="+projectStep+"&categoryNo="+category
			,dataType : "html"
			,success : function(res){
				console.log("성공");
				$("#resultLayout").html(res)
			},
			error : function(){
				console.log("실패");
			}
		});
	});
	$(".pagingLast").click(function(){
		$.ajax({
			type : "get"
			,url : "/layout/projectpaging"
			,data : "curPage="+${paging.totalPage}+"&projectStep="+projectStep+"&categoryNo="+category
			,dataType : "html"
			,success : function(res){
				console.log("성공");
				$("#resultLayout").html(res)
			},
			error : function(){
				console.log("실패");
			}
		});
	});
	
	
})

</script>
<style type="text/css">
 #project-status {
    color: white;
    background: red;
    padding: 3px 5px;
    font-weight: 700;
    font-size: 12px;
    border-radius: 15px;
  }
  #category-section .container {
    overflow: auto;
  }
  #category-section .row {
    flex-flow: nowrap;
  }

#ing {
    float: left;
    width:33%;
    box-sizing: border-box;
}
#end {
    float: left;
    width:33%;
    box-sizing: border-box;
}


#All{
	float: right;
    width: 33%;
    box-sizing: border-box;

}
 .section-img {
    padding: 3px;
  }
  .section-img img {
    width: 100%;
    object-fit: cover;
  }
  .section-body {
    display: flex;
    flex-direction: column;
    /*justify-content: space-around;*/
    min-height: 220px;
  }
  [class^="body"] {
    margin: 5px 0;
  }
  .section-body .body-title {
    margin: 5px 0;
    font-size: 14px;
    height: 40px;
    overflow: hidden;
  }
  .section-body .body-intro {
    font-size: 12px;
    height: 40px;
    overflow: hidden;
  }
  .section-body .body-progress {
    flex-grow: 1;
  }
  .section-body .body-progress progress {
    width: 100%;
  }
  .section-body .body-etc {
    flex-grow: 1;
  }
  .section-body .body-etc span {
    font-size: 12px;
  }
  .section-body .body-etc div:nth-child(2) {
    display: flex;
    justify-content: flex-end;
  }
  .section-body .body-etc div:first-child > span:first-child{
    color: red;
  }

#center{
	margin:0 auto; 
}
.category{
	float: left;
}
.btncate {
        background-color : #47423f;
        color : white;
        width: 100px;
        height: 50px;
        display: flex;
        align-items: center;
        justify-content: center;
}
.btncate:hover {
        color : white;
        background-color: #b3b1b2;
}

table.test{width: 100%; width: 1000px; margin:auto;}
table.test td{height: 30px; padding : 10px;}

.CategoryNo>a{
	border-radius: 10px;
	margin: auto 5px;
}
</style>
</head>

<body>
<br>
<br>
<br>
<div class="row container py-3 text-center0" id="center">
	<div class="col text-center" id="ing">
		<a onclick="step(3)"><i class="fa-regular fa-circle-check fa-5x step(3)"></i></a>
		<br>
		<span>진행중인 펀딩</span>
	</div>
	<div class="col text-center" id="end">
		<a onclick="step(4)"><i class="fa-solid fa-sack-xmark fa-5x step(4)"></i></a>
		<br>
		<span>종료된 펀딩</span>
	</div>
	<div class="col text-center" id="All">
		<a onclick="step(5)"><i class="fa-solid fa-scale-balanced fa-5x step(5)"></i></a>
		<br>
		<span>전체</span>
	</div>
	
</div>
<div class="CategoryNo" style="width:880px;; margin : 50px auto;">

<c:forEach items="${catelist }" var="c">

<a onclick="categorya(${c.categoryNo})" class="btncate category category${c.categoryNo }" >${c.categoryName}</a>

</c:forEach>
</div>
<div style="clear:both"></div>
<br>

<table class="table-condensed test" >
   <c:forEach items="${project}" var="i">
   
    <c:if test="${i.rnum mod 3 eq '1'}">
    <tr>
    </c:if>
      <input type="hidden" value="${i.projectNo}"/>
      <td class="projectView" onclick="projectView(${i.projectNo})">
       <div style="display: flex;">
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" style="margin: 0 auto; display: flex;
    flex-wrap: wrap;

    justify-content: space-between;">
      <div class="col" style="min-width: 250px;" style="margin:0px auto;">
      
        <div class="card shadow-sm" style=" border: 1px solid; max-width: 250px; max-height:332px; padding: 5px;">
          <img src="${i.projectImage}" style="min-height: 250px; width: 100%; ">
          <div class="card-body">
            <strong>${i.projectTitle}</strong>
            <c:if test="${i.projectStep eq 4}">
              <span id="project-status">마감</span>
            </c:if>
            <p class="card-text">${i.projectIntro}</p>
            <div >
              <div class="col d-flex">
              <span style="margin-right: 10px;">
                <fmt:formatNumber value="${p.sum / p.projectPrice}" type="percent"/>
              </span>
                
              </div>
              <div class="col text-end">
              <span>
              <fmt:formatDate value="${p.closeDate}" pattern="yy/MM/dd"/>
              </span>
              </div>
            </div>
          </div>
        </div>
      
      </div>
      </div>
      </div>
      </td>
   <c:if test="${i.rnum / 3 eq '3' }">
	    </tr>
    </c:if>

  </c:forEach>



</table>
</body>
  
</html>
<%@ include file="../../../layout/paging.jsp" %>
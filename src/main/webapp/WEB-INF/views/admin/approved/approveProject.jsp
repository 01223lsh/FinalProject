<%-- create by young --%>
<%-- 심사대기중인 프로젝트 승언/거절 처리 페이지 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>


   <script type="text/javascript">
     $(document).ready(function () {
       $(".approveBtn").click(function () {
         var projectNo = $(this).attr("data-projectNo")
         var projectTitle = $(this).attr("data-projectTitle")
         var memberNo = $(this).attr("data-memberNo")
         $("input[name=projectNo]").val(projectNo)
         $("input[name=memberNo]").val(memberNo)
         $("#approve-modal-projectTitle").text(projectTitle)
       });


	     $(".projectView").click(function(e) {
         const projectNo = $(this).children("input").val();
         
         $.ajax({
           type: "get"
           , url: "/admin/approved/projectDetail"
           , dataType: "html"
           , data: "projectNo="+projectNo
           , success: function(res) {
             console.log("성공")
             $("#resultLayout").html(res)
           }
           , error: function() {
             console.log("ajax 실패")
           }
         })
       })

       var endNo=${paging.endNo/10};
       var startPage=${paging.startPage};
       var endPage = ${paging.endPage};
       var str = "approveProject";
       $(document).ready(function(){
       	for(var i = startPage; i <= endPage; i++){
       		(function(i){
       			$(".paging"+i).click(function(){	
       				$.ajax({
       					type : "get"
       					,url : "/layout/ApprovedPaging"
       					,data : "curPage="+i+"&str="+str
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
       			,url : "/layout/ApprovedPaging"
       			,data : "curPage="+1+"&str="+str
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
       			,url : "/layout/ApprovedPaging"
       			,data : "curPage="+ ${paging.startPage - paging.pageCount }+"&str="+str
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
       			,url : "/layout/ApprovedPaging"
       			,data : "curPage="+${paging.startPage + paging.pageCount }+"&str="+str
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
       			,url : "/layout/ApprovedPaging"
       			,data : "curPage="+${paging.curPage + 1 }+"&str="+str
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
       			,url : "/layout/ApprovedPaging"
       			,data : "curPage="+${paging.curPage - 1 } +"&str="+str
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
       			,url : "/layout/ApprovedPaging"
       			,data : "curPage="+${paging.totalPage}+"&str="+str
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

     });
  </script>
<style type="text/css">
table.test{width: 100%; width: 1000px; margin:auto;}
table.test td{height: 30px; padding : 10px;}

</style>
</head>
<body>
<h1 style="text-align: center;">프로젝트 승인</h1>
<hr>

<table class="test" >
   <c:forEach items="${list}" var="i">
   
    <c:if test="${i.rnum mod 3 eq '1'}">
    <tr class="row-project">
    </c:if>
      <td class="projectView">
      <input type="hidden" value="${i.projectNo}"/>
       <div style="display: flex;">
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" style="margin: 0 auto; display: flex;
     flex-wrap: wrap; 

    justify-content: space-between;">
      <div class="col" style="min-width: 250px;" style="margin:0px auto;">
      
        <div class="card shadow-sm" style=" border: 1px solid; max-width: 250px; padding: 5px;">
          <img src="${i.projectImage}" style="min-height: 250px; width: 100%; ">
          <div class="card-body">
            <strong>${i.projectTitle}</strong>
            <c:if test="${p.projectStep eq 4}">
              <span id="project-status">마감</span>
            </c:if>
            <p class="card-text">${i.projectIntro}</p>
            <div >
              <div class="col d-flex">
<!--               <span style="margin-right: 10px;"> -->
<%--                 <fmt:formatNumber value="${p.sum / p.projectPrice}" type="percent"/> --%>
<!--               </span> -->
                
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
<div class="container" style="display: flex;">
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" style="margin: 0 auto; display: flex;
    flex-wrap: wrap;
    width: 750px;
    justify-content: space-between;">

     



<!-- Modal -->
<div class="modal" id="btn-approve" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h2 class="modal-title" id="exampleModalLabel">프로젝트 승인</h2>
      </div>
      <div class="modal-body">
        <form name="approveSendForm">
          <div class="mb-3">
            <strong class="col-form-label">프로젝트명:</strong><br>
            <span id="approve-modal-projectTitle"></span>
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">보낼 메시지:</label>
            <textarea class="form-control" id="message-text" style="resize: none;" rows="10" name="message"></textarea>
          </div>
          <input type="hidden" name="projectNo">
          <input type="hidden" name="memberNo">
          <input type="hidden" name="projectStep" value="4">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="btn-approve-send" data-bs-dismiss="modal">승인</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>


</body>
</html>
<%@ include file="../../../layout/paging.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    


    <script type="text/javascript">
        // 프로젝트 심사 요청 처리
        function updateProjectStep(projectStep) {
            const projectNo = '${project.projectNo}'
            const projectTitle = '${project.projectTitle}'
            const memberNo = '${project.memberNo}'
            const message = $("textarea[name=message]").val()
            const queryString = {projectNo: projectNo, memberNo: memberNo, projectStep: projectStep, alertContent: message,projectTitle:projectTitle};

            console.log(queryString);

            $.ajax({
                type: "post"
                , url: "/admin/approved/approveProject"
                , dataType: "json"
                , data: queryString
                , success: function (res) {
                    console.log(res)
                    alert(res.msg)
                    approveProject()
                }
                , error() {
                    console.log("ajax 실패")
                }
            })
        }

    </script>

<style>
img{
	width: 100%;
}

.btnProjectDetail {
      width: 500px;
      margin-bottom: 40px;
      margin-top: 40px;
}
   .btn{
   margin-right:10px;   
    background: #527578;
    border: 1px solid #527578;
    color: white;
    border-radius: 5px;
    }
    .btn:hover{
    	background-color: rgb(132,151,143);
    }
    .bg{
	position: relative;
	background-size: cover;
    -webkit-filter: blur(10px);
    background-position: 50% 30%;
    height: 180px;
	
}
.reward-header:before,
.reward-header .bg{display:none!important}
 @supports (-webkit-filter: blur(10px)) {
.reward-header .bg {
      top: -20px;
      bottom: -20px;
      display: block !important;
      background-position:50% 30%;
      background-repeat:no-repeat;
      background-size: cover;
      -webkit-filter: blur(10px);
      z-index: 1;
      }
      .reward-header:before {
      /* display: block !important; */
      content: '';
      clear: both;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      z-index: 2;
   }
}
#approvedProjectView {
	
	margin-bottom: 20px;
	width : 68%;
 	float: left; 
}
.projectApplicant{
	
    width: 300px;
    border : 1px solid #527578;
    border-radius:10px;
    margin-left: 35px;
    padding: 25px;

}
#projectApplicant>div{
	margin-bottom: 20px;
}
.projectApplicantInfoHead{
	font-size: 25px;
	text-align: center;
}
#projectImgAndMemberInfo{
	margin: 0 auto;
    display: table;
}
.projectApplicantInfo{
	font-size:16px;
	margin-top: 25px;
}
.projectApplicantInfo>div{
	margin-bottom: 10px;
}
@supports (position: sticky) or (position: -webkit-sticky) {
 .rightbar{
      position: sticky;
      top: 4px;
      width: 30%
  }
}
.projectImgDiv>img{
	height: 100%px;
	position: static;
}


</style>
</head>
<body>

<div class="container" style="width: 1000px;text-align: center;">
 <div class="bg" style="position: relative; background-image:linear-gradient(  rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.3) ),url(${project.projectImage});"></div>
        
        <div class="categoryTitle" style="position: relative;top: -110px; z-index: 1; text-align: center; ">

        <div style="color:#64E6E6; ">
        	<c:forEach items="${category}" var='i'>
       			 <c:if test="${project.categoryNo eq i.categoryNo}">
           			 ${i.categoryName}
       			 </c:if>
       		</c:forEach>
		</div>
        <h2 class="title" style="color: white;">${project.projectTitle }</h2>
		</div>
        </div>
     
		<div id="projectImgAndMemberInfo" style="margin-top: -10px; width: 900px;">
	
			<div id="approvedProjectView" style="display: table-header-group;">
				<div style="margin-bottom: 50px;  "><img src="${project.projectImage}" style="margin-bottom: 100px;">
				 ${project.projectContent}</div>
<!-- 				<div style="text-align: center; font-size:20px;float: left; width: 100%" class="projectImgDiv"></div> -->
			</div>
			
			<div style="float: right; color:#47423f;" class="rightbar" >
<!-- 			<div style=" color:#47423f;" class="rightbar" > -->
				<div class="projectApplicant" style="margin-bottom: 35px; ">
					<div class="projectApplicantInfoHead"> <img src="${project.projectImage}" style="width: 28px;height: 28px;border-radius: 13px;    margin-bottom: 6px;">	${member.accountName}</div>
					<div class="projectApplicantInfo">
					<div>아이디 &nbsp;&nbsp;&nbsp;${member.id }</div>
					<div>대&nbsp;&nbsp;&nbsp;표&nbsp;&nbsp;&nbsp; ${member.name }</div>
					<div style="font-size: 15px;">사업자번호&nbsp;&nbsp;&nbsp;  ${member.accountNumber }</div>
					<div>소&nbsp;&nbsp;&nbsp;개&nbsp;&nbsp;&nbsp;${project.projectIntro}</div>
					</div>
				</div>
			
				<div class="projectApplicant"> 
					<div class="projectApplicantInfoHead">
						사업 계획
					</div>
					<div class="projectApplicantInfo">
						<div style="letter-spacing:10%;">목표금액&nbsp;&nbsp;&nbsp;${project.projectPrice}</div>
						<div style="letter-spacing: 7px;float: left;">오픈일&nbsp;</div><div><fmt:formatDate value="${project.openDate}" pattern="yyyy-MM-dd"/></div>
						<div style="letter-spacing: 7px;float: left;">마감일&nbsp;</div><div><fmt:formatDate value="${project.closeDate}" pattern="yyyy-MM-dd"/></div>
						<div style="float: left;">배송시작&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${project.deliveryDate}" pattern="yyyy-MM-dd"/></div>
						<div>일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;정&nbsp;&nbsp;&nbsp;<div>${project.schedulePlan}</div></div>
						<div>예산계획&nbsp;&nbsp;&nbsp;<div>${project.budgetPlan}</div></div>
<%-- 						<div style="letter-spacing: 7px;">오픈일&nbsp;</div><div><fmt:formatDate value="${project.openDate}" pattern="yyyy-MM-dd"/></div> --%>
<%-- 						<div style="letter-spacing: 7px;">마감일&nbsp;</div><div><fmt:formatDate value="${project.closeDate}" pattern="yyyy-MM-dd"/></div> --%>
<%-- 						<div style="">배송시작&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${project.deliveryDate}" pattern="yyyy-MM-dd"/></div> --%>
					</div>
				</div>
		
			</div>
			

			
</div>
	<div style="clear: both;"></div>			
    <div class="btnProjectDetail" style="    margin: 0 auto;" >
        <div class="row text-center">
            <button class="btn btn-primary" onclick="updateProjectStep(5)">승인</button>
            <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#btn-approve">거절</button>
            <button class="btn btn-success" onclick="approveProject()">목록</button>
        </div>
    </div>
	


<!-- Modal -->
<div class="modal" id="btn-approve" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title" id="exampleModalLabel">프로젝트 거절</h2>
            </div>
            <div class="modal-body">
                <form name="approveSendForm">
                    <div class="mb-3">
                        <label for="message-text" class="col-form-label">보낼 메시지:</label>
                        <textarea class="form-control" id="message-text" style="resize: none;" rows="10" name="message"></textarea>
                    </div>
                    <input type="hidden" name="projectNo">
                    <input type="hidden" name="memberNo">
                    <input type="hidden" name="projectStep" value="2">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" onclick="updateProjectStep(2)">거절</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>


</body>
</html>

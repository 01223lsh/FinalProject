<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    

<style>
    	
   img {
      max-width: 100%;
   }
   .p-content-section {
      width: 500px;
   }
   .btn{
   margin-right:10px;   
    background: #527578;
    border: 1px solid #527578;
    color: white;
    border-radius: 5px;
    }
</style>

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

</head>
<body>

<div class="container">
    <div class="p-content-section">
        <h2>프로젝트 제목</h2>
        <hr>
        <p>${project.projectTitle}</p>
    </div>
    <div class="p-content-section">
        <h2>카테고리</h2>
        <hr>
        <p>
            (categoryNo - categoryId 이름 차이로 가져오지 못함)
            ${project.categoryNo}
        </p>
    </div>
    <div class="p-content-section">
        <h2>대표사진(하드코딩)</h2>
        <hr>
        <p>
            <img src="/resources/img/test1.jpg" alt="">
        </p>
    </div>
    <div class="p-content-section">
        <h2>소개글</h2>
        <hr>
        <p>${project.projectIntro}</p>
    </div>
    <div class="p-content-section">
        <h2>프로젝트 예산 계획</h2>
        <hr>
        <p>${project.budgetPlan}</p>
    </div>
    <div class="p-content-section">
        <h2>프로젝트 일정</h2>
        <hr>
        <p>${project.schedulePlan}</p>
    </div>
    <div class="p-content-section">
        <h2>목표금액</h2>
        <hr>
        <p>${project.projectPrice}</p>
    </div>
    <div class="p-content-section">
        <h2>프로젝트 오픈일</h2>
        <hr>
        <p>
            <fmt:formatDate value="${project.openDate}" pattern="yyyy-MM-dd"/>
        </p>
    </div>
    <div class="p-content-section">
        <h2>프로젝트 마감일</h2>
        <hr>
        <p>
            <fmt:formatDate value="${project.closeDate}" pattern="yyyy-MM-dd"/>
        </p>
    </div>
    <div class="p-content-section">
        <h2>예상 배송시작일</h2>
        <hr>
        <p>
            <fmt:formatDate value="${project.deliveryDate}" pattern="yyyy-MM-dd"/>
        </p>
    </div>
    <div class="p-content-section">
        <h2>소개글 내용(이미지 하드코딩)</h2>
        <hr>
        <p>
            ${project.projectContent}
            <img src="/resources/img/content1.jpg" alt="">
            <img src="/resources/img/content2.jpg" alt="">
            <img src="/resources/img/content3.jpg" alt="">
            <img src="/resources/img/content4.jpg" alt="">
            <img src="/resources/img/content5.jpg" alt="">
        </p>
    </div>
    <div class="p-content-section">
        <div class="row text-center">
            <button class="btn btn-primary" onclick="updateProjectStep(5)">승인</button>
            <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#btn-approve">거절</button>
            <button class="btn btn-success" onclick="approveProject()">목록</button>
        </div>
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

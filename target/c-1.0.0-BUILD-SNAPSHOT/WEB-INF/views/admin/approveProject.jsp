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
  <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

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
       // 프로젝트 승인 요청 전달
       // $("#btn-approve-send").click(function () {
       //     var queryString = $("form[name=approveSendForm]").serialize();
       //     console.log(queryString)
       //   $.ajax({
       //     type: "post"
       //     , url: "/admin/approveProject"
       //     , dataType: "json"
       //     , data: queryString
       //     , success: function (res) {
       //       console.log("성공")
       //       console.log(res)
       //       approveProject()
       //     }
       //     , error() {
       //       console.log("ajax 실패")
       //     }
       //   })
       // });
       // tr 클릭시 해당 프로젝트 정보로 이동
       $(".row-project").click(function(e) {
         const projectNo = $(this).children("input").val();
         $.ajax({
           type: "get"
           , url: "/admin/projectDetail"
           , dataType: "html"
           , data: {projectNo: projectNo}
           , success: function(res) {
             console.log("성공")
             $("#resultLayout").html(res)
           }
           , error: function() {
             console.log("ajax 실패")
           }
         })
       })


     });
  </script>

</head>
<body>

<hr>
<table class="table table-striped table-hover table-condensed">
  <tr>
    <th>No</th>
    <th>프로젝트 이름</th>
<%--    <th>승인여부</th>--%>
<%--    <th>프로젝트 선택</th>--%>
<%--    <th>회원번호</th>--%>
  </tr>

  <c:forEach items="${list}" var="i">
    <tr class="row-project">
      <input type="hidden" value="${i.projectNo}">
      <td>${i.projectNo }</td>
      <td>${i.projectTitle}</td>
      <%--<td>
        <button type="button" class="btn btn-primary approveBtn" data-bs-toggle="modal" data-bs-target="#btn-approve"
          data-projectNo="${i.projectNo}"
          data-projectTitle="${i.projectTitle}"
          data-memberNo="${i.memberNo}">
          승인
        </button>
        <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#btn-decline">
          거절
        </button>
      </td>
      <td>
        <input type="checkbox" name="step-chk" value="${i.projectNo}">
      </td>
      <td>${i.memberNo}</td>--%>
    </tr>
  </c:forEach>



</table>

<%--<div class="row">
  <button class="btn btn-primary">일괄 승인</button>
  <button class="btn btn-danger">일괄 거절</button>
</div>--%>


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
<%@ page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/exceljs/4.2.0/exceljs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.0/FileSaver.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<script type="text/javascript">
function chartDate(){
	var selectDate = $(".chartDate").val();
	$.ajax({
		type : "get"
		,url : "/admin/main"
		,data : {selectDate:selectDate}
		,dataType : "html"
		,success : function(res){
			$("#resultLayout").html(res)
		},error : function(){
			console.log("차트 변경 실패");
		}
		
	})
}
function qnaView(qnaNo){

	console.log(qnaNo);
	$.ajax({
		type : "post"
		,url : "/admin/qnaView?qnaNo="+qnaNo
		,dataType :"html"
		,success : function(res){
			$("#resultLayout").html(res)
		}
		,error : function(){
			console.log("qna view error")
		}
	})
}
function memberManagement(){
	$.ajax({
		type : "get"
		,url : "/admin/member"
		,data : "grade=4"+"&str=member"
		,dataType : "html"
		,success : function(res){
			$("#resultLayout").html(res)
			
		}
		,error : function(){
			console.log("회원관리 뷰 실패")
		}
	})

}
function noticeManagement(){
	$.ajax({
		type : "get"
		,url : "/admin/notice"
		,data : "str=notice"
		,dataType : "html"
		,success : function(res){
			console.log("공지사항 뷰 성공")
			$("#resultLayout").html(res)
			
		}
		,error : function(){
			console.log("공지사항 뷰 실패")
		}
	})

}
function projectManagement(){
	$.ajax({
		type : "get"
		,url : "/admin/project"
		,data : "str=poject&projectStep=5&categoryNo=0"
		,dataType : "html"
		,success : function(res){
			console.log("공지사항 뷰 성공")
			$("#resultLayout").html(res)
			
		}
		,error : function(){
			console.log("공지사항 뷰 실패")
		}
	})
}

/* edit by young */
function approveProject() {
    $.ajax({
        type : "get"
        ,url : "/admin/approveProject"
        ,data : "str=approveProject"
        ,dataType : "html"
        ,success : function(res){
            console.log("공지사항 뷰 성공")
            $("#resultLayout").html(res)

        }
        ,error : function(){
            console.log("공지사항 뷰 실패")
        }
    })
}
function qnaManagement(searchtest){
	$.ajax({
		type : "get"
		,url : "/admin/qna"
		,data : {str:"qna",search:searchtest,complete:"3"}
		,dataType : "html"
		,success : function(res){
			console.log("공지사항 뷰 성공")
			$("#resultLayout").html(res)
			
		}
		,error : function(){
			console.log("공지사항 뷰 실패")
		}
	})
}





</script>
<style>
#btn_chart_excel_download {
    border: 0;
    background-color: #007f1b;
    color: white; 
    font-weight:bold; 
    padding: 5px; 
	border-radius: 10px;
	float : right;
}

nav{ 
    width:200px; 
    background-color:#eee; 
    border-right:1px solid #ddd;
    /* height:100% 그냥 적용 안됨. 부모개념이 있어야 채워질 수 있음 */
    /*공중에 떠서 공간을 차지하지 않음*/
    height:100% /*fixed를 해서 높이 100%가 가능해짐*/
}
h1{ font-size:18px;  padding:20px; }
	.menu {}
    .menu li {}

    
.menu li a {
    height:30px;
    line-height:30px;
    display:block;
    padding:0 20px;
    font-size:12px;
    color:#555;
}
.menu li a:hover { background-color:yellowgreen; color:white;}

#center{
	margin:0 auto; 
}
#menu {
    width:15%;
    box-sizing: border-box;
}

#managerLayout{
	width: 100%;
    margin: 0px auto;
    display: flex;
}
#Layout{
    width:80%;
    box-sizing: border-box;
}
#chart-line{
	width: 700px;
	height: 700px;
}
</style>


</head>
<body>

<!-- <button  onclick="memberManagement()">회원관리</button><br> -->
<!-- <button>프로젝트 관리</button><br> -->
<!-- <button>프로젝트 승인</button><br> -->
<br><br>
<div id="managerLayout">
<div  id="menu">
<nav >
    관리자 페이지 <!-- h1태그 검색사이트가 좋아함. 문서상에 1개만 있는 것을 권장한다. -->
    <ul class="menu">
        <li><a onclick="memberManagement()">회원관리</a></li>
        <li><a onclick="projectManagement()">프로젝트 목록</a></li>
        <%-- edit by young --%>
        <li><a onclick="approveProject()">프로젝트 승인</a></li>
        <li><a onclick="noticeManagement()">공지사항</a></li>
        <li><a onclick="qnaManagement()">문의 게시판</a></li>
        <li><a href="">통계</a></li>
    </ul>
 
</nav>
</div>
<div id="Layout">
	<div id="resultLayout">
		<div id="chart-line">
			<select id="chartDate" onchange="chartDate()">
				<option value="7">최근 1주일</option>
				<option value="30">최근 한달</option>
			</select>
			<canvas id="line-chart" style=" width:300px; height:250px"></canvas>

			<input type="button" value="엑셀 다운로드" id="btn_chart_excel_download" class="btn_excel"/>
		</div>
	</div>
	</div>
</div>

<script type="text/javascript">
        
$("#btn_chart_excel_download").click(function() {
    // 캔버스에 그려진 이미지를 data url로 변환
    let base64Image = ctx.toDataURL(1.0);

    // excel js 객체 생성
    let workbook = new ExcelJS.Workbook();

    // 워크시트 생성
    let worksheet =  workbook.addWorksheet('Chart');
    
    
    let worksheet2 = workbook.addWorksheet('list');

    const rawData = [
    	<c:forEach items="${list}" var='i'>
    	{header: "${i.regDate}", data: ["${i.cnt}"]},

    	</c:forEach> 
    ]
	console.log(rawData);
    rawData.forEach((data, index) => {
        worksheet2.getColumn(index + 1).values = [data.header, ...data.data];
    });
    

    // 흰 배경을 만들기 위해 셀 병합
    worksheet.mergeCells('A1:H25');

    // 가상의 파일 읽기
    workbook.xlsx.readFile("chartExample.xlsx");
    
    // 이미지 등록
    let imageId = workbook.addImage({
        base64: base64Image,
        extension: 'png',
    });

    // 병합했던 셀에 이미지 추가 (엑셀 파일 열면 위치 이동가능)
    worksheet.addImage(imageId, 'A1:H25');
    
	<c:forEach items="${list}" var='i'>
	var lastday = "${i.regDate}"
	</c:forEach> 
    // 파일 다운로드
    workbook.xlsx.writeBuffer().then(function (data) {
        let blob = new Blob([data], {type: "application/vnd.ms-excel;charset=utf-8"});
        saveAs(blob, "${list[0].regDate}~"+lastday+" 회원가입 현황 그래프.xlsx");
    });
});
var arr = new Array();
var arr2 = new Array();
	<c:forEach items="${list}" var='i'>
		arr.push('${i.cnt}')
		arr2.push('${i.regDate}')
		
	</c:forEach>
const ctx = document.getElementById('line-chart'); // getContext('2d') 를 하는 경우가 있는데 없어야 엑셀다운가능

new Chart(document.getElementById("line-chart"), {
    type: 'line',
    data: {
      labels: arr2,
      datasets: [{ 
          data: arr
       	  ,label: "회원 가입 수",
          borderColor: "#3e95cd",
          fill: false
        }]
    },
    options: {
      title: {
        display: true,
        text: '1주일 회원 가입 현황 그래프'
      }
    }
  });
</script>
</body>
</html>
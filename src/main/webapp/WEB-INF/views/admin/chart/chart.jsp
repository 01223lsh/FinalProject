<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="chart-line">
	<select id="chartDate" onchange="chartDate(this)">
		<option value="7" <c:if test="${chart.chartCheck eq 0 }">selected</c:if>>최근 1주일</option>
		<option value="30" <c:if test="${chart.chartCheck eq 1 }">selected</c:if>>최근 한달</option>
	</select>
	<canvas id="line-chart" style=" width:300px; height:250px"></canvas>

	<input type="button" value="엑셀 다운로드" id="btn_chart_excel_download" class="btn_excel"/>
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
    	{header: "날짜", data: ["전체"], data1: ["일반 회원"], data2: ["사업자 회원"]},
    	<c:forEach items="${list}" var='i'>
    	{header: "${i.regDate}", data: ["${i.cnt}"], data1: ["${i.normalcnt}"], data2: ["${i.buisnesscnt}"]},
    	

    	</c:forEach> 
    ]
	console.log(rawData);
    rawData.forEach((data, index) => {
        worksheet2.getColumn(index +1).values = [data.header, ...data.data, ...data.data1, ...data.data2];
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
	var allcnt = new Array();
	var allDate = new Array();
	var buisnesscnt = new Array();
	var normalcnt = new Array();

	<c:forEach items="${list}" var='i'>
		allcnt.push('${i.cnt}')
		allDate.push('${i.regDate}')
		buisnesscnt.push('${i.buisnesscnt}')
		normalcnt.push('${i.normalcnt}')
		 
		
	</c:forEach>
const ctx = document.getElementById('line-chart'); // getContext('2d') 를 하는 경우가 있는데 없어야 엑셀다운가능

new Chart(document.getElementById("line-chart"), {
    type: 'line',
    data: {
      labels: allDate,
      datasets: [{ 
          data: allcnt
       	  ,label: "회원가입 수",
          borderColor: "#3e95cd",
          fill: false
        },{
        data: normalcnt
        ,label: "일반 회원가입 수",
        borderColor: "red",
         fill: false
        },{
       data: buisnesscnt
       ,label: "사업자 회원가입 수",
       borderColor: "blue",
       fill: false
       }]  
    },
    options: {
      title: {
        display: true,
        text: '회원 가입 현황 그래프'
      }
    }
  });
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<script src="/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">


	
	$("#newsSubmit").click(function(){
		
		var from1 = $("#newsForm").serialize();
		from1 += "&newsContent="+CKEDITOR.instances['newsContent'].getData();
		console.log(from1);
		
		$.ajax({
			url:"/project/news/write",
			type:"post",
			data:from1,
			datatype:"html",
			success:function(res){
				console.log("성공")
				$("#content3_1").html(res);
			},
			error:function(){
    			console.log("통신실패");
    		}
		})
		
	})
	
	function cancel(){
			
			$.ajax({
				url:"/project/news/list",
				type:"post",
				data:{projectNo:${projectNo}},
				dataType: "html",
				success:function(res){
					console.log("성공")
					
        			$("#content3_1").html(res);
				},
				error:function(){
        			console.log("통신실패");
        		}
			})
		}
	

	
	
</script>


<div>
<form id="newsForm" enctype="multipart/form-data" method="post">
<input type="hidden" name="projectNo" value="${projectNo }">
	<table style="height: 350px;">
	<tr>
	<td width="10%;">제목</td>
	<td><input type="text" id="newsTitle" name="newsTitle" style="width:500px "></td>
	</tr>
	
	
	
	<tr>
		<td>내용</td>
		<td><textarea style="width: 500px; height: 400px" id="newsContent"></textarea></td>
	</tr>
	
	
	
	</table>

</form>
<div style="text-align: center; margin: 8px 0px 8px;">
<button id="newsSubmit" type="button" class="btn btn-primary">작성</button>
<button id="newsCancel" type="button" class="btn btn-default" onclick="cancel()" style="background-color: rgb(240, 240, 240);">취소</button>
</div>

<br><br><br><br><br>
</div>   

<script>
$(function () {
	CKEDITOR.replace('newsContent', { // ck에디터를 지정하고자 하는 textarea 태그의 id
	filebrowserUploadUrl: '/project/ck/upload'// 이미지 업로드를 진행할 url
	})
	})
</script>
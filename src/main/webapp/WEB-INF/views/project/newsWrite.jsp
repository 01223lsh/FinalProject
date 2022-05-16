<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    

<script type="text/javascript">


	
	$("#newsSubmit").click(function(){
		
		var from1 = $("#newsForm").serialize();
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
<form id="newsForm" >
<input type="hidden" name="projectNo" value="${projectNo }">
<table style="width: 500px; height: 350px;">
<tr>
	<td style="width: 15%">제목</td>
	<td><input type="text" id="newsTitle" name="newsTitle" style="width:400px "></td>
</tr>
<tr>
	<td>내용</td>
	<td><textarea style="width: 400px; height: 300px" id="newsContent" name="newsContent"></textarea></td>
	
</tr>


</table>
<div class="text-center">
<button id="newsSubmit" type="button" class="btn btn-primary">작성</button>
<button id="newsCancel" type="button" class="btn btn-default" onclick="cancel()">취소</button>
</div>
</form>

</div>   
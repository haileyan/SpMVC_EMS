<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
margin-top: 200px;
}

form{
	margin: 0 auto;
	width: 80%;
}

label {
	display:inline-block;
	float:left;
	padding:5px;
	font-weight:bold;
	width:100px;
}

input, textarea{
	display:inline-block;
	width:85%;
	padding:5px;
	margin:5px;
}

button{
	margin-left:600px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
	$("#btn_save").click(function(){
		
		$.ajax({
			url:"<c:url value='/write'/>",
			method:"POST",
			data:$("#write_form1").serialize()+"@@"+$("#write_form2").serialize(),
			success:function(result){
				alert(result)
			},
			error:function(){
				alert("잉?!!!")
			}
		})
	})
})
</script>
<body>
<section>
<form action="<c:url value='/insert'/>" method="POST" id="write_form1" enctype="multipart/form-data">
	<label for="from_email">발신인</label>
	<input value="${EMAIL.from_email}" type="text" name="from_email"><br/>

	<label for="to_email">수신인</label>
	<input value="${EMAIL.to_email}" type="text" name="to_email"><br/>
	
	<label for="s_date">발송일</label>
	<input value="${EMAIL.s_date}" type="text" name="s_date"><br/>
	
	<label for="s_time">발송시간</label>
	<input value="${EMAIL.s_time}" type="text" name="s_time"><br/>
	
	<label for="s_subject">제목</label>
	<input value="${EMAIL.s_subject}" type="text" name="s_subject"><br/>
	
	<label for="s_content">내용</label>
	<textarea rows="10" id="s_content" name="s_content">${EMAIL.s_content}</textarea><br/>

	<label for="s_file1">첨부파일1</label>
	<input multiple value="${EMAIL.s_file1}" type="file" name="s_file1"><br/>

	<label></label>
	<button type="button" id="btn_save">SAVE</button>
	
</form>
</section>
</body>
</html>
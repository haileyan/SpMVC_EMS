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
	margin-top: 350px;

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
<body>
<section>
	<form action="<c:url value="/write"/>" method="POST" class="write_form" enctype="multipart/form-data">
	
	<label for="from_email">발신인</label>	
	<input value="${EmailVO.from_email}" type="" name="from_email"><br/>

	<label for="to_email">수신인</label>	
	<input value="${EmailVO.to_email}" type="text" name="to_email"><br/>
	
	<label for="s_subject">제목</label>	
	<input value="${EmailVO.s_subject}" type="text" name="s_subject"><br/>
	
	<label for="s_content"></label>	
	<textarea rows="10" id="s_content" name="s_content">${EmailVO.s_content}</textarea><br/>

	<label for="s_file1">첨부파일1</label>	
	<input value="${EmailVO.s_file1}" type="file" name="file1"><br/>
	<input type="hidden" id="s_file1" value="${EmailVO.s_file1}" >

	<label for="s_file2">첨부파일2</label>	
	<input value="${EmailVO.s_file2}" type="file" name="file2"><br/>
	<input type="hidden" id="s_file2" value="${EmailVO.s_file2}" >
	
	<label></label>
	<button>저장하기</button>
	</form>

</section>
</body>
</html>
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
<link href="https://fonts.googleapis.com/css?family=Song+Myung" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
	$("#email_update").click(function(){
		let id = ${EmailVO.id}
		location.href = "<c:url value='/update'/>" + "?id=" +id
	})
	
	$("#email_delete").click(function(){
		let id = ${EmailVO.id}
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href = "<c:url value='/delete'/>" + "?id=" +id	
		}
	})
})
</script>
<style>

body{
	margin-top:350px;
}

#entire {
	border: 2px solid white;
	width: 80%;
	margin: 0 auto;
	font-family: 'Song Myung', serif;
	font-size: 15pt;
	margin-bottom: 70pt;
}

#box {
	padding: 30px;
}

#frontq, #afterq {
	font-size: 60pt;

}

#from, #to { 
	background: rgba(255, 255, 255, 0.6);
  	width:100%;
	height:40px;
	padding-left:5pt;
	margin-top:20pt;
	margin-bottom:20pt; 
}

#contents {
  	background: rgba(255, 255, 255, 0.6);
  	width:100%;
	height:400px;
	padding:20pt;
}

#title {
	font-size:30pt;
	text-align:center;
}

.bottom_box {
	padding:5pt 400pt;
	margin: 0 0 auto;
 	height:60px;
}
</style>
<body>
<div id="entire">
<article id="box">
<h3 id="title"><span id="frontq">"</span>${EmailVO.s_subject}<span id="afterq">"</span></h3>

<div id="to">
<p><b>&nbsp;TO:&nbsp;&nbsp;</b>${EmailVO.to_email}<p>
</div>

<div id="from">
<p><b>&nbsp;FROM:&nbsp;&nbsp;</b>${EmailVO.from_email}<p>
</div>

<div id="contents">
<p>${EmailVO.s_content}<p>
</div>
<p><img src="${pageContext.request.contextPath}/files/${EmailVO.s_file1}">
<p><img src="${pageContext.request.contextPath}/files/${EmailVO.s_file2}">
</article>
<div class="bottom_box">
	<button type="button" id="email_update" style="margin-right:10pt;"><img src="https://img.icons8.com/office/30/000000/edit-file.png"></button>
	<button type="button" id="email_delete" ><img src="https://img.icons8.com/office/30/000000/deleted-message.png"></button>
</div>
</div>
</body>
</html>

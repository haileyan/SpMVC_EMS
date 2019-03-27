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
body{
margin-top:200px;

}

table {
	border-collapse:collapse;
	border-spacing:0;
	width:90%;
	border:1px solid #ccc;
	margin-left:100px;
}

tr{
	border: 1px solid #ddd;
}

tr:nth-child(even) {
	background-color: #ccc;
}

tr:nth-child(odd) {
	background-color: #fff;
}

tr:hover {
	background-color: #ddd;
}

td {
	text-align:center;
}

td, th {
padding : 8px 8px;
vertical-align : top; 
}
</style>
<body>
<table>
<tr>
	<th>발신인</th>
	<th>수신인</th>
	<th>발송일</th>
	<th>발송시간</th>
	<th>제목</th>
</tr>
<c:choose>
	<c:when test="${empty EMAIL}">
	<tr coalspan="5">내용이 없습니다</tr>
	</c:when>
	
	<c:otherwise>
		<c:forEach items="${EMAIL}" var="email" varStatus="i">
		<tr>
			<td>${email.from_email}</td>
			<td>${email.to_email}</td>		
			<td>${email.s_date}</td>
			<td>${email.s_time}</td>
			<td>${email.s_subject}</td>
		</tr>	
		</c:forEach>
	</c:otherwise>
</c:choose>
</table>
</body>
</html>
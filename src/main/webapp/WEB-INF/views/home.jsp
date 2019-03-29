<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Email Management System</title>
</head>
<link href="https://fonts.googleapis.com/css?family=Song+Myung" rel="stylesheet">
<style>
*{
	box-sizing:border-box;
}

body{
	background-color:#F6E2B5;
	padding: 0;
	margin: 0;
	font-family: 'Song Myung', serif;
}

header{
	position:fixed;
	height:300px;
	width:100%;
	top:0;
	background-image:url("https://images.unsplash.com/photo-1552987614-cea548ab520a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80");
	padding:100px;
}

nav {
	display: flex;
	align-items: flex-end;
	justify-content: space-between;
	transition:align-items 0.2s;
	background: rgb(0, 0, 0);
  	background: rgba(255, 255, 255, 0.6);
	margin-top:50px;
}

.logo {
	display: inline-block;
	padding:20px 30px;
	background-color: #F35B66;
	color:#fff;
	margin:50px 50px 0 50px;
	transition: all 0.2s;
	
}

ul {
	display: flex;
	margin:50px 50px 0 0;
	padding-top: 0;
	padding-bottom: 25px;
	list-style-type : none;
	font-size:15pt;
	text-shadow: 0 0 8px yellow;
}

li a {
	display: block;
	padding: 10px 20px;
	text-decoration: none;
	color:#2E64FE;
}

li a:hover {
	background-color: #E6E6E6;
}
</style>
<body>
<header>
<%@ include file="/WEB-INF/views/include/home-nav.jspf" %>
</header>
<article id="body">
<c:if test="${BODY == 'LIST'}">
	<%@ include file="/WEB-INF/views/email_list.jsp" %>
</c:if>
<c:if test="${BODY == 'WRITE'}">
	<%@ include file="/WEB-INF/views/email_write.jsp" %>
</c:if>
<c:if test="${BODY == 'DETAIL'}">
<%@ include file="/WEB-INF/views/email_detail.jsp" %>
</c:if>
</article>
</body>
</html>
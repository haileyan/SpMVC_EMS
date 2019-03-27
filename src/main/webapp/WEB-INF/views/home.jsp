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
<style>
*{
	box-sizing:border-box;
}

body{
	padding: 0;
	margin: 0;
}

header{
	position:fixed;
	width:100%;
	top:0;
	background-color:#F4FA58;
	padding:30px;
}

nav {
	display: flex;
	align-items: flex-end;
	justify-content: space-between;
	transition:align-items 0.2s;
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
	padding:0;
	list-style-type : none;
}

li a {
	display: block;
	padding: 10px 20px;
	text-decoration: none;
	color:#0B0B61;
}

li a:hover {
	background-color: #E6E6E6;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
	// 이메일 목록
	$("#home").click(function(){
		$.ajax({
			url:"<c:url value='/email_list'/>",
			method:"GET",
			success:function(result){
				$("#body").html(result)
			},
			error:function(){
				alert("NOPPPPPE")
			}
		})
	})
	
	// 이메일 작성
	$("#write").click(function(){
		$.ajax({
			url:"<c:url value='/write'/>",
			method:"GET",
			success:function(result){
				$("#body").html(result)
			},
			error:function(){
				alert("NOPPPPPE")
			}
		})
	})
})
</script>
<body>
<header>
<nav>
<a href="#" id="logo"><img src="email.png" style="width:100px;"></a>
		<ul>
			<li><a href="javascript:void(0)" id="home"><b>Home</b></a></li>
			<li><a href="javascript:void(0)" id="write"><b>이메일작성</b></a></li>
			<li><a href="javascript:void(0)" id="join"><b>회원가입</b></a></li>
			<li><a href="#" id="login"><b>로그인</b></a></li>
		</ul>
</nav>
</header>
<article id="body">

</article>
</body>
</html>
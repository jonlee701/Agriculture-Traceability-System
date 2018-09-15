<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
div,img {
	margin-left: auto;
	margin-right: auto;
	width: 80%;
	height: 80%;
}

</style>
</head>
<body>
	<div>
		<h1>${user.name}</h1>
		<br /> <br /> 
		<img src="${user.picture}"> 
		<br /> <br /> 
		<p>公司简介: ${user.introduction}</p>
		<p>公司地址: ${user.location}</p>
		<p>联系电话: ${user.phone}</p>
		<br /> 
	</div>
</body>
</html>
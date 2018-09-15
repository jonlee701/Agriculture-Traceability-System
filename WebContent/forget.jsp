<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/wangzhe/css/bootstrap.min.css">
</head>
<body>

<h2 style="margin-left: 20px;">找回密码</h2>
<form action="/wangzhe/user/forget" method="post"  style="margin-left: 20px;">
纳税人识别号:
	<input type="text" name="identify" size="20" value="${map.identify}"/><br/><br/>
	
	<p style="color: red">${map.state}</p>
	
	<input type="submit"  style="width: 100px;" class="btn btn-primary btn-sm "  data-toggle="modal" data-target="#m" value="确定"/>
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>注 册</h2>
<form action="user/register" enctype="multipart/form-data" method="post">
	企业名称:
	<input type="text" name="name" size="20" /><br/><br/>
	联系电话
	<input type="text" name="phone" size="20" /><br/><br/>
	纳税人识别号:
	<input type="text" name="identify" size="20" onkeypress="return event.keyCode>=48&&event.keyCode<=57" ng-pattern="/[^a-zA-Z]/" /><br/><br/>
	密  码:
	<input type="password" name="password" size="20" /><br/><br/>
	密保问题:
	<input type="text" name="question" size="20" /><br/><br/>
	密保答案:
	<input type="text" name="answer" size="20" /><br/><br/>
	公司地址:
	<input type="text" name="location" size="20" /><br/><br/>
	企业简介:
	<textarea name="introduction" cols="30"  rows="8"></textarea>
	<br/><br/>
	企业图片:
	<input type="file" name="file">
	<br/><br/>

	<input type="submit" value="提交" />&nbsp;&nbsp;
    <input type="reset" value="重置" />&nbsp;&nbsp;
</form>
</body>
</html>
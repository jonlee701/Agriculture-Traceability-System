<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>修改密码</h2>
<p>公司名称: ${user.name}</p>
<p>纳税人识别号: ${user.identify}</p>
<form action="/wangzhe/user/changePass" method="post">
        <p>密保问题: ${user.question}</p>
        密保答案: <input type="text" name="answer" size="20"> <br/><br/>
        新密码:<input type="password" name="password" size="20"> <br/><br/>
        <p style="color: red">${state}</p>
        <input type="submit" value="提交" />&nbsp;&nbsp;
</form>
</body>
</html>
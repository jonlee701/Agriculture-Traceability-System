<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/wangzhe/css/bootstrap.min.css">
</head>
<body background="/wangzhe/1.jpg">

<div>
    <h1 style = "position:relative; top:80px; left:450px">欢迎来到农产品溯源系统，请登录</h1>
</div>
<div style = "margin:130px 100px 0 0">
    <form id="form1" name="form1" method="post" action="/wangzhe/user/login">
        <table align="center">
            <tr>
                <td width="378" align="right">账号：</td>
                <td width="393"><label for="name"></label>
                    <input name="identify" type="text" id="identify" value="${map.identify }"/></td>
            </tr>
            <tr>
                <td align="right">密码：</td>
                <td><label for="password"></label>
                    <input type="password" name="password" id="password" /></td>
            </tr>
        </table>
        <p style="color: red" align="center">${map.state}</p>

        <div class="panel-body">
            <input   type="submit" style = "margin:0 0 0 630px"class="btn btn-primary btn-sm "  data-toggle="modal" data-target="#m" value="登录"/>
            <button class="btn btn-danger btn-sm "  data-toggle="modal" ><a href="/wangzhe/register.jsp" style="color: white;">注册</button>
        	<a href="/wangzhe/forget.jsp">忘记密码</a>
        </div>
    </form>
</div>
</body>
</html>
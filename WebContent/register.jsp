<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body background="/wangzhe/1.jpg">
	<div>
		<h1 h1 style="position: relative; left: 450px">
			欢迎来到农业溯源系统,请完成注册
			<h1>
	</div>
	<div style="margin: 0 100px 0 0">
		<form id="form1" name="form1" method="post" action="/wangzhe/user/register"
			enctype="multipart/form-data">
			<table align="center">


				<tr>
				<tr>
					<td width="378" align="right">纳税人识别号：</td>
					<td width="393"><label for="name"></label> <input
						name="identify" type="text" id="identify" value="" /></td>
				</tr>

				<tr>
					<td align="right">密码：</td>
					<td><label for="password"></label> <input type="password"
						name="password" id="password" /></td>
				</tr>

				<td align="right">手机号码：</td>
				<td><label></label> <input name="phone" id="phone" /></td>
				</tr>

				<tr>
					<td width="378" align="right">密保问题:：</td>
					<td width="393"><label for="question"></label> <input
						name="question" type="text" id="question" value="" /></td>
				</tr>

				<tr>
					<td width="378" align="right">密保答案：</td>
					<td width="393"><label for="answer"></label> <input
						name="answer" type="text" id="answer" value="" /></td>
				</tr>

				<tr>
					<td width="378" align="right">企业名称：</td>
					<td width="393"><label for="name"></label> <input name="name"
						type="text" id="name" value="" /></td>
				</tr>
				<tr>
					<td align="right">企业地址：</td>
					<td><label for="location"></label> <input type="text"
						name="location" id="location" /></td>

				</tr>
				<tr>
					<td align="right">企业图片：</td>
					<td><label for="file"></label> <input type="file" name="file" /></td>
				</tr>

				<tr>
					<td align="right">企业简介：</td>
					<td><textarea name="introduction" cols="30" rows="5"></textarea>
					</td>
				</tr>
			</table>
			<p style="color: red" align="center">${message}</p>
			<div class="panel-body">
				<button style="margin: 0 0 0 650px" class="btn btn-primary btn-sm "
					data-toggle="modal" data-target="">注册</button>
				<button type="reset" class="btn btn-warning btn-sm "
					data-toggle="modal">重置</button>
			</div>
		</form>
	</div>
</body>
</html>
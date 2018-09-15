<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/wangzhe/css/bootstrap.min.css">
<style type="text/css">
<!--
body, table {
	font-size: 12px;
}

table {
	table-layout: fixed;
	empty-cells: show;
	border-collapse: collapse;
	margin: 0 auto;
}

td {
	height: 50px;
}

h1, h2, h3 {
	font-size: 12px;
	margin: 0;
	padding: 0;
}

.title {
	background: #FFF;
	border: 1px solid #9DB3C5;
	padding: 1px;
	width: 90%;
	margin: 20px auto;
}

.title h1 {
	line-height: 31px;
	text-align: center;
	background: #2F589C url(/wangzhe/th_bg2.gif);
	background-repeat: repeat-x;
	background-position: 0 0;
	color: #FFF;
}

.title th, .title td {
	border: 1px solid #CAD9EA;
	padding: 5px;
}

table.t1 {
	border: 1px solid #cad9ea;
	color: #666;
}

table.t1 th {
	background-image: url(/wangzhe/th_bg1.gif);
	background-repeat: :repeat-x;
	height: 30px;
	text-align: center;
}

table.t1 td, table.t1 th {
	border: 1px solid #cad9ea;
	padding: 0 1em 0;
}

table.t1 tr.a1 {
	background-color: #f5fafe;
}
</style>
<script type="text/javascript">
	function ApplyStyle(s) {
		document.getElementById("mytab").className = s.innerText;
	}

	function showQR(id) {
		// body... 
		var img = document.getElementById("img");
		if (img.hidden) {
			var url = "http://pan.baidu.com/share/qrcode?w=150&h=150&url=http://10.200.24.74:8080/wangzhe/product/get?id="
					+ id;
			img.src = url;
			img.hidden = false;
		} else {
			img.hidden = true;
		}

	}
	function setImg(id){
		var img = document.getElementById("img");
			var url = "http://pan.baidu.com/share/qrcode?w=150&h=150&url=http://10.200.24.74:8080/wangzhe/product/get?id="
					+ id;
			img.src = url;
	}
</script>

</head>
<body>
	<div class="title">
		<h1 style="height: 50px">
			<div style="font-size: 30px; padding-top: 10px;">农产品信息一览</div>
		</h1>

	</div>
	<div>
		<div style="display: block; float: left; margin-left: 70px">
			<form action="/wangzhe/product/searchByNameOrFarmer" method="get">
				输入农户或农产品名称： <input type="text" class="text" name="key"> <input
					type="submit" value="搜索" class="submit">
			</form>
		</div>

		<div style="float: right; margin-right: 70px;">
			<button onclick="javascrtpt:window.location.href='/wangzhe/add.jsp'">添加农产品</button>
			<a href="/wangzhe/user/showInfo">个人信息</a> <a
				href="/wangzhe/user/logout">退出</a>
		</div>

	</div>

	<br>
	<br />

	<table width="90%" id="mytab" border="1" class="t1">

		<tr>
			<th width="5%">序号</th>
			<th width="10%">类别</th>
			<th width="5%">组别</th>
			<th width="10%">产品名称</th>
			<th width="10%">农户</th>
			<th width="10%">称重员</th>
			<th width="10%">重量(g)</th>
			<th width="10%">日期</th>
			<th width="10%">价格(元)</th>
			<th width="15%">二维码</th>
			<th width="10%">总价(元)</th>
			<th width="15%">操作</th>
		</tr>

		<c:if test="${products ==null}">
			<script type="text/javascript">
				javascrtpt: window.location.href = '/wangzhe/product/getAll'
			</script>
		</c:if>
		<c:forEach items="${products}" var="product" varStatus="status">

			
			<c:if test="${status.index%2==0}">
				<tr>
			</c:if>
			<c:if test="${status.index%2!=0}">
				<tr class="a1">
			</c:if>

				<td>${status.index+1}</td>
				<td align="center"><c:if test="${product.category == 1}">
        		蔬菜类
        	</c:if> <c:if test="${product.category == 2}">
        		屠肉类
        	</c:if></td>
				<td align="center">${product.groups}</td>
				<td align="center">${product.name}</td>
				<td align="center">${product.farmer}</td>
				<td align="center">${product.weigher}</td>
				<td align="center">${product.weight}</td>
				<td align="center">${product.productDate}</td>
				<td align="center">${product.price}</td>
				

				<td align="center">
					<button class="btn btn-primary btn-sm center-block"
						data-toggle="modal" data-target="#m" onclick="setImg(${product.id})">显示二维码</button>
					<div class="modal fade" id="m" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<img id="img"/>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal -->
					</div>
				</td>


				<td align="center">${product.totalPrice}</td>
				<td align="center"><a href="delete?id=${product.id}">删除</a>/<a
					href="toEdit?id=${product.id}">修改</a></td>
			</tr>
		</c:forEach>

	</table>
	<script src="/wangzhe/jquery-3.2.1.min.js"></script>
	<script src="/wangzhe/js/bootstrap.min.js"></script>
</body>
</html>
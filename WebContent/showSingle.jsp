<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width = device-width ,initial-scale = 1,
                    maximum-scale = 1,minimum-scale = 1,user-scalable = no " />
<title>Insert title here</title>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=ZWetswiy0lHigEpHjHoMvSKpqapgCuK7"></script>

<link rel="stylesheet" href="/wangzhe/css/bootstrap.min.css">

<style type="text/css">
.btn-lg {
	padding: 10px 0px;
}

.col-xs-3, .col-xs-4 {
	padding: 0 10px;
}

.nav>li>a {
	padding: 10px 10px;
}

@media screen and (max-width: 350px) {
	.col-xs-1 {
		padding: 0 10px;
	}
	.col-xs-3, .col-xs-4 {
		padding: 0;
	}
}

body {
	padding-bottom: 70px;
}

#allmap {
	width: 600px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 30px;
	font-family: "微软雅黑";
	height: 500px;
}
</style>
</head>
<body  >

	<div id="allmap"></div>

	<div id="info" style="display: none;" align="center">
		<h1>${map.user.name}</h1>
		<br /> <br /> <img  style="width: 70%;" src="${map.user.picture}"> <br /> <br />
		<p style="width: 70%;" align="left">公司简介: ${map.user.introduction}</p>
		<p style="width: 70%;" align="left">公司地址: ${map.user.location}</p>
		<p style="width: 70%;" align="left">联系电话: ${map.user.phone}</p>
		<br />
	</div>


	<nav class=" navbar navbar-default navbar-fixed-bottom"
		style="text-align: center;">

	<ul class="nav nav-tabs">

		<li class="col-xs-6 col-sm-6"><a class="" href="#"
			onclick="showProduct()">
				<div style="color: #5dea10"
					class="glyphicon glyphicon-comment btn-lg" aria-hidden="true">
					<div>基本信息</div>
				</div>
		</a></li>

		<li class="col-xs-6 col-sm-6"><a class="" href="#"
			onclick="showCompany()">
				<div style="color: #d2b010"
					class="glyphicon glyphicon-list-alt btn-lg" aria-hidden="true">
					<div>企业简介</div>
				</div>
		</a></li>

	</ul>

	</nav>

	<script type="text/javascript" src="/wangzhe/js/bootstrap.min.js"></script>
</body>
</html>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap"); // 创建Map实例

	var lng = "${map.product.lng}";
	var lat = "${map.product.lat}";
	var title = "${map.product.farmer}";

	//content
	var name = "${map.product.name}";
	var type = "${map.product.category}";
	var s_type;
	if (type == 1) {
		s_type = "蔬菜类";
	} else if (type == 2) {
		s_type = "屠肉类";
	}
	var weight = "${map.product.weight}";
	var productDate = "${map.product.productDate}";

	var content = s_type + ": " + name + "<br/> 采收时间: " + productDate
			+ "<br/> 重量: " + weight / 500 + "斤";

	var point = new BMap.Point(lng, lat);
	map.centerAndZoom(point, 20); // 初始化地图,设置中心点坐标和地图级别
	//添加地图类型控件
	map.addControl(new BMap.MapTypeControl({
		mapTypes : [ BMAP_NORMAL_MAP, BMAP_HYBRID_MAP ]
	}));
	map.setCurrentCity("北京"); // 设置地图显示的城市 此项是必须设置的
	map.enableScrollWheelZoom(true); //开启鼠标滚轮缩放

	var marker = new BMap.Marker(point); // 创建标注
	map.addOverlay(marker); // 将标注添加到地图中
	map.centerAndZoom(point, 20);
	var opts = {
		width : 250, // 信息窗口宽度
		height : 150, // 信息窗口高度
		title : title, // 信息窗口标题
	}
	var infoWindow = new BMap.InfoWindow(content, opts); // 创建信息窗口对象 
	map.openInfoWindow(infoWindow, point); //开启信息窗口
	marker.addEventListener("click", function() {
		map.openInfoWindow(infoWindow, point); //开启信息窗口
	});
	
	function G(id) {
	    return document.getElementById(id);
	}

	function showProduct() {
		var divMap=G("allmap");
		var divInfo=G("info");
		divInfo.style.display='none';
		divMap.style.display='';
	}

	function showCompany() {
		var divMap=G("allmap");
		var divInfo=G("info");
		divMap.style.display='none';
		divInfo.style.display='';
	}
</script>

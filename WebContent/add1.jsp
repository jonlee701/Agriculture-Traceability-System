<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <style type="text/css">
    body,
    html{
    	width: 100%;
        height:100%;
        overflow: hidden;
        margin: 0;
        font-family: "微软雅黑";
    }
      #left {
        float: left;
        width: 300px;
        height: 100%;
      }
      #allmap {
      	width: 70%;
        margin: 0;
        font-family: "微软雅黑";
        margin-left: 310px;
        height: 75%;
      }
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ZWetswiy0lHigEpHjHoMvSKpqapgCuK7"></script>
</head>
<body>
<div id="left">

    <form action="product/add" method="post" id="form">
        产品名称:
        <input type="text" name="name" size="20" maxlength="10" value="${product.name }"/>
        <br/>
        <br>
        类  别: 
       <!-- <c:if test="${sessionScope.type ==1 }">
        	<input type="radio" value="1" name="category" checked disabled="disabled"/>蔬菜类
        	<input type="radio" value="2" name="category" disabled="disabled"/>屠肉类
        </c:if>
        <c:if test="${sessionScope.type ==2 }">
        	<input type="radio" value="1" name="category" disabled="disabled"/>蔬菜类
        	<input type="radio" value="2" name="category" checked disabled="disabled"/>屠肉类
        </c:if>-->
        <input type="radio" value="1" name="category" />蔬菜类
        	<input type="radio" value="2" name="category" />屠肉类
        <br/>
        <br/>
       	组  别:
        <input type="text" name="group"  size="20" maxlength="10" value="${product.groups }"/>
        <br/>
        <br>
        称重员
        <input type="text" name="weigher"  size="20" maxlength="10" value="${product.weigher }"/>
        <br/>
        <br>
        重 量:
        <input type="text" name="weight"  size="20"  maxlength="6" onkeypress="return event.keyCode>=48&&event.keyCode<=57" ng-pattern="/[^a-zA-Z]/" value="${product.weight }"/> 斤
        <br/>
        <br>
       <c:if test="${sessionScope.type == 1}">
   			采摘日期:
   		</c:if>
   		  <c:if test="${sessionScope.type == 2}">
   			屠宰时间:
   		</c:if>
        <input type="text" name="productDate"  size="20" maxlength="10" value="${product.productDate }"/>
        <br/>
        <br>
        价  格:
        <input type="text" name="price" size="20"  maxlength="6"  onkeypress="return event.keyCode>=48&&event.keyCode<=57" ng-pattern="/[^a-zA-Z]/" value="${product.price }"/> 元/斤
        <br/>
        <br>
        注*以下信息请在右边的地图选择:
        <br/>
        <br>
        经度:<input type="text" name="lng"  readonly="true" id="input_lng" value="${product.lng }"> 
        <br/>
        <br>
        维度:<input type="text" name="lat"  readonly="true" id="input_lat" value="${product.lat }"> 
        <br/>
        <br>
        地址:<input type="text" name="location" readonly="true" id="input_location" size="50" value="${product.location }"> 
        <br/>
        <br>
        <input type="submit" value="提交" />&nbsp;&nbsp;
        <input type="reset" value="重置" />&nbsp;&nbsp;
    </form>
 </div>
 
 	<div id="r-result">必须要在此处搜索地址才能添加:<input type="text" id="suggestId" size="20" value="百度" style="width:150px;" /></div>
    <div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
    <div id="allmap"></div>

</body>
</html>
<script type="text/javascript">
// 百度地图API功能

function G(id) {
    return document.getElementById(id);
  }

var map = new BMap.Map("allmap"); // 创建Map实例
map.centerAndZoom(new BMap.Point(116.404, 39.915), 11); // 初始化地图,设置中心点坐标和地图级别
//添加地图类型控件
map.addControl(new BMap.MapTypeControl({
    mapTypes: [
        BMAP_NORMAL_MAP,
        BMAP_HYBRID_MAP
    ]
}));
map.setCurrentCity("北京"); // 设置地图显示的城市 此项是必须设置的
map.enableScrollWheelZoom(true); //开启鼠标滚轮缩放

var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
    {"input" : "suggestId"
    ,"location" : map
  });

  ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
  var str = "";
    var _value = e.fromitem.value;
    var value = "";
    if (e.fromitem.index > -1) {
      value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
    }    
    str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
    
    value = "";
    if (e.toitem.index > -1) {
      _value = e.toitem.value;
      value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
    }    
    str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
    G("searchResultPanel").innerHTML = str;
  });

  var myValue;
  ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
  var _value = e.item.value;
    myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
    G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
    
    setPlace();
  });

  function setPlace(){
    map.clearOverlays();    //清除地图上所有覆盖物
    function myFun(){
      var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
      map.centerAndZoom(pp, 18);
      map.addOverlay(new BMap.Marker(pp));    //添加标注 
      G("input_lng").value=pp.lng;
      G("input_lat").value=pp.lat;
      G("input_location").value=myValue;
    }
    var local = new BMap.LocalSearch(map, { //智能搜索
      onSearchComplete: myFun
    });
    local.search(myValue);
  }
  
  if("${product.id }"!=""){
	  var form=G("form");
	  form.action="edit?id=${product.id}";
  }
  
</script>



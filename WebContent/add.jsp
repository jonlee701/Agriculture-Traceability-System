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
    <script type="text/javascript">
	    function G(id) {
	        return document.getElementById(id);
	    }
    </script>
    <link rel="stylesheet" href="/wangzhe/css/bootstrap.min.css">
</head>
<form style="display: block;float: left" action="/wangzhe/product/add" method="post"  >

    <br>
    <br>
    <div class="form-group has-feedback">
        <div class="col-sm-12">
            <span class="glyphicon glyphicon-apple form-control-feedback"></span>
            <input type="text" class="form-control" id="name" name="name" placeholder="产品名称" autofocus>
        </div>
    </div>


    <div class="form-group has-feedback">
        <div class="col-sm-12">
            <div style="font-family: 微软雅黑;display: block;float: left" >产品类别：</div>
            <label class="checkbox-inline ">
                <input type="radio" name="category" id="category"
                       value="1" checked> 蔬菜类
            </label>
            <label class="checkbox-inline ">
                <input type="radio" name="category" id="category"
                       value="2"> 屠肉类
            </label>
        </div>
    </div>

    <div class="form-group has-feedback">
        <div class="col-md-12">
            <span class="glyphicon glyphicon-scissors form-control-feedback"></span>
            <input type="text" class="form-control" id="group" name="group" placeholder="组别" autofocus>
        </div>
    </div>

    <div class="form-group has-feedback">
        <div class="col-md-12">
            <span class="glyphicon glyphicon-wrench form-control-feedback"></span>
            <input type="text" class="form-control" id="weigher" name="weigher" placeholder="称重员" autofocus>
        </div>
    </div>

    <div class="form-group has-feedback">
        <div class="col-md-12">
            <span class="glyphicon glyphicon-object-align-left form-control-feedback"></span>
            <input type="text" class="form-control" id="weight" name="weight" placeholder="重量（g）" autofocus>
        </div>
    </div>

    <div class="form-group has-feedback">
        <div class="col-md-12">
            <span class="glyphicon glyphicon-dashboard form-control-feedback"></span>
            <input type="text" class="form-control" id="productDate" name="productDate" placeholder="日期" autofocus>
        </div>
    </div>
    
    <c:if test="${sessionScope.type == 1}">
   			<script type="text/javascript">
	 			var item=G("productDate");
	 			item.placeholder="采摘日期:";
	 		</script>
   		</c:if>
   		  <c:if test="${sessionScope.type == 2}">
   			<script type="text/javascript">
	 			var item=G("productDate");
	 			item.placeholder="屠宰时间";
	 		</script>
   		</c:if>

    <div class="form-group has-feedback">
        <div class="col-md-12">
            <span class="glyphicon glyphicon-usd form-control-feedback"></span>
            <input type="text" class="form-control" id="price" name="price" placeholder="价格（元）" autofocus>
        </div>
    </div>

    <div>
        <br />
    </div>
    <div class="form-group has-feedback">

        <div class="col-md-12">
            <label>以下信息请在右边地图中选择</label>
            <span class="glyphicon glyphicon-arrow-right form-control-feedback"></span>
            <input type="text" class="form-control" id="input_lng" name="lng" readonly="readonly" placeholder="经度" autofocus>
        </div>
    </div>
    <div class="form-group has-feedback">
        <div class="col-md-12">
            <span class="glyphicon glyphicon-arrow-up form-control-feedback"></span>
            <input type="text" class="form-control" id="input_lat" name="lat" readonly="readonly" placeholder="纬度" autofocus>
        </div>
    </div>
    <div class="form-group has-feedback">
        <div class="col-md-12">
            <span class="glyphicon glyphicon-plane form-control-feedback"></span>
            <input type="text" class="form-control" id="input_location" name="location" readonly="readonly" placeholder="详细地址" autofocus>
        </div>
    </div>



    <div class="panel-body">
        <button class="btn btn-primary btn-sm "  data-toggle="modal" data-target="#m">确定</button>
        <button type="reset" class="btn btn-warning btn-sm "  data-toggle="modal" >重置</button>
    </div>

</form>

    <div class="input-group col-md-4" style="margin:0 0 0 310px;positon:relative">
        <input type="text" id="suggestId"  class="form-control"placeholder="请输入你要搜索的地址" />
        <span class="input-group-btn">
                   <button class="btn btn-info btn-search " >搜索</button>
                </span>
    </div>
    <div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;">
    </div>
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
<script type="text/javascript" src="/wangzhe/jquery-3.2.1.min.js"/>
<script type="text/javascript" src="/wangzhe/js/bootstrap.min.js"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css"/>
	<link href="<%=request.getContextPath()%>/css/login.css" rel="stylesheet" type="text/css"/>
	<!-- 引入jquery -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>


	<style type="text/css">
	body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=wjT5hLmSQEDscmdYGRfb9dT4yX8qyZ4T"></script>
<title>单击获取点击的经纬度</title>
</head>
<body>
<div id="allmap" style="width:800px;height:500px;float:left;margin-top:15px;">

</div>
<div style="margin-top:15px;">
	<a href="#" id="saveAreaId" class="easyui-linkbutton" iconCls="icon-ok" style="width:40%;height:33px">保存</a>
</div>
当前经纬度: <input type="text" id="pointId">
</body>
</html>
<script type="text/javascript">
    // 百度地图API功能
    var map = new BMap.Map("allmap");
    var mk;
    map.centerAndZoom("广州", 12);
    map.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
    map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用
    map.enableInertialDragging();


    //添加选择城市的控件
    var size = new BMap.Size(50, 20);
    map.addControl(new BMap.CityListControl({
        anchor: BMAP_ANCHOR_TOP_RIGHT,
        offset: size,
        // 切换城市之间事件
        // onChangeBefore: function(){
        //    alert('before');
        // },
        // 切换城市之后事件
        // onChangeAfter:function(){
        //   alert('after');
        // }
    }));


    /*    //单击获取点击的经纬度
       map.addEventListener("click", function (e) {
           alert(e.point.lng + "," + e.point.lat);
           map.removeOverlay(mk);
           mk = new BMap.Marker(e.point);
           map.addOverlay(mk);
       });   */


    //单击获取点击的经纬度
    map.addEventListener("click", function (e) {
        //alert(e.point.lng + "," + e.point.lat);
        var point=e.point.lng + "," + e.point.lat;
        $("#pointId").val(point);
        map.removeOverlay(mk);
        mk = new BMap.Marker(e.point);
        map.addOverlay(mk);

    });


    // 添加带有定位的导航控件
    var navigationControl = new BMap.NavigationControl({
        // 靠左上角位置
        anchor: BMAP_ANCHOR_TOP_LEFT,
        // LARGE类型
        type: BMAP_NAVIGATION_CONTROL_LARGE,
        // 启用显示定位
        enableGeolocation: true
    });
    map.addControl(navigationControl);
    // 添加定位控件
    var geolocationControl = new BMap.GeolocationControl();
    geolocationControl.addEventListener("locationSuccess", function (e) {
        // 定位成功事件
        var address = '';
        address += e.addressComponent.province;
        address += e.addressComponent.city;
        address += e.addressComponent.district;
        address += e.addressComponent.street;
        address += e.addressComponent.streetNumber;
        //alert("当前定位地址为：" + address);
    });
    geolocationControl.addEventListener("locationError", function (e) {
        // 定位失败事件
        alert(e.message);
    });
    map.addControl(geolocationControl);

    $("#saveAreaId").click(function(){

        var location = $("#pointId").val();
        $.ajax({
            url:'<%=path%>/area/getareaName.do',
            data:{
                location:location
            },
            success:function(data){
                var regeocode=data.regeocode;
                //具体地址  var areaname=regeocode.formatted_address;

                var addressComponent=regeocode.addressComponent
                var  province= addressComponent.province;
                var city =addressComponent.city;
                var district = addressComponent.district;

                var areaname =province+city+ district;
                alert(areaname);

                $.ajax({
                    url :'<%=path%>/area/saveArea.do',
                    data:{
                        areaname : areaname
                    },
                    success:function(){
                        $.messager.alert('提示','保存成功！！')
                        location.href="<%=path%>/toBusinessArea.do"
                    }
                })


            }
        })
    })

</script>

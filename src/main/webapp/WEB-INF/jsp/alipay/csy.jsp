<div>
    <div>
        <div>位置</div>
        <div>
            <input id="addressSheng" type="text"/>
            <input id="addressShi" type="text"/>
            <input id="addressXian" type="text"/>

        </div>
    </div>
    <div style="height: 400px;width:730px;margin:auto;">
        <div id="container"
             style="
                width: 730px;
                height: 400px;
                border: 1px solid gray;
                overflow:hidden;">
        </div>
    </div>
    <div>
        <div>经度</div>
        <div>
            <input id="longitude" type="text" placeholder="经度"/>
        </div>
    </div>
    <div>
        <div>纬度</div>
        <div>
            <input id="latitude" type="text" placeholder="纬度"/>
        </div>
    </div>
    </form>
</div>
</div>

<script>


    //map中的container必须与div中id保持一致

    map.centerAndZoom("昆明",12);//默认地址
    //逆地址解析（将经纬度转化为地址）
    var geoc = new BMap.Geocoder();
    map.enableScrollWheelZoom();    //启用滚轮放大缩小，默认禁用
    map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用
    //添加单击事件
    map.addEventListener("click",function(e){
        map.clearOverlays();//清空原来的标注
        document.getElementById("longitude").value = e.point.lng;
        document.getElementById("latitude").value = e.point.lat;
        var marker = new BMap.Marker(new BMap.Point(e.point.lng, e.point.lat));  // 创建标注，为要查询的地方对应的经纬度
        map.addOverlay(marker);
        geoc.getLocation(e.point,function(rs){
            var addComp = rs.addressComponents;
            document.getElementById("addressSheng").value=(addComp.province );
            document.getElementById("addressShi").value=(  addComp.city  );
            document.getElementById("addressXian").value=(  addComp.district );

        });
    });
</script>

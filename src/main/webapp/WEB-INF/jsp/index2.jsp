<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>金科商城</title>
	<link href="<%=request.getContextPath()%>/css/slider.css" rel="stylesheet" type="text/css"/>
	<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css"/>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>

	<!-- 引入bootstrap的js-->
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/js/bootstrap.min.js"></script>

	<!-- 引入bootstrap的js-->
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/treeview/bootstrap-treeview.min.js"></script>

	<!-- 引入bootstrap的js-->
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/addTabs/addTabs.js"></script>
<style>
	.main{width:1080px;min-height:390px;margin:10px auto;}
	.scroll{ float:left; width:50px; height:50px;}
</style>
	<style>
		.main{width:1080px;min-height:390px;margin:10px auto;}
		.scroll{ float:left; width:50px; height:50px; }

	</style>
</head>
<body>

<input type="hidden" value="${user.uid}" id="userId">
<input type="hidden" value="${user.username}" id="userName">

	<div class="scrol" style="float:left; width:15%; height:1000px;" >
		<center>
			<br><br><br><br><br><br><br><br>
			<div style="height: 300px; width: 200px; ">

			</div>
			<br><br><br><br><br><br><br><br>
			<div style="height: 300px; width: 200px; ">

			</div>
		</center>

	</div>
<!-- 广告列表 -->
	<div class="scro" style="float:right; width:15%; height:1000px; " >
		<center>
			<br><br><br><br><br><br><br><br>
			<div style="height: 300px; width: 200px; ">

			</div>
			<br><br><br><br><br><br><br><br>
			<div style="height: 300px; width: 200px; ">

			</div>
		</center>
	</div>



<div class="scrolll" style="width:70%; height:1000px; float: left">
<div class="container header">
	<div class="span5">
		<div class="logo">
			<a href="./网上商城/index.htm">
				<img src="${logo[0].logimg}" width="50px" height="70px" alt="金科商城"/>
			</a>
		</div>
	</div>
	<div class="span9">
		<div class="headerAd">
			<img src="<%=request.getContextPath()%>/image/header.jpg" width="320" height="50" alt="正品保障" title="正品保障"/>
		</div>
	</div>
<div class="span10 last">
		<div class="topNav clearfix">
			<ul>

				<li id="loginuser" class="loginuser"
					style="display: list-item;"><span id="usernameSpan"></span>|
				</li>

				<li id="headerLogin" class="headerLogin" style="display: list-item;">
					<span id="mydd">	<a href="<%=request.getContextPath()%>/loginUser/toLoginUser">登录</a></span>|</li>
				<li id="headerRegister" class="headerRegister"
					style="display: list-item;"><span id="exit"><a href="<%=request.getContextPath()%>/reg/toregPage">注册</a></span>|
				</li>

				<li><a>会员中心</a> |</li>
				<li><a>购物指南</a> |</li>
				<li><a>关于我们</a></li>
			</ul>
		</div>
		<div class="cart">
			<a href="<%=request.getContextPath()%>/cart_myCart.action">购物车</a>
		</div>
		<div class="phone">
			客服热线: <strong>96008/53277764</strong>
		</div>
	</div>

	<div class="span24">
		<ul class="mainNav">
			<li><a href="<%=request.getContextPath()%>/user/toIndex">首页</a> |</li>
			<c:forEach items="${category}" var="ccc">
				<li><a href="javascript:thePrimaryQuery(${ccc.cid})">${ccc.cname}</a> |</li>
			</c:forEach>
		</ul>
	</div>

</div>

<div class="container index">


	<div class="span24">
		<div id="hotProduct" class="hotProduct clearfix">
			<div class="title">
				<strong>热门商品</strong>
				<!-- <a  target="_blank"></a> -->
			</div>
			<ul class="tab">
				<li class="current">
					<a href="./蔬菜分类.htm?tagIds=1" target="_blank"></a>
				</li>
				<li>
					<a  target="_blank"></a>
				</li>
				<li>
					<a target="_blank"></a>
				</li>
			</ul>

			<br><br>
			<div class="main">
				<c:forEach items="${pro}" var="pro">
					<div class="scroll" style="height: 190px; width: 190px;" >
						<center>
							<a href="javascript:querys(${pro.pid})" ><img src="${pro.image}" alt="" width="160px" height="160px"></a>
						</center>
					</div>
				</c:forEach>
			</div>

			<ul class="tabContent" style="display: none;">
				<li>
					<a target="_blank"><img src="./Mango商城 - Powered By Mango Team_files/c5b1b396-181a-4805-9e68-9b400d71f91e-thumbnail.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/c5b1b396-181a-4805-9e68-9b400d71f91e-thumbnail.jpg" style="display: block;"></a>
				</li>
				<li>
					<a  target="_blank"><img src="./Mango商城 - Powered By Mango Team_files/4107e1ce-5e7c-4941-bc0f-718f35ba14cd-thumbnail.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/4107e1ce-5e7c-4941-bc0f-718f35ba14cd-thumbnail.jpg" style="display: block;"></a>
				</li>
				<li>
					<a  target="_blank"><img src="./Mango商城 - Powered By Mango Team_files/6f8ae4bf-cbd3-41c7-aa22-0fe81db6add4-thumbnail.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/6f8ae4bf-cbd3-41c7-aa22-0fe81db6add4-thumbnail.jpg" style="display: block;"></a>
				</li>
				<li>
					<a target="_blank"><img src="./Mango商城 - Powered By Mango Team_files/3d835c07-08c5-46d7-912d-adcd41f8c8e6-thumbnail.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/3d835c07-08c5-46d7-912d-adcd41f8c8e6-thumbnail.jpg" style="display: block;"></a>
				</li>
				<li>
					<a  target="_blank"><img src="./Mango商城 - Powered By Mango Team_files/5e5be432-fbee-4bdd-a7bd-a92e01f9bfc4-thumbnail.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/5e5be432-fbee-4bdd-a7bd-a92e01f9bfc4-thumbnail.jpg" style="display: block;"></a>
				</li>
				<li>
					<a target="_blank"><img src="./Mango商城 - Powered By Mango Team_files/cae1bc6b-0159-4ce0-9a9c-4926df231b4f-thumbnail.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/cae1bc6b-0159-4ce0-9a9c-4926df231b4f-thumbnail.jpg" style="display: block;"></a>
				</li>
				<li>
					<a  target="_blank"><img src="./Mango商城 - Powered By Mango Team_files/40e34b2d-d240-446e-9874-89969edbe89f-thumbnail.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/40e34b2d-d240-446e-9874-89969edbe89f-thumbnail.jpg" style="display: block;"></a>
				</li>
				<li>
					<a target="_blank"><img src="./Mango商城 - Powered By Mango Team_files/a8db4410-05e5-4dfa-8217-eb885a104af3-thumbnail.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/a8db4410-05e5-4dfa-8217-eb885a104af3-thumbnail.jpg" style="display: block;"></a>
				</li>
			</ul>
			<ul class="tabContent" style="display: none;">
				<li>
					<a target="_blank"><img src="./Mango商城 - Powered By Mango Team_files/9f164e13-bcaa-48a6-9b35-0ca96629f614-thumbnail.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/9f164e13-bcaa-48a6-9b35-0ca96629f614-thumbnail.jpg" style="display: block;"></a>
				</li>
				<li>
					<a target="_blank"><img src="./Mango商城 - Powered By Mango Team_files/c41d0347-364c-42bb-baeb-25142c1ed167-thumbnail.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/c41d0347-364c-42bb-baeb-25142c1ed167-thumbnail.jpg" style="display: block;"></a>
				</li>
				<li>
					<a target="_blank"><img src="./Mango商城 - Powered By Mango Team_files/2af8be8a-75b9-41ae-b009-a7c54b685a4e-thumbnail.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/2af8be8a-75b9-41ae-b009-a7c54b685a4e-thumbnail.jpg" style="display: block;"></a>
				</li>
				<li>
					<a  target="_blank"><img src="./Mango商城 - Powered By Mango Team_files/1a3ad7de-7ee9-4530-b89a-46375219beb5-thumbnail.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/1a3ad7de-7ee9-4530-b89a-46375219beb5-thumbnail.jpg" style="display: block;"></a>
				</li>
				<li>
					<a target="_blank"><img src="./Mango商城 - Powered By Mango Team_files/ea566af4-0cdb-4017-a8c7-27e407794204-thumbnail.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/ea566af4-0cdb-4017-a8c7-27e407794204-thumbnail.jpg" style="display: block;"></a>
				</li>
				<li>
					<a  target="_blank"><img src="./Mango商城 - Powered By Mango Team_files/dea31d42-fa3e-4b69-a631-51ca7c79f032-thumbnail.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/dea31d42-fa3e-4b69-a631-51ca7c79f032-thumbnail.jpg" style="display: block;"></a>
				</li>
				<li>
					<a  target="_blank"><img src="./Mango商城 - Powered By Mango Team_files/1c81f492-a3d7-4c06-8658-bc2c76808cd3-thumbnail.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/1c81f492-a3d7-4c06-8658-bc2c76808cd3-thumbnail.jpg" style="display: block;"></a>
				</li>
				<li>
					<a target="_blank"><img src="./Mango商城 - Powered By Mango Team_files/f1174ca6-6bdf-4d0b-86e6-5455bc8e89ad-thumbnail.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/f1174ca6-6bdf-4d0b-86e6-5455bc8e89ad-thumbnail.jpg" style="display: block;"></a>
				</li>
			</ul>
		</div>
	</div>
	<div class="span24">
		<div id="newProduct" class="newProduct clearfix">
			<div class="title">
				<strong>最新商品</strong>
				<a  target="_blank"></a>
			</div>
			<ul class="tab">
				<li class="current">
					<a href="./蔬菜分类.htm?tagIds=2" target="_blank"></a>
				</li>
				<li>
					<a  target="_blank"></a>
				</li>
				<li>
					<a target="_blank"></a>
				</li>
			</ul>

			<br><br>
			<div class="main">
				<c:forEach items="${dd}" var="dd">
					<div class="scroll" style="height: 190px; width: 190px;" >
						<center>
							<a href="javascript:queryd(${dd.pid})" ><img src="${dd.image}" alt="" width="160px" height="160px"></a>
						</center>
					</div>
				</c:forEach>
			</div>



			<ul class="tabContent" style="display: none;">
				<li>
					<a  target="_blank"><img src="./Mango商城 - Powered By Mango Team_files/b04a22f5-267d-4e33-ac58-dda941eeaf84-thumbnail.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/b04a22f5-267d-4e33-ac58-dda941eeaf84-thumbnail.jpg" style="display: block;"></a>
				</li>
				<li>
					<a  target="_blank"><img src="./Mango商城 - Powered By Mango Team_files/ca3043f5-dbb0-4a03-9bb6-8274f78b5d7e-thumbnail.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/ca3043f5-dbb0-4a03-9bb6-8274f78b5d7e-thumbnail.jpg" style="display: block;"></a>
				</li>
				<li>
					<a  target="_blank"><img src="./Mango商城 - Powered By Mango Team_files/a2ac0816-37e4-477a-b179-e64f71252cf5-thumbnail.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/a2ac0816-37e4-477a-b179-e64f71252cf5-thumbnail.jpg" style="display: block;"></a>
				</li>
				<li>
					<a  target="_blank"><img src="./Mango商城 - Powered By Mango Team_files/fbb80ec8-a1d3-49de-b83b-79eae4b1ff69-thumbnail.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/fbb80ec8-a1d3-49de-b83b-79eae4b1ff69-thumbnail.jpg" style="display: block;"></a>
				</li>
				<li>
					<a target="_blank"><img src="./Mango商城 - Powered By Mango Team_files/bb99deac-0b33-48f1-a3ad-e8310516be07-thumbnail.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/bb99deac-0b33-48f1-a3ad-e8310516be07-thumbnail.jpg" style="display: block;"></a>
				</li>
				<li>
					<a target="_blank"><img src="./Mango商城 - Powered By Mango Team_files/7b3c0647-1016-4d13-8b84-4d63818e1179-thumbnail.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/7b3c0647-1016-4d13-8b84-4d63818e1179-thumbnail.jpg" style="display: block;"></a>
				</li>
				<li>
					<a  target="_blank"><img src="./Mango商城 - Powered By Mango Team_files/3c79f82f-f136-48aa-9e81-7e10fbb3de2a-thumbnail.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/3c79f82f-f136-48aa-9e81-7e10fbb3de2a-thumbnail.jpg" style="display: block;"></a>
				</li>
				<li>
					<a target="_blank"><img src="./Mango商城 - Powered By Mango Team_files/b998f840-91fc-41b6-b73d-70587babf760-thumbnail.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/b998f840-91fc-41b6-b73d-70587babf760-thumbnail.jpg" style="display: block;"></a>
				</li>
			</ul>
			<ul class="tabContent" style="display: none;">
				<li>
					<a  target="_blank"><img src="./Mango商城 - Powered By Mango Team_files/9f164e13-bcaa-48a6-9b35-0ca96629f614-thumbnail.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/9f164e13-bcaa-48a6-9b35-0ca96629f614-thumbnail.jpg" style="display: block;"></a>
				</li>
				<li>
					<a target="_blank"><img src="./Mango商城 - Powered By Mango Team_files/1a3ad7de-7ee9-4530-b89a-46375219beb5-thumbnail.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/1a3ad7de-7ee9-4530-b89a-46375219beb5-thumbnail.jpg" style="display: block;"></a>
				</li>
				<li>
					<a target="_blank"><img src="./Mango商城 - Powered By Mango Team_files/7acae4ac-5909-4142-8b20-19c5462859d6-thumbnail.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/7acae4ac-5909-4142-8b20-19c5462859d6-thumbnail.jpg" style="display: block;"></a>
				</li>
				<li>
					<a  target="_blank"><img src="./Mango商城 - Powered By Mango Team_files/ea566af4-0cdb-4017-a8c7-27e407794204-thumbnail.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/ea566af4-0cdb-4017-a8c7-27e407794204-thumbnail.jpg" style="display: block;"></a>
				</li>
				<li>
					<a  target="_blank"><img src="./Mango商城 - Powered By Mango Team_files/dea31d42-fa3e-4b69-a631-51ca7c79f032-thumbnail.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/dea31d42-fa3e-4b69-a631-51ca7c79f032-thumbnail.jpg" style="display: block;"></a>
				</li>
				<li>
					<a  target="_blank"><img src="./Mango商城 - Powered By Mango Team_files/1c81f492-a3d7-4c06-8658-bc2c76808cd3-thumbnail.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/1c81f492-a3d7-4c06-8658-bc2c76808cd3-thumbnail.jpg" style="display: block;"></a>
				</li>
				<li>
					<a  target="_blank"><img src="./Mango商城 - Powered By Mango Team_files/f1174ca6-6bdf-4d0b-86e6-5455bc8e89ad-thumbnail.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/f1174ca6-6bdf-4d0b-86e6-5455bc8e89ad-thumbnail.jpg" style="display: block;"></a>
				</li>
				<li>
					<a  target="_blank"><img src="./Mango商城 - Powered By Mango Team_files/2971c96e-9f11-4491-9faf-9ea7e1fec53c-thumbnail.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/2971c96e-9f11-4491-9faf-9ea7e1fec53c-thumbnail.jpg" style="display: block;"></a>
				</li>
			</ul>
		</div>
	</div>
	<div class="span24">
		<div class="friendLink">
			<dl>
				<dt>新手指南</dt>
				<dd>
					<a  target="_blank">支付方式</a>
					|
				</dd>
				<dd>
					<a  target="_blank">配送方式</a>
					|
				</dd>
				<dd>
					<a  target="_blank">售后服务</a>
					|
				</dd>
				<dd>
					<a  target="_blank">购物帮助</a>
					|
				</dd>
				<dd>
					<a  target="_blank">蔬菜卡</a>
					|
				</dd>
				<dd>
					<a  target="_blank">礼品卡</a>
					|
				</dd>
				<dd>
					<a target="_blank">银联卡</a>
					|
				</dd>
				<dd>
					<a  target="_blank">亿家卡</a>
					|
				</dd>

				<dd class="more">
					<a >更多</a>
				</dd>
			</dl>
		</div>
	</div>
</div>
<div class="container footer">
	<div class="span24">
		<div class="footerAd">
			<img src="<%=request.getContextPath()%>/image/footer.jpg" width="950" height="52" alt="我们的优势" title="我们的优势">
		</div>	</div>
	<div class="span24">
		<ul class="bottomNav">
			<li>
				<a>关于我们</a>
				|
			</li>
			<li>
				<a>联系我们</a>
				|
			</li>
			<li>
				<a>招贤纳士</a>
				|
			</li>
			<li>
				<a>法律声明</a>
				|
			</li>
			<li>
				<a>友情链接</a>
				|
			</li>
			<li>
				<a target="_blank">支付方式</a>
				|
			</li>
			<li>
				<a target="_blank">配送方式</a>
				|
			</li>
			<li>
				<a>服务声明</a>
				|
			</li>
			<li>
				<a>广告声明</a>

			</li>
		</ul>
	</div>
	<div class="span24">
		<div class="copyright">Copyright © 2005-2015 网上商城 版权所有</div>
	</div>
</div>

</div>




<script>



    function querys(pid) {
        location.href="<%=request.getContextPath()%>/comm/querydetails?pid="+pid;
    }

    function queryd(pid) {
        location.href="<%=request.getContextPath()%>/comm/querydetails?pid="+pid;
    }

    function thePrimaryQuery(cid) {
        location.href="<%=request.getContextPath()%>/comm/thePrimaryQuery?cid="+cid;
    }



    $(function () {
        console.info($("#userId"))
        var uid = $("#userId").val();
        var username = $("#userName").val();
        if (uid!='' && uid!=null) {
            $("#usernameSpan").html(username);
            $("#mydd").html("<a href='<%=request.getContextPath()%>/loginUser/madd'>我的订单</a>");
            $("#exit").html("<a href='<%=request.getContextPath()%>/loginUser/exitUser'>退出</a>");

        }
    })



</script>


</body>
</html>
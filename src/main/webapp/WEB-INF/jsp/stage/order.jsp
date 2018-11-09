<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

	<title>订单页面</title>
	<link href="<%=request.getContextPath()%>/css/common.css"
		  rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/css/cart.css"
		  rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/css/product.css"
		  rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>


</head>
<body>
<input type="hidden" value="${user.uid}" id="userId">
<input type="hidden" value="${user.username}" id="userName">

<div class="container header">
	<div class="span5">
		<div class="logo">
			<a href="./网上商城/index.htm"> <img
					src="/shop/image/r___________renleipic_01/logo.gif"
					alt="传智播客" /> </a>
		</div>
	</div>
	<div class="span9">
		<div class="headerAd">
			<img src="/shop/image/header.jpg"
				 width="320" height="50" alt="正品保障" title="正品保障" />
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
			<a href="/shop/cart_myCart.action">购物车</a>
		</div>
		<div class="phone">
			客服热线: <strong>96008/53277764</strong>
		</div>
	</div>
	<div class="span24">
		<ul class="mainNav">
			<li><a href="<%=request.getContextPath()%>//index.action">首页</a> |</li>

			<li><a href="<%=request.getContextPath()%>//product_findByCid.action?cid=1&page=1">女装男装</a> |</li>

			<li><a href="/shop/product_findByCid.action?cid=2&page=1">鞋靴箱包</a> |</li>

			<li><a href="/shop/product_findByCid.action?cid=3&page=1">运动户外</a> |</li>

			<li><a href="/shop/product_findByCid.action?cid=4&page=1">珠宝配饰</a> |</li>

			<li><a href="/shop/product_findByCid.action?cid=5&page=1">手机数码</a> |</li>

			<li><a href="/shop/product_findByCid.action?cid=6&page=1">家电办公</a> |</li>

			<li><a href="/shop/product_findByCid.action?cid=7&page=1">护肤彩妆</a> |</li>

			<li><a href="/shop/product_findByCid.action?cid=10&page=1">家居饰品</a> |</li>


		</ul>
	</div>

</div>

<div class="container cart">

	<div class="span24">

		<div class="step step1">
			<ul>

				<li class="current"></li>
				<li>我的订单</li>
			</ul>
		</div>


		<table>
			<tbody>
			<c:forEach items="${orders}" var="o">
			<tr>
                <th colspan="5">订单编号:${o.oid};订单金额:<font
						color="red">${o.total}
				</font>

					&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">
						<c:if test="${o.state==2}">
							<a href="javascript:payment(${o.oid})">付款</a>
						</c:if>
						<c:if test="${o.state==1}">
							已完成
						</c:if>
						<c:if test="${o.state==3}">
							待发货
						</c:if>
						<c:if test="${o.state==4}">
							<a href='javascript:updateOrder(${o.oid})'>确认收货</a>
						</c:if>
				</font>
				</th>
			</tr>
			<tr>
				<th>图片</th>
				<th>商品</th>
				<th>价格</th>
				<th>数量</th>
				<th>小计</th>
			</tr>

			<tr>
				<td width="60"><img src="${o.pimg}"
					/>
				</td>
				<td>${o.pname}</td>
				<td>${o.price}</td>
				<td class="quantity" width="60"></td>
				<td width="140"><span class="subtotal">￥${o.total}
								</span></td>
			</tr>
			</c:forEach>



			<tr>
				<th colspan="5">
					<div class="pagination">
						<span>第1/3页 </span>



						<span class="currentPage">1
									</span>



						<a
								href="/shop/order_findByUid.action?page=2">2
						</a>




						<a
								href="/shop/order_findByUid.action?page=3">3
						</a>



						<a class="nextPage"
						   href="/shop/order_findByUid.action?page=2">&nbsp;</a>
						<a class="lastPage"
						   href="/shop/order_findByUid.action?page=3">&nbsp;</a>

					</div>
				</th>
			</tr>
			</tbody>
		</table>


	</div>

</div>
<div class="container footer">
	<div class="span24">
		<div class="footerAd">
			<img src="image\r___________renleipic_01/footer.jpg" alt="我们的优势"
				 title="我们的优势" height="52" width="950">
		</div>
	</div>
	<div class="span24">
		<ul class="bottomNav">
			<li><a href="#">关于我们</a> |</li>
			<li><a href="#">联系我们</a> |</li>
			<li><a href="#">诚聘英才</a> |</li>
			<li><a href="#">法律声明</a> |</li>
			<li><a>友情链接</a> |</li>
			<li><a target="_blank">支付方式</a> |</li>
			<li><a target="_blank">配送方式</a> |</li>
			<li><a>SHOP++官网</a> |</li>
			<li><a>SHOP++论坛</a></li>
		</ul>
	</div>
	<div class="span24">
		<div class="copyright">Copyright © 2005-2015 网上商城 版权所有</div>
	</div>
</div>
<script type="text/javascript">
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

	function updateOrder (oid) {
		$.ajax({
			url:"<%=request.getContextPath()%>/loginUser/updateOrderById",
			data:{oid:oid},
			success:function () {
				location.href="<%=request.getContextPath()%>/loginUser/madd"
            }
		})
    }

    function payment(oid) {
        location.href="<%=request.getContextPath()%>/alipay/toPayment?oid="+oid;
    }

    //进页面刷新一次   一次！！！
    $(document).ready(function () {

        if(location.href.indexOf("#reloaded")==-1){
            location.href=location.href+"#reloaded";
            location.reload();
        }
    })


</script>
</body>
</html>
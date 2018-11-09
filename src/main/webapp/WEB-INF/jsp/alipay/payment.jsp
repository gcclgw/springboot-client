<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

    <title>订单页面</title>
    <link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/css/cart.css" rel="stylesheet" type="text/css"/>
    <!-- 引入bootstrap的css -->
    <link  href="<%=request.getContextPath()%>/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" >
    <!-- 引入bootstrap-treeview的css -->
    <link  href="<%=request.getContextPath()%>/js/treeview/bootstrap-treeview.min.css" rel="stylesheet" >
    <!-- 引入bootstrap-addTabs的css -->
    <link  href="<%=request.getContextPath()%>/js/addTabs/addTabs.css" rel="stylesheet" >
    <!-- 引入bootstrap-table的css -->
    <link  href="<%=request.getContextPath()%>/js/table/bootstrap-table.min.css" rel="stylesheet" >
    <!-- 引入fileinput的css -->
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/js/fileinput/css/fileinput.min.css" />




    <!-- 引入jquery -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <!-- 引入bootstrap的js-->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/js/bootstrap.min.js"></script>
    <!-- 引入bootstrap的js-->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/treeview/bootstrap-treeview.min.js"></script>
    <!-- 引入bootstrap的js-->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/addTabs/addTabs.js"></script>
    <!-- 引入bootstrap-table的js-->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/table/bootstrap-table.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/table/locale/bootstrap-table-zh-CN.min.js"></script>
    <!-- 引入bootbox.js -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootbox/bootbox.js"></script>
    <!-- 引入fileinput的js -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/fileinput/js/fileinput.min.js"></script>
    <!--  引入fileinput的js -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/fileinput/js/locales/zh.js"></script>



</head>
<body>

<div class="container header">
    <div class="span5">
        <div class="logo">
            <a href="./网上商城/index.htm">
                <img src="#" alt="传智播客"/>
            </a>
        </div>
    </div>
    <div class="span9">
        <div class="headerAd">
            <img src="#" width="320" height="50" alt="正品保障" title="正品保障"/>
        </div>
    </div>


    <div class="span10 last">
        <div class="topNav clearfix">
            <ul>


                <li id="headerLogin" class="headerLogin" style="display: list-item;">
                    姜涛
                    |</li>
                <li id="headerLogin" class="headerLogin" style="display: list-item;">
                    <a href="/shop/order_findByUid.action?page=1">我的订单</a>
                    |</li>
                <li id="headerRegister" class="headerRegister"
                    style="display: list-item;"><a href="/shop/user_quit.action">退出</a>|
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
            <li><a href="/shop/index.action">首页</a> |</li>

            <li><a href="/shop/product_findByCid.action?cid=1&page=1">女装男装</a> |</li>

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

                <li  class="current"></li>
                <li  >付款页面</li>
            </ul>
        </div>


        <table>
            <tbody>
            <tr>
                <input type="hidden" id="oid" value="${orders.oid}">
                <th colspan="5">订单编号：${orders.oid}&nbsp;&nbsp;&nbsp;&nbsp;</th>
            </tr>
            <tr>
                <th>图片</th>
                <th>商品</th>
                <th>价格</th>
                <th>数量</th>
                <th>小计</th>
            </tr>
            <c:forEach items="${ordersList}" var="ordersList">
                <tr>
                    <td width="60">
                        <img src="${ordersList.image}"/>
                    </td>
                    <td>
                            ${ordersList.pname}
                    </td>
                    <td>
                            ${ordersList.shopprice}
                    </td>
                    <td class="quantity" width="60">
                            ${ordersList.count}
                    </td>
                    <td width="140">
                        <span class="subtotal">￥${ordersList.subtotal}</span>
                    </td>

                </tr>

            </c:forEach>


            </tbody>
        </table>
        <dl id="giftItems" class="hidden" style="display: none;">
        </dl>
        <div class="total">
            <em id="promotion"></em>
            <input type="hidden" value="${orders.total}" id="totals">
            商品总金额: <strong id="effectivePrice">￥${orders.total}</strong>
        </div>
            <input type="hidden" value="83" name="total">
            <div class="span24">
                <center>请确认订单信息或修改</center>
                    收&nbsp;&nbsp;货&nbsp;&nbsp;地&nbsp;址&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：<input id="addr1" type="text"  style="width:240px" value="${orders.addr}" />
                        <img src="<%=request.getContextPath()%>/image/zuobiao.jpg" width="26" height="20" border="0" onmouseover="testArr()"/>
                    <br/>
                    具体地址/门牌号：<input type="text" id="addr2"  style="width:240px">
                    <br />
                    收&nbsp;&nbsp;货&nbsp;&nbsp;人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：<input id="name" type="text" value="${orders.name}" style="width:150px" />
                    <br />
                    联&nbsp;&nbsp;系&nbsp;&nbsp;方&nbsp;&nbsp;式&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：<input id="phone" type="text"value="${orders.phone}" style="width:150px" />
                <hr />
                <p style="text-align:right">
                    <a href="javascript:SubmitOrders()">
                        <img src="<%=request.getContextPath()%>/images/finalbutton.gif" width="204" height="51" border="0" />
                    </a>
                </p>
            </div>
    </div>

</div>
<div class="container footer">
    <div class="span24">
        <div class="footerAd">
            <img src="#" alt="我们的优势" title="我们的优势" height="52" width="950">
        </div>
    </div>
    <div class="span24">
        <ul class="bottomNav">
            <li>
                <a href="#">关于我们</a>
                |
            </li>
            <li>
                <a href="#">联系我们</a>
                |
            </li>
            <li>
                <a href="#">诚聘英才</a>
                |
            </li>
            <li>
                <a href="#">法律声明</a>
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
                <a >SHOP++官网</a>
                |
            </li>
            <li>
                <a>SHOP++论坛</a>

            </li>
        </ul>
    </div>
    <div class="span24">
        <div class="copyright">Copyright © 2005-2015 网上商城 版权所有</div>
    </div>
</div>
<script>

    function SubmitOrders(){
        var oid=$("#oid").val();
        var total=$("#totals").val();
        var oid=$("#arr1").val();
        var oid=$("#arr2").val();
        var oid=$("#oid").val();
        location.href="<%=request.getContextPath()%>/alipay/goAlipay?oid="+oid+"&total="+total;
    }


    var res;
    function createAddContent(url){
        $.ajax({
            url:url,
            async:false,
            success:function(data){
                res = data;
            }
        });
        return res;
    }

    //地图窗口
    function testArr(){
        bootbox.dialog({
            message: createAddContent('<%=request.getContextPath()%>/alipay/toArea'),
            closeButton: true,
            keyboard:true,
        })

    }
</script>
</body>

</html>
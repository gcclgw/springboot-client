<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>订单页面</title>
    <link href="/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="/css/cart.css" rel="stylesheet" type="text/css"/>

    <!-- 引入jquery -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
</head>
<body>



<input type="hidden" value="${user.uid}" id="userId">
<input type="hidden" value="${user.username}" id="userName">
<div class="container header">
    <div class="span5">
        <div class="logo">
            <a href="http://localhost:8080/mango/">
                <img src="${logo[0].logimg}" width="50px" height="70px" alt="金科商城"/>
            </a>
        </div>
    </div>
    <div class="span9">
        <div class="headerAd">
            <img src="/image/header.jpg" width="320" height="50" alt="正品保障" title="正品保障">
        </div>	</div>


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




                <li><a href="<%=request.getContextPath()%>/comm/jfsc">积分商城</a> |</li>
                <li><a href="<%=request.getContextPath()%>/comm/shoppingguide">购物指南</a> |</li>
                <li><a>关于我们</a></li>
            </ul>
        </div>
        <div class="cart">
            <a href="/cart_myCart.action">购物车</a>
        </div>
        <div class="phone">
            客服热线: <strong>96008/53277764</strong>
        </div>
    </div>
    <div class="span24">
        <ul class="mainNav">
            <li><a href="">积分商城</a> |</li>

        </ul>
    </div>

</div>

<div class="container cart">

    <div class="span24">

        <div class="step step1">
            <ul>

                <li  class="current"></li>
                <li  >生成订单成功</li>
            </ul>
        </div>


        <table>
            <tbody>
            <tr>
                <th colspan="5">订单编号:${orders.oid}&nbsp;&nbsp;&nbsp;&nbsp;</th>
            </tr>
            <tr>
                <th>图片</th>
                <th>商品</th>
                <th>价格</th>
                <th>数量</th>
                <th>小计</th>
            </tr>

            <tr>
                <td width="60">
                    <img src="${selectPro.image}"/>
                </td>
                <td>
                        ${selectPro.pname}
                </td>
                <td>
                        ${selectPro.shop_price}
                </td>
                <td class="quantity" width="60">
                        ${selectPro.count}
                    <input type="hidden" id="countid" value="${selectPro.count}">
                </td>
                <td width="140">
                    <span class="subtotal">${selectPro.subtotal}</span>
                    <input type="hidden" id="subtotalid" value="${selectPro.subtotal}">
                </td>

            </tr>

            </tbody>
        </table>
        <dl id="giftItems" class="hidden" style="display: none;">
        </dl>
        <div class="total">
            <em id="promotion"></em>
             <strong id="effectivePrice"><span id="jfid"></span>积分</strong>
        </div>
        <form id="orderForm" action="<%=request.getContextPath()%>/comm/updateOrder" method="post">
            <input type="hidden" name="oid" value="${orders.oid}"/>
            <input type="hidden" name="userid" value="${user.uid}" id="used">
            <input type="hidden" id="ssss" name="ssss" />
            <div class="span24">
                <p>
                    收货地址：<input name="addr" type="text" value="${uu.addr}"  style="width:350px" />
                    <br />
                    收货人&nbsp;&nbsp;&nbsp;：<input name="name" value="${uu.name}" type="text"  style="width:150px" />
                    <br />
                    联系方式：<input name="phone" type="text" value="${uu.phone}" style="width:150px" />

                </p>
                <hr />
                <p style="text-align:right">
                    <a href="javascript:document.getElementById('orderForm').submit();">
                    <img src="/images/finalbutton.gif" width="204" height="51" border="0" />
                </a>
                </p>
            </div>
        </form>
    </div>

</div>
<div class="container footer">
    <div class="span24">
        <div class="footerAd">
            <img src="image\r___________renleipic_01/footer.jpg" alt="我们的优势" title="我们的优势" height="52" width="950">
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


         var count = $("#countid").val()
         var subtotal = $("#subtotalid").val()
         var cs = count*subtotal;
         $("#jfid").html(cs)
         var aa = $("#jfid").html()
         $("#ssss").val(parseInt(aa))





    function querydetails(pid) {
        location.href="<%=request.getContextPath()%>/comm/querydetails?pid="+pid;
    }


    function thePrimaryQuery(cid) {
        /*alert(cid)*/
        location.href="<%=request.getContextPath()%>/comm/thePrimaryQuery?cid="+cid;
    }


    function queryById(csid) {
        /*alert(cid)*/
        location.href="<%=request.getContextPath()%>/comm/thePrimaryQuery?csid="+csid;
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

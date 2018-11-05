

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <title>网上商城</title>
    <link href="/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="/css/product.css" rel="stylesheet" type="text/css"/>


    <!-- 引入jquery -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>

    <!-- 引入bootstrap的js-->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/js/bootstrap.min.js"></script>

    <!-- 引入bootstrap的js-->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/treeview/bootstrap-treeview.min.js"></script>

    <!-- 引入bootstrap的js-->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/addTabs/addTabs.js"></script>
</head>
<body>

<div class="container header">
    <div class="span5">
        <div class="logo">
            <a>
                <img src="/image/r___________renleipic_01/logo.gif" alt="传智播客">
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

                <li id="headerLogin" class="headerLogin" style="display: list-item;">
                    <a href="/user_loginPage.action">登录</a>|</li>
                <li id="headerRegister" class="headerRegister"
                    style="display: list-item;"><a href="/user_registPage.action">注册</a>|
                </li>



                <li><a>会员中心</a> |</li>
                <li><a>购物指南</a> |</li>
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
            <a href="<%=request.getContextPath()%>/user/toIndex">首页</a>
            <c:forEach items="${cate}" var="ccc">
                <li><a href="javascript:thePrimaryQuery(${ccc.cid})">${ccc.cname}</a> |</li>
            </c:forEach>

        </ul>
    </div>

</div><div class="container productContent">
    <div class="span6">
        <div class="hotProductCategory">
            <c:forEach items="${cate}" var="ca">
                <dl>

                    <dt>

                        <a href="<%=request.getContextPath()%>/categorysecond/queryProductByCid>" >${ca.cname}</a>
                    </dt>

                    <c:forEach items="${cs}" var="cs">
                        <input type="hidden" value="${ca.cid}"/>
                        <input type="hidden" value="${cs.cid}"/>


                        <c:if test="${ca.cid==cs.cid}">

                            <dd>
                                <a href="#">${cs.csname}</a>
                            </dd>

                        </c:if>

                    </c:forEach>

                </dl>

            </c:forEach>
        </div>


    </div>

    <div class="span18 last">
        <c:forEach items="${details}" var="det">
        <div class="productImage">
            <a title="" style="outline-style: none; text-decoration: none;" id="zoom" href="${det.image}" rel="gallery">
                <div class="zoomPad"><img style="opacity: 1;" title="" class="medium" src="${det.image}"><div style="display: block; top: 0px; left: 162px; width: 0px; height: 0px; position: absolute; border-width: 1px;" class="zoomPup"></div><div style="position: absolute; z-index: 5001; left: 312px; top: 0px; display: block;" class="zoomWindow"><div style="width: 368px;" class="zoomWrapper"><div style="width: 100%; position: absolute; display: none;" class="zoomWrapperTitle"></div><div style="width: 0%; height: 0px;" class="zoomWrapperImage"><img src="${det.image}" style="position: absolute; border: 0px none; display: block; left: -432px; top: 0px;"></div></div></div><div style="visibility: hidden; top: 129.5px; left: 106px; position: absolute;" class="zoomPreload">Loading zoom</div></div>
            </a>

        </div>

        <div class="name">${det.pname}</div>
        <div class="sn">
            <div>编号：${det.pid}</div>
        </div>
        <div class="info">
            <dl>
                <dt>商城价:</dt>
                <dd>
                    <strong>￥：${det.shop_price}元</strong>
                    参 考 价：
                    <del>￥${det.market_price}元</del>
                </dd>
            </dl>
            <dl>
                <dt>促销:</dt>
                <dd>
                    <a target="_blank" title="限时抢购 (2014-07-30 ~ 2015-01-01)">限时抢购</a>
                </dd>
            </dl>
            <dl>
                <dt>    </dt>
                <dd>
                    <span>    </span>
                </dd>
            </dl>
        </div>

        <form id="cartForm" action="/cart_addCart.action" method="post" >
            <input type="hidden" name="pid" value="73"/>
            <div class="action">
                <dl class="quantity">
                    <dt>购买数量:</dt>
                    <dd>
                        <input id="count" name="count" value="1" maxlength="4" onpaste="return false;" type="text"/>
                    </dd>
                    <dd>
                        件
                    </dd>
                </dl>

                <div class="buy">
                    <input id="addCart" class="addCart" value="加入购物车" type="button" onclick="saveCart()"/>
                </div>
            </div>
        </form>

        <div id="bar" class="bar">
            <ul>
                <li id="introductionTab">
                    <a href="javascript:sx()">商品介绍</a>
                </li>
                <li id="introductionidid">
                    <a href="javascript:querydetails(${det.pid})">商品属性</a>
                </li>
            </ul>
        </div>

        <div id="introduction" name="introduction" class="introduction">
            <div class="title">
                <strong>${det.pdesc}</strong>
            </div>
            <div>
                <img src="${det.image}">
            </div>
        </div>
        </c:forEach>

            <div id="introductionid" name="introductionid" class="introductionid" hidden>

            </div>


    </div>

</div>
<div class="container footer">
    <div class="span24">
        <div class="footerAd">
            <img src="/image/footer.jpg" width="950" height="52" alt="我们的优势" title="我们的优势">
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
    function saveCart(){
        document.getElementById("cartForm").submit();
    }


    function querydetails(pid) {
        $(".introduction").hide();
        $(".introductionid").show();
        $.ajax({
               url:"<%=request.getContextPath()%>/comm/queryaaa?pid="+pid,
               type:"post",
                dataType:"text",
                    success:function (data) {
                  // alert(data)
                        var str ="";
                   var da = eval(data);
                   alert(da)
                        for (var i = 0; i < da.length; i++){
                            str+= da[i].cname+":"+da[i].cvalue+"<br>";
                        }
                        $("#introductionid").replaceWith(str)
            }
        })
    }

    function sx() {
        location.href=location
    }














</script>




</body>
</html>
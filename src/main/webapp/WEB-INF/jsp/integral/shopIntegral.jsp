<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<!-- 引入jquery -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<head>

    <title>积分商城</title>
    <link href="/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="/css/product.css" rel="stylesheet" type="text/css"/>
    <style>
        .main{width:1000px;min-height:390px;margin:10px auto;}
        .scroll{ float:left; width:50px; height:50px; }
    </style>
</head>
<body>
<input type="hidden" value="${user.uid}" id="userId">
<input type="hidden" value="${user.username}" id="userName">
<input type="hidden" value="${user.integral}" id="userintegral">
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
  <br><br><br><br>
    <div class="span24">
        <ul class="mainNav">
            <li><center><a>积分商城</a></center></li>
            <li><center><a><span id="userSpanuserSpan"></span></a></center></li>
        </ul>
    </div>

</div>

<br><br>
<div class="main">
    <c:forEach items="${queryIntegral}" var="al">
        <div class="scroll" style="height: 200px; width: 200px;" >
            <center>
                <a href="javascript:querys(${al.pid})" ><img src="${al.image}" alt="" width="160px" height="150px"></a>
                <br><span style='color:green'>
                        ${al.pname}
                </span> <br>

                <span class="price">
                    积分:${al.shop_price}
                </span>
            </center>
        </div>
    </c:forEach>
</div>





<div class="container footer">
    <div class="span24">
        <div class="footerAd">
            <img src="/image/footer.jpg" width="950" height="52" alt="我们的优势" title="我们的优势">
        </div>	</div>
    <div class="span24">
        <ul class="bottomNav">
            <li>
                <a >关于我们</a>
                |
            </li>
            <li>
                <a>联系我们</a>
                |
            </li>
            <li>
                <a >诚聘英才</a>
                |
            </li>
            <li>
                <a >法律声明</a>
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
                <a  target="_blank">配送方式</a>
                |
            </li>
            <li>
                <a >官网</a>
                |
            </li>
            <li>
                <a >论坛</a>

            </li>
        </ul>
    </div>
    <div class="span24">
        <div class="copyright">Copyright©2005-2015 网上商城 版权所有</div>
    </div>
</div>


<script>

    function querys(pid) {
        location.href="<%=request.getContextPath()%>/comm/queryintegraldetails?pid="+pid;
    }

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
        var userintegral = $("#userintegral").val();
        var aa= "我的积分:"+userintegral;
        $("#userSpanuserSpan").html(aa)
        if (uid!='' && uid!=null) {
            $("#usernameSpan").html(username);
            $("#mydd").html("<a href='<%=request.getContextPath()%>/loginUser/madd'>我的订单</a>");
            $("#exit").html("<a href='<%=request.getContextPath()%>/loginUser/exitUser'>退出</a>");

        }
    })



</script>


</body>
</html>

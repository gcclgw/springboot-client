<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<!-- 引入jquery -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<head>
        <style>
            .redpack {
                height: 450px;
                background: #A5423A;
                width: 300px;
                left: 0;
                top: 0;
                border-radius: 10px;
                margin: 0 auto;
            }
            .topcontent {
                height: 300px;
                border: 1px solid #BD503A;
                background-color: #BD503A;
                border-radius: 10px 10px 50% 50% / 10px 10px 15% 15%;
                box-shadow: 0px 4px 0px -1px rgba(0,0,0,0.2);
            }
            #redpack-open {
                width: 120px;
                height: 120px;
                border: 1px solid #FFA73A;
                background-color: #FFA73A;
                border-radius: 50%;
                color: #fff;
                font-size: 20px;
                display: inline-block;
                margin-top: -50px;
                box-shadow: 0px 4px 0px 0px rgba(0, 0, 0, 0.2);
            }


        </style>
    <title>传智网上商城</title>
    <link href="/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="/css/product.css" rel="stylesheet" type="text/css"/>
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
            <li><a href="<%=request.getContextPath()%>/user/toIndex">首页</a> |</li>
            <%--<c:forEach items="${cate}" var="ca">
                <li><a href="<%=request.getContextPath()%>/categorysecond/toClothing">${ca.cname}</a> |</li>
            </c:forEach>--%>
            <c:forEach items="${cate}" var="ccc">
                <li><a href="javascript:thePrimaryQuery(${ccc.cid})">${ccc.cname}</a> |</li>
            </c:forEach>
        </ul>
    </div>


         <br>
        <center>
            <font color="#b8860b"><h1>免费注册</h1></font>
        </center><br>

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="<%=request.getContextPath()%>/reg/toregPage">免费注册方式：</a><br>
        <center>
            <img src="/img/2348.png" alt="">
        </center>



        <center>
            <font color="#b8860b"><h1>购物流程</h1></font>
        </center><br><br>

        <center>
            <img src="/img/1820.png" alt="">
        </center>



        <center>
            <font color="#b8860b"><h1>电子发票</h1></font>
        </center><br><br>



                尊敬的顾客：<br>
                根据国家税务总局2015年第84号文“国家税务总局关于推行通过增值税电子发票系统开具的增值税电子普通发票有关问题”的公告，为响应号召，我司定于2016年03月01日起开始正式启用电子发票。
                <br>
                纸质发票变更为电子发票后，将会给您的生活带来更多的便利，从此不再有担心发票丢失、不能长久保存等问题的出现，这一举措绿色环保，为国家节能减排起到促进作用。
                <br>
                央广购物所开具的电子发票均为真实有效的合法发票，与纸质发票在财务会计、消费者权益保护等方面具有同等效力。
                <br><br>
                手机短信查询/下载：<br>
                订单出库时，央广购物会通过短信平台发送一条链接短信到您的手机上，通过这个链接您可以自行下载电子发票。电子发票包括“代码、号码、校验码”三组共40位的数字，您可以在本网站或国税局网站通过发票代码、发票号码、防伪码进行真伪验证。
                <br><br><br><br><br>

                网站查询/下载：<br>
                您也可以在央广购物网站上用订购时手机号注册（已注册用户可直接登录），2016年3月1日起，您所有订单的电子发票会在网站账户中同步更新，您可以查询任意的订单电子发票和代码、号码、校验码，同时进行发票下载；或是通过订购时的手机号在北京市国税局电子发票平台（http://www.e-inv.cn/）上注册（已注册用户可直接登录），获取订单电子发票和代码、号码、校验码，同时进行发票下载。
                <br>
                如果您对电子发票的使用还有任何疑问的话，欢迎致电4008-518-518！我们的客服人员会对你做一对一的解答！
                <br>
                感谢您的支持与配合，祝您购物愉快！
                <br><br><br><br><br><br><br><br>



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

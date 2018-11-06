<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<!-- 引入jquery -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<head>
    <%--分页样式--%>
    <style>
        *{padding:0;margin:0}
        ul,li{list-style:none}
        .left{float:left}
        .right{float:left}
        .page_container{height: 30px; line-height: 30px;width: 510px;overflow: hidden;text-align: center;padding: 30px 0;color: #757575;}
        .page_num_container{width: 301px;margin:0 10px;border:1px solid #ccc; border-right:0;box-sizing: border-box;overflow: hidden;position: relative;height: 32px;}
        .page_num_container ul{position: absolute;top: 0;}
        .page_num_container ul li{float: left;width: 30px;border-right:1px solid #ccc ;box-sizing: border-box;text-align: center;cursor: pointer;}
        .page_num_container ul li:hover,.page_num_container ul li.active{ background: #f4a100;color: #fff;}
        .page_btn{width: 60px;border:1px solid #ccc;box-sizing: border-box;cursor: pointer;}
        .page_btn:hover{ background: #f4a100;color: #fff;}
        .all_page:hover{background:none;color: #757575;}
        .prev_btn{margin-right: 10px;}
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

</div>
<div class="container productList">
    <div class="span6">
        <div class="hotProductCategory">

            <c:forEach items="${cate}" var="ca">
                <dl>

                    <dt>

                        <a href="javascript:thePrimaryQuery(${ca.cid})">${ca.cname}</a>
                    </dt>

                    <c:forEach items="${cs}" var="cs">
                        <input type="hidden" value="${ca.cid}"/>
                        <input type="hidden" value="${cs.cid}"/>

                        <c:if test="${ca.cid==cs.cid}">

                            <dd>
                                <a href="javascript:queryById(${cs.csid})">${cs.csname}</a>
                            </dd>

                        </c:if>

                    </c:forEach>

                </dl>

            </c:forEach>

        </div>
    </div>
    <div class="span18 last">

        <form id="productForm" action="/image/蔬菜 - Powered By Mango Team.htm" method="get">

            <div id="result" class="result table clearfix">
                <ul>
                    <c:forEach items="${thePrimaryList}" var="the">
                        <li>
                            <a href="javascript:querydetails(${the.pid})">
                                <img src="${the.image}" width="170" height="170"  style="display: inline-block;">

                                <span style='color:green'>
                                        ${the.pname}
                                </span>

                                <span class="price">
												商城价:${the.shop_price}
											</span>

                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <%-- 得到当前页--%>
            <span id="dqPage" hidden="hidden" class="disabled1 current">${page}</span>
            <%-- js控制的页码显示在这个div中--%>
            <div id="pageBtn" style="width: auto;display:inline-block !important;height: auto;">
            </div>
        </form>
    </div>
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



    //页码显示
    $(function(){

        var dqPage = $("#dqPage").text();//得到当前页数
        dqPage = parseInt(dqPage);//得到的文本转成int
        var pageCount = $("#pageCount").text();//得到总页数
        pageCount = parseInt(pageCount);
        var i = 1;
        i = parseInt(i);
        var item="";
        var href = "这里是请求地址";
        if (pageCount <= 5 ) {//总页数小于五页，则加载所有页

            for (i; i <= pageCount; i++) {
                if (i == dqPage) {
                    item += "<span class='disabled'>"+i+"</span>";
                }else{
                    item += "<a href='"+href+i+"' >"+i+"</a>";
                }
            };
            $('#pageBtn').append(item);
            return;
        }else if (pageCount > 5) {//总页数大于五页，则加载五页
            if (dqPage < 5) {//当前页小于5，加载1-5页
                for (i; i <= 5; i++) {
                    if (i == dqPage) {
                        item += "<span class='disabled'>"+i+"</span>";
                    }else{
                        item += "<a href='"+href+i+"' >"+i+"</a>";
                    }
                };
                if (dqPage <= pageCount-2) {//最后一页追加“...”代表省略的页
                    item += "<span> . . . </span>";
                }
                $('#pageBtn').append(item);
                return;
            }else if (dqPage >= 5) {//当前页大于5页
                for (i; i <= 2; i++) {//1,2页码始终显示
                    item += "<a href='"+href+i+"' >"+i+"</a>";
                }
                item += "<span> . . . </span>";//2页码后面用...代替部分未显示的页码
                if (dqPage+1 == pageCount) {//当前页+1等于总页码
                    for(i = dqPage-1; i <= pageCount; i++){//“...”后面跟三个页码当前页居中显示
                        if (i == dqPage) {
                            item += "<span class='disabled'>"+i+"</span>";
                        }else{
                            item += "<a href='"+href+i+"' >"+i+"</a>";
                        }
                    }
                }else if (dqPage == pageCount) {//当前页数等于总页数则是最后一页页码显示在最后
                    for(i = dqPage-2; i <= pageCount; i++){//...后面跟三个页码当前页居中显示
                        if (i == dqPage) {
                            item += "<span class='disabled'>"+i+"</span>";
                        }else{
                            item += "<a href='"+href+i+"' >"+i+"</a>";
                        }
                    }
                }else{//当前页小于总页数，则最后一页后面跟...
                    for(i = dqPage-1; i <= dqPage+1; i++){//dqPage+1页后面...
                        if (i == dqPage) {
                            item += "<span class='disabled'>"+i+"</span>";
                        }else{
                            item += "<a href='"+href+i+"' >"+i+"</a>";
                        }
                    }
                    item += "<span> . . . </span>";
                }
                $('#pageBtn').append(item);
                return;
            }
        }


    });


</script>


</body>
</html>

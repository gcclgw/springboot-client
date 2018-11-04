<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>传智网上商城</title>
    <link href="/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="/css/product.css" rel="stylesheet" type="text/css"/>
</head>
<body>
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
            <li><a href="<%=request.getContextPath()%>/user/toIndex">首页</a> |</li>
            <c:forEach items="${cate}" var="ca">
                <li><a href="<%=request.getContextPath()%>/categorysecond/toClothing">${ca.cname}</a> |</li>
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

        <form id="productForm" action="/image/蔬菜 - Powered By Mango Team.htm" method="get">

            <div id="result" class="result table clearfix">
                <ul>

                    <li>
                        <a href="/product_findByPid.action?pid=1">
                            <img src="/products/1/cs10001.jpg" width="170" height="170"  style="display: inline-block;">

                            <span style='color:green'>
											 韩版连帽加厚毛衣女外套
											</span>

                            <span class="price">
												商城价： ￥228.0
											</span>

                        </a>
                    </li>

                    <li>
                        <a href="/product_findByPid.action?pid=2">
                            <img src="/products/1/cs10002.jpg" width="170" height="170"  style="display: inline-block;">

                            <span style='color:green'>
											 女装立领长袖拼接PU皮毛呢外套
											</span>

                            <span class="price">
												商城价： ￥172.0
											</span>

                        </a>
                    </li>

                    <li>
                        <a href="/product_findByPid.action?pid=3">
                            <img src="/products/1/cs10003.jpg" width="170" height="170"  style="display: inline-block;">

                            <span style='color:green'>
											 韩版女装翻领羔绒夹棉格子毛呢外套
											</span>

                            <span class="price">
												商城价： ￥119.0
											</span>

                        </a>
                    </li>

                    <li>
                        <a href="/product_findByPid.action?pid=4">
                            <img src="/products/1/cs10004.jpg" width="170" height="170"  style="display: inline-block;">

                            <span style='color:green'>
											 韩版女装翻领羔绒夹棉格子毛呢外套
											</span>

                            <span class="price">
												商城价： ￥119.0
											</span>

                        </a>
                    </li>

                    <li>
                        <a href="/product_findByPid.action?pid=5">
                            <img src="/products/1/cs10005.jpg" width="170" height="170"  style="display: inline-block;">

                            <span style='color:green'>
											 韩版女装翻领羔绒夹棉格子毛呢外套
											</span>

                            <span class="price">
												商城价： ￥119.0
											</span>

                        </a>
                    </li>

                    <li>
                        <a href="/product_findByPid.action?pid=6">
                            <img src="/products/1/cs10006.jpg" width="170" height="170"  style="display: inline-block;">

                            <span style='color:green'>
											 冬装韩版女装翻领羔绒夹棉格子毛呢外套
											</span>

                            <span class="price">
												商城价： ￥119.0
											</span>

                        </a>
                    </li>

                    <li>
                        <a href="/product_findByPid.action?pid=7">
                            <img src="/products/1/cs10007.jpg" width="170" height="170"  style="display: inline-block;">

                            <span style='color:green'>
											 新款优雅奢华毛领白鸭绒轻薄羽绒服
											</span>

                            <span class="price">
												商城价： ￥590.0
											</span>

                        </a>
                    </li>

                    <li>
                        <a href="/product_findByPid.action?pid=8">
                            <img src="/products/1/cs10008.jpg" width="170" height="170"  style="display: inline-block;">

                            <span style='color:green'>
											 秋冬季毛呢外套女中长款圆领小香风呢子大衣
											</span>

                            <span class="price">
												商城价： ￥336.0
											</span>

                        </a>
                    </li>


                </ul>
            </div>
            <div class="pagination">
                <span>第 1/9 页</span>






                <span class="currentPage">1</span>



                <a href="/product_findByCid.action?cid=1&page=2">2</a>




                <a href="/product_findByCid.action?cid=1&page=3">3</a>




                <a href="/product_findByCid.action?cid=1&page=4">4</a>




                <a href="/product_findByCid.action?cid=1&page=5">5</a>




                <a href="/product_findByCid.action?cid=1&page=6">6</a>




                <a href="/product_findByCid.action?cid=1&page=7">7</a>




                <a href="/product_findByCid.action?cid=1&page=8">8</a>




                <a href="/product_findByCid.action?cid=1&page=9">9</a>





                <a class="nextPage" href="/product_findByCid.action?cid=1&page=2">&nbsp;</a>
                <a class="lastPage" href="/product_findByCid.action?cid=1&page=9">&nbsp;</a>



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

</body>
</html>

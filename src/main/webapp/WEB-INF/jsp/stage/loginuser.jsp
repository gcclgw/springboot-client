<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>会员登录</title>

	<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css"/>
	<link href="<%=request.getContextPath()%>/css/login.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>


</head>
<body>

<div class="container header">
	<div class="span5">
		<div class="logo">
			<a href="http://localhost:8080/mango/">
				<img src="<%=request.getContextPath()%>/image/r___________renleipic_01/logo.gif" alt="传智播客">
			</a>
		</div>
	</div>
	<div class="span9">
		<div class="headerAd">
			<img src="<%=request.getContextPath()%>/image/header.jpg" width="320" height="50" alt="正品保障" title="正品保障">
		</div>	</div>


	<div class="span10 last">
		<div class="topNav clearfix">
			<ul>

				<li id="headerLogin" class="headerLogin" style="display: list-item;">
					<a href="<%=request.getContextPath()%>/loginUser/toLoginUser">登录</a>|</li>
				<li id="headerRegister" class="headerRegister"
					style="display: list-item;"><a href="<%=request.getContextPath()%>/reg/toregPage">注册</a>|
				</li>



				<li><a>会员中心</a> |</li>
				<li><a href="<%=request.getContextPath()%>/comm/shoppingguide">购物指南</a> |</li>
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
			<li><a href="<%=request.getContextPath()%>/user/toIndex">首页</a> |</li>


		</ul>
	</div>

</div>	<div class="container login">
	<div class="span12">
		<div class="ad">
			<img src="<%=request.getContextPath()%>/image/login.jpg" width="500" height="330" alt="会员登录" title="会员登录">
		</div>		</div>
	<div class="span12 last">
		<div class="wrap">
			<div class="main">
				<div class="title">
					<strong>会员登录</strong>USER LOGIN

				</div>
				<div></div>
				<form id="loginForm"  novalidate="novalidate">
					<table>
						<tbody><tr>
							<th>
								用户名:
							</th>
							<td>
								<input type="text" id="username" name="username" class="text" maxlength="20">

							</td>
						</tr>
						<tr>
							<th>
								密&nbsp;&nbsp;码:
							</th>
							<td>
								<input type="password" id="password" name="password" class="text" maxlength="20" autocomplete="off">
							</td>
						</tr>


						<tr>
							<th>&nbsp;

							</th>
							<td>
								<input type="button" class="submit" onclick="loginUser()" value="登 录">
							</td>
						</tr>
						<tr class="register">
							<th>&nbsp;

							</th>
							<td>
								<dl>
									<dt>还没有注册账号？</dt>
									<dd>
										立即注册即可体验在线购物！
										<a href="/shop/user_registPage.action">立即注册</a>
									</dd>
								</dl>
							</td>
						</tr>
						</tbody></table>
				</form>
			</div>
		</div>
	</div>
</div>
<div class="container footer">
	<div class="span24">
		<div class="footerAd"><img src="<%=request.getContextPath()%>/image/footer.jpg" width="950" height="52" alt="我们的优势" title="我们的优势" /></div>
	</div>
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
				<a  target="_blank">配送方式</a>
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

<script type="text/javascript">
function loginUser () {
	$.ajax({
		url:"<%=request.getContextPath()%>/loginUser/login",
		data:$("#loginForm").serialize(),
		success:function (data) {
            if (0 == data) {
                alert("用户名错误");
            } else if (1 == data) {
                alert("密码错误！")

            } else if (2 == data) {

                location.href = "<%=request.getContextPath()%>/user/toZp";

            }
        }
	})
}


</script>


</body>
</html>
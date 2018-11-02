<#assign base=request.contextPath />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${base}/static/layui/css/layui.css">
<link rel="stylesheet" href="${base}/static/layui/css/modules/layer/default/layer.css">
</head>
<body>

<h3>用户登陆页面</h3>
账号：<input id="account"><br>
密码：<input id="pwd" type="password"><br>
验证码：<input id="imgCode">
<span onclick="change_imgcode()">
	<img id="imgcode_node" src="${base}/imgcode">
	<font color="red">看不清，点击换一张</font>
</span>
<br>
<input type="button" value="登录" onclick="fun_zhuce()">




<script type="text/javascript" src="${base}/static/jquery.min.js"></script>
<script src="${base}/static/layui/layui.all.js"></script>
<script>

	//切换验证码
	function change_imgcode() {
		$("#imgcode_node").attr("src", "${base}/imgcode?t=" + new Date().getTime());
	}
	
	
	
	
	//
	function fun_zhuce() {
		//判断账号非空
		var account = $("#account").val();
		if (null == account || "" == account) {
			alert("请输入有效账号");
			return;
		}
		//判断密码非空
		var pwd = $("#pwd").val();
		if (null == pwd || "" == pwd) {
			alert("请输入有效密码");
			return;
		}
		//判断验证码非空
		var imgCode = $("#imgCode").val();
		if (null == imgCode || "" == imgCode) {
			alert("请输入有效验证码");
			return;
		}
		$.ajax({
			url:"${base}/user/login",
			dataType:"json",
			data:{account:account,pwd:pwd,imgCode:imgCode},
			type:"post",
			success:function(data) {
				if (1 == data.flag) {
					location.href = "${base}/";
				} else if (2 == data.flag) {
					alert("验证码错误")
				} else if (3 == data.flag) {
					alert("用户名错误")
				} else if (4 == data.flag) {
					alert("密码错误")
				}
			}
		});
	
	}
    
</script>

</body>
</html>
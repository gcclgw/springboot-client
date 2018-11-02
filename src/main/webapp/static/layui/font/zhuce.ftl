<#assign base=request.contextPath />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${base}/static/layui/css/layui.css">
<link rel="stylesheet" href="${base}/static/layui/css/modules/layer/default/layer.css">
</head>
<body>

<h3>用户注册页面</h3>
账号：<input id="account"><br>
密码：<input id="pwd" type="password"><br>
<input type="button" value="注册" onclick="fun_zhuce()">




<script type="text/javascript" src="${base}/static/jquery.min.js"></script>
<script src="${base}/static/layui/layui.all.js"></script>
<script>
	
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
		$.ajax({
			url:"${base}/user/insertUser",
			dataType:"json",
			data:{account:account,pwd:pwd},
			type:"post",
			success:function(data) {
				if (0 == data.flag) {
					alert("用户已存在");
				} else if (1 == data.flag) {
					location.href = "${base}/toLogin";
				}
			}
		});
	
	}
    
</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 引入easyui核心样式 -->
<link rel="stylesheet" type="text/css" href="../static/easyui/themes/default/easyui.css">
<!-- 引入easyui图标样式 -->
<link rel="stylesheet" type="text/css" href="../static/easyui/themes/icon.css">
<!-- 引入layui样式 -->  
<link rel="stylesheet" href="../static/layui/css/layui.css">
<link rel="stylesheet" href="../static/layui/css/modules/layer/default/layer.css">
<script src="../static/easyui/jquery.min.js"></script>
<script src="../static/easyui/jquery.easyui.min.js"></script>
<script src="../static/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="../static/easyui/util-js.js"></script>
<script src="../static/layui/layui.all.js"></script>
</head>
<body>
 <input type="hidden" value="${rid}" id="rid">
<ul id="powerTree" class="easyui-tree" data-options="cascadeCheck:false,animate:false,lines:true" ></ul>
<script type="text/javascript" >


	 var treeObj = {
			url:"role/findPower.do",
			checkbox:true,
			idField:"id",
			parentField:"pid", 
			onLoadSuccess:function (node,data){
				var powerArray=eval('${powerList}'); 	
				for ( var i=0 ; i<powerArray.length ;i++){
					var n = $("#powerTree").tree('find',powerArray[i].powerId)
					$("#powerTree").tree('check',n.target);
					
				}
	 },
			
			onCheck:function(node){ //当点击checkbox 时触发
				var	node1 = $("#powerTree").tree('getParent',node.target); //得到父节点
				if(node1 !=null && node.checked == false){
				$("#powerTree").tree('check',node1.target); //选中父节点
				}
				
			},
			}

			
$("#powerTree").tree(treeObj);

</script>
</body>
</html>
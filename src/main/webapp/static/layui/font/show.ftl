<#assign base=request.contextPath />
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${base}/static/layui/css/layui.css">
<link rel="stylesheet" href="${base}/static/layui/css/modules/layer/default/layer.css">
</head>
<body>


姓名<input id="sname"><br>
性别	<input type="radio" name="ssex" value="1">男
			<input type="radio" name="ssex" value="2">女<br>
入学日期：<input id="sdateBegin">~<input id="sdateEnd"><br>
班级名称:<select id="cl">
			<option value="0">===请选择===</option>
		<#list list as a>
			<option value="${a.claid}">${a.claname}</option>
		</#list>
	</select><br>

爱好：<input type="checkbox" name="stuhobby" value="1">吃饭
<input type="checkbox" name="stuhobby" value="2">睡觉
<input type="checkbox" name="stuhobby" value="3">打豆豆<br>
<input type="button" value="搜索" onclick="serach_stu(1)">
<input type="button" value="批量删除" onclick="batch_delete()">
<br><br><br>
<div id="data_div">
<#include "list.ftl">
</div>

<script type="text/javascript" src="${base}/static/jquery.min.js"></script>
<script src="${base}/static/layui/layui.all.js"></script>
<script>
	function turn_page(page) {
		//location.href = "${base}/stu/queryStu?page=" + page;
		serach_stu(page);
	}
	
	//反选
	function reverse_check() {
		$("[name='stu_checkbox']").each(function(V, I) {
			$(this).prop("checked", !$(this).prop("checked"));
		});
	}
	
	//批量删除
	function batch_delete() {
		var stuIDS = "";
		$("[name='stu_checkbox']:checked").each(function(V, I) {
			stuIDS = stuIDS + "," + $(this).val();
		});
		if (0 < stuIDS.length) {
			stuIDS = stuIDS.substr(1);
		}
		if (0 == stuIDS) {
			alert("请至少选择一项！");
		} else {
			if (confirm("你确定删除吗？")) {
				$.ajax({
					url:"${base}/stu/del",
					data:{stuIDS:stuIDS},
					type:"post",
					success:function(data) {
						serach_stu(1);
					}
				});
			}
		}
	}
	
	
	function serach_stu(page) {
		var sname = $("#sname").val();
		var ssex = 0;
		$("[name='ssex']:checked").each(function(V, I) {
			ssex = $(this).val();
		});
		var stuhobby = "";
		$("[name='stuhobby']:checked").each(function(V, I) {
			stuhobby = stuhobby + "," + $(this).val();
		});
		if (0 < stuhobby.length) {
			stuhobby = stuhobby.substr(1);
		}
		var sdateBegin = $("#sdateBegin").val();
		var sdateEnd = $("#sdateEnd").val();
		var cl=$("#cl").val();
		var json = {
			page:page,
			sname:sname,
			ssex:ssex,
			sdateBegin:sdateBegin,
			sdateEnd:sdateEnd,
			bjjid:cl,
			stuhobby:stuhobby,
		}
		$.ajax({
			url:"${base}/stu/toShow",
			data:json,
			type:"post",
			success:function(data) {
				$("#data_div").html(data);
			}
		});
	}
	
	layui.use(['form', 'upload', 'layedit', 'laydate'], function(){
            var form = layui.form;
            var upload = layui.upload;
            var edit = layui.layedit;
            var laydate = layui.laydate;
            
            //初始化日期控件
            laydate.render({
            	elem:"#sdateBegin"
            });
            laydate.render({
            	elem:"#sdateEnd"
            });
            
    });
    
    function updateXx(sid){
			$.ajax({
				url:"${base}/stu/updateXx",
				data:{sid:sid},
				dataType:"json",
				type:"post",
				success:function(data){
					serach_stu(1);
				}
			});
		}
		function updateFu(sid){
			$.ajax({
				url:"${base}/stu/updateFu",
				data:{sid:sid},
				dataType:"json",
				type:"post",
				success:function(data){
					serach_stu(1);
				}
			});
		}
		function updateBy(sid){
			$.ajax({
				url:"${base}/stu/updateBy",
				data:{sid:sid},
				dataType:"json",
				type:"post",
				success:function(data){
					serach_stu(1);
				}
			});
		}
    
    
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<title>Insert title here</title>
<link rel="stylesheet" href="../js/bootstrap3/css/bootstrap.css" />
<link rel="stylesheet" href="../js/bootstrap3/css/bootstrap-theme.css" />
<link rel="stylesheet" href="../js/bootstrap-table/bootstrap-table.css"/>
<link rel="stylesheet" href="../js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css"/>

<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap3/js/bootstrap.js"></script>
<script src="../js/bootstrap-table/bootstrap-table.js"></script>
<script src="../js/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
<script src="../js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"/></script>
<script src="../js/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"/></script>
</head>

<body>
	<div class="container-fluid">
		<div class="col-md-12">
			<table  class="table" id="myTable" ></table>
		</div>
	</div>
<script type="text/javascript">
	
	$(function(){
		initTable();
	}) 
	
	function initTable(){
		$('#myTable').bootstrapTable({
			toolbar:'#toolbar',
			url:'/user/selectUserList',//获取数据地址
			pagination:true, //是否展示分页
			pageList:[5, 10, 20, 50],//分页组件
			pageNumber:1,
			pageSize:5,//默认每页条数
			//search:true,//是否显示搜索框
			//searchText:'试试',//初始化搜索文字
			showColumns:false,//是否显示 内容列下拉框
			showToggle:false,//是否显示 切换试图（table/card）按钮
			showPaginationSwitch:false,//是否显示 数据条数选择框
			showRefresh:false,//是否显示刷新按钮
			detailView:false,//设置为 true 可以显示详细页面模式。
			showFooter:false,//是否显示列脚
			clickToSelect: true, //是否启用点击选中行
			sidePagination:'server',//分页方式：client客户端分页，server服务端分页（*
			striped:true,
			/*queryParams:function(){
				var searchGoodsName = $('#searchGoodsName').val();
				return {
					page: this.pageNumber,
					rows: this.pageSize,
					'goodsBean.name':searchGoodsName,
					};
			},*/
			columns:[
			        /*{checkbox:true},*/
					{field:'uid',title:'ID',align:'center',width:150},
					{field:'username',title:'名称',align:'center',width:150},
					{field:'crud',title:'用户赋角色',width:100,
						formatter: function (value,row,index){
							return "<a href='javascript:findUserRole("+row.userId+")'>用户赋角色</a>";
						}
					}
		          ]
		});
	}

</script>
</body>
</html>
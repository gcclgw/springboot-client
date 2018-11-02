<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

    <!-- 引入bootstrap的css -->
    <link  href="<%=request.getContextPath()%>/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" >
    <!-- 引入bootstrap-treeview的css -->
    <link  href="<%=request.getContextPath()%>/js/treeview/bootstrap-treeview.min.css" rel="stylesheet" >
    <!-- 引入bootstrap-addTabs的css -->
    <link  href="<%=request.getContextPath()%>/js/addTabs/addTabs.css" rel="stylesheet" >
    <!-- 引入bootstrap-table的css -->
    <link  href="<%=request.getContextPath()%>/js/table/bootstrap-table.min.css" rel="stylesheet" >
    <!-- 引入fileinput的css -->
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/js/fileinput/css/fileinput.min.css" />




    <!-- 引入jquery -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <!-- 引入my97 -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/my97/WdatePicker.js"></script>
    <!-- 引入bootstrap的js-->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/js/bootstrap.min.js"></script>
    <!-- 引入bootstrap的js-->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/treeview/bootstrap-treeview.min.js"></script>
    <!-- 引入bootstrap的js-->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/addTabs/addTabs.js"></script>
    <!-- 引入bootstrap-table的js-->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/table/bootstrap-table.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/table/locale/bootstrap-table-zh-CN.min.js"></script>
    <!-- 引入bootbox.js -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootbox/bootbox.js"></script>
    <!-- 引入fileinput的js -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/fileinput/js/fileinput.min.js"></script>
    <!--  引入fileinput的js -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/fileinput/js/locales/zh.js"></script>


    <script type="text/javascript" src="<%=request.getContextPath()%>/js/fileinput/themes/fa/theme.js"></script>

</head>
<body>
<!--  条件查询的 form  表单  -->
<!-- 表单 -->
<table id="findLog"></table>


<script type="text/javascript">
function search(){
	$("#findLog").bootstrapTable('refresh',
			{query: {
	 			"minDate":$("#minTime").val(),
	 			"maxDate":$("#maxTime").val(),
	 			//"product.proType":$("#proType").val(),
			}}
	);
	
}




$().ready(function(){
	$("#findLog").bootstrapTable({
		 url:"<%=request.getContextPath()%>/mongo/findLog",
        method:"post",
        striped: true,  	// 斑马线效果     默认false
        //只允许选中一行
        singleSelect:true,
        //选中行是不选中复选框或者单选按钮
        clickToSelect:true,
        showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
        cardView: false,                    //是否显示详细视图
        uniqueId: "logInfoId",                 //每一行的唯一标识，一般为主键列
        showColumns: true,                  //是否显示所有的列
        showRefresh: true,                  //是否显示刷新按钮
        minimumCountColumns: 2,     //  最少留两列
        detailView: false,                  //是否显示父子表
        //发送到服务器的数据编码类型
        contentType:'application/x-www-form-urlencoded;charset=UTF-8',   //数据编码纯文本  offset=0&limit=5
        toolbar:'#tabToolBar',   //  工具定义位置
        //前台--排序字段
        //sortName:'proPrice',
        //sortOrder:'desc',
         //前台--搜索框
         search:true,
        //启动回车键做搜索功能
        searchOnEnterKey:true,
        //分页方式   后台请求的分页方式
        //sidePagination:'server',
        pagination: true,                   //是否显示分页（*）
        pageNum: 1,                       //每页的记录行数（*）
        pageSize: 6,                       //每页的记录行数（*）
        pageList: [6,9,12],        //可供选择的每页的行数（*）
        //得到查询的参数
        /*queryParams : function (params) {
            //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            var temp = {
                rows: params.limit,                         //页面大小
                page: (params.offset / params.limit) + 1,   //页码
                sort: params.sort,      //排序列名
                sortOrder: params.order //排位命令（desc，asc）
            };
            return temp;
        },*/
		columns:[
		     	{field:'userId',title:'日志编号',width:50,
					/*formatter:function(value,row,index){   //  格式化  当前单元格内容
						return "<input type='checkbox' value="+value+" name='chk'/>";
					}*/
				},
				{field:'className',title:'类名',width:100},
				{field:'methodName',title:'方法名',width:100,sortable:true},
                {field:'param',title:'参数属性',width:100},
                {field:'type',title:'声明类型',width:100},
				{field:'createTime',title:'操作时间',width:100,
					 	/*formatter:function(value,row,index){//value 当前字段值  row当前行的数据  index当前行
							var simfomat = new Date();
			        		simfomat.setTime(value);   //转换时间
			        		return  simfomat.toLocaleDateString();
						}*/
					}
		         ],
                onLoadSuccess: function () {

                },
                onLoadError: function () {
                    showTips("数据加载失败！");
                },
                onDblClickRow: function (row, $element) {
                    var id = row.ID;
                    EditViewById(id, 'view');
                },
		         //传递参数（*）
				 /*queryParams: function(params) {
					 	var whereParams = {
					 			/!*
					 				分页  自定义的参数         默认传 limit（展示几条）    offset（从第几条开始    起始条数）
					 			*!/
					 			"pageSize":params.limit,
					 			"start":params.offset,
					 			//"minDate":$("#minTime").val(),
					 			//"maxDate":$("#maxTime").val(),
					 			//"pro_name":params.search,//精确搜索产品名称
					 	}
						 return whereParams;
					 },*/

	});
	
	
	
});

</script>
</body>
</html>
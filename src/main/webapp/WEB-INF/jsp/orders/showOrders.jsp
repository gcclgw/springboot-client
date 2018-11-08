<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单管理</title>
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


<table id="findLog"></table>
<script type="text/javascript">
$(function () {
    $("#findLog").bootstrapTable({
        url:"<%=request.getContextPath()%>/orders/queryOrders",
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
        columns: [/*{
            checkbox: true,
            visible: true                  //是否显示复选框
        }, */{
            field: 'orderid',
            title: '订单编号',
        }, {
            field: 'total',
            title: '订单金额',
            sortable: true
        }, {
            field: 'name',
            title: '收货人',
            visible: true
        }, {
            field: 'addr',
            title: '收货地址',
        }, {
            field: 'state',
            title: '订单状态',
            formatter:function (value,row,index) {
                if(value==1){
                    return '订单完成';
                }if(value==2){
                    return '未付款';
                }if(value==3){
                    return "<a href='javascript:fahuo("+row.oid+")'>发货</a>";
                }if(value==4){
                    return '等待确认收货';
                }
            }
        }, {
            field: 'phone',
            title: '手机号',
        }, {
            field: 'ordertime',
            title: '下单时间',
            sortable: true
        }, {
            field: 'xiangqing',
            title: '订单详情',
            formatter:function(value,row,index){   //  格式化  当前单元格内容
                return '<button type="button" onclick="XiangQing('+row.oid+')" class="btn btn-primary">\n' +
                    '                        <span class="glyphicon glyphicon-share"></span>详情\n' +
                    '                            </button>'
            }
        },  {field:'cz',title:'操作',sortable:true,
            formatter:function(value,row,index){   //  格式化  当前单元格内容
                return '<button type="button" onclick="del('+row.oid+')" class="btn btn-danger">\n' +
                    '                        <span class="glyphicon glyphicon-trash"></span>删除\n' +
                    '                            </button>'
            }
        },{field:'cz',title:'操作',sortable:true,
            formatter:function(value,row,index){   //  格式化  当前单元格内容
                return '<button type="button" onclick="up('+row.oid+')" class="btn btn-warning">\n' +
                    '                        <span class="glyphicon glyphicon-cog"></span>修改\n' +
                    '                            </button>'
            }
        }
            , ],
        onLoadSuccess: function () {

        },
        onLoadError: function () {
            showTips("数据加载失败！");
        },
        onDblClickRow: function (row, $element) {
            var id = row.ID;
            EditViewById(id, 'view');
        },



    });
})

var res;
function createAddContent(url){
    $.ajax({
        url:url,
        async:false,
        success:function(data){
            res = data;
        }
    });
    return res;
}
//订单详情
function XiangQing(oid){
    bootbox.dialog({
        title: '订单详情',
        message: createAddContent('<%=request.getContextPath()%>/orders/toGoodsDetails?oid=' + oid),
        closeButton: true,
        //queryParams:{id:id},
        keyboard:true,
        buttons: {
            /*"success": {
                "label": "<i class='icon-ok'></i> 保存",
                "className": "btn-sm btn-success",
                "callback": function () {
                    $.ajax({
                        url: '/commodity/updateCommodity',
                        async: false,
                        data: $("#updateCommodityFormwjw").serialize(),
                        success: function (resutlt) {
                            $("#commodityTablewjw").bootstrapTable("refresh");
                        }
                    });
                }
            },*/
            "cancel": {
                "label": "<i class='icon-info'></i> 关闭",
                "className": "btn-sm btn-danger",
                "callback": function () {

                }
            }
        }
    })

    }
function fahuo(oid){
    $.ajax({
        url:"<%=request.getContextPath()%>/orders/fahuo",
        type: "POST",
        data: { oid: oid },
        success: function (data) {
            alert("成功发货！");
            $("#findLog").bootstrapTable('refresh');//刷新表格
            /*$('findLog').dataTable().fnClearTable(); //清空表格
            $('findLog').dataTable().fnAddData(packagingdatatabledata(data),true); //刷下表格
            $("#modal-container-648308").modal("hide");*/
        },error: function (error) {
            alert("系统错误！"+error);
        }
    })
}
// 删除
function del(oid){
    $.ajax({
        url:"<%=request.getContextPath()%>/orders/deleteOrders",
        data: { oid: oid },
        success: function () {
            alert("成功删除！");
            $("#findLog").bootstrapTable('refresh');//刷新表格
        },error: function () {
            alert("系统错误！");
        }
    })
}


//修改
function up(oid){
    bootbox.dialog({
        title: '修改订单',
        message: createAddContent('<%=request.getContextPath()%>/orders/toUpdateDetails?oid=' + oid),
        closeButton: true,
        //queryParams:{id:id},
        keyboard:true,
        buttons: {
            "success": {
                "label": "<i class='icon-ok'></i> 保存",
                "className": "btn-sm btn-success",
                "callback": function () {
                    $.ajax({
                        url: '<%=request.getContextPath()%>/orders/updateOrder',
                        async: false,
                        data: $("#ordersform").serialize(),
                        success: function (resutlt) {
                            alert("成功修改！")
                            $("#findLog").bootstrapTable("refresh");
                        }
                    });
                }
            },
            "cancel": {
                "label": "<i class=\"glyphicon glyphicon-refresh\"></i> 关闭",
                "className": "btn-sm btn-danger",
                "callback": function () {

                }
            }
        }
    })

}


</script>
</body>
</html>
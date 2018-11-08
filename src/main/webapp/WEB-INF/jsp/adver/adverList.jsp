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

<div class="container-fluid">
    <div class="col-md-12">
        <div id="toolbar">
            <%--<button class="btn btn-default glyphicon glyphicon-zoom-in" onclick="searchTable()">搜索</button>--%>
            <input type="button" class="btn btn-success" value="新增" onclick="addAdver()">
           <%-- <button class="btn btn-info"><i class="glyphicon glyphicon-pencil" onclick="editUser()"></i>修改</button>--%>
           <%-- <button class="btn btn-danger"><i class="glyphicon glyphicon-trash" onclick="delAllAdver()"></i>批量删除</button>--%>
                <input type="button" class="btn btn-danger ,glyphicon glyphicon-trash" value="批量删除" onclick="delAllAdver()">
        </div>
        <table  class="table" id="adverTable" ></table>

    </div>

</div>
<script type="text/javascript">


    $(function(){
        initTable();
    })

    function initTable(){
        $('#adverTable').bootstrapTable({
            toolbar:'#toolbar',
            url:'/adver/selectAdverList',//获取数据地址
            pagination:true, //是否展示分页
            pageList:[3, 6, 9, 12],//分页组件
            pageNumber:1,
            pageSize:3,//默认每页条数
            //search:true,//是否显示搜索框
            //searchText:'试试',//初始化搜索文字
            showColumns:false,//是否显示 内容列下拉框
            showToggle:false,//是否显示 切换试图(table/card)按钮
            showPaginationSwitch:false,//是否显示 数据条数选择框
            showRefresh:false,//是否显示刷新按钮
            detailView:false,//设置为 true 可以显示详细页面模式.
            showFooter:false,//是否显示列脚
            clickToSelect: true, //是否启用点击选中行
            sidePagination:'server',/*//分页方式：client客户端分页，server服务端分页（**/
            striped:true,
            queryParams:function(){
                var searchGoodsName = $('#searchGoodsName').val();
                return {
                    page: this.pageNumber,
                    rows: this.pageSize,
                    'goodsBean.name':searchGoodsName,
                };
            },
            columns:[
                {checkbox:true},
                {field:'adverid',title:'ID',align:'center',width:100},
                {field:'advername',title:'广告名称',align:'center',width:100},
                {field:'adverurl',title:'广告路径',align:'center',width:150},
                {field:'adimg',title:'广告图片',align:'center',width:150,
                    formatter:function(value,row,index){
                        var s;
                        if(row.adimg!=null){
                            var url = row.adimg;
                            s = '<a class = "view"  href="javascript:void(0)"><img style="width:400;height:50px;"  src="'+url+'" /></a>';
                        }
                        return s;
                    }
                },
                {field:'seatname',title:'广告位名称',align:'center',width:50},
                {field:'cruds',title:'操作',width:100,
                    formatter: function (value,row,index){
                        return "<a href='javascript:findAdverSeat("+row.adverid+")'>用户赋角色</a>";
                    }
                }
            ],
        });
    }

    //新增
    function addAdver(){
        location.href="<%=request.getContextPath()%>/toAddAdver";
    }

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

    //修改
    function findAdverSeat(adverid){
        alert(adverid);
        bootbox.dialog({
            title: '广告位设置',
            message: createAddContent('<%=request.getContextPath()%>/adver/dialogAdverSeat?adverid='+adverid),
            closeButton: true,
            //queryParams:{id:id},
            keyboard:true,
            buttons: {
                "success": {
                    "label": "<i class='icon-ok'></i> 保存",
                    "className": "btn-sm btn-success",
                    "callback": function(){    //提交   表单信息   添加   修改  用一个
                        var rows=$("#adverSeatTable").bootstrapTable("getSelections");
                        //  第一步  获取  复选框选中的值
                        var roleIds="";
                        $.each(rows,function (index,obj){
                            roleIds+=obj.rid+",";

                        });
                        alert(roleIds)
                        //  拼成一个ids      1,2,3

                        $.ajax({
                            type:"post",
                            url:"/user/saveUserRole",
                            async: false,
                            data: {
                                "uid":$("#userId").val(),
                                "roleIds":roleIds
                            },
                            success: function (resutlt) {
                                $("#userTable").bootstrapTable("refresh")
                              /*  $("#userRole").bootstrapTable("close");
                                $('#userTable').bootstrapTable("load");*/
                            }
                        });
                    }
                },
                "cancel": {
                    "label": "<i class='icon-info'></i> 关闭",
                    "className": "btn-sm btn-danger",
                    "callback": function () {

                    }
                }
            }
        });
    }

    /* 批量删除 */
    function delAllAdver() {
        //是否选中了数据
        var delete_arrry = $("#adverTable").bootstrapTable('getSelections'); //获取表选择的行
        if (0 == delete_arrry.length) {
            bootbox.alert("提示", "请至少选中一条数据");
        } else {
            bootbox.confirm('确认','您确认想要删除记录吗？',function(r){
                if (r){
                    //删除操作
                    var ids = "";
                    for (var i = 0; i < delete_arrry.length; i++) {
                        ids += "," + delete_arrry[i].adverid;
                    }
                    if (0 < ids.length) {
                        ids = ids.substr(1);
                    }
                    $.ajax({
                        url:"<%=path%>/adver/delAllAdver",
                        data:{ids:ids},
                        type:"post",
                        success:function(data) {
                            bootbox.alert('删除成功');
                            $("#adverTable").bootstrapTable('refresh');
                        }
                    });
                }
            });
        }
    };

/*
    //批删
    function delAllAdver(){
        var selects = $('#adverTable').bootstrapTable('getSelections'); //获取表选择的行
        if (selects.length <= 0) {
            bootbox.alert('请选择有效数据');
            return;
        }
        var ids = "";
        for (var i = 0; i < selects.length; i++) {
            ids += "," +"'"+ selects[i].adverid+"'";
        }
        if (0 < ids.length) {
            ids = ids.substr(1);
        }
        alert(ids);
        bootbox.confirm("确认要删除选择的数据吗？",function (result) {
            if (result) {
                $.ajax({
                    url: '/adver/delAllAdver',
                    type: 'post',
                    data: {adverid:ids},
                    success: function (data, status) {
                        bootbox.alert('删除成功');
                        $("#adverTable").bootstrapTable('refresh');
                    }
                });
            }
        })
    }*/
</script>
</body>
</html>
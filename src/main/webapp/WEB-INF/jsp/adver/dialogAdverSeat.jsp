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
        <table  class="table" id="adverSeatTable" ></table>
        <input type="hidden" value="${adverid}" id="adverid">
    </div>

</div>
<script type="text/javascript">
    var  adver = $("#adverid").val();
    alert(adver);

    $(function(){
        initTable();
    })

    function initTable(){
        $('#adverSeatTable').bootstrapTable({
            toolbar:'#toolbar',
            url:'/adverseat/selectAdverSeatList',//获取数据地址
            pagination:true, //是否展示分页
            pageList:[3, 6, 9, 12],//分页组件
            pageNumber:1,
            pageSize:3,//默认每页条数
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
            idField :"seatid",
            queryParams:function(){
                var searchGoodsName = $('#searchGoodsName').val();
                return {
                    page: this.pageNumber,
                    rows: this.pageSize,
                    'goodsBean.name':searchGoodsName,
                };
            },
            onLoadSuccess:function (data){  // 加载成功后执行的方法
                var adverSeat=eval('${adverSeatList}');
                $.each(adverSeat,function (index,obj){
                    $("[name='chk1'][value='"+this.seatid+"']").prop("checked",true);
                    $("#adverSeatTable").bootstrapTable("getSelections",this.seatid);
                });
            },
            columns:[
                /*{checkbox:true},*/
                {field:'chkid',checkbox:true,width:100},
                {field:'seatid',title:'ID',align:'center',width:150,
                       formatter: function (value,row,index){
                            return "<input  type='checkbox'  name='chk1' value='"+row.seatid+"'  >";
                    }
                },

                {field:'seatname',title:'广告位名称',align:'center',width:150},

                {field:'crud',title:'操作',width:100,
                    formatter: function (value,row,index){
                        return "<a href='javascript:findUserRole("+row.adverid+")'>操作</a>";
                    }

                }
            ],
        });
    }
    /*
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

        function findUserRole(uid){
            alert(uid);
            bootbox.dialog({
                title: '角色赋权限',
                message: createAddContent('/user/dialogRole?userId='+uid),
                closeButton: true,
                //queryParams:{id:id},
                keyboard:true,
                buttons: {
                    "success": {
                        "label": "<i class='icon-ok'></i> 保存",
                        "className": "btn-sm btn-success",
                        "callback": function(){    //提交   表单信息   添加   修改  用一个
                            var rows=$("#roleTable").bootstrapTable("getSelections");
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
                                    "userId":$("#userId").val(),
                                    "roleIds":roleIds
                                },
                                success: function (resutlt) {
                                    $("#userTable").bootstrapTable("refresh")
                                    $("#userRole").bootstrapTable("close");
                                    $('#userTable').bootstrapTable("load");
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
        */

</script>
</body>
</html>
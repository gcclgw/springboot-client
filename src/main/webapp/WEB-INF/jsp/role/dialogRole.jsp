<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="../js/bootstrap3/css/bootstrap.css" />
    <link rel="stylesheet" href="../js/bootstrap3/css/bootstrap-theme.css" />
    <link rel="stylesheet" href="../js/bootstrap-table/bootstrap-table.css"/>
    <link rel="stylesheet" href="../js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css"/>
    <link rel="stylesheet" href="../js/addTabs/addTabs.css"/>



    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap3/js/bootstrap.js"></script>
    <script src="../js/bootstrap-table/bootstrap-table.js"></script>
    <script src="../js/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
    <script src="../js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
    <script src="../js/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="../js/addTabs/addTabs.js"></script>

</head>
<body>
<table id="roleTable"></table>
<input type="hidden" value="${userId}" id="userId">
<script type="text/javascript" >
    var  userId = $("#userId").val();
    alert(userId);
    $(function (){
     $('#roleTable').bootstrapTable({
        toolbar:'#toolbar',
        url:'/user/findRole',//获取数据地址
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
        title:"角色列表",
        rownumbers:true,    //  显示序列号
        idField :"rid",
        queryParams:function(){
            var searchGoodsName = $('#searchGoodsName').val();
            return {
                page: this.pageNumber,
                rows: this.pageSize,
                'goodsBean.name':searchGoodsName,
            };
        },
        onLoadSuccess:function (data){  // 加载成功后执行的方法
            /*var roleArray=eval('');JSON.parse('')*/
            var roleArray =  eval('${roleList}');
            alert(roleArray);
            $.each(roleArray,function (index,obj){
                $("[name='chk1'][value='"+this.rid+"']").prop("checked",true);
                $("#roleTable").bootstrapTable('getSelections',this.rid);
               /* selectRecord   getSelections*/
            });
        },
        columns:[
            {field:'chkid',checkbox:true,width:100},
            {field:'rid',title:'角色ID',width:100,
                       formatter: function (value,row,index){
                            return "<input  type='checkbox'  name='chk1' value='"+row.rid+"'  >";
                    }
            },
            {field:'rid',title:'ID',align:'center',width:150},
            {field:'text',title:'名称',align:'center',width:150},
            {field:'crud',title:'操作',width:100,
             formatter: function (value,row,index){
            return "<a href='javascript:findUserRole("+row.rid+")'>角色赋权限</a>";
        }
    }
],
});
})


</script>
</body>
</html>
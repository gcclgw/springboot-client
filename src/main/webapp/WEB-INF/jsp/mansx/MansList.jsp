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
<table id="manslist"></table>

<script type="text/javascript">
    $(function(){searchPet();})

    function searchPet(){

        $("#manslist").bootstrapTable({
            url:"<%=request.getContextPath()%>/mans/queryuser",
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
            //search:true,
            //启动回车键做搜索功能
            //searchOnEnterKey:true,
            //分页方式   后台请求的分页方式
            //sidePagination:'server',
            pagination: true,                   //是否显示分页（*）
            pageNum: 1,                       //每页的记录行数（*）
            pageSize: 6,                       //每页的记录行数（*）
            pageList: [6,9,12],        //可供选择的每页的行数（*）
            //得到查询的参数   //  工具定义位置
            columns:[[
                {
                    field:'uid',
                    title:'编号',
                    width:100
                },
                {
                    field:'username',
                    title:'用户名称',
                    width:100
                },
                {
                    field:'name',
                    title:'真实名称',
                    width:100
                },
                {field:'xg',title:'操作',width:100,sortable:true,
                    formatter:function(value,row,index){   //  格式化  当前单元格内容
                        return '<button type="button" onclick="updateMans('+row.uid+')" class="btn btn-danger">\n' +
                            '<span class="glyphicon glyphicon-edit"></span>修改\n' +
                            ' </button>  <button type="button" onclick="del('+row.uid+')" class="btn btn-danger">\n'+
                            '                            \<span class="glyphicon glyphicon-remove"></span>删除\n' +
                            '                            </button>'
                    }
                }





            ]],


        });}







//删除
    function del(uid){
        alert(uid);
        $.ajax({
            url:"<%=request.getContextPath()%>/mans/deleteMans",
            data:{uid:uid},
            success:function(){
                alert("删除成功")
                location.href=location.href;
            }
        })


    }
//修改
    function updateMans(uid){
        location.href="<%=request.getContextPath()%>/mans/updateMans?uid="+uid;
    }
</script>
</body>

</html>

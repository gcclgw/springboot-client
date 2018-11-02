<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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

<head>
    <title>Title</title>
</head>
<body>
<br/>
<center><input type="button" class="btn btn-success" value="新增" onclick="addcate()"></center>
<table id="categoryTable"></table>
<script>

    $(function(){
        $("#categoryTable").bootstrapTable({
            url:"<%=request.getContextPath()%>/category/queryCategory",
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
            columns:[
                {field:'cid',title:'序号',width:50,align:'center'},
                {field:'cname',title:'一级分类名称',width:100,align:'center'},
                {field:'sc',title:'删除',width:100,align:'center',sortable:true,
                    formatter:function(value,row,index){   //  格式化  当前单元格内容
                        return '<button type="button" onclick="delcate('+row.cid+')" class="btn btn-danger">\n' +
                            '                        <span class="glyphicon glyphicon-remove"></span>\n' +
                            '                            </button>'
                    }
                },
                {field:'bj',title:'编辑',width:100,align:'center',sortable:true,
                    formatter:function(value,row,index){   //  格式化  当前单元格内容
                        return '<button type="button" onclick="editcate('+row.cid+')" class="btn btn-warning">\n' +
                            '                        <span class="glyphicon glyphicon-edit"></span>\n' +
                            '                            </button>'
                    }
                }

            ],
            //传递参数（*）
            /*queryParams: function() {

                return {
                    page:this.pageNum,
                    rows:this.pageSize
                };
            },*/
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
            pageSize: 3,                       //每页的记录行数（*）
            pageList: [3, 6, 9,12],        //可供选择的每页的行数（*）
        });



    });

    //删除
    function delcate(id){
        $.ajax({
            url:"<%=request.getContextPath()%>/category/delCategory",
            data:{cid:id},
            success:function(){
                alert("删除成功")
                $("#categoryTable").bootstrapTable('refresh');

            }
        })

    }


    //新增
    function addcate(){
        location.href="<%=request.getContextPath()%>/category/toaddcategory";
    }

    //修改
    function editcate(id){
        location.href="<%=request.getContextPath()%>/category/toEditList?id="+id;
    }


</script>
</body>
</html>

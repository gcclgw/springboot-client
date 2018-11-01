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
    <link href="https://cdn.bootcss.com/bootstrap-validator/0.5.3/css/bootstrapValidator.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap-validator/0.5.3/js/bootstrapValidator.min.js"></script>
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


    <link rel="stylesheet" href="<%=request.getContextPath()%>/js/bootstrapvalidator/dist/css/bootstrapValidator.css"/>

    <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrapvalidator/dist/js/bootstrapValidator.js"></script>





</head>
<body>
<div style="text-align: left;">
    <button type="button" class="btn btn-info" onclick="add()">
        <span class="glyphicon glyphicon-plus"></span> 新增企业
    </button>


</div>
<table id="showbus"></table>

<div class="modal fade" id="adddialod" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <form id="addBusForm"  class="form-horizontal">

            <div class="modal-content">
                <div class="modal-header">

                    <h4 class="modal-title" id="myModalLabel">编辑</h4>
                </div>
                <div class="modal-body">

                    <div class="form-group">
                        <label for="qnameId">企业名称</label>
                        <input type="text" name="qname" id="qnameId" class="form-control"  placeholder="企业名称"

                        />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="close" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                    <button type="button" id="add" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" ></span>保存</button>
                </div>
            </div>
        </form>
    </div>
</div>


<script type="text/javascript">
    $(function(){
        $("#showbus").bootstrapTable({
            url:"<%=request.getContextPath()%>/business/queryBusiness",
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
                {field:'qid',title:'企业id',width:50},
                {field:'qname',title:'企业名称',width:100},
                {field:'qstatus',title:'合作状态',width:100,sortable:true,
                    formatter:function(value,row,index){   //  格式化  当前单元格内容
                        if (value==1){
                            return "签约";
                        } else {
                            return "未签约";
                        }
                    }


                },
                {field:'cz',title:'操作',width:100,sortable:true,
                    formatter:function(value,row,index){   //  格式化  当前单元格内容
                        return '<button type="button" onclick="del('+row.qid+')" class="btn btn-danger">\n' +
                            '                        <span class="glyphicon glyphicon-remove"></span>删除\n' +
                            '                            </button>;'
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

        $('#addBusForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                qname: {
                    message: '用户名验证失败',
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        }
                    }
                }

            }
        })

    });
function del(qid){
    alert(qid);
$.ajax({
    url:"<%=request.getContextPath()%>/business/deleteBus",
    data:{qid:qid},
    success:function(){
        alert("删除成功")
        $("#showbus").bootstrapTable('refresh');
    }
})

}

$("#add").click(function () {
    var flag = $('#addBusForm').data("bootstrapValidator").isValid();
    if (flag){
        $.ajax({
            url:"<%=request.getContextPath()%>/business/addBus",
            data:$("#addBusForm").serialize(),
            success:function(){

                $("#showbus").bootstrapTable('refresh');
            }
        })
    }
})




    //修改
    function add(){
        $("#adddialod").modal();


    }





</script>

</body>

</html>

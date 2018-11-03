<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<div class="modal fade" id="myCategory" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <form id="editForm">
            <input type="hidden" name="cid" value="${id}">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title" id="myModalLabel">修改</h4>
                </div>

                <div class="modal-body">

                    <div class="form-group">
                        <label for="txt_departmentname">一级分类名称</label>
                        <input type="text" name="cname" value="${category.cname}" class="form-control"  placeholder="请输入名称">
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" id="gb" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                    <button type="button" id="editdiv" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" ></span>修改</button>
                </div>

            </div>
        </form>
    </div>
</div>

<script>

    $(function(){
        $("#myCategory").modal();
    })


    $("#editdiv").click(function(){
            $.ajax({

                url:"<%=request.getContextPath()%>/category/editcate",
                type:"post",
                data:$("#editForm").serialize(),
                success:function(){
                    location.href="<%=request.getContextPath()%>/category/tocategory";
                },
            });
    });

    $("#gb").click(function(){
        location.href="<%=request.getContextPath()%>/category/tocategory";
    })

</script>

</body>
</html>

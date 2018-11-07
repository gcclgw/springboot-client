
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>

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
<input type="hidden" name="pid" id="aaa" value="${pid}">
<!-- 添加属性弹框 -->
<div class="modal fade" id="myTjsx" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">


        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                <h4 class="modal-title" id="myModaabel">添加属性</h4>
            </div>
            <div class="modal-body">

                <div style="text-align: left;">
                    <button type="button" onclick="dian()" class="btn btn-info">
                        <span class="glyphicon glyphicon glyphicon-plus">添加属性</span>
                    </button>
                </div>
                     <div id="d">
                <div  class="form-group">
                    <label for="txt_departmentname">属性名称</label>
                    <input type="text" name="cname" class="form-control" id="txt_depaename" placeholder="属性名称">
                     </div>
                         <div class="form-group">
                             <label for="txt_departmentname">属性值</label>
                             <input type="text" name="cvalue" class="form-control" id="txt_departmentname" placeholder="属性值">
                         </div>
                     </div>

                <p id="p"></p>

            </div>
            <div class="modal-footer">
                <button type="button" id="guan" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                <button type="button" id="ttttt" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" ></span>保存</button>
            </div>
        </div>

    </div>
</div>


<script>

    <!-- 添加属性弹框 -->
$(function () {

        $("#myTjsx").modal();

})


    <!-- 追加属性 -->
    function dian() {
        $("#p").append($("#d").html()+"<br><br>");
    }

    <!-- 保存属性 -->
    $("#ttttt").click(function () {
        var qq = $("#aaa").val()
        var ids = "";
        $("[name='cname']").each(function(){
            ids+=","+$(this).val()
        })
        ids = ids.substr(1);

        var idsvalue = "";
        $("[name='cvalue']").each(function(){
            idsvalue+=","+$(this).val()
        })
        idsvalue = idsvalue.substr(1);

        $.ajax({
            url:"<%=request.getContextPath()%>/comm/addtjsx",
            data:{cname:ids,
                cvalue:idsvalue,
                pid:$("#aaa").val()
            },

            success:function () {
                alert("保存成功")
                location.href="<%=request.getContextPath()%>/comm/toCommodity";
            },
            error:function () {
                alert("保存失败")
                location.href=location
            }
        })
    })


    <!-- 关闭弹框 -->
    $("#guan").click(function () {
        location.href="<%=request.getContextPath()%>/comm/toCommodity";
    })
</script>
</body>
</html>

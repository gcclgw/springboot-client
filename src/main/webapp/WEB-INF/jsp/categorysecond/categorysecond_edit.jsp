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

<div class="modal fade" id="myCategorySecond" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <form id="editForm">
            <input type="hidden" name="csid" value="${scid}">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title" id="myModalLabel">修改</h4>
                </div>

                <div class="modal-body">

                    <div class="form-group">二级分类名称<input type="text" name="csname" value="${cs.csname}" class="form-control"  placeholder="请输入名称">
                    </div>
                </div>
                <div class="form-group">
                    <label for="txt_departmentname">所属的一级分类</label>
                    <select class="form-control" name="cid" id="sele">
                        <option value="">请选择</option>
                        <c:forEach items="${category}" var="a">
                            <option value="${a.cid}"
                            <c:if test="${a.cid==cs.cid}">selected</c:if>
                            >${a.cname}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="modal-footer">
                    <button type="button" id="gb" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                    <button type="button" id="editform" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" ></span>修改</button>
                </div>

            </div>
        </form>
    </div>
</div>

<script>

    $(function(){
        $("#myCategorySecond").modal();
    })


    $("#editform").click(function(){
        $.ajax({
            url:"<%=request.getContextPath()%>/categorysecond/editSecond",
            type:"post",
            data:$("#editForm").serialize(),
            success:function(){
                location.href="<%=request.getContextPath()%>/categorysecond/toCategorysecondJsp";
            },
        });
    });
    $("#gb").click(function(){
        location.href="<%=request.getContextPath()%>/categorysecond/toCategorysecondJsp";
    })

</script>

</body>
</html>

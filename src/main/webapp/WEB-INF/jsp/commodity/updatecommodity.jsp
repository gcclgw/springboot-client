
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

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

<head>
    <title>首页</title>
</head>
<body>

<!-- 修改弹框 -->
<div class="modal fade" id="myupdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <form id="updateForm">
            <input type="hidden" name="pid" value="${pid}">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title" id="myModalLabel">编辑</h4>
                </div>
                <div class="modal-body">

                    <div class="form-group">
                        <label for="txt_departmentname">商品名称</label>
                        <input type="text" name="pname" value="${pro.pname}" class="form-control" id="txt_departmentname" placeholder="商品名称">
                    </div>
                    <div class="form-group">
                        <label for="txt_parentdepartment">市场价格</label>
                        <input type="text" name="market_price" value="${pro.market_price}" class="form-control" id="txt_parentdepartment" placeholder="市场价格">
                    </div>
                    <div class="form-group">
                        <label for="txt_departmentlevel">商城价格</label>
                        <input type="text" name="shop_price" value="${pro.shop_price}" class="form-control" id="txt_departmentlevel" placeholder="商城价格">
                    </div>
                    <div class="form-group">
                        <label for="txt_statu">商品描述</label>
                        <input type="text" name="pdesc" value="${pro.pdesc}" class="form-control" id="txt_statu" placeholder="描述">
                    </div>
                    <div class="form-group">
                        <label for="txt_statu">所属的二级分类</label>
                        <select class="form-control" name="csid" id="sel2">
                            <option value="">请选择</option>
                            <c:forEach items="${list}" var="a">
                                <option value="${a.csid}"
                                        <c:if test="${a.csid==pro.csid}">selected</c:if>
                                >${a.csname}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="txt_departmentlevel">商品图片</label><br>
                        <img src="${pro.image}" height="100px" width="100px"><br><br>
                        <input type="file" class="file" id="imgimg" multiple name="image"  width="42">
                        <input type="hidden" name="image" id="imageId">
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" id="guanid" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                    <button type="button" id="btn_update" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" ></span>保存</button>
                </div>
            </div>
        </form>
    </div>
</div>


<script>


    $("#imgimg").fileinput({

        language : 'zh',
        uploadUrl : "<%=request.getContextPath()%>/comm/headImgUpload",
        showUpload: true, //是否显示上传按钮
        showRemove : true, //显示移除按钮
        showPreview : true, //是否显示预览
        showCaption: false,//是否显示标题
        autoReplace : true,
        minFileCount: 0,
        uploadAsync: true,
        maxFileCount: 10,//最大上传数量
        browseOnZoneClick: true,
        msgFilesTooMany: "选择上传的文件数量 超过允许的最大数值！",
        enctype: 'multipart/form-data',
        // overwriteInitial: false,//不覆盖已上传的图片
        allowedFileExtensions : [ "jpg", "png", "gif" ],
        browseClass : "btn btn-primary", //按钮样式
        previewFileIcon : "<i class='glyphicon glyphicon-king'></i>"
    }).on("fileuploaded", function(e, data) {//文件上传成功的回调函数，还有其他的一些回调函数，比如上传之前...

        $("#imageId").val(data.response.imgUrl);

    });











    $(function () {

        <!-- 修改弹框 -->
            $("#myupdate").modal();

    })


    <!-- 新增方法 -->
    $("#btn_update").click(function () {
        $.ajax({
            url:"<%=request.getContextPath()%>/comm/updateCommodity",
            type:"post",
            dataType:"text",
            data:$("#updateForm").serialize(),
            success:function () {
                alert("修改成功")
                location.href="<%=request.getContextPath()%>/comm/toCommodity";
            },
            error:function () {
                alert("修改失败")
                location.href=location
            }
        })
    })

    <!-- 关闭弹框 -->
   $("#guanid").click(function () {
       location.href="<%=request.getContextPath()%>/comm/toCommodity";
   })


</script>

</body>
</html>

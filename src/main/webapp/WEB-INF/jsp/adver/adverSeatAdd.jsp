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

<div class="modal fade" id="mySeat" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <form id="addSeatForm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title" id="myModalLabel">新增</h4>
                </div>

                <div class="modal-body">

                    <div class="form-group">
                        <label for="txt_departmentname">广告名称</label>
                        <input type="text" name="advername" class="form-control"  placeholder="请输入名称">
                    </div>

                    <div class="form-group">
                        <label for="txt_departmentname">广告路径</label>
                        <input type="text" name="adverurl" class="form-control"  placeholder="请输入路径">
                    </div>

                    <div class="form-group">
                        <label for="txt_departmentlevel">广告图片</label>
                        <input type="file" class="file" id="img" multiple name="image"  width="42">
                        <input type="hidden" name="adimg" id="adverimg">
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" id="gb" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                    <button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" ></span>保存</button>
                </div>

            </div>
        </form>
    </div>
</div>

<script>

    $(function(){
        $("#mySeat").modal();
    })


    $("#btn_submit").click(function(){
        $.ajax({
            url:"<%=request.getContextPath()%>/adver/addAdver",
            type:"post",
            data:$("#addSeatForm").serialize(),
            success:function(){
                alert("新增成功")
                location.href="<%=request.getContextPath()%>/selectAdver";
            },
        });
    });

    $("#gb").click(function(){
        location.href="<%=request.getContextPath()%>/selectAdver";
    })

    $("#img").fileinput({

        language : 'zh',
        uploadUrl : "<%=request.getContextPath()%>/adver/headImgUpload",
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


        //alert(data)
        // console.info(data.response.imgUrl)
        //  $("input[name='image']").val(data.response.imgUrl);
        $("#adverimg").val(data.response.imgUrl);
        //   $("#imageId").attr("src",data.response.imgUrl);
        /*var res = data.response;
        console.log(res)
        imageData.push({
            "path": res.data.path,
            "date":res.data.date
        });
        console.log(imageData);*/
    });







</script>

</body>
</html>

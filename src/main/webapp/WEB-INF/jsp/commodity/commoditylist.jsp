<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<style>

    button{background: #3b72bb; color: #fff; border-radius: 3px; height: 40px; width: 100px; border: none;

        margin: auto; display: block; margin-top: 20px;

    }

</style>
<div style="text-align: left;">
    <button type="button" onclick="addCommodity()" class="btn btn-info">
        <span class="glyphicon glyphicon-plus"></span> 添加商品
    </button>
</div>
<!-- 表格 -->
<table id="showbus"></table>


<!-- 新增弹框 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <form id="addForm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                <h4 class="modal-title" id="myModalLabel">新增</h4>
            </div>
            <div class="modal-body">

                <div class="form-group">
                    <label for="txt_departmentname">商品名称</label>
                    <input type="text" name="pname" class="form-control" id="txt_departmentname" placeholder="商品名称">
                </div>
                <div class="form-group">
                    <label for="txt_parentdepartment">市场价格</label>
                    <input type="text" name="market_price" class="form-control" id="txt_parentdepartment" placeholder="市场价格">
                </div>
                <div class="form-group">
                    <label for="txt_departmentlevel">商城价格</label>
                    <input type="text" name="shop_price" class="form-control" id="txt_departmentlevel" placeholder="商城价格">
                </div>
                <div class="form-group">
                    <label for="txt_statu">商品描述</label>
                    <input type="text" name="pdesc" class="form-control" id="txt_statu" placeholder="描述">
                </div>
                <div class="form-group">
                    <label for="txt_statu">所属的二级分类</label>
                    <select class="form-control" name="csid" id="sel2">
                        <option value="">请选择</option>
                        <c:forEach items="${list}" var="a">
                            <option value="${a.csid}">${a.csname}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group">
                    <label for="txt_departmentlevel">商品图片</label>
                    <input type="file" class="file" id="img" multiple name="image"  width="42">
                    <input type="hidden" name="image" id="imageId">
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                <button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" ></span>保存</button>
            </div>
        </div>
    </form>
    </div>
</div>


<script type="text/javascript">

    $("#img").fileinput({

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


        //alert(data)
        // console.info(data.response.imgUrl)
        //  $("input[name='image']").val(data.response.imgUrl);
        $("#imageId").val(data.response.imgUrl);
        //   $("#imageId").attr("src",data.response.imgUrl);
        /*var res = data.response;
        console.log(res)
        imageData.push({
            "path": res.data.path,
            "date":res.data.date
        });
        console.log(imageData);*/
    });





    $(function(){
        $("#showbus").bootstrapTable({
            url:"<%=request.getContextPath()%>/comm/queryCommodity",
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
                {field:'pid',title:'序号',width:50},
                {field:'image',title:'商品图片',width:100,
                formatter:function (value,row,index) {
                    return '<img src="'+row.image+'" width="30" height="30" >';
                }
                },
                {field:'pname',title:'商品名称',width:100},
                {field:'market_price',title:'商品价格',width:50},
                {field:'is_hot',title:'点击量',width:100},
                {field:'tjsx',title:'添加属性',width:100,
                    formatter:function (value,row,index) {
                        return '<div style="text-align: left;">\n' +
                            '    <button type="button" onclick="tjsx('+row.pid+')" class="btn btn-info">\n' +
                            '        <span class="glyphicon glyphicon-plus"></span> 添加属性\n' +
                            '    </button>\n' +
                            '</div>';
                    }
                },
                {field:'bj',title:'编辑',width:100,
                    formatter:function (value,row,index) {
                        return '<div style="text-align: left;">\n' +
                            '    <button type="button" onclick="toupdate('+row.pid+')" class="btn btn-info">\n' +
                            '        <span class="glyphicon glyphicon-edit"></span> 修改商品\n' +
                            '    </button>\n' +
                            '</div>';
                    }
                },
                {field:'sc',title:'删除',width:100,
                formatter:function (value,row,index) {
                    return '<div style="text-align: left;">\n' +
                        '    <button type="button" onclick="deleteCommodity('+row.pid+')" class="btn btn-danger">\n' +
                        '        <span class="glyphicon glyphicon-floppy-remove"></span> 删除商品\n' +
                        '    </button>\n' +
                        '</div>';
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
            pageSize: 10,                       //每页的记录行数（*）
            pageList: [3, 6, 9,12],        //可供选择的每页的行数（*）
        });



    });

    <!-- 删除 -->
             function deleteCommodity(pid) {
             alert(pid)
             $.ajax({
                 url:"<%=request.getContextPath()%>/comm/deleteCommodity?pid="+pid,
                 success:function (data) {
                     alert("删除成功");
                     location.href = location
                 }
         })
     }

    <!-- 新增弹框 -->
     function addCommodity() {
      $("#myModal").modal();
     }

    <!-- 新增方法 -->
     $("#btn_submit").click(function () {
         $.ajax({
                 url:"<%=request.getContextPath()%>/comm/addCommodity",
                 type:"post",
                  dataType:"text",
                  data:$("#addForm").serialize(),
             success:function () {
                 alert("新增成功")
                 location.href=location
             },
             error:function () {
                 alert("新增失败")
             }
         })
     })

    <!-- 跳转修改页面 -->
    function toupdate(pid) {
        location.href="<%=request.getContextPath()%>/comm/toupdate?pid="+pid;
    }

    <!-- 跳转添加属性页面 -->
    function tjsx(pid) {



        location.href="<%=request.getContextPath()%>/comm/totjsx?pid="+pid;
    }



</script>

</body>

</html>

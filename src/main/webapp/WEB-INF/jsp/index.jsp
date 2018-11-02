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

    <!-- 引入jquery -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>

    <!-- 引入bootstrap的js-->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/js/bootstrap.min.js"></script>

    <!-- 引入bootstrap的js-->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/treeview/bootstrap-treeview.min.js"></script>

    <!-- 引入bootstrap的js-->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/addTabs/addTabs.js"></script>
    <style type="text/css">
        body {padding-top:55px;}

    </style>
</head>
<body>
<!--导航条  -->
<!--导航条  -->
<!-- navbar-fixed-top  规定在页面最顶部-->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <!-- Brand and toggle get grouped for better mobile display -->
            <!-- 头部信息 -->

            <a class="navbar-brand" href="#">
                <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true" ></span> 商城管理系统
            </a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

            <ul class="nav navbar-nav navbar-right">

                <li><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true" ></span> 用户名：</a></li>
                <li><a href="#">注册</a></li>
            </ul>


        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<!-- ============================导航结束==================================-->

<!--=========栅格布局 ==============-->
<div class="row">
    <div class="col-md-3">

        <a class="list-group-item" data-addtab="userMenu" data-target="#tabs" data-url="http://www.baidu.com">
            后台管理菜单
        </a>

        <!-- tree 的插件 -->
        <div id="treeDiv"></div>

    </div>

    <div class="col-md-9">

        <!--   选项卡    -->
        <!-- Nav tabs -->
        <ul id="tabs" class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active">
                <a href="#home" aria-controls="home" role="tab" data-toggle="tab">欢迎</a></li>
        </ul>
        <!-- 选项卡  内容 -->
        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" style="" class="tab-pane active " id="home">后台管理系统</div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function(){
        initTree();

    })
    function initTree(){

        $.ajax({

            url:'<%=request.getContextPath()%>/powertree/getTreeNavCommon',
            type:'post',
            data:{},
            dataType:'json',
            success:function(result){
                $('#treeDiv').treeview({
                    //data属性 树节点信息 json数组
                    data: result,
                    //tree默认展开的节点级别默认为2
                    //levels: 1,
                    //含有子节点的图标
                   // collapseIcon:'glyphicon glyphicon-star-empty',
                    //没有子节点的图标
                   // emptyIcon:'glyphicon glyphicon-usd',
                    //backColor: 'green',yellow,gray,blue
                   // color: "#090909", //节点的前景色      string
                    //backColor: "#d8d5d9", //节点的背景色      string
                    //是否显示复选框
                   // showCheckbox:false,
                    //是否允许选中多个节点
                    //multiSelect:true,
                    //启用节点的超链接功能默认为false,节点需指定href属性
                   // enableLinks:true,
                    //事件当节点选中时
                  //  expand: false,
                    onNodeSelected:function(event, node) {

                        $.addtabs({iframeHeight: 650});
                        $.addtabs.add({
                            id:node.id,
                            title:node.text,
                            url:node.href
                        });
                    }
                });
            }
        })
    }
</script>
</body>
</html>

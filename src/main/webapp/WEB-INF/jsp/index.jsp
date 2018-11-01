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

   <%-- <!-- 引入jquery -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
--%>
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
<nav class="navbar navbar-inverse navbar-fixed-top">
    <!--定义在容器顶部  -->
    <div class="container-fluid">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <!-- Brand and toggle get grouped for better mobile display -->
        <!-- 头部信息 -->
        <div class="navbar-header">
            <a class="navbar-brand glyphicon glyphicon-globe" href="#" id="menu-toggle">
                中国电力建设
            </a>
        </div>



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
    $.addtabs({iframeHeight:870});
    $(function (){


        var tree = [
            {
                id:1,
                text: "承包商管理",
                //nodes 子字节json数组
                nodes: [
                    {
                        id:2,
                        text: "承包商审核",
                        nodes: [
                            {
                                id:3,
                                //节点文本
                                text: "未通过承包商",
                                //href新打开一个窗口显示jsp页面
                                //url 在选项卡中显示jsp页面
                                //点击节点跳转的URL
                                url:'<%=request.getContextPath()%>/product!dataGird.htm',
                            },
                            {
                                id:4,
                                text: "已审核承包商",
                                url:"http://news.baidu.com"
                            }
                        ]
                    },
                    {
                        text: "承包商评级"
                    }
                ]
            },
            {
                text: "承包商评级"
            }
        ];

        $.ajax({
            type:"post",
            url:"<%=request.getContextPath()%>/menu!findAutoMenu.htm",
            dataType:"json",
            success:function (data){
                //渲染树插件 treeview()
                $("#treeDiv").treeview({
                    //data属性 树节点信息 json数组
                    data: data,
                    //tree默认展开的节点级别默认为2
                    levels: 0,
                    //含有子节点的图标
                    collapseIcon:'glyphicon glyphicon-star-empty',
                    //没有子节点的图标
                    emptyIcon:'glyphicon glyphicon-usd',
                    //背景颜色
                    //backColor: 'green'
                    //是否显示复选框
                    showCheckbox:true,
                    //是否允许选中多个节点
                    //multiSelect:true,
                    //启用节点的超链接功能默认为false,节点需指定href属性
                    enableLinks:true,
                    //事件当节点选中时
                    onNodeSelected:function(event,node){
                        //动态向 nav-tabs 导航标签添加tab选项卡
                        //addTabs方法  add() 添加tab  close()关闭tab  closeAll() 关闭全部tab
                        if(null !=  node.url){
                            $.addtabs.add({
                                id:node.id,
                                title:node.text,
                                url:node.url,
                            })
                        }

                    }
                })


            }
        });



    })
</script>
</body>
</html>

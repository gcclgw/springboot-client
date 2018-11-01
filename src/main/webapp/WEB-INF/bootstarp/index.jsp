<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/js/bootstrap3/css/bootstrap.css" />
<link rel="stylesheet" href="/js/bootstrap3/css/bootstrap-theme.css" />
<link rel="stylesheet" href="/js/bootstrap-treeview/bootstrap-treeview.min.css"/>
<link rel="stylesheet" href="/js/bootStrap-addTabs/bootstrap.addtabs.css"/>

<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap3/js/bootstrap.js"></script>
<script src="/js/bootstrap-treeview/bootstrap-treeview.min.js"></script>
<script src="/js/bootStrap-addTabs/bootstrap.addtabs.min.js"></script>
</head>
<body>
	<!-- 导航头 -->
	<nav class="navbar navbar-inverse navbar-static-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">
					金科教育  万新就业
				</a>
			</div>
		</div>
	</nav>
	<!-- 布局中心 -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3">
				<div id="myTree"></div>
			</div>
			<div class="col-md-9">
				<div	 class="myTabs">
					<!-- 新选项卡 -->
					<ul class="nav nav-tabs" id="tablist">
						<li role = "presentation" class="active">
							<a href="#home" role="tab" data-toggle="tab">欢迎</a>
						</li>
					</ul>

					<!-- 选项卡下内容 -->
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active" id="home">

						</div>
					</div>
				</div>
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
                $('#myTree').treeview({
                    data:result,
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








    /*$(function(){
        initTree();
    })

    function initTree(){
        $.ajax({
            url:'/powertree/getTreeNavCommon',
        type:'post',
        data:{},
        dataType:'json',
        success:function(result){
            $('#myTree').treeview({
                data:result,
                onNodeSelected:function(e,node){
                    $.addtabs({iframeHeight:650})
                    $.addtabs.add({
                        id:node.id,
                        title:node.text,
                        url:node.href,
                    });
                }
            })
        }
    })
}*/
</script>
</body>
</html>
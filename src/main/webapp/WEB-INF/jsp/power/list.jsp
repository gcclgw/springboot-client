<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<title>Insert title here</title>
<%--
	<link rel="stylesheet" href="../js/bootstrap3/css/bootstrap.css" />
	<link rel="stylesheet" href="../js/bootstrap3/css/bootstrap-theme.css" />
	<link rel="stylesheet" href="../js/bootstrap-table/bootstrap-table.css"/>
	<link rel="stylesheet" href="../js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css"/>
	<link rel="stylesheet" href="../js/addTabs/addTabs.css"/>




	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap3/js/bootstrap.js"></script>
	<script src="../js/bootstrap-table/bootstrap-table.js"></script>
	<script src="../js/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
	<script src="../js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
    <script src="../js/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="../js/addTabs/addTabs.js"></script>
--%>
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

<div class="container-fluid">
	<div class="col-md-12">
		<table  class="table" id="userTable" ></table>
	</div>

</div>
<script type="text/javascript">


    $(function(){
        initTable();
    })

    function initTable(){
        $('#userTable').bootstrapTable({
            toolbar:'#toolbar',
            url:'/user/selectUserList',//获取数据地址
            pagination:true, //是否展示分页
            pageList:[3, 6, 9, 12],//分页组件
            pageNumber:1,
            pageSize:3,//默认每页条数
            //search:true,//是否显示搜索框
            //searchText:'试试',//初始化搜索文字
            showColumns:false,//是否显示 内容列下拉框
            showToggle:false,//是否显示 切换试图（table/card）按钮
            showPaginationSwitch:false,//是否显示 数据条数选择框
            showRefresh:false,//是否显示刷新按钮
            detailView:false,//设置为 true 可以显示详细页面模式。
            showFooter:false,//是否显示列脚
            clickToSelect: true, //是否启用点击选中行
            sidePagination:'server',//分页方式：client客户端分页，server服务端分页（*
            striped:true,
            queryParams:function(){
                var searchGoodsName = $('#searchGoodsName').val();
                return {
                    page: this.pageNumber,
                    rows: this.pageSize,
                    'goodsBean.name':searchGoodsName,
                };
            },
            columns:[
                /*{checkbox:true},*/
                {field:'uid',title:'ID',align:'center',width:150},
                {field:'username',title:'名称',align:'center',width:150},
                {field:'crud',title:'用户赋角色',width:100,
                    formatter: function (value,row,index){
                        return '<a href="javascript:findUserRole('+row.uid+')">用户赋角色</a>';
                    }
                }
            ],
        });
    }

    var res;
    function createAddContent(url){
        $.ajax({
            url:url,
            async:false,
            success:function(data){
                res = data;
            }
        });
        return res;
    }

  function findUserRole(uid){
        alert(uid);
      bootbox.dialog({
            title: '角色赋权限',
		    message: createAddContent('<%=request.getContextPath()%>/user/dialogRole?userId='+uid),
		    closeButton: true,
		    //queryParams:{id:id},
		    keyboard:true,
		    buttons: {
				"success": {
				"label": "<i class='icon-ok'></i> 保存",
			  "className": "btn-sm btn-success",
			  "callback": function(){    //提交   表单信息   添加   修改  用一个
                      var rows=$("#roleTable").bootstrapTable("getSelections");
					  //  第一步  获取  复选框选中的值
					  var roleIds="";
					  $.each(rows,function (index,obj){
						  roleIds+=obj.rid+",";

					  });

                         alert(roleIds)
					  //  拼成一个ids      1,2,3
                  		alert($("#userId").val()),
                      $.ajax({
                          type:"post",
                          url:"/user/saveUserRole",
						  async: false,
						  data: {
                              "uid":$("#use	rId").val(),
                              "roleIds":roleIds
						  },

						  success: function (resutlt) {
						  	$("#userTable").bootstrapTable("refresh")
                              $("#userRole").bootstrapTable("close");
                              $('#userTable').bootstrapTable("load");
							}
			          });
		  			}
	  			},
				  "cancel": {
					  "label": "<i class='icon-info'></i> 关闭",
						  "className": "btn-sm btn-danger",
						  "callback": function () {

              }
          }
      }
        });
    }



    /*function findUserRole(uid){
        $("#myModalLabel").text("用户赋角色");
       /!* $('#myModal').modal();*!/
        $("#roleTable").bootstrapTable({
            title: '角色赋权限',
            width: 600,
            height: 400,
            cache:false,
            href:"/user/dialogRole?userId="+uid,
            closed: false,
            modal: true,
            iconCls:"icon-save",
            buttons:[{      //  底部 按钮
                text:'OK',
                iconCls:"icon-ok",
                handler:function(){    //提交   表单信息   添加   修改  用一个
                    var rows=$("#roleTree").tree("getChecked");
                    //  第一步  获取  复选框选中的值
                    var pids="";
                    $.each(rows,function (index,obj){
                        pids+=obj.id+",";

                    });
                    //  拼成一个ids      1,2,3

                    $.ajax({
                        type:"post",
                        url:"user/saveUserRole.do",
                        data:{

                            "rid":$("#rid").val(),
                            "pids":pids
                        },
                        success:function (msg){
                            $.messager.alert('我的消息','提交成功！','info');
                            $("#roleTable").dialog("close");
                            $('#userTable').datagrid("load");
                        }
                    });


                }
            },{
                text:'关闭',
                iconCls:"icon-no",
                handler:function(){
                    $("#roleTable").dialog("close");
                }
            }],
            onLoad:function (){  // uploaddify  要做 dialog  加载时完成
                //editor.readonly(true);   // 设置  kindeditor   修改时只读
            }
        });
    }*/







</script>
</body>
</html>
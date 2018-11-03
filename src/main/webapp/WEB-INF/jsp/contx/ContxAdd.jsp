<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <style type="text/css">
        body {padding-top:55px;}

    </style>
    <script type="text/javascript" src="<%=request.getContextPath()%>/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<center><font color="#a52a2a"> <h2>签约合同</h2></font> </center>
<br>
  <br>
    <br>
      <form method="post" action="<%=request.getContextPath()%>/cont/poixAdd">
 <center>
<table border="2">
      <tr>
        <td>合同名称:<input name="htname"></td>
        <td>状态:<input name="htstatus"></td>
        <td>生效时间:<input  class="Wdate" name="startdate" type="text"   onClick="WdatePicker({dateFmt:'yyyy-MM-dd  HH:mm:ss'})"></td>
     </tr>
     <tr>
        <td>结束时间:<input  class="Wdate" name="endtime" type="text"   onClick="WdatePicker({dateFmt:'yyyy-MM-dd  HH:mm:ss'})"></td>
         <td>企业编号:<input name="qid"></td>
         <td>描述:<textarea name="htinfo"></textarea></td>
     </tr>
 </center>
</table><br>
          <input type="reset" value="清除" style="width:90px;height:30px;background-color:black">
          <input type="submit" value="提交" style="width:90px;height:30px;background-color:white"><br>

</form>
<center><br><input type="button" value="返回" onclick="restx()" style="width:120px;height:40px;background-color:grey"></center>

</body>
<script>
    function restx(){
        location.href="<%=request.getContextPath() %>/cont/queryContx";
    }
</script>
</html>

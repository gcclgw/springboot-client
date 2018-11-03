<%@ page import="java.nio.file.Path" %>
<%@ page import="org.aspectj.weaver.tools.cache.SimpleCacheFactory" %>
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

</head>
<body style="background:#1b6d85">
<center><font color="#a52a2a"> <h2>编辑用户 </h2></font> </center>
<br>
  <br>
    <br>
<center>
      <form method="post" action="<%=request.getContextPath()%>/mans/updateAdd">

<table border="2">
    r<input type="hidden" name="uid" value="${user.uid}">
      <tr>
        <td>用户姓名:<input name="username" value="${user.username}"></td>
        <td><pre>               <input type="submit" value="确定">                </pre></td>
          <td>密码:<input name="password" value="${user.password}"></td>
     </tr>
     <tr>
        <td>真实姓名:<input name="name" value="${user.name}"></td>
         <td><pre>                <input type="reset" value="重置">                 </pre></td>
         <td>邮箱:<input name="email" value="${user.email}"></td>
     </tr>
     <tr>
        <td>用户电话:<input name="phone" value="${user.phone}"></td>
         <td><pre>                <input type="button" value="返回" onclick="fh(1)" >                </pre></td>
         <td>    地址:<input name="addr" value="${user.addr}"></td>
     </tr>

</table>
</form>
</center>

</body>
<script type="text/javascript">
    function fh(qid){

        $.ajax({
            url:"<%=request.getContextPath()%>/mans/querymans",
            data:{qid:qid},
            success:function(){

                location.href="<%=request.getContextPath()%>/mans/querymans"
            }
        })




    }

</script>


</html>

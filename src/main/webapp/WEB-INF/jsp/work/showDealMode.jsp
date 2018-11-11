<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


</head>
<body>

<!-- ===================== -->
<div class="radio">
    <label>
        <input type="radio" onclick="getJt()"  name="optionsRadios" id="jt" value="1" checked> 接通电话
    </label>
</div>
<form id="workForm">
    <input id="htid" name="htid"  value="${htid}">
    <div class="form-group" display:none id="div">

            <label >记录内容</label>
            <textarea class="form-control" rows="3" name="text" id="textarea"></textarea><br/>
                <span style="color:#ffcc99">如果续约可不用填写通话内容。如果解约请填写解约原因。方便总结问题！</span>
        <div class="radio">
            <label>
                <input type="radio"   name="workstyle" id="jy" value="1" > 解约
            </label>
            <label>
                <input type="radio"   name="workstyle" id="xy" value="2" > 续约
            </label>

        </div>
    </div>


<div class="radio">
    <label>
        <input type="radio" onclick="getWjt()" name="workstyle" id="optionsRadios2" value="3"> 电话未接通
    </label>
</div>
</form>
<!-- ===================== -->
<script type="text/javascript">
    function getJt() {
        document.getElementById("div").style.display="";
    }
    function getWjt() {
        document.getElementById("div").style.display="none";
    }


</script>
</body>
</html>
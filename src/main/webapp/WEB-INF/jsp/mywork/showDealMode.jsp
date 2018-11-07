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
<input id="htid" type="hidden" value="${contract.htid}">
<!-- ===================== -->
<div class="radio">
    <label>
        <input type="radio" onclick="getJt()"  name="optionsRadios" id="jt" value="1" checked> 接通电话
    </label>
</div>
<form id="">
    <div class="form-group" display:none id="div">

            <label for="name">记录内容</label>
            <textarea class="form-control" rows="3" id="textarea"></textarea><br/>
                <span style="color:#ffcc99">如果续约可不用填写通话内容。如果在考虑请填写原因。如果解约请填写解约原因。方便总结问题！</span>
        <div class="radio">
            <label>
                <input type="radio"   name="optionsRadios1" id="jy" value="3" > 解约
            </label>
            <label>
                <input type="radio"   name="optionsRadios1" id="xy" value="4" > 续约
            </label>
            <label>
                <input type="radio"   name="optionsRadios1" id="qt" value="5" > 再考虑
            </label>
        </div>
    </div>
</form>

<div class="radio">
    <label>
        <input type="radio" onclick="getWjt()" name="optionsRadios" id="optionsRadios2" value="2"> 电话未接通
    </label>
</div>

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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


</head>
<body>
<!-- ===================== -->
<form id="ordersform">
            <div class="modal-body">
                <input type="hidden" name="oid" value="${orders.oid}">
                <div class="form-group">
                    <label for="txt_departmentname">收货人姓名</label>
                    <input type="text" name="name" class="form-control" id="txt_departmentname" value="${orders.name}">
                </div>
                <div class="form-group">
                    <label for="txt_parentdepartment">手机号</label>
                    <input type="text" name="phone" class="form-control" id="txt_parentdepartment" value="${orders.phone}">
                </div>
                <div class="form-group">
                    <label for="txt_departmentlevel">收货地址</label>
                    <input type="text" name="addr" class="form-control" id="txt_departmentlevel" value="${orders.addr}">
                </div>
            </div>
</form>
<!-- ===================== -->
<script type="text/javascript">

</script>
</body>
</html>
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


<c:forEach items="${goodsDetailsList}" var="goodsDetailsList">
    <h4>※所购商品※</h4>
    <div id="introduction" name="introduction" class="introduction">
        <div class="title">
            <strong>商品名称：${goodsDetailsList.pname}</strong>
        </div>
        <div>
            <img src="${goodsDetailsList.image}" height="100" width="100">
            商品描述：${goodsDetailsList.pdesc}
        </div>
        <div>
            <span style="color: #ff894f">原价：${goodsDetailsList.marketPrice}</span>
            现价：${goodsDetailsList.shopPrice}
        </div>


    </div>

<hr>
</c:forEach>



<!-- ===================== -->
<script type="text/javascript">

</script>
</body>
</html>
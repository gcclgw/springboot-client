<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>

支付失败！
<script>
    $(function(){
        location.href="<%=request.getContextPath()%>/loginUser/madd";
        /*$.ajax({
            url:'../seckill/updateOrderStatus',
            type:'post',
            dataType:'json',
            data:{},
            success:function(){
                location.href="../webapp/hjw/indexshou.jsp";
            }
        })*/
    })
</script>
</body>
</html>
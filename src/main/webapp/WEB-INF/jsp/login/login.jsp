<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Insert title here</title>

    <link rel="stylesheet" type="text/css" href="<%=path%>/static/easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/easyui/themes/icon.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/easyui/themes/color.css"/>
    <script type="text/javascript" src="<%=path%>/static/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/easyui/locale/easyui-lang-zh_CN.js"></script>

    <STYLE>
        body {
            background: #ebebeb;
            font-family: "Helvetica Neue", "Hiragino Sans GB", "Microsoft YaHei",
            "\9ED1\4F53", Arial, sans-serif;
            color: #222;
            font-size: 12px;
        }

        * {
            padding: 0px;
            margin: 0px;
        }

        .top_div {
            background: #008ead;
            width: 100%;
            height: 400px;
        }

        .ipt {
            border: 1px solid #d3d3d3;
            padding: 10px 10px;
            width: 250px;
            border-radius: 4px;
            padding-left: 35px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
            -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
            ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
            .15s;
            transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s
        }

        .ipt:focus {
            border-color: #66afe9;
            outline: 0;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
            rgba(102, 175, 233, .6);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
            rgba(102, 175, 233, .6)
        }

        .u_logo {
            background: url("<%=path%>/images/username.png") no-repeat;
            padding: 10px 10px;
            position: absolute;
            top: 43px;
            left: 63px;
        }

        .p_logo {
            background: url("<%=path%>/images/password.png") no-repeat;
            padding: 10px 10px;
            position: absolute;
            top: 12px;
            left: 63px;
        }

        a {
            text-decoration: none;
        }

        .tou {
            background: url("<%=path%>/images/tou.png") no-repeat;
            width: 97px;
            height: 92px;
            position: absolute;
            top: -87px;
            left: 140px;
        }

        .left_hand {
            background: url("<%=path%>/images/left_hand.png") no-repeat;
            width: 32px;
            height: 37px;
            position: absolute;
            top: -38px;
            left: 150px;
        }

        .right_hand {
            background: url("<%=path%>/images/right_hand.png") no-repeat;
            width: 32px;
            height: 37px;
            position: absolute;
            top: -38px;
            right: -64px;
        }

        .initial_left_hand {
            background: url("<%=path%>/images/hand.png") no-repeat;
            width: 30px;
            height: 20px;
            position: absolute;
            top: -12px;
            left: 100px;
        }

        .initial_right_hand {
            background: url("<%=path%>/images/hand.png") no-repeat;
            width: 30px;
            height: 20px;
            position: absolute;
            top: -12px;
            right: -112px;
        }

        .left_handing {
            background: url("<%=path%>/images/left-handing.png") no-repeat;
            width: 30px;
            height: 20px;
            position: absolute;
            top: -24px;
            left: 139px;
        }

        .right_handinging {
            background: url("<%=path%>/images/right_handing.png") no-repeat;
            width: 30px;
            height: 20px;
            position: absolute;
            top: -21px;
            left: 210px;
        }
    </STYLE>

    <SCRIPT type="text/javascript">
        $(function() {
            //得到焦点
            $("#password").focus(function() {
                $("#left_hand").animate({
                    left : "150",
                    top : " -38"
                }, {
                    step : function() {
                        if (parseInt($("#left_hand").css("left")) > 140) {
                            $("#left_hand").attr("class", "left_hand");
                        }
                    }
                }, 2000);
                $("#right_hand").animate({
                    right : "-64",
                    top : "-38px"
                }, {
                    step : function() {
                        if (parseInt($("#right_hand").css("right")) > -70) {
                            $("#right_hand").attr("class", "right_hand");
                        }
                    }
                }, 2000);
            });
            //失去焦点
            $("#password").blur(function() {
                $("#left_hand").attr("class", "initial_left_hand");
                $("#left_hand").attr("style", "left:100px;top:-12px;");
                $("#right_hand").attr("class", "initial_right_hand");
                $("#right_hand").attr("style", "right:-112px;top:-12px");
            });
        });
    </SCRIPT>

    <META name="GENERATOR" content="MSHTML 11.00.9600.17496">

</head>

<body>

<DIV class="top_div"></DIV>

<DIV
        style="background: rgb(255, 255, 255); margin: -100px auto auto; border: 1px solid rgb(231, 231, 231); border-image: none; width: 400px; height: 236px; text-align: center;">

    <DIV style="width: 165px; height: 96px; position: absolute;">

        <DIV class="tou"></DIV>

        <DIV class="initial_left_hand" id="left_hand"></DIV>

        <DIV class="initial_right_hand" id="right_hand"></DIV>
    </DIV>
    <form id="form1" action="login!login.action" method="post">
        <P style="padding: 30px 0px 10px; position: relative;">
            <SPAN class="u_logo"></SPAN> <INPUT class="ipt" id="loginNumber" type="text"
                                                placeholder="请输入用户名" value="">

        </P>

        <P style="position: relative;">
            <SPAN class="p_logo"></SPAN> <INPUT class="ipt" name="password" id="password"
                                                type="password" placeholder="请输入密码" value="">
        </P>

        <P style="position: relative;">
            <INPUT class="ipt" name="checkCode"
                   style="width: 37%;float: left;margin-left: 54px;margin-top: 10px;"
                   type="text" placeholder="请输入验证码" value="" id="veriftyCode">
            <img onclick="changerVeriftyCode()" id="verificationCode" src="/login/verificationCode" style="width: 22%;height: 15%;float: left;margin: 11px 5px;"/>
            <a href="javascript:changerVeriftyCode();" style="float: left;line-height: 57px;">换一张</a>
        </P>
    </form>

    <DIV
            style="height: 50px; line-height: 50px; margin-top: 68px; border-top-color: rgb(231, 231, 231); border-top-width: 1px; border-top-style: solid;">

        <P style="margin: 0px 35px 20px 45px;">
                    <SPAN style="float: left;"><A
                            style="color: rgb(204, 204, 204);" href="javaSCript:login2()">快速登录</A>
                    </SPAN> <SPAN style="float: right;"><A
                style="color: rgb(204, 204, 204); margin-right: 10px;" href="#">注册</A>
                        <span
                                style="background: rgb(0, 142, 173);cursor:pointer; padding: 7px 10px; border-radius: 4px; border: 1px solid rgb(26, 117, 152); border-image: none; color: rgb(255, 255, 255); font-weight: bold;"
                                id="loginBtn">登录</span> </SPAN>
        </P>
    </DIV>
</DIV>
<script type="text/javascript">

    function changerVeriftyCode(){
        $('#verificationCode').attr('src','/login/verificationCode?t='+new Date());
    }

    $('#loginBtn').click(function(){
        //$.messager.progress(); // 显示进度条
        $.ajax({
            url:'<%=path%>/login/login',
            type:'post',
            data:{
                username:$('#loginNumber').val(),
                password:$('#password').val(),
                userImgCode:$('#veriftyCode').val()
            },
            dataType:'json',
            success:function(data) {
                //$.messager.progress('close'); // 如果提交成功则隐藏进度条
                if (1 == data.flag) {
                    alert("验证码为空！");
                } else if (2 == data.flag) {
                    alert("验证码错误！");
                } else if (3 == data.flag) {
                    alert("用户名或密码错误！");
                } else if (4 == data.flag){
                    alert("登陆成功！");
                    location.href = "<%=path%>/user/toAdminIndex";
                }
            }
        })
    })

    //快速登录
    function login2(){

        location.href = "../user/toLogin3.do";

    }

</script>
<div style="text-align:center;"></div>

</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>一大堆红包下落抽奖</title>


    <meta name="Keywords" content="一大堆红包下落jQuery抽奖代码" />


    <meta name="description" content="一大堆红包下落jQuery抽奖代码" />

    <link href="http://img.chinaz.com/max-templates/passport/styles/topbar.css" type="text/css" rel="Stylesheet" />
    <link href="/style/style_kj.css" type="text/css" rel="stylesheet" />
    <link href="/style/demo.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="/style/js/jquery-1.2.pack.js"></script>
    <script type="text/javascript">
        var theme_list_open = false;
        $(document).ready(function () {
            function fixHeight() {
                var headerHeight = $("#switcher").height();
                $("#iframe").attr("height", $(window).height()-84 + "px");
            }
            $(window).resize(function () {
                fixHeight();
            }).resize();
            //响应式预览
            $('.icon-monitor').addClass('active');
            $(".icon-mobile-3").click(function () {
                $("#by").css("overflow-y", "auto");
                $('#iframe-wrap').removeClass().addClass('mobile-width-3');
                $('.icon-tablet,.icon-mobile-1,.icon-monitor,.icon-mobile-2,.icon-mobile-3').removeClass('active');
                $(this).addClass('active');
                return false;
            });

            $(".icon-mobile-2").click(function () {
                $("#by").css("overflow-y", "auto");
                $('#iframe-wrap').removeClass().addClass('mobile-width-2');
                $('.icon-tablet,.icon-mobile-1,.icon-monitor,.icon-mobile-2,.icon-mobile-3').removeClass('active');
                $(this).addClass('active');
                return false;
            });

            $(".icon-mobile-1").click(function () {
                $("#by").css("overflow-y", "auto");
                $('#iframe-wrap').removeClass().addClass('mobile-width');
                $('.icon-tablet,.icon-mobile,.icon-monitor,.icon-mobile-2,.icon-mobile-3').removeClass('active');
                $(this).addClass('active');
                return false;
            });

            $(".icon-tablet").click(function () {
                $("#by").css("overflow-y", "auto");
                $('#iframe-wrap').removeClass().addClass('tablet-width');
                $('.icon-tablet,.icon-mobile-1,.icon-monitor,.icon-mobile-2,.icon-mobile-3').removeClass('active');
                $(this).addClass('active');
                return false;
            });

            $(".icon-monitor").click(function () {
                $("#by").css("overflow-y", "hidden");
                $('#iframe-wrap').removeClass().addClass('full-width');
                $('.icon-tablet,.icon-mobile-1,.icon-monitor,.icon-mobile-2,.icon-mobile-3').removeClass('active');
                $(this).addClass('active');
                return false;
            });
        });
    </script>
    <script type="text/javascript">
        function Responsive($a) {
            if ($a == true) $("#Device").css("opacity", "100");
            if ($a == false) $("#Device").css("opacity", "0");
            $('#iframe-wrap').removeClass().addClass('full-width');
            $('.icon-tablet,.icon-mobile-1,.icon-monitor,.icon-mobile-2,.icon-mobile-3').removeClass('active');
            $(this).addClass('active');
            return false;
        };
    </script>
</head>
<body id="by" style="overflow-y: hidden" >
<div id="switcher">
    <div class="center">
        <ul>
            <li class="logoTop">在线预览！</li>
            <div id="Device">
                <li class="device-monitor"><a href="javascript:"><div class="icon-monitor"></div></a></li>
                <li class="device-mobile"><a href="javascript:"><div class="icon-tablet"> </div></a></li>
                <li class="device-mobile"><a href="javascript:"><div class="icon-mobile-1"> </div></a></li>
                <li class="device-mobile-2"><a href="javascript:"><div class="icon-mobile-2"> </div></a></li>
                <li class="device-mobile-3"><a href="javascript:"><div class="icon-mobile-3"> </div></a></li>
            </div>


        </ul>


    </div>
</div>

<script type="text/javascript">

    var description = '一大堆红包下落jQuery抽奖代码: 一大堆红包下落jQuery抽奖代码是一款节日抽奖转盘特效，可键盘控制旋转，背景为红包雨，图片可以更改，调整速度。';



    var sendT = {
        getHeader: function () {
            var g_title = description;
            var re = /<[^<>]*?font[^<>]*?>/gi;
            g_title = g_title.replace(re, "");
            return g_title;
        },
        getFirstImgSrc: function () {
            var allPageTags = document.getElementsByTagName("div");
            for (var i = 0; i < allPageTags.length; i++) {
                if (allPageTags[i].className == 'downtext') {
                    if (allPageTags[i].getElementsByTagName("img")[0] && allPageTags[i].getElementsByTagName("img")[0].width > 200) {
                        return allPageTags[i].getElementsByTagName("img")[0].src;
                    }
                    else {
                        return null;
                    }

                }
            }
        },
        getContent: function () {
            var allPageTagss = document.getElementsByTagName("div");
            for (var i = 0; i < allPageTagss.length; i++) {
                if (allPageTagss[i].className == 'downtext') {
                    return allPageTagss[i].innerHTML;
                }
            }
        }
    }



    document.getElementById("fxwb").onclick = function () {
        (function (s, d, e, r, l, p, t, z, c) {
            var f = 'http://service.weibo.com/share/share.php?appkey=872996044&', u = z || d.location, p = ['url=', e(u), '&title=', e(sendT.getHeader()), '&source=', e(r), '&sourceUrl=', e(l), '&content=', c || 'gb2312', '&pic=', e(p || '')].join('');
            function a() {
                if (!window.open([f, p].join(''), 'mb', ['toolbar=0,status=0,resizable=1,width=440,height=430,left=', (s.width - 440) / 2, ',top=', (s.height - 430) / 2].join(''))) u.href = [f, p].join('');
            };
            if (/Firefox/.test(navigator.userAgent)) setTimeout(a, 0); else a();
        })(screen, document, encodeURIComponent, 'CHINAZ', 'http://sc.chinaz.com/', sendT.getFirstImgSrc(), null, null, null);
    }



</script>
<script type="text/javascript" src="/js/softinfo.js.aspx?id=529105" defer="defer" charset="UTF-8"></script>
<div style="display:none">
    <script src="http://s4.cnzz.com/stat.php?id=300636&web_id=300636" language="JavaScript"></script>
</div>
</body>
</html>

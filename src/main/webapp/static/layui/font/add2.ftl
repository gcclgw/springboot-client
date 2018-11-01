<#assign base=request.contextPath />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${base}/static/layui/css/layui.css">
<link rel="stylesheet" href="${base}/static/layui/css/modules/layer/default/layer.css">
</head>
<body>

		姓名<input id="sname"><br>
		年龄<input id="saga"><br>
		性别	<input type="radio" name="ssex" value="1">男
			<input type="radio" name="ssex" value="2">女<br>
		班级名称:<select id="cl">
			<#list list as a>
				<option value="${a.claid}">${a.claname}</option>
			</#list>
		</select><br>
		入学日期：<input id="sdate"><br>
		个人情况：<textarea id="studesc"></textarea><br>
		爱好：<input type="checkbox" name="stuhobby" value="1">吃饭
			<input type="checkbox" name="stuhobby" value="2">睡觉
			<input type="checkbox" name="stuhobby" value="3">打豆豆<br>
		
		<div class="layui-upload">
		    <button type="button" class="layui-btn" id="test1">
		        <i class="layui-icon">&#xe67c;</i>图片
		    </button>
		</div>
		<div>
		    <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
		       预览图：
		        <div class="layui-upload-list" id="demo1">
		            <p id="demoText"></p>
		        </div>
		    </blockquote>
		</div>
		<input type="hidden" id="simg"><br>
		
		
		<input type="button" value="添加信息" onclick="addStu()">
		
		
<script type="text/javascript" src="${base}/static/jquery.min.js"></script>
<script src="${base}/static/layui/layui.all.js"></script>	

<script>

	function addStu() {
		var sname = $("#sname").val();
		var saga = $("#saga").val();
		var ssex = 1;
		$("[name='ssex']:checked").each(function(V, I) {
			ssex = $(this).val();
		});
		var sdate = $("#sdate").val();
		var simg = $("#simg").val();
		var cl=$("#cl").val();
		ffffff();
		var studesc = $("#studesc").val();
		
		var stuhobby = "";
		$("[name='stuhobby']:checked").each(function(V, I) {
			stuhobby = $(this).val();
		});
		var json = {
			sname:sname,
			saga:saga,
			ssex:ssex,
			sdate:sdate,
			simg:simg,
			bjjid:cl,
			studesc:studesc,
			stuhobby:stuhobby,
		}
		//ajax���ú�̨����ѧ����Ϣ�ı���
		$.ajax({
			url:"${base}/stu/add",
			data:json,
			dataType:"json",
			type:"post",
			success:function(data) {
				alert("保存成功");
				location.href="${base}/stu/queryStu";
			}
		});
	}
	
	var stueditor;
	layui.use(['form', 'upload', 'layedit', 'laydate'], function(){
            var form = layui.form;
            var upload = layui.upload;
            var edit = layui.layedit;
            var laydate = layui.laydate;
            
            //初始化编辑器
            stueditor = edit.build("studesc");
            
            ffffff = function() {
            	edit.sync(stueditor);
            }
            
            //初始化日期控件
            laydate.render({
            	elem:"#sdate"
            });
            
            var ssdd1;
            var uploadInst = upload.render({
                elem: '#test1'
                ,url: '${base}/stu/uploadStudentCover'
                ,field:"studentCover"
                ,before: function(obj){
                    ssdd1 = layer.open({
                        type: 1
                        ,title: false 
                        ,closeBtn: false
                        //,area: '300px;'
                        ,shade: 0.4
                        //,id: 'LAY_layuipro'
                        //,btn: ['火速围观', '残忍拒绝']
                        //,btnAlign: 'c'
                        ,moveType: 1 //��קģʽ��0����1
                        ,content: '<i class="layui-icon layui-anim layui-anim-rotate layui-anim-loop">&#xe63d;</i>'
                    });
                    obj.preview(function(index, file, result){
//                        $('#demo1').attr('src', result); 
                        $('#demo1').append('<img height="80px" src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
                    });
                }
                ,done: function(res){
                	//��һ���ϴ�����֮��ص�����
                    if (1 == res.code) {
                          $("#simg").val(res.fileUrl);
                    }
                    layer.close(ssdd1);
                    //����ϴ�ʧ��
//                    if(res.code ==0){
//                        return layer.msg('上传失败');
//                    }
                    //�ϴ��ɹ�
                }
                ,error: function(){
                    //��ʾʧ��״̬����ʵ���ش�
                    var demoText = $('#demoText');
                    demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">测试</a>');
                    demoText.find('.demo-reload').on('click', function(){
                        uploadInst.upload();
                    });
                }
            });
            
    });
	
	
	

</script>
</body>
</html>
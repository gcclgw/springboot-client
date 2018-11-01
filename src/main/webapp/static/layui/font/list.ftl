<#assign base=request.contextPath />

<a href="${base}/stu/selectBj">新增</a>
<table border="1" bgcolor="purple">
	<tr>
		<td><input type="checkbox" onchange="reverse_check()"></td>
		<td>编号</td>
		<td>姓名</td>
		<td>年龄</td>
		<td>性别</td>
		<td>入学日期</td>
		<td>爱好</td>
		<td>图片</td>
		<td>班级</td>
		<td>状态</td>
		<td>操作</td>
	</tr>
<#list map.list as a>
	<tr>
		<td><input type="checkbox" name="stu_checkbox" value="${a.sid}"></td>
		<td>${a.sid}</td>
		<td>${a.sname}</td>
		<td>${a.saga}</td>
		<td><#if a.ssex == 1>
					男
					<#else>
					女
				</#if>
			</td>
			<td>${a.sdate}</td>
			<td>
				<#if a.stuhobby??>
					<#if a.stuhobby?contains("1")>
						吃饭，
					</#if>
					<#if a.stuhobby?contains("2")>
						睡觉，
					</#if>
					<#if a.stuhobby?contains("3")>
						打豆豆
					</#if>
				</#if>
			
			</td>
		<td><img width="100" src="${base}/${a.simg}"></td>
		<td>
			<#if a.bjj??>
					${a.bjj.claname!'' }
			</#if>
		</td>
		<td>
				<#if a.stuStatus == 1 >正常</#if>
				<#if a.stuStatus == 2 >休学</#if>
				<#if a.stuStatus == 3 >毕业</#if>
		</td>
		<td>
				<a href="${base}/stu/del?id=${a.sid}">删除</a>
				<a href="${base}/stu/upda?id=${a.sid}">修改</a>
				<a href="${base}/stu/download?id=${a.sid}">下载图片</a>
			<#if a.stuStatus == 1 >
				<input type="button" value="休学" onclick="updateXx(${a.sid})">
				<input type="button" value="毕业" onclick="updateBy(${a.sid})">
			<#else>
				<input type="hidden" value="休学" onclick="updateXx(${a.sid})">
			</#if>
			<#if a.stuStatus == 2 >
				<input type="button"  value="复学" onclick="updateFu(${a.sid})">
				<input type="button" value="毕业" onclick="updateBy(${a.sid})">
			<#else>
				<input type="hidden"  value="复学" onclick="updateFu(${a.sid})">
			</#if> 
			<#if a.stuStatus == 3 >
				<input type="hidden" value="毕业" onclick="updateBy(${a.sid})">
			</#if>
				
		</td>
	</tr>
</#list>
	<tr>
		<td colspan="4">
				<#if map.pageNum <= 1>
				<input type="button" value="首页" disabled onclick="turn_page(1)">
				<input type="button" value="上一页" disabled onclick="turn_page(${map.pageNum - 1})">
			<#else>
				<input type="button" value="首页" onclick="turn_page(1)">
				<input type="button" value="上一页" onclick="turn_page(${map.pageNum - 1})">
			</#if>
			
			<#if map.pages <= map.pageNum>
				<input type="button" value="下一页" disabled onclick="turn_page(${map.pageNum + 1})">
				<input type="button" value="尾页" disabled onclick="turn_page(${map.pages})">
			<#else>
				<input type="button" value="下一页" onclick="turn_page(${map.pageNum + 1})">
				<input type="button" value="尾页" onclick="turn_page(${map.pages})">
			</#if>
			共${map.pages}页 共${map.total}条
	
		</td>
	</tr>
</table>
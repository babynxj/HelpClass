<%@page import="classhelp.guofeng.common.ClassInfo"%>
<%@page import="classhelp.guofeng.student.Student"%>
<%@page import="classhelp.guofeng.student.StudentUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	StudentUtil sUtil = new StudentUtil();
	Student stu = sUtil.getStudentInfo(id);
	ClassInfo classinfo = sUtil.getClassTeacherInfo(stu.getClassid());
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";   

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>学生主页</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/css/Share.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/css/Info.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/css/Menus.css" />

</head>

<script src="<%=basePath%>/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/js/menus.js" charset="utf-8"></script>
<script src="<%=basePath%>/js/jquery.movebg.js"></script>

<script type="text/javascript"
	src="http://webapi.amap.com/maps?v=1.3&key=7ac94a5c896074b8b86ef5b35f7490ce"></script>
<body>

	<div class="bgimg">
		<div class="classname">
			<h2><%=classinfo.getClassName()%></h2><br>
			<h3>
				教师：<%=classinfo.getTeacherName()%></h3>
		</div>
		<div class="indexbtn">
			<div id="weathertip" style="line-height: 25px"></div>
			<script type="text/javascript">
					AMap.service('AMap.Weather', function() {
						var weather = new AMap.Weather();
						//查询实时天气信息, 查询的城市到行政级别的城市，如朝阳区、杭州市
						weather.getLive('芝罘区', function(err, data) {
							if (!err) {
								var str = [];
								str.push('<div>' + '芝罘区' + '</div>');
								str.push('<div>' + data.weather + '&nbsp;&nbsp;'+data.temperature + '℃&nbsp;,&nbsp;&nbsp;' + data.windPower +'级'+data.windDirection +'风</div>');
								document.getElementById('weathertip').innerHTML = str.join('');
							}
						});
					});
			</script>
		</div>
	</div>
	<div class="list">
		<div class="listmenu">
			<div class="wraper">
				<div class="nav">
					<ul>
						<li class="nav-item cur"><a href="index_student.jsp?id=<%=id%>">我的首页</a></li>
						<li class="nav-item"><a href="student_work.jsp?id=<%=id%>">我的作业</a></li>
						<li class="nav-item"><a href="student_docheck.jsp?id=<%=id%>">我的考勤</a></li>
					</ul>
					<!--移动的滑动-->
					<div class="move-bg"></div>
					<!--移动的滑动 end-->
				</div>
			</div>

		</div>
	</div>

	<div class="neirong">
		<div class="neirongbg">
			<div class="neirongtxt">
				<h3>
					您的账号：<%=stu.getStudentid()%></h3><br>
				<h3>
					您的姓名：<%=stu.getName()%></h3><br>
				<h3>
					您的专业：<%=stu.getSpecialty()%></h3><br>
				<h3>
					您的联系电话：<%=stu.getPhone()%></h3><br>
				<h3>
					您的邮箱：<%=stu.getEmail()%></h3><br>
				<h3>
					您所在班级邀请码：<%=stu.getClassid()%></h3><br>
			</div>
		</div>
	</div>

	<div class="bottom">
		<div class="bottoms">
			EMail：<a href="mailto:iamguofeng@163.com">CLASS HELP</a>
			&nbsp;©2016&nbsp;Class:1405&nbsp;ID:20142203788&nbsp;Name:Guo Feng
		</div>
	</div>
	<iframe name="aa" style="display:none"></iframe>
</body>
</html>

<%@page import="classhelp.guofeng.util.Util"%>
<%@page import="classhelp.guofeng.mail.SendEmail"%>
<%@page import="classhelp.guofeng.teacher.Teacher"%>
<%@page import="classhelp.guofeng.teacher.TeacherUtil"%>
<%@page import="classhelp.guofeng.mail.Email"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	TeacherUtil tUtil = new TeacherUtil();
	Teacher tea = tUtil.getTeacherInfo(id);
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";   

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>通知-教师</title>

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
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/css/Rotate.css" />

</head>

<script src="<%=basePath%>/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/js/menus.js" charset="utf-8"></script>
<script src="<%=basePath%>/js/jquery.movebg.js"></script>
</head>
<body>
	<div class="bgimg2"></div>
	<div class="list">
		<div class="listmenu">
			<div class="wraper">
				<div class="nav">
					<ul>
						<li class="nav-item"><a
							href="index_teacher.jsp?id=<%=id%>">我的资料</a></li>
						<li class="nav-item"><a href="select_work.jsp?id=<%=id%>">布置作业</a></li>
						<li class="nav-item"><a href="select_check.jsp?id=<%=id%>">发布考勤</a></li>
						<li class="nav-item cur"><a href="push_mail.jsp?id=<%=id%>">推送通知</a></li>
					</ul>
					<!--移动的滑动-->
					<div class="move-bg"></div>
					<!--移动的滑动 end-->
				</div>
			</div>

		</div>
	</div>

	<div class="neirong">
		<div class="neirongbg2">
			<div class="neirongtxt">
				<form  class="mail" method="post" action="/classhelp/PushMailServlet" target="aa">
				<div class="logo">
				<img class="Rotation img" src="../images/email.jpg" width="128" height="128" />
				</div>
					请输入通知标题：<br> <input type="text" name="subject"
						class="mailtitle"><br> <br> 请输入通知内容：<br>
					<textarea name="content" class="mailtxt"></textarea>
					<br> <input type="hidden" name="host"
						value="<%=new Util().getMailHost(tea.getTmail())%>"> <input
						type="hidden" name="classid" value="<%=tea.getTclassid()%>">
					<input type="hidden" name="fromAddr" value="<%=tea.getTmail()%>">
					<input type="hidden" name="username" value="<%=tea.getTmail()%>">
					<input type="hidden" name="password" value="<%=tea.getMailcode()%>"><br>
					<br> 
					<div class="mailbtn">
					<input type="submit" value="发布通知" class="file">
					<input type="reset" value="重写" class="file">
					</div>
				</form>
				<br>
				<hr>
				<br>
				<h5>温馨提示</h5>
				
				<h5>1、请在资料页正确填写教师邮箱的客户端授权码。</h5>
				<h5>2、您点击发布按钮后，所有学生将会收到此通知邮件，最好让您的学生把教师邮箱加入白名单。</h5>
				<h5>3、请认真填写上述内容，不得出现广告性词语，通知内容请输入30词以上。否则可能审核为广告或垃圾邮件。</h5>
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


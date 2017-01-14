<%@page import="classhelp.guofeng.student.Student"%>
<%@page import="classhelp.guofeng.student.StudentUtil"%>
<%@page import="classhelp.guofeng.common.FinishWork"%>
<%@page import="classhelp.guofeng.teacher.Teacher"%>
<%@page import="classhelp.guofeng.teacher.TeacherUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String workid = request.getParameter("workid");
	TeacherUtil tUtil = new TeacherUtil();
	ArrayList fhlist = tUtil.getFinishWork(workid);
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";   

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>作业详情</title>

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

<body>
	<div class="bgimg2">
		<div class="classname">
			<h2></h2>
			<h3></h3>
		</div>

	</div>

	<div class="list">
		<div class="listmenu">
			<div class="wraper">
				<div class="nav">
					<ul>
						<li class="nav-item"><a
							href="index_teacher.jsp?id=<%=id%>">我的资料</a></li>
						<li class="nav-item cur"><a href="select_work.jsp?id=<%=id%>">布置作业</a></li>
						<li class="nav-item"><a href="select_check.jsp?id=<%=id%>">发布考勤</a></li>
						<li class="nav-item"><a href="push_mail.jsp?id=<%=id%>">推送通知</a></li>
					</ul>
					<!--移动的滑动-->
					<div class="move-bg"></div>
					<!--移动的滑动 end-->
				</div>
			</div>

		</div>
	</div>
	<div class="neirong">
		<div class="workall">
			作业
			<%=workid%>
			提交详情
		</div>
		<div class="neirongtxt2">
			<%
				StudentUtil sUtil = new StudentUtil();
				Student stu;
				FinishWork hw;
				int intPageSize; //一页显示的记录数
				int intRowCount; //记录总数
				int intPageCount; //总页数
				int intPage; //待显示页码
				int i = 0;
				String strPage;
				intPageSize = 8; //设置一页显示的记录数
				strPage = request.getParameter("page"); //取得待显示页码
				if (strPage == null) {
					/*表明在QueryString中没有page这一个参数，此时显示第一页数据*/
					intPage = 1;
				} else {
					//将字符串转换成整型
					intPage = java.lang.Integer.parseInt(strPage);
					if (intPage < 1)
						intPage = 1;
				}
				//记算总页数
				intRowCount = fhlist.size(); //获取记录总数
				intPageCount = (intRowCount + intPageSize - 1) / intPageSize;
				if (intPage > intPageCount)
					//调整待显示的页码
					intPage = intPageCount;
				if (intPageCount > 0) {
					i = (intPage - 1) * intPageSize;
					//将记录指针定位到待显示页的第一条记录上
					//显示数据
					int j = i;
					int x = intRowCount - intPageSize * intPage;
					if (x < 0) {
						j = i + x;
					}
					//----------------
					for (; i < (j + intPageSize); i++) {
						hw = (FinishWork) fhlist.get(i);
						stu = sUtil.getStudentInfo(hw.getStudentId());
			%>
			<div class="item2">
				<div class="itemtxt">
					学号：<%=hw.getStudentId()%>
					<span class="studentname"> </span> 姓名：<%=stu.getName()%>

					<div class="getwork">
						<form method="get" action="/classhelp/DownloadServlet" target="a">
							<input type="hidden" name="fileurl" value="<%=hw.getFileUrl()%>">
							<input class="file" type="submit" value="下载作业">
						</form>
					</div>


				</div>
			</div>
			<%
				}
				}
			%>

			<div class="mypage" align="center">
				<a
					href="select_onework.jsp?workid=<%=workid%>&id=<%=id%>&page=<%=1%>"><input
					class="pagebutton" type="button" value="首页"></a> <a
					href="select_onework.jsp?workid=<%=workid%>&id=<%=id%>&page=<%=intPageCount%>"><input
					class="pagebutton" type="button" value="尾页"></a> 共<%=intPageCount%>页作业&nbsp;&nbsp;第
				<%=intPage%>
				页
				<%
 	if (intPage < intPageCount) {
 %>
				<a
					href="select_onework.jsp?workid=<%=workid%>&id=<%=id%>&page=<%=intPage + 1%>"><input
					class="pagebutton" type="button" value="下一页"></a>
				<%
					}
					if (intPage > 1) {
				%>

				<a
					href="select_onework.jsp?workid=<%=workid%>&id=<%=id%>&page=<%=intPage - 1%>"><input
					class="pagebutton" type="button" value="上一页"></a>
				<%
					}
				%>
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

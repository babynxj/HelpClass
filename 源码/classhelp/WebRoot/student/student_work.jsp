<%@page import="classhelp.guofeng.common.ClassInfo"%>
<%@page import="classhelp.guofeng.util.Util"%>
<%@page import="classhelp.guofeng.common.HomeWork"%>
<%@page import="classhelp.guofeng.student.Student"%>
<%@page import="classhelp.guofeng.student.StudentUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	Util util = new Util();
	StudentUtil sUtil = new StudentUtil();
	Student stu = sUtil.getStudentInfo(id);
	ClassInfo classinfo = sUtil.getClassTeacherInfo(stu.getClassid());
	ArrayList hwlist = sUtil.getStudentWork(id);
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";   

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>我的作业-学生</title>
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
<script src="http://hovertree.com/ziyuan/jquery/jquery-1.12.0.min.js"
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/css/Menus.css" />

</head>
<script src="<%=basePath%>/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/js/menus.js" charset="utf-8"></script>
<script src="<%=basePath%>/js/jquery.movebg.js"></script>
<body>
	<div class="bgimg">
		<div class="classname">
			<h2><%=classinfo.getClassName()%></h2><br>
			<h3>
				教师：<%=classinfo.getTeacherName()%></h3>
		</div>
	</div>
	
	<div class="list">
		<div class="listmenu">
			<div class="wraper">
				<div class="nav">
					<ul>
						<li class="nav-item"><a
							href="index_student.jsp?id=<%=id%>">我的首页</a></li>
						<li class="nav-item cur"><a href="student_work.jsp?id=<%=id%>">我的作业</a></li>
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
		<div class="neirongtxt2">
			<%
				int intPageSize; //一页显示的记录数
				int intRowCount; //记录总数
				int intPageCount; //总页数
				int intPage; //待显示页码
				int i = 0;
				String strPage;
				intPageSize = 2; //设置一页显示的记录数
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
				intRowCount = hwlist.size(); //获取记录总数
				intPageCount = (intRowCount + intPageSize - 1) / intPageSize;
				if (intPage > intPageCount)
					//调整待显示的页码
					intPage = intPageCount;
				if (intPageCount > 0) {
					i = intRowCount - (intPage - 1) * intPageSize;
					//将记录指针定位到待显示页的第一条记录上
					//显示数据
					int j = i;
					int x = intRowCount - intPageSize * intPage;
					if (x < 0) {
						intPageSize = intPageSize + x;
					}
					//----------------
					for (i = j - 1; i >= j - intPageSize; i--) {
			%>
			<div class="item">
				<div class="itemtxt">
					<%
						HomeWork hw = (HomeWork) hwlist.get(i);
								String workid = hw.getWorkId();
					%>
					作业
					<%=workid%>
					<%="&nbsp;&nbsp;["
							+ util.chandate(hw.getBeginTime()) + "]"%>
					<br> <br>
					<div class="worktitle" style="color: #000000;font-size: 20px;">
						标题：<%=hw.getWorkTitle()%>
					</div>
					<br> 内容：<%=hw.getWorkText()%><br> <br> 附件：<%=hw.getFile()%><br>
					<br>
					<div class="end">
						<div class="enddate">
							截止日期：<%=util.chandate(hw.getEndTime())%>
						</div>
						<div class="sendfile">
							<form method="post" action="/classhelp/UploadServlet" target="aa"
								enctype="multipart/form-data">
								<input id="uploadBtn" class="upload" type="file"
									name="uploadFile" /> <input name="stuid" type="hidden"
									value="<%=stu.getStudentid()%>"> <input name="workid"
									type="hidden" value="<%=workid%>"> <input
									id="filesubmit" class="file" type="submit" value="上传作业" />
							</form>
						</div>
					</div>
				</div>
				<br>
			</div>
			<%
				}
				}
			%>

			<div class="mypage" align="center">
				<a href="student_work.jsp?id=<%=id%>&page=<%=1%>"><input
					class="pagebutton" type="button" value="首页"></a> <a
					href="student_work.jsp?id=<%=id%>&page=<%=intPageCount%>"><input
					class="pagebutton" type="button" value="尾页"></a> 共<%=intPageCount%>页作业&nbsp;&nbsp;第
				<%=intPage%>
				页
				<%
 	if (intPage < intPageCount) {
 %>
				<a href="student_work.jsp?id=<%=id%>&page=<%=intPage + 1%>"><input
					class="pagebutton" type="button" value="下一页"></a>
				<%
					}
					if (intPage > 1) {
				%>
				<a href="student_work.jsp?id=<%=id%>&page=<%=intPage - 1%>"><input
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

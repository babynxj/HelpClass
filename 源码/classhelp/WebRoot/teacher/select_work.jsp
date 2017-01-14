<%@page import="classhelp.guofeng.common.HomeWork"%>
<%@page import="classhelp.guofeng.teacher.Teacher"%>
<%@page import="classhelp.guofeng.teacher.TeacherUtil"%>
<%@page import="classhelp.guofeng.util.Util"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	Util util = new Util();
	TeacherUtil tUtil = new TeacherUtil();
	Teacher tea = tUtil.getTeacherInfo(id);
	ArrayList hwlist = tUtil.getPushWork(id);
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";   

%>

<!--  DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">-->
<!DOCTYPE HTML>
<html>
<head>

<title>作业-教师</title>

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
	href="<%=basePath%>/css/Window.css">

<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/css/Menus.css" />

</head>
<script type="text/javascript"
	src="<%=basePath%>/js/common.js"></script>
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
		<div class="indexbtn">
			<a href="javascript:void(0)"> <input class="classbtn"
				type="button" value="发布作业" onclick="window1()" />
			</a>
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
					//------------------------------
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
							<input class="file" type="button" value="查看完成情况"
								onclick="openThisWork(<%=workid%>,<%=id%>);">
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
				<a href="select_work.jsp?id=<%=id%>&page=<%=1%>"><input
					class="pagebutton" type="button" value="首页"></a> <a
					href="select_work.jsp?id=<%=id%>&page=<%=intPageCount%>"><input
					class="pagebutton" type="button" value="尾页"></a> 共<%=intPageCount%>页&nbsp;&nbsp;第
				<%=intPage%>
				页
				<%
 	if (intPage < intPageCount) {
 %>
				<a href="select_work.jsp?id=<%=id%>&page=<%=intPage + 1%>"><input
					class="pagebutton" type="button" value="下一页"></a>
				<%
					}
					if (intPage > 1) {
				%>
				<a href="select_work.jsp?id=<%=id%>&page=<%=intPage - 1%>"><input
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

	<div id="light" class="white_content">
		<form action="/classhelp/PushWorkServlet" method="get" target="aa">
			<div>
				<div class="windowtitle">
					<div class="windowtitletxt">发布新作业</div>
				</div>
				<div>
					<a href="javascript:void(0),location.reload();"> <input
						class="file" type="submit" value="发 布" onclick="window2()">
					</a> <a href="javascript:void(0);"> <input class="file"
						type="button" value="取 消" onclick="window2()">
					</a>
				</div>
			</div>
			<div class="windowtxt">

				请输入作业序号： <input type="number" name="work_id" maxlength="10"><br>
				<br> 请输入作业标题： <input type="text" name="work_title"
					maxlength="30"><br> <br> 请输入作业内容：
				<textarea name="work_txt" class="winworktxt"></textarea>
				<br> <br> 请选择开始时间： <input type="date" name="work_btime"><br>
				<br> 请选择结束时间： <input type="date" name="work_etime"><br>
				<br> <input type="hidden" name="work_teacherid"
					value="<%=tea.getTeacherid()%>"> <input type="hidden"
					name="work_classid" value="<%=tea.getTclassid()%>">

			</div>
		</form>
	</div>
	<div id="fade" class="black_overlay"></div>
</body>
</html>
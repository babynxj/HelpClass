<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>课堂帮-注册</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/Info.css" />
<script src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/Register.css" />
</head>
<body>
	<div class="regtitle" align="center">
		课堂帮
		<hr class="myhr">
	</div>

	<div class="main-page">
		<div class="left">
			<div class="nav-back"></div>
			<div class="nav">
				<div class="on">注册学生账户</div>
				<div>注册教师账户</div>
			</div>
		</div>
		<div class="right">
			<div class="content-back"></div>
			<div class="content">
				<div>
					<form class="regstu" action="/classhelp/RegisterServlet" target="aa">
						<input type="hidden" name="what" value="student">	
						<label>设置账号</label><input type="text" name="id" maxlength="10" >
						<span class="tip">请输入4~10位的数字或英文</span>
						<br><br>
						<label>设置密码</label><input type="password" name="pwd1" maxlength="20">
						<span class="tip">请输入4~20位的字符(非汉字)</span>
						<br><br>
						<label>重复密码</label><input type="password" name="pwd2" maxlength="20">
						<span class="tip">请重新输入一遍密码</span>
						<br><br>
						<label>名字</label><input type="text" name="username" maxlength="20">
						<span class="tip">请输入你的真实姓名</span>
						<br><br>
						<label>专业</label><input type="text" name="specialty" maxlength="50">
						<span class="tip">请输入你所修专业</span>
						<br><br>
						<label>邮箱</label><input type="text" name="email" maxlength="50">
						<span class="tip">请输入邮箱地址,由英文和数字、下划线组成</span>
						<br><br>
						<label>手机号码</label><input type="text" name="phone" maxlength="11">
						<span class="tip">请输入有效的手机号</span>
						<br><br>
						<label>课堂邀请码</label><input type="text" name="classid" maxlength="10">
						<span class="tip">请输入从老师所获得的课程码</span>
						<br><br>
						<input class="file" type="submit" value="注册学生账号">
						<input class="file" type="reset" value="重填">
					</form>
				</div>
				<div>
					<form class="regtea" action="/classhelp/RegisterServlet" target="aa">	
						<input type="hidden"  name="what" value="teacher">	
						<label>设置账号</label><input type="text" name="id" maxlength="10">
						<span class="tip">请输入4~10位数字或英文</span>
						<br><br>
						<label>设置密码</label><input type="password" name="pwd1" maxlength="20">
						<span class="tip">请输入4~20位字符(非汉字)</span>
						<br><br>
						<label>重复密码</label><input type="password" name="pwd2" maxlength="20">
						<span class="tip">请重新输入一遍密码</span>
						<br><br>
						<label>名字</label><input type="text" name="username" maxlength="20">
						性别 <input type="text" name="sex" maxlength="1" size="1">
						<span class="tip">请输入你的真实姓名和性别</span>
						<br><br>
						<label>邮箱</label><input type="text" name="email" maxlength="50">
						<span class="tip">请输入邮箱地址,由英文和数字、下划线组成</span>
						<br><br>
						<label>手机号码</label><input type="text" name="phone" maxlength="11">
						<span class="tip">请输入有效的手机号</span>
						<br><br>
						<label>创建课堂码</label><input type="text" name="setclasssid" maxlength="10">
						<span class="tip">请输入4位字符(非汉字),作为您班级的邀请码</span>
						<br><br>
						<label>邮箱授权码</label><input type="password" name="mailcode" maxlength="30">
						<span class="tip">请输入上面填写的邮箱客户端授权码</span>
						<br><br>
						<input class="file" type="submit" value="注册教师账号">
						<input class="file" type="reset" value="重填">
					</form>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<script type="text/javascript">
		$(".main-page .nav div").mouseenter(function() {
			var $this = $(this);
			var index = $this.index();
		}).mouseleave(function() {
			var $this = $(this);
			var index = $this.index();
		}).click(function() {
			var $this = $(this);
			var index = $this.index();
			var l = -(index * 390);
			$(".main-page .nav div").removeClass("on");
			$(".main-page .nav div").eq(index).addClass("on");
			$(".main-page .content div:eq(0)").stop().animate({
				"margin-top" : l
			}, 500);
		});
	</script>

<iframe name="aa" style="display:none"></iframe>
</body>
</html>
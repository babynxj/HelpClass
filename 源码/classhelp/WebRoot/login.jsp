<%@page import="classhelp.guofeng.util.LoginCheck"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String login = request.getParameter("login");

	if(login!=null&&login.trim().equals("true")){
		String identity=request.getParameter("identity");//获取身份标识
		String id = request.getParameter("username");
		String pwd = request.getParameter("password");
		
		LoginCheck lc=new LoginCheck();
		if(identity.equals("i_student")){	
			if(lc.CheakStudent(id,pwd)==1){
				response.sendRedirect("student/index_student.jsp?id="+id);
			}
		}
		else if(identity.equals("i_teacher")){
			if(lc.CheakTeacher(id,pwd)==1){
				response.sendRedirect("teacher/index_teacher.jsp?id="+id);
			}
		}
	}

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>课堂帮-登录</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/Login.css" />
</head>

<body>
	<div class="container">
		<section id="content">
		<form action="login.jsp" method="post">
			<h1>课堂帮</h1>
			<input type="hidden" value="true" name="login">
			<div>
				<input type="text" placeholder="用户名" required="" name="username" id="username" />
			</div>
			<div>
				<input type="password" placeholder="密码" required="" name="password" id="password" />
			</div>
			<div>
				<input type="submit" value="登录" /> 
				<div class="styled-select">
					<select name="identity">
					    <option value="i_student">学生</option>
					    <option value="i_teacher">教师</option>
					</select>
				</div>
				<div  class="reg">
					<a  href="register.jsp">点我注册</a>
				</div>	
			</div>
		</form>
		<!-- form -->
		<div class="button">
			<a href="login.jsp">"奇迹每天都在发生。"  《阿甘正传》</a>
		</div>
		<!-- button --> </section>
		<!-- content -->
	</div>
	<!-- container -->
</body>
</html>

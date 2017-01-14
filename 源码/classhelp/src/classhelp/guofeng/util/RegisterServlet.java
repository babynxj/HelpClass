package classhelp.guofeng.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");

		String what = request.getParameter("what");
		if (what.equals("student")) {
			signStudent(request, response);

		} else if (what.equals("teacher")) {
			signTeacher(request, response);
		}
	}

	public void signTeacher(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pwd1 = request.getParameter("pwd1");
		String pwd2 = request.getParameter("pwd2");
		String sex = request.getParameter("sex");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String classid = request.getParameter("setclasssid");
		String mailcode = request.getParameter("mailcode");
		PrintWriter out = response.getWriter();
		System.out.println("classid:"+classid);

		if (pwd1.trim().equals(pwd2.trim())) {
			String sql = "insert into teacher(teacherid,tpassword,tname,sex,classid,tphone,temail,emailcode) values(?,?,?,?,?,?,?,?)";
			Connection conn = DBbean.getConn();
			PreparedStatement ps = DBbean.getPrepareStatement(conn, sql);
			try {
				ps.setString(1, id);
				ps.setString(2, pwd1);
				ps.setString(3, username);
				ps.setString(4, sex);
				ps.setString(5, classid);
				ps.setString(6, phone);
				ps.setString(7, email);
				ps.setString(8, mailcode);
				ps.executeUpdate();
				out.print("<script>alert('注册教师账号成功！');</script>");
			} catch (SQLException e) {
				out.print("<script>alert('此用户名已经被注册，请更换 ！');</script>");
				e.printStackTrace();	
			} finally {
				DBbean.close(ps);
				DBbean.close(conn);
			}
		} else {
			out.print("<script>alert('您两次输入的密码不匹配！');</script>");
		}
		out.close();
	}

	public void signStudent(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pwd1 = request.getParameter("pwd1");
		String pwd2 = request.getParameter("pwd2");
		String specialty = request.getParameter("specialty");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String classid = request.getParameter("classid");
		PrintWriter out = response.getWriter();

		if (pwd1.trim().equals(pwd2.trim())) {
			String sql = "insert into student(studentid,password,name,specialty,email,phone,classid) values(?,?,?,?,?,?,?)";
			Connection conn = DBbean.getConn();
			PreparedStatement ps = DBbean.getPrepareStatement(conn, sql);
			try {
				ps.setString(1, id);
				ps.setString(2, pwd1);
				ps.setString(3, username);
				ps.setString(4, specialty);
				ps.setString(5, email);
				ps.setString(6, phone);
				ps.setString(7, classid);
				ps.executeUpdate();
				out.print("<script>alert('注册学生账号成功！');</script>");
			} catch (SQLException e) {
				out.print("<script>alert('此用户名已经被注册，请更换 ！');</script>");
				e.printStackTrace();
			} finally {
				DBbean.close(ps);
				DBbean.close(conn);
			}
		} else {
			out.print("<script>alert('您两次输入的密码不匹配！');</script>");
		}
		out.close();
	}
}

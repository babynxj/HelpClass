package classhelp.guofeng.mail;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classhelp.guofeng.util.DBbean;

public class PushMailServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
		Email email = new Email();
		email.setHost(request.getParameter("host"));
		email.setUsername(request.getParameter("username"));
		email.setPassword(request.getParameter("password"));
		String s=new String(request.getParameter("subject").getBytes("ISO-8859-1"),"UTf-8");
		String c=new String(request.getParameter("content").getBytes("ISO-8859-1"),"UTf-8");
		email.setSubject(s);
		email.setContent(c);
		email.setFromAddr(request.getParameter("fromAddr"));
		email.setAddresses(getStudentEmail(request.getParameter("classid")));
		if (new SendEmail(email).sendMail()) {
			pw.print("<script>alert('群发EMail完成！');</script>");
			
		}else{
			pw.print("<script>alert('群发EMail失败，请重试！');</script>");
		}
		pw.close();
	}

	/**
	 * 查询此课程学生Email
	 * 
	 * @param classId
	 * @return
	 */
	public ArrayList<String> getStudentEmail(String classId) {
		ArrayList<String> addresses = new ArrayList<String>();
		String sql = "SELECT * FROM student where classid='" + classId + "'";
		Connection conn = DBbean.getConn();
		Statement stmt = DBbean.getStatement(conn);
		ResultSet rs = DBbean.getResultSet(stmt, sql);
		try {
			while (rs.next()) {
				if (!rs.getString("email").trim().equals("")) {
					addresses.add(rs.getString("email").trim());
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBbean.close(rs);
			DBbean.close(stmt);
			DBbean.close(conn);
		}
		return addresses;
	}
}

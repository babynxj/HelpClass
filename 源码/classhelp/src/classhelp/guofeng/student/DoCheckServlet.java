package classhelp.guofeng.student;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classhelp.guofeng.util.DBbean;

public class DoCheckServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private String check_id;
	private String student_id;
	private String check_number;
	private int flag = 0;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
		check_id = request.getParameter("checkid");
		student_id = request.getParameter("stuid");
		check_number = request.getParameter("checknumber");

		// 查询获得数据库此考勤信息
		String sql = "select * from checksign where checkid='" + check_id + "'";
		Connection conn = DBbean.getConn();
		Statement stmt = DBbean.getStatement(conn);
		ResultSet rs = DBbean.getResultSet(stmt, sql);

		// 验证码为空
		if (check_number.trim().equals("") || check_number.trim() == null) {
			pw.print("<script>alert('请输入考勤验证码！');</script>");
		} else {
			// 验证码不为空
			try {
				// 数据库有此考勤信息
				if (rs.next()) {
					flag = Integer.parseInt(rs.getString("flag"));
					// 此考勤还没有过期
					if (flag == 1) {
						String check_number_t = rs.getString("number");
						// 验证码输入正确
						if (check_number_t.equals(check_number)) {
							String sql2 = "insert into finishcheck(checkid,studentid) values('"
									+ check_id + "','" + student_id + "')";
							DBbean.getResultSetOfInsert(stmt, sql2);
							pw.print("<script>alert('O(∩_∩)O 考勤成功！');</script>");
						} else {
							pw.print("<script>alert('您输入的考勤码不正确！');</script>");
						}
					} else {
						pw.print("<script>alert('此考勤已经过期！');</script>");
					}
				} else {
					pw.print("<script>alert('不存在此考勤信息!');</script>");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBbean.close(rs);
				DBbean.close(stmt);
				DBbean.close(conn);
				pw.close();
			}
		}
	}

}

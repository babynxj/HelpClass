package classhelp.guofeng.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 验证学生登录
 * 
 * @author GUOFENG
 * 
 */
public class LoginCheck {

	public int CheakStudent(String id, String pwd) {

		String sql = "SELECT * FROM student where studentid='" + id + "'" + " "
				+ "and" + " " + "password='" + pwd + "'";
		Connection conn = DBbean.getConn();
		Statement stmt = DBbean.getStatement(conn);
		ResultSet rs = DBbean.getResultSet(stmt, sql);
		try {
			if (rs.next()) {
				return 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			DBbean.close(rs);
			DBbean.close(stmt);
			DBbean.close(conn);
		}
		return 0;
	}

	public int CheakTeacher(String id, String pwd) {

		String sql = "SELECT * FROM teacher where teacherid='" + id + "'" + " "
				+ "and" + " " + "tpassword='" + pwd + "'";
		Connection conn = DBbean.getConn();
		Statement stmt = DBbean.getStatement(conn);
		ResultSet rs = DBbean.getResultSet(stmt, sql);
		try {
			if (rs.next()) {
				return 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			DBbean.close(rs);
			DBbean.close(stmt);
			DBbean.close(conn);
		}
		return 0;
	}
}

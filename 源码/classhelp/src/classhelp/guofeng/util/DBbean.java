package classhelp.guofeng.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 数据库操作封装类
 * 
 * @author GUOFENG
 * 
 */
public class DBbean {
	// get连接
	public static Connection getConn() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String user = "root";
			String pwd = "root";
			String url = "jdbc:mysql://localhost:3306/classhelp?useUnicode=true&characterEncoding=UTF-8&useSSL=true";
			conn = DriverManager.getConnection(url, user, pwd);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return conn;
	}

	// get容器
	public static Statement getStatement(Connection conn) {
		Statement stmt = null;
		try {
			if (conn != null) {
				stmt = conn.createStatement();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stmt;
	}

	// get结果集
	public static ResultSet getResultSet(Statement stmt, String sql) {
		ResultSet rs = null;
		try {
			if (stmt != null) {
				rs = stmt.executeQuery(sql);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	// get结果集
	public static void getResultSetOfInsert(Statement stmt, String sql) {
		try {
			if (stmt != null) {
				stmt.execute(sql);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static PreparedStatement getPrepareStatement(Connection conn,
			String sql) {
		PreparedStatement pstmt = null;
		try {
			if (conn != null) {
				pstmt = conn.prepareStatement(sql);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pstmt;
	}

	public static PreparedStatement prepareStmt(Connection conn, String sql) {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
		} catch (SQLException e) {
		}
		return pstmt;
	}

	// close连接
	public static void close(Connection conn) {
		try {
			if (conn != null) {
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// close容器
	public static void close(Statement stmt) {
		try {
			if (stmt != null) {
				stmt.close();
				stmt = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// close结果集
	public static void close(ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// close PS
	public static void close(PreparedStatement prepareStmt) {
		try {
			if (prepareStmt != null) {
				prepareStmt.close();
				prepareStmt = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

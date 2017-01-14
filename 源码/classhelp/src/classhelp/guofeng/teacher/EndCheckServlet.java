package classhelp.guofeng.teacher;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classhelp.guofeng.util.DBbean;

public class EndCheckServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private String checkid;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		checkid = request.getParameter("checkid");
		endThisCheck(checkid);
		request.getRequestDispatcher("/teacher/select_check.jsp?id=101")
				.forward(request, response);
	}

	/**
	 * ½áÊø´Ë´Î¿¼ÇÚ
	 * 
	 * @param workid
	 * @return
	 */
	public void endThisCheck(String checkid) {
		Connection conn = null;
		Statement stmt = null;
		try {
			String sql = "UPDATE checksign SET flag = 0 WHERE checkid = '"
					+ checkid + "'";
			conn = DBbean.getConn();
			stmt = DBbean.getStatement(conn);
			DBbean.getResultSetOfInsert(stmt, sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBbean.close(stmt);
			DBbean.close(conn);
		}
	}
}

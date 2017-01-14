package classhelp.guofeng.teacher;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classhelp.guofeng.util.DBbean;

public class PushCheckServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	String check_id;
	String check_number;
	String check_title;
	String flag;
	String classid;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		check_id= request.getParameter("check_id");
		check_title=request.getParameter("check_title");
		check_number = request.getParameter("check_number");
		flag = request.getParameter("flag");
		classid = request.getParameter("classid");
		
		PrintWriter pw = response.getWriter();
		// 保存到数据库
		String sql = "insert into checksign(checkid,ctitle,flag,classid,number)"
				+ " values('"
				+ check_id
				+ "','"
				+ check_title
				+ "','"
				+ flag
				+ "','"
				+ classid
				+ "','" 
				+ check_number + "')";
		Connection conn = DBbean.getConn();
		Statement stmt = DBbean.getStatement(conn);
		DBbean.getResultSetOfInsert(stmt, sql);
		DBbean.close(stmt);
		DBbean.close(conn);
		//pw.print("<script>document.getElementById('checkbutton').value= \"ing...\";</script>");
		pw.close();

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}

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

public class PushWorkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String work_id;
	private String work_title;
	private String work_txt;
	private String work_btime;
	private String work_etime;
	private String work_teacherid;
	private String work_classid;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		work_id = request.getParameter("work_id");
		work_title = request.getParameter("work_title");
		work_txt = request.getParameter("work_txt");
		work_btime = request.getParameter("work_btime");
		work_etime = request.getParameter("work_etime");
		work_teacherid = request.getParameter("work_teacherid");
		work_classid = request.getParameter("work_classid");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
		// 保存到数据库
		String sql = "insert into homework(workid,worktitle,worktxt,btime,etime,teacherid,classid)"
				+ " values('"
				+ work_id
				+ "','"
				+ work_title
				+ "','"
				+ work_txt
				+ "','"
				+ work_btime
				+ "','"
				+ work_etime
				+ "','"
				+ work_teacherid
				+ "','" 
				+ work_classid + "')";
		Connection conn = DBbean.getConn();
		Statement stmt = DBbean.getStatement(conn);
		DBbean.getResultSetOfInsert(stmt, sql);
		DBbean.close(stmt);
		DBbean.close(conn);
		pw.print("<script>alert('" + "您的作业：" + work_id + " 发布完成！');</script>");
		pw.close();

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}

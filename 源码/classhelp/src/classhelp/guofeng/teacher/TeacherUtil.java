package classhelp.guofeng.teacher;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import classhelp.guofeng.common.CheckSign;
import classhelp.guofeng.common.FinishCheck;
import classhelp.guofeng.common.FinishWork;
import classhelp.guofeng.common.HomeWork;
import classhelp.guofeng.util.DBbean;

public class TeacherUtil {

	/**
	 * 查询教师资料
	 * 
	 * @param teaId
	 * @return
	 */
	public Teacher getTeacherInfo(String teaId) {
		Teacher tea = new Teacher();
		String sql = "SELECT * FROM teacher where teacherid='" + teaId + "'";
		Connection conn = DBbean.getConn();
		Statement stmt = DBbean.getStatement(conn);
		ResultSet rs = DBbean.getResultSet(stmt, sql);
		try {
			if (rs.next()) {
				tea.setTeacherid(rs.getString("teacherid"));
				tea.setTname(rs.getString("tname"));
				tea.setTphone(rs.getString("tphone"));
				tea.setTclassid(rs.getString("classid"));
				tea.setTsex(rs.getString("sex"));
				tea.setTmail(rs.getString("temail"));
				tea.setMailcode(rs.getString("emailcode"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBbean.close(rs);
			DBbean.close(stmt);
			DBbean.close(conn);
		}
		return tea;
	}

	/**
	 * 查询发布的作业
	 * 
	 * @param teaid
	 * @return
	 */
	public ArrayList getPushWork(String teaid) {
		ArrayList workList = new ArrayList();

		String sql = "SELECT * FROM teacher where teacherid='" + teaid + "'";
		Connection conn = DBbean.getConn();
		Statement stmt = DBbean.getStatement(conn);
		ResultSet rs = DBbean.getResultSet(stmt, sql);

		try {
			if (rs.next()) {
				String sql2 = "SELECT * FROM homework where classid='"
						+ rs.getString("classid") + "'";
				ResultSet rs2 = DBbean.getResultSet(stmt, sql2);
				while (rs2.next()) {
					HomeWork hw = new HomeWork();
					hw.setWorkId(rs2.getString("workid"));
					hw.setWorkTitle(rs2.getString("worktitle"));
					hw.setWorkText(rs2.getString("worktxt"));
					hw.setFile(rs2.getString("file"));
					hw.setBeginTime(rs2.getString("btime"));
					hw.setEndTime(rs2.getString("etime"));
					hw.setClassId(rs2.getString("classid"));
					hw.setTeacherId(rs2.getString("teacherid"));
					workList.add(hw);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBbean.close(rs);
			DBbean.close(stmt);
			DBbean.close(conn);
		}
		return workList;
	}

	/**
	 * 查询创建的考勤
	 * 
	 * @param teaid
	 * @return
	 */
	public ArrayList getPushCheck(String classid) {
		ArrayList checkList = new ArrayList();
		String sql = "SELECT * FROM checksign where classid='" + classid + "'";
		Connection conn = DBbean.getConn();
		Statement stmt = DBbean.getStatement(conn);
		ResultSet rs = DBbean.getResultSet(stmt, sql);

		try {

			while (rs.next()) {
				CheckSign cs = new CheckSign();
				cs.setCheckid(rs.getString("checkid"));
				cs.setChecktitle(rs.getString("ctitle"));
				cs.setFlag(rs.getString("flag"));
				cs.setClassid(rs.getString("classid"));
				cs.setNumber(rs.getString("number"));
				checkList.add(cs);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBbean.close(rs);
			DBbean.close(stmt);
			DBbean.close(conn);
		}
		return checkList;
	}

	/**
	 * 查询已经完成的作业
	 * 
	 * @param workid
	 * @return
	 */
	public ArrayList getFinishWork(String workid) {

		ArrayList workList = new ArrayList();
		String sql = "SELECT * FROM finishwork where workid='" + workid + "'";
		Connection conn = DBbean.getConn();
		Statement stmt = DBbean.getStatement(conn);
		ResultSet rs = DBbean.getResultSet(stmt, sql);

		try {
			while (rs.next()) {
				FinishWork fw = new FinishWork();
				fw.setWorkId(rs.getString("workid"));
				fw.setStudentId(rs.getString("studentid"));
				fw.setFileUrl(rs.getString("fileurl"));
				workList.add(fw);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBbean.close(rs);
			DBbean.close(stmt);
			DBbean.close(conn);
		}
		return workList;
	}

	/**
	 * 查询已经完成的考勤
	 * 
	 * @param workid
	 * @return
	 */
	public ArrayList getFinishCheck(String checkid) {

		ArrayList checkList = new ArrayList();
		String sql = "SELECT * FROM finishcheck where checkid='" + checkid
				+ "'";
		Connection conn = DBbean.getConn();
		Statement stmt = DBbean.getStatement(conn);
		ResultSet rs = DBbean.getResultSet(stmt, sql);

		try {
			while (rs.next()) {
				FinishCheck fc = new FinishCheck();
				fc.setCheckId(rs.getString("checkid"));
				fc.setStudentId(rs.getString("studentid"));
				checkList.add(fc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBbean.close(rs);
			DBbean.close(stmt);
			DBbean.close(conn);
		}
		return checkList;
	}
}

package classhelp.guofeng.student;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import classhelp.guofeng.common.CheckSign;
import classhelp.guofeng.common.ClassInfo;
import classhelp.guofeng.common.HomeWork;
import classhelp.guofeng.util.DBbean;

public class StudentUtil {

	/**
	 * 查询学生资料
	 * 
	 * @param stuId
	 * @return
	 */
	public Student getStudentInfo(String stuId) {
		Student stu = new Student();

		String sql = "SELECT * FROM student where studentid='" + stuId + "'";
		Connection conn = DBbean.getConn();
		Statement stmt = DBbean.getStatement(conn);
		ResultSet rs = DBbean.getResultSet(stmt, sql);
		try {
			if (rs.next()) {
				stu.setStudentid(rs.getString("studentid"));
				stu.setName(rs.getString("name"));
				stu.setPhone(rs.getString("phone"));
				stu.setSpecialty(rs.getString("specialty"));
				stu.setClassid(rs.getString("classid"));
				stu.setEmail(rs.getString("email"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBbean.close(rs);
			DBbean.close(stmt);
			DBbean.close(conn);
		}
		return stu;
	}

	/**
	 * 查询作业
	 * 
	 * @param stuid
	 * @return
	 */
	public ArrayList getStudentWork(String stuid) {
		ArrayList workList = new ArrayList();

		String sql = "SELECT * FROM student where studentid='" + stuid + "'";
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
	 * 查询班级考勤
	 * 
	 * @param classid
	 * @returnf
	 */
	public ArrayList getStudentCheck(String classid) {
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
	 * 查询所选课程的基本信息
	 * 
	 * @param classid
	 * @return
	 */
	public ClassInfo getClassTeacherInfo(String classid) {
		ClassInfo classinfo = new ClassInfo();

		String sql = "SELECT * FROM class where classid='" + classid + "'";
		Connection conn = DBbean.getConn();
		Statement stmt = DBbean.getStatement(conn);
		ResultSet rs = DBbean.getResultSet(stmt, sql);
		try {
			if (rs.next()) {
				classinfo.setClasssId(rs.getString("classid"));
				classinfo.setClassName(rs.getString("classname"));
				classinfo.setTeacherName(rs.getString("teachername"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBbean.close(rs);
			DBbean.close(stmt);
			DBbean.close(conn);
		}
		return classinfo;
	}
}

package classhelp.guofeng.student;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.Connection;
import java.sql.Statement;
import java.util.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.fileupload.disk.*;
import classhelp.guofeng.util.DBbean;

/**
 * 文件上传
 * 
 * @author GUOFENG
 * 
 */
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private String filePath; // 文件存放目录
	private String tempPath; // 临时文件目录
	private String studentid;
	private String workid;
	private String filename;
	private String SQLFileName;

	// 初始化
	public void init(ServletConfig config) throws ServletException {
		// super.init(config);
		// 可以从配置文件中获得初始化参数
		// filePath = config.getInitParameter("filepath");
		// tempPath = config.getInitParameter("temppath");
		// ServletContext context = getServletContext();
		// filePath = context.getRealPath(filePath);
		// tempPath = context.getRealPath(tempPath);
		filePath = "D:/ClassHelpFile/file";
		tempPath = "D:/ClassHelpFile/temp";
	}

	// doPost
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
		res.setContentType("text/html");
		res.setCharacterEncoding("utf-8");
		PrintWriter pw = res.getWriter();
		try {
			DiskFileItemFactory diskFactory = new DiskFileItemFactory();
			// threshold 极限、临界值，即硬盘缓存 1M
			diskFactory.setSizeThreshold(10 * 1024);
			// repository 贮藏室，即临时文件目录
			diskFactory.setRepository(new File(tempPath));

			ServletFileUpload upload = new ServletFileUpload(diskFactory);
			// 防止乱码
			upload.setHeaderEncoding("UTF-8");
			// 设置允许上传的最大文件大小
			upload.setSizeMax(10 * 1024 * 1024);
			// 解析HTTP请求消息头

			List<FileItem> fileItems = upload.parseRequest(req);
			Iterator<FileItem> iter = fileItems.iterator();
			while (iter.hasNext()) {
				FileItem item = (FileItem) iter.next();
				if (item.isFormField()) {
					processFormField(item, pw);// 处理表单内容
				} else {
					processUploadFile(item, pw);// 处理上传的文件
				}
			}

			SQLFileName = filePath + "/" + filename;
			//System.out.println(workid + " & " + studentid + " & " + SQLFileName);
			// 保存到数据库
			String sql = "insert into finishwork(workid,studentid,fileurl) values('"
					+ workid + "','" + studentid + "','" + SQLFileName + "')";
			Connection conn = DBbean.getConn();
			Statement stmt = DBbean.getStatement(conn);
			DBbean.getResultSetOfInsert(stmt, sql);
			DBbean.close(stmt);
			DBbean.close(conn);
			pw.print("<script>alert('" + "您的作业：" + filename
					+ " 上传完成！');</script>");
			pw.close();

		} catch (Exception e) {
			System.out.println("异常：使用 fileupload 包发生异常!");
			e.printStackTrace();
		}

	}

	// 处理表单内容
	private void processFormField(FileItem item, PrintWriter pw)
			throws Exception {
		String name = item.getFieldName();
		if (name.equals("stuid")) {
			studentid = item.getString();
		} else if (name.equals("workid")) {
			workid = item.getString();
		}
	}

	// 处理上传的文件
	private void processUploadFile(FileItem item, PrintWriter pw)
			throws Exception {
		filename = item.getName();
		int index = filename.lastIndexOf("\\");
		filename = filename.substring(index + 1, filename.length());
		long fileSize = item.getSize();
		if ("".equals(filename) && fileSize == 0) {
			System.out.println("文件名为空 !");
			// return;
		}
		File uploadFile = new File(filePath + "/" + filename);
		item.write(uploadFile);
		// pw.println(filename + " 文件保存完毕 !");
		// pw.println("文件大小为 ：" + fileSize + "\r\n");
	}

	// doGet
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
		doPost(req, res);
	}
}
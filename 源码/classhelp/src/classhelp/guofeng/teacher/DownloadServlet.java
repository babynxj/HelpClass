package classhelp.guofeng.teacher;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 文件下载
 * @author GUOFENG
 *
 */
public class DownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String path;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//获取传送的文件路径
		path = request.getParameter("fileurl");
		if (path != null) {
			download(response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void download(HttpServletResponse response) throws IOException {
		//去掉路径，剩下文件名。
		String realPath = path.substring(path.lastIndexOf("/") + 1);
		// 告诉浏览器是以下载的方法获取到资源，以此种编码来解析。
		response.setHeader("content-disposition", "attachment; filename="
				+ URLEncoder.encode(realPath, "utf-8"));
		// 获取资源，保存。
		FileInputStream fis = new FileInputStream(path);
		int len = 0;
		byte[] buf = new byte[1024];
		while ((len = fis.read(buf)) != -1) {
			response.getOutputStream().write(buf, 0, len);
		}
		fis.close();
	}

}

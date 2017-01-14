package classhelp.guofeng.util;

import java.util.Random;

public class Util {

	/**
	 * 修正日期格式
	 * 
	 * @param date
	 * @return
	 */
	public String chandate(String date) {
		String d[] = date.split(" ");
		String d2[] = d[0].split("-");
		String d3[] = d[1].split(":");
		return d2[0] + "/" + d2[1] + "/" + d2[2] + " " + d3[0] + ":" + d3[1];
	}

	/**
	 * 获取随机四位验证码
	 * 
	 * @return
	 */
	public int getCheckNumber() {
		int number;
		int max = 9999;
		int min = 1000;
		Random ran = new Random();
		number = ran.nextInt(max) % (max - min + 1) + min;
		return number;
	}

	/**
	 * 获得Mail Host
	 * 
	 * @return
	 */
	public String getMailHost(String mail) {
		// smtp.163.com
		String end = mail.split("@")[1];
		return "smtp." + end;
	}
}

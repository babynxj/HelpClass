package classhelp.guofeng.mail;

import java.util.Date;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.*;

public class SendEmail {

	private Email email;

	public SendEmail(Email email) {
		this.email = email;
	}

	// 发送邮件
	public boolean sendMail() {
		Properties prop;
		Session session;
		MimeMessage msg;

		try {
			prop = new Properties(); // 存储连接参数
			prop.put("mail.smtp.host", email.getHost());
			prop.put("mail.smtp.auth", "true");

			session = Session.getDefaultInstance(prop, null); // 获得一个邮件的Session
			msg = new MimeMessage(session); // 邮件信息

			// 检查邮件地址是否合法
			if (email.getFromAddr() == null || email.getFromAddr().equals("")) {
				throw new Exception("发件地址错误");
			}

			if (email.getAddresses() == null) {
				throw new Exception("目标地址错误");
			}

			InternetAddress[] sendTo = new InternetAddress[email.getAddresses().size()];
			for (int i = 0; i < email.getAddresses().size(); i++) {
				System.out.println("发送到:" + email.getAddresses().get(i));
				sendTo[i] = new InternetAddress(email.getAddresses().get(i));
			}

			// 设置源地址
			msg.setFrom(new InternetAddress(email.getFromAddr()));
			// 设置目的地址
			// msg.setRecipient(Message.RecipientType.TO, new
			// InternetAddress(toAddr));
			msg.setRecipients(Message.RecipientType.TO, sendTo);
			// 设置主题
			msg.setSubject(email.getSubject(), "UTF-8");

			Multipart mp = new MimeMultipart(); // 邮件内容
			MimeBodyPart mbpContent = new MimeBodyPart();
			mbpContent
					.setContent(email.getContent(), "text/html;charset=UTF-8"); // 邮件格式

			mp.addBodyPart(mbpContent);
			msg.setContent(mp);
			msg.setSentDate(new Date());

			// 发送邮件
			Transport transport = session.getTransport("smtp");
			transport.connect((String) prop.get("mail.smtp.host"),
					email.getUsername(), email.getPassword());
			transport.sendMessage(msg,
					msg.getRecipients(MimeMessage.RecipientType.TO));

			transport.close();
			return true;
		} catch (Exception e) {
			System.out.println(e.toString());
			return false;
		}
	}
}
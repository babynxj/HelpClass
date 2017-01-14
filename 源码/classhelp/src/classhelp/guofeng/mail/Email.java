package classhelp.guofeng.mail;

import java.io.Serializable;
import java.util.ArrayList;

public class Email implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String host;
	String username;
	String password;
	String fromAddr;
	ArrayList<String> addresses;
	String subject;
	String content;

	
	public ArrayList<String> getAddresses() {
		return addresses;
	}
	public void setAddresses(ArrayList<String> addresses) {
		this.addresses = addresses;
	}
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFromAddr() {
		return fromAddr;
	}
	public void setFromAddr(String fromAddr) {
		this.fromAddr = fromAddr;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
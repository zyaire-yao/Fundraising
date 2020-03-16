package com.fund.sendEmail;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.springframework.stereotype.Component;

import com.sun.mail.util.MailSSLSocketFactory;



public class MailUtilByFindPwd implements Runnable{

	private String email; // 收件人信箱
	private String href;//連結
    private Long   time;

	public  MailUtilByFindPwd(String memberEmail,String code) {
		this.email = memberEmail;
		this.time = new Date().getTime();
		this.href = "http://localhost:8080/Fundraising/findMemberByEmail?memberEmail="+email+"&time="+time+"&code="+code;
	}
	
	@Override
	public void run() {
		// 1.建立連接javax.mail.Session
		// 2.建立郵件 javax.mail.Message
		// 3.送信
		String from = ParamConfig.EMAIL_FORM; // 寄件人信箱 
		String host = ParamConfig.EMAIL_HOST;      // 指定送信的主機
		String userName=ParamConfig.EMAIL_USERNAME;          // 填帳號    
		String password=ParamConfig.EMAIL_PWD;			 //填信箱密碼

		Properties properties = System.getProperties();// 獲取屬性

		properties.setProperty("mail.smtp.host", host);// 設定郵件服務器
		properties.setProperty("mail.smtp.auth", "true");// 打開認證

		try {

			MailSSLSocketFactory sf = new MailSSLSocketFactory();
			sf.setTrustAllHosts(true);
			properties.put("mail.smtp.ssl.enable", "true");
			properties.put("mail.smtp.ssl.socketFactory", sf);
			properties.put("mail.debug", "true");

			// 獲取默認對象
			Session session = Session.getDefaultInstance(properties, new Authenticator() {
				public PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(userName, password); // 寄件人信箱和密碼
				}
			});

			// 2.創建郵件對象
			Message message = new MimeMessage(session);
			// 2.1設定寄件人
			message.setFrom(new InternetAddress(from));
			// 2.2設收件人
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			// 2.3信件主題
			String subject = MimeUtility.encodeWord("密碼變更", "UTF-8", "Q");
			message.setSubject(subject);
			// 2.4信件內文
			String content ="<html><head></head><body><h2>募資網密碼變更通知</h2><table><tbody>";
			content +="<tr><td>親愛的用戶您好，寄信後一分鐘內，按下<a style='color: bule' href='"+href+"'>確認連結</a>來更改密碼。</td></tr>";            
			content +="<tr><td>若無法點選上述連結，請將下列網址貼於瀏覽器的網址列後，再按下Enter即可完成啟動：</td></tr>";
			content +="<tr><td><a style='color: bule' href='"+href+"'>"+href+"</a></td></tr>";
			content +="</tbody></table></body></html>";
			message.setContent(content, "text/html;charset=UTF-8");
			// 3.寄信
			Transport.send(message);
			System.out.println("寄信成功!");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}



}

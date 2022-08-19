package edu.howf.util;

import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SMTP {
	private final Properties serverInfo;	//서버 정보
	private final Authenticator auth;		//인증 정보
	
	public SMTP() {
		//네이버 SMTP 서버 접속 정보
		serverInfo = new Properties();
		serverInfo.put("mail.smtp.host", "smtp.naver.com");//이메일 발송을 처리해줄 SMTP 서버
		serverInfo.put("mail.smtp.port", "587");//
		serverInfo.put("mail.smtp.starttls.enable", "true");//로그인시 TLS 사용
		serverInfo.put("mail.smtp.auth", "true");
		serverInfo.put("mail.smtp.debug", "true");
		serverInfo.put("mail.smtp.socketFactory.port", "587");//포트번호
		serverInfo.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		serverInfo.put("mail.smtp.socketFactory.fallback","false");
		serverInfo.put("mail.smtp.ssl.trust", "smtp.naver.com");
		serverInfo.put("mail.smtp.ssl.protocols", "TLSv1.2");
		
		//사용자 인증 정보
		auth = new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("han418hi","wb0815hyj0406");
			}
		};
	}
	
	//주어진 메일 내용을 네이버 SMTP 서버를 통해 전송.
	public void emailSending(Map<String, String>mailInfo) throws MessagingException{
		//1. 세션 생성
		Session session = Session.getInstance(serverInfo, auth);
		session.setDebug(true);
		
		//2. 메시지 작성
		MimeMessage msg = new MimeMessage(session);
		msg.setFrom(new InternetAddress(mailInfo.get("from")));	//보내는 사람
		msg.addRecipient(Message.RecipientType.TO, new InternetAddress(mailInfo.get("to")));	//받는 사람
		msg.setSubject(mailInfo.get("subject"));
		msg.setContent(mailInfo.get("content"), mailInfo.get("format"));
		
		//3.전송
		Transport.send(msg);
		
	}
}

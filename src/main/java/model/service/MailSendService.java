package model.service;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

/*웹메일 인증을 위한 mail send 클래스*/
public class MailSendService {
	public String connectEmail(String email) {
		String tol = email; //인증을 위해 사용자가 입력한 이메일 주소
		String host = "smtp.gmail.com"; //smtp 서버
		String subject = "[솜솜아부탁해] 이메일 인증 번호"; //보내는 제목 설정
		String from = "plzsom0203@gmail.com"; //보내는 사람(구글 계정)
		String authNum = MailSendService.authNum(); //인증번호를 위한 난수 발생 부분
		String content = "인증번호 [" + authNum + "]"; //이메일 내용 설정
		
		//SMTP를 이용하기 위해 설정해주는 설정 값들
		try {
			Properties props = System.getProperties();
			
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", 465);
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");
			props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
			props.put("mail.smtp.ssl.protocols", "TLSv1.2");
			
			props.put("mail.debug", "true");
			
			Session mailSession
				= Session.getDefaultInstance(props, new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication("plzsom0203@gmail.com", "dvmwzstiakaolvcl"); //Gmail 계정&앱 비밀번호
					}
				});
			
			Message msg = new MimeMessage(mailSession);
			
			msg.setFrom(new InternetAddress(from));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(tol));
			msg.setSubject(subject); //제목 설정
			msg.setSentDate(new java.util.Date()); //보내는 날짜 설정
			msg.setContent(content, "text/html; charset=utf-8"); //내용 설정
			
			Transport.send(msg); //메일 보내기
		}catch(MessagingException e) {
			e.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return authNum;
	}
	
	//난수 발생 function
	public static String authNum() {
		StringBuffer buffer = new StringBuffer();
		
		for(int i = 0; i <= 4; i++) {
			int num = (int)(Math.random() * 9 + 1);
			buffer.append(num);
		}
		return buffer.toString();
	}
}

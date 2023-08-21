package com.shop.app.common.controller.advice;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

@Service
public class MailSender {

		// 질문 답변 메소드
		public void sendEmailOnAnswerRegistration(String userEmail, String answerContent, int questionId) {
		    String subject = "[우리집동물친구] 문의하신 내용에 답변이 등록되었습니다.";
		    String link = "http://localhost:8080/pet/servicecenter/inquiry/questionDetail.do?questionId=" + questionId;
	
		    String htmlMessage = "<html><body><div style='width: 800px; margin: auto;'>";
		    htmlMessage += "<br/><br/><p style='font-size: 22px;'><strong>우리집동물친구</strong>";
		    htmlMessage += "<hr style='border: 1px solid #c8c8c8;'/>";
		    htmlMessage += "<br/><p style='font-size: 27px;'><strong>문의하신 내용</strong>에 답변이 등록되었습니다.<br/></p>";
		    htmlMessage += "<br/>안녕하세요. 반려동물 쇼핑몰 우리집동물친구입니다. <br/> 문의하신 내용에 다음과 같은 답변이 등록되었습니다.<br/><br/><br/>";
		    htmlMessage += "<div style='background-color: #f5f5f5; display: flex; align-items: center; height: 100px; margin-bottom: 50px;'>" + answerContent + "<br/></div>";
		    htmlMessage += "<a href='" + link + "' style='background-color: #5886d3; color: white; padding: 12px 20px; border-radius: 4px; text-decoration: none;'>1:1 문의 보러가기</a>";
		    htmlMessage += "<br/><hr style='border: 1px solid #c8c8c8; margin-top: 50px;'/><br/><br/>";
		    htmlMessage += "</div></body></html>";
	
		    sendEmail(userEmail, subject, htmlMessage);
		}
		
		// 이메일 인증 메소드
	    public void sendEmailOnUserVerification(String userEmail, String verificationCode) {
	        String subject = "[우리집동물친구] 회원가입 이메일 인증";
	        String verificationUrl = "http://localhost:8080/pet/email/verifyEmail?email=" + userEmail + "&token=" + verificationCode;
	        
		    String htmlMessage = "<html><body><div style='width: 800px; margin: auto;'>";
		    htmlMessage += "<br/><br/><p style='font-size: 22px;'><strong>우리집동물친구</strong>";
		    htmlMessage += "<hr style='border: 1px solid #c8c8c8;'/>";
		    htmlMessage += "<br/><p style='font-size: 27px;'><strong>이메일 인증 코드</strong> 보내드립니다.<br/></p>";
		    htmlMessage += "<br/>안녕하세요. 반려동물 쇼핑몰 우리집동물친구입니다. <br/> 이메일 인증 링크 보내드립니다. <br/><br/> <p>아래 링크를 눌러주시면 이메일 인증이 완료됩니다.</p><br/><br/>";
		    htmlMessage += "<a href='"+ verificationUrl +"' style='background-color: #5886d3; color: white; padding: 12px 20px; border-radius: 4px; text-decoration: none; margin-top: 20px;'>인증하기</a><br/>";
		    htmlMessage += "<br/><hr style='border: 1px solid #c8c8c8; margin-top: 50px;'/><br/><br/>";
		    htmlMessage += "</div></body></html>";
		    
	        sendEmail(userEmail, subject, htmlMessage);
	    }
	    
	    // 실제 이메일 발송 처리 메소드
	    public void sendEmail(String recipient, String subject, String message) {
	        Properties p = System.getProperties();
	        p.put("mail.smtp.starttls.enable", "true");
	        p.put("mail.smtp.host", "smtp.naver.com");
	        p.put("mail.smtp.auth", "true");
	        p.put("mail.smtp.port", "25");

	        Authenticator auth = new MyAuthentication();
	        Session session = Session.getInstance(p, auth);
	        MimeMessage msg = new MimeMessage(session);

	        try {
	            msg.setSentDate(new Date());
	            InternetAddress from = new InternetAddress();
	            from = new InternetAddress("vldzmf0877@naver.com");
	            msg.setFrom(from);
	            InternetAddress to = new InternetAddress(recipient);
	            msg.setRecipient(Message.RecipientType.TO, to);
	            msg.setSubject(subject, "UTF-8");
	            msg.setText(message, "UTF-8");
	            msg.setHeader("content-Type", "text/html");
	            javax.mail.Transport.send(msg, msg.getAllRecipients());
	        } catch (AddressException addr_e) {
	            addr_e.printStackTrace();
	        } catch (MessagingException msg_e) {
	            msg_e.printStackTrace();
	        }
	    }
	}
	
class MyAuthentication extends Authenticator {

	PasswordAuthentication pa;
	public MyAuthentication(){

		String id = "vldzmf0877@naver.com";  //네이버 이메일 아이디
		String pw = "dPfk7311!";        //네이버 비밀번호

		// ID와 비밀번호를 입력한다.
		pa = new PasswordAuthentication(id, pw);
	}

	// 시스템에서 사용하는 인증정보
	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}
} 

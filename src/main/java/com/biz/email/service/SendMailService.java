package com.biz.email.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.xml.soap.MimeHeader;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.biz.email.model.EmailVO;

@Service
public class SendMailService {

	@Autowired
	JavaMailSender mailSender;
	
	public void sendMail(EmailVO emailVO) {
		String from_email = emailVO.getFrom_email() ;
		String to_email = emailVO.getTo_email();
		String subject = emailVO.getS_subject();
		String content = emailVO.getS_content();
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper mHelper;
		try {
			mHelper = new MimeMessageHelper(message, true, "UTF-8");
			mHelper.setFrom(from_email);
			mHelper.setTo(to_email);
			mHelper.setSubject(subject);
			mHelper.setText(content);
			
			mailSender.send(message);
			
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}
	
}

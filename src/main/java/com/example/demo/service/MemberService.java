package com.example.demo.service;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.example.demo.dao.MemberDao;
import com.example.demo.dto.Member;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class MemberService {

	private MemberDao memberDao;
	private JavaMailSender javaMailSender;
	
	public MemberService(MemberDao memberDao, JavaMailSender javaMailSender) {
		this.memberDao = memberDao;
		this.javaMailSender = javaMailSender;
	}

	public Member getMemberByLoginId(String loginId) {
		return this.memberDao.getMemberByLoginId(loginId);
	}

	public void joinMember(String loginId, String loginPw, String name, String email) {
		this.memberDao.joinMember(loginId, loginPw, name, email);
	}

	public String getLoginId(int id) {
		return this.memberDao.getLoginId(id);
	}
	
	public Member getMemberByNameAndEmail(String name, String email) {
		return this.memberDao.getMemberByNameAndEmail(name, email);
	}

	public void modifyPassword(int id, String loginPw) {
		this.memberDao.modifyPassword(id, loginPw);
	}
	
	public void sendEmail(String to, String subject, String text) {
        MimeMessage message = this.javaMailSender.createMimeMessage();
        
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(text, true);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        
        this.javaMailSender.send(message);
    }
	
    public void sendPasswordRecoveryEmail(Member member, String tempPassword) {
        String subject = "임시 패스워드 발송";
        String text = "<html>"
                    + "<body>"
                    + "<h3>임시 패스워드 : " + tempPassword + "</h3>"
                    + "<a style='display:inline-block;padding:10px;border-radius:10px;border:5px solid black;font-size:4rem;color:inherit;text-decoration:none;' href='http://localhost:8081/usr/member/login' target='_blank'>로그인 하러가기</a>"
                    + "</body>"
                    + "</html>";
        sendEmail(member.getEmail(), subject, text);
    }
    
    public Member getMemberById(int id) {
		return this.memberDao.getMemberById(id);
	}

	public void modifyMember(int id, String name, String email) {
		this.memberDao.modifyMember(id, name, email);
	}
}

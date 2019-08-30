package com.study.service;

import com.study.email.EmailDTO;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;






@Service
public class EmailServiceImpl
  implements EmailService
{
  @Autowired
  private JavaMailSender mailSender;
  
  public static int ran() { return (int)(Math.random() * 900000.0D) + 100000; }






  
  public int sendMail(EmailDTO dto) {
    int temp = ran();


    
    try {
      MimeMessage msg = this.mailSender.createMimeMessage();
      
      msg.addRecipient(MimeMessage.RecipientType.TO, new InternetAddress(dto.getReceiveMail()));
      
      msg.addFrom(new InternetAddress[] { new InternetAddress("jhs19920309@gmail.com", "�������� ����") });
      
      msg.setSubject("������ �������� ������", "utf-8");
      
      String htmlStr = "����������[" + temp + "] ������.";

      
      msg.setText(htmlStr, "utf-8", "html");
      
      this.mailSender.send(msg);

    
    }
    catch (Exception e) {
      
      e.printStackTrace();
    } 
    
    return temp;
  }
}

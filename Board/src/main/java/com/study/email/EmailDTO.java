package com.study.email;


public class EmailDTO
{
  private String senderName;
  private String senderMail;
  private String receiveMail;
  private String subject;
  private String message;
  
  public String getSenderName() { return this.senderName; }

  
  public void setSenderName(String senderName) { this.senderName = senderName; }

  
  public String getSenderMail() { return this.senderMail; }

  
  public void setSenderMail(String senderMail) { this.senderMail = senderMail; }

  
  public String getReceiveMail() { return this.receiveMail; }

  
  public void setReceiveMail(String receiveMail) { this.receiveMail = receiveMail; }

  
  public String getSubject() { return this.subject; }

  
  public void setSubject(String subject) { this.subject = subject; }

  
  public String getMessage() { return this.message; }

  
  public void setMessage(String message) { this.message = message; }

  
  public String toString() {
    return "EmailDTO [senderName=" + this.senderName + ", senderMail=" + this.senderMail + ", receiveMail=" + this.receiveMail + 
      ", subject=" + this.subject + ", message=" + this.message + ", getSenderName()=" + getSenderName() + 
      ", getSenderMail()=" + getSenderMail() + ", getReceiveMail()=" + getReceiveMail() + ", getSubject()=" + 
      getSubject() + ", getMessage()=" + getMessage() + ", getClass()=" + getClass() + ", hashCode()=" + 
      hashCode() + ", toString()=" + super.toString() + "]";
  }
}

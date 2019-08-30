package com.study.domain;

import java.util.Date;


public class CommentVO
{
  private long cno;
  private long rno;
  private String recomment;
  private String commenter;
  private Date replyDate;
  private Date updateDate;
  
  public long getCno() { return this.cno; }

  
  public void setCno(long cno) { this.cno = cno; }

  
  public long getRno() { return this.rno; }

  
  public void setRno(long rno) { this.rno = rno; }

  
  public String getRecomment() { return this.recomment; }

  
  public void setRecomment(String recomment) { this.recomment = recomment; }

  
  public String getCommenter() { return this.commenter; }

  
  public void setCommenter(String commenter) { this.commenter = commenter; }

  
  public Date getReplyDate() { return this.replyDate; }

  
  public void setReplyDate(Date replyDate) { this.replyDate = replyDate; }

  
  public Date getUpdateDate() { return this.updateDate; }

  
  public void setUpdateDate(Date updateDate) { this.updateDate = updateDate; }

  
  public String toString() {
    return "CommentVO [cno=" + this.cno + ", rno=" + this.rno + ", recomment=" + this.recomment + ", commenter=" + this.commenter + 
      ", replyDate=" + this.replyDate + ", updateDate=" + this.updateDate + ", getCno()=" + getCno() + ", getRno()=" + 
      getRno() + ", getRecomment()=" + getRecomment() + ", getCommenter()=" + getCommenter() + 
      ", getReplyDate()=" + getReplyDate() + ", getUpdateDate()=" + getUpdateDate() + ", getClass()=" + 
      getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
  }
}

package com.study.domain;

import java.util.Date;







public class ReplyVO
{
  private long rno;
  private long bno;
  private String reply;
  private String replyer;
  private Date replyDate;
  private Date updateDate;
  private int commentCnt;
  
  public int getCommentCnt() { return this.commentCnt; }

  
  public void setCommentCnt(int commentCnt) { this.commentCnt = commentCnt; }

  
  public long getRno() { return this.rno; }

  
  public void setRno(long rno) { this.rno = rno; }

  
  public long getBno() { return this.bno; }

  
  public void setBno(long bno) { this.bno = bno; }

  
  public String getReply() { return this.reply; }

  
  public void setReply(String reply) { this.reply = reply; }

  
  public String getReplyer() { return this.replyer; }

  
  public void setReplyer(String replyer) { this.replyer = replyer; }

  
  public Date getReplyDate() { return this.replyDate; }

  
  public void setReplyDate(Date replyDate) { this.replyDate = replyDate; }

  
  public Date getUpdateDate() { return this.updateDate; }

  
  public void setUpdateDate(Date updateDate) { this.updateDate = updateDate; }

  
  public String toString() {
    return "ReplyVO [rno=" + this.rno + ", bno=" + this.bno + ", reply=" + this.reply + ", replyer=" + this.replyer + ", replyDate=" + 
      this.replyDate + ", updateDate=" + this.updateDate + "]";
  }
}

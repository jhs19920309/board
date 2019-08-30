package com.study.domain;

import java.util.Date;
import java.util.List;












public class BoardVO
{
  private long bno;
  private String title;
  private String content;
  private String writer;
  private Date regdate;
  private Date updateDate;
  private int replyCnt;
  private List<BoardAttachVO> attachList;
  
  public List<BoardAttachVO> getAttachList() { return this.attachList; }

  
  public void setAttachList(List<BoardAttachVO> attachList) { this.attachList = attachList; }

  
  public int getReplyCnt() { return this.replyCnt; }

  
  public void setReplyCnt(int replyCnt) { this.replyCnt = replyCnt; }



  
  public long getBno() { return this.bno; }

  
  public void setBno(long bno) { this.bno = bno; }

  
  public String getTitle() { return this.title; }

  
  public void setTitle(String title) { this.title = title; }

  
  public String getContent() { return this.content; }

  
  public void setContent(String content) { this.content = content; }

  
  public String getWriter() { return this.writer; }

  
  public void setWriter(String writer) { this.writer = writer; }

  
  public Date getRegdate() { return this.regdate; }

  
  public void setRegdate(Date regdate) { this.regdate = regdate; }

  
  public Date getUpdateDate() { return this.updateDate; }

  
  public void setUpdateDate(Date updateDate) { this.updateDate = updateDate; }

  
  public String toString() {
    return "BoardVO [bno=" + this.bno + ", title=" + this.title + ", content=" + this.content + ", writer=" + this.writer + ", regdate=" + 
      this.regdate + ", updateDate=" + this.updateDate + "]";
  }
}

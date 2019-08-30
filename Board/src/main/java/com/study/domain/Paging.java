package com.study.domain;










public class Paging
{
  private int pageNum;
  private int amount;
  private String type;
  private String keyword;
  
  public Paging() { this(1, 10); }


  
  public Paging(int pageNum, int amount) {
    this.pageNum = pageNum;
    this.amount = amount;
  }

  
  public int getPageNum() { return this.pageNum; }


  
  public void setPageNum(int pageNum) { this.pageNum = pageNum; }


  
  public int getAmount() { return this.amount; }


  
  public void setAmount(int amount) { this.amount = amount; }




  
  public String getType() { return this.type; }


  
  public void setType(String type) { this.type = type; }


  
  public String getKeyword() { return this.keyword; }


  
  public void setKeyword(String keyword) { this.keyword = keyword; }



  
  public String toString() { return "Paging [pageNum=" + this.pageNum + ", amount=" + this.amount + "]"; }



  
  public String[] getTypeArr() { return (this.type == null) ? new String[0] : this.type.split(""); }
}

package com.study.domain;




public class PageDTO
{
  private int startPage;
  private int endPage;
  private boolean prev;
  private boolean next;
  private int total;
  private Paging pg;
  
  public PageDTO(Paging pg, int total) {
    this.pg = pg;
    this.total = total;
    
    this.endPage = (int)Math.ceil(pg.getPageNum() / 10.0D) * 10;








    
    this.startPage = this.endPage - 9;
    
    int realEnd = (int)Math.ceil(total * 1.0D / pg.getAmount());









    
    if (realEnd < this.endPage)
    {
      this.endPage = realEnd;
    }
    
    this.prev = (this.startPage > 1);
    this.next = (this.endPage < realEnd);
  }




  
  public int getStartPage() { return this.startPage; }



  
  public int getEndPage() { return this.endPage; }



  
  public boolean isPrev() { return this.prev; }



  
  public boolean isNext() { return this.next; }



  
  public int getTotal() { return this.total; }



  
  public Paging getPg() { return this.pg; }
}

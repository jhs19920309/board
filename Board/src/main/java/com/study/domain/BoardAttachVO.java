package com.study.domain;





public class BoardAttachVO
{
  private String uuid;
  private String uploadPath;
  private String fileName;
  private boolean fileType;
  private Long bno;
  
  public String getUuid() { return this.uuid; }


  
  public void setUuid(String uuid) { this.uuid = uuid; }


  
  public String getUploadPath() { return this.uploadPath; }


  
  public void setUploadPath(String uploadPath) { this.uploadPath = uploadPath; }


  
  public String getFileName() { return this.fileName; }


  
  public void setFileName(String fileName) { this.fileName = fileName; }


  
  public boolean isFileType() { return this.fileType; }


  
  public void setFileType(boolean fileType) { this.fileType = fileType; }


  
  public Long getBno() { return this.bno; }


  
  public void setBno(Long bno) { this.bno = bno; }


  
  public String toString() {
    return "BoardAttachVO [uuid=" + this.uuid + ", uploadPath=" + this.uploadPath + ", fileName=" + this.fileName + ", fileType=" + 
      this.fileType + ", bno=" + this.bno + "]";
  }
}

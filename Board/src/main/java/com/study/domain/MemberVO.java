package com.study.domain;

import java.util.Date;
import java.util.List;





public class MemberVO
{
  private String userid;
  private String userpw;
  private String userName;
  private boolean enabled;
  private String email;
  private Date regDate;
  private Date updateDate;
  private List<AuthVO> authList;
  
  public String getEmail() { return this.email; }

  
  public void setEmail(String email) { this.email = email; }

  
  public String getUserid() { return this.userid; }

  
  public void setUserid(String userid) { this.userid = userid; }

  
  public String getUserpw() { return this.userpw; }

  
  public void setUserpw(String userpw) { this.userpw = userpw; }

  
  public String getUserName() { return this.userName; }

  
  public void setUserName(String userName) { this.userName = userName; }

  
  public boolean isEnabled() { return this.enabled; }

  
  public void setEnabled(boolean enabled) { this.enabled = enabled; }

  
  public Date getRegDate() { return this.regDate; }

  
  public void setRegDate(Date regDate) { this.regDate = regDate; }

  
  public Date getUpdateDate() { return this.updateDate; }

  
  public void setUpdateDate(Date updateDate) { this.updateDate = updateDate; }

  
  public List<AuthVO> getAuthList() { return this.authList; }

  
  public void setAuthList(List<AuthVO> authList) { this.authList = authList; }

  
  public String toString() {
    return "MemberVO [userid=" + this.userid + ", userpw=" + this.userpw + ", userName=" + this.userName + ", enabled=" + this.enabled + 
      ", regDate=" + this.regDate + ", updateDate=" + this.updateDate + ", authList=" + this.authList + "]";
  }
}

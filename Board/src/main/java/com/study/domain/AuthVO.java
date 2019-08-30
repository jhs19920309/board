package com.study.domain;


public class AuthVO
{
  private String userid;
  private String auth;
  
  public String getUserid() { return this.userid; }

  
  public void setUserid(String userid) { this.userid = userid; }

  
  public String getAuth() { return this.auth; }

  
  public void setAuth(String auth) { this.auth = auth; }


  
  public String toString() { return "AuthVO [userid=" + this.userid + ", auth=" + this.auth + "]"; }
}

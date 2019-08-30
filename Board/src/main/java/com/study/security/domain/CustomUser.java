package com.study.security.domain;

import com.study.domain.AuthVO;
import com.study.domain.MemberVO;
import java.util.Collection;
import java.util.stream.Collectors;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;


 


public class CustomUser
  extends User
{
  private MemberVO member;
  
  public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) { super(username, password, authorities); }




  
  public CustomUser(MemberVO vo) {
    super(vo.getUserid(), vo.getUserpw(), (Collection)vo.getAuthList().stream().map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
    
    this.member = vo;
  }


  
  public MemberVO getMember() { return this.member; }
}

package com.study.security;

import com.study.domain.MemberVO;
import com.study.mapper.MemberMapper;
import com.study.security.domain.CustomUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;





public class CustomUserDetailsService
  implements UserDetailsService
{
  @Autowired
  private MemberMapper memberMapper;
  
  public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    MemberVO vo = this.memberMapper.read(username);
    
    return (vo == null) ? null : new CustomUser(vo);
  }
}

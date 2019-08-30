package com.study.service;

import com.study.domain.MemberVO;
import com.study.mapper.SignUpMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 


@Service
public class SignUpServiceImpl
  implements SignUpService
{
  @Autowired
  SignUpMapper mapper;
  
  public int selectId(String name) { return this.mapper.select(name); }




  
  public void register(MemberVO vo) {
    this.mapper.register(vo);
    this.mapper.registerAuth(vo);
  }



  
  public int checkEmail(String email) { return this.mapper.checkEmail(email); }
}

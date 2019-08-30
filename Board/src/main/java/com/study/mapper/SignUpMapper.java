package com.study.mapper;

import com.study.domain.MemberVO;

public interface SignUpMapper {
  int select(String paramString);
  
  void register(MemberVO paramMemberVO);
  
  void registerAuth(MemberVO paramMemberVO);
  
  int checkEmail(String paramString);
}

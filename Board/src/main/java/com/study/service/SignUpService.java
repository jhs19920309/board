package com.study.service;

import com.study.domain.MemberVO;

public interface SignUpService {
  int selectId(String paramString);
  
  void register(MemberVO paramMemberVO);
  
  int checkEmail(String paramString);
}

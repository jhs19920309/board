package com.study.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.domain.MemberVO;
import com.study.email.EmailDTO;
import com.study.service.EmailService;
import com.study.service.SignUpService;










@RequestMapping({"/signup"})
@Controller
public class SignUpController
{
  @Autowired
  SignUpService service;
  @Autowired
  EmailService emailService;
  @Autowired
  PasswordEncoder pwencoder;
  
  @GetMapping(value = {"/id/{name}"}, produces = {"application/json;charset=UTF-8"})
  @ResponseBody
  public int idCheck(@PathVariable("name") String name) { return this.service.selectId(name); }




  
  @GetMapping(value = {"/email/{email}"}, produces = {"application/json;charset=UTF-8"})
  @ResponseBody
  public int emailCheck(@PathVariable("email") String email) {
    int selectCount = this.service.checkEmail(email);
    System.out.println(selectCount);
    return selectCount;
  }



  
  @RequestMapping({"/write"})
  public String write() { return "/email/write"; }





  
  @GetMapping(value = {"/send/{email}"}, produces = {"application/json;charset=UTF-8"})
  @ResponseBody
  public int send(@PathVariable("email") String email) {
    EmailDTO dto = new EmailDTO();
    
    dto.setReceiveMail(email);
    
    return this.emailService.sendMail(dto);
  }



  
  @PostMapping({"/register"})
  public String register(MemberVO member) {
    member.setUserpw(this.pwencoder.encode(member.getUserpw()));
    this.service.register(member);

    
    return "redirect:/board/list";
  }
}

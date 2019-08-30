package com.study.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;









@Controller
public class SecurityController
{
  @GetMapping({"/"})
  public String afterLogin() { return "home"; }



  
  @GetMapping({"/index"})
  public String test123() { return "home"; }







  
  @GetMapping({"/accessError"})
  public void accessDenied(Authentication auth, Model model) { model.addAttribute("msg", "ACCESS Denied"); }





  
  @GetMapping({"/customLogin"})
  public void loginInput(String error, String logout, Model model) {
    if (error != null)
    {
      model.addAttribute("error", "Login Error Check Your Account");
    }
    
    if (logout != null) {
      
      System.out.println("3");
      model.addAttribute("logout", "Logout!!");
    } 
  }



  
  @GetMapping({"/customLogout"})
  public void logoutGET() {}



  
  @PostMapping({"/customLogout"})
  public void logoutPost() { System.out.println("��������"); }
}

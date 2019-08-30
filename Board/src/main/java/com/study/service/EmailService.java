package com.study.service;

import com.study.email.EmailDTO;

public interface EmailService {
  int sendMail(EmailDTO paramEmailDTO);
}

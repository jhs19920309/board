package com.study.msg;

import java.util.HashMap;
import java.util.Map;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;





public class ReplyEchoHandler
  extends TextWebSocketHandler
{
  Map<String, WebSocketSession> userSessions = new HashMap();








  
  public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    System.out.println("afterConnectionEstablised : " + session);


    
    if (session.getAttributes().keySet().size() == 4) {
      String senderId = getId(session);
      
      this.userSessions.put(senderId, session);
    } 
  }



  
  public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    System.out.println("handleTextMessage: " + session + " : " + message);
    
    String senderId = getId(session);


    
    String msg = (String)message.getPayload();
    if (!StringUtils.isEmpty(msg)) {
      
      String[] strs = ((String)message.getPayload()).split(",");
      
      if (strs != null && strs.length == 4) {
        String cmd = strs[0];
        String replyWriter = strs[1];
        String boardWriter = strs[2];
        String bno = strs[3];
        
        WebSocketSession boardWriterSession = (WebSocketSession)this.userSessions.get(boardWriter);
        if ("reply".equals(cmd) && boardWriterSession != null) {
          
          TextMessage tmpMsg = new TextMessage(String.valueOf(replyWriter) + "����  " + bno + "�� �������� ������ ����������");
          boardWriterSession.sendMessage(tmpMsg);
        } 
      } 
    } 
  }

























  
  public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    System.out.println("afterConnectionClose: " + session + " : " + status);
    
    if (session.getAttributes().keySet().size() == 4) {

      
      SecurityContext sc = (SecurityContext)session.getAttributes().get("SPRING_SECURITY_CONTEXT");

      
      String name = sc.getAuthentication().getName();
      this.userSessions.remove(name);
    } 
  }


  
  private String getId(WebSocketSession session) {
    Map<String, Object> httpSession = session.getAttributes();
    
    SecurityContext sec = (SecurityContext)httpSession.get("SPRING_SECURITY_CONTEXT");


    
    String user = null;
    if (sec == null) {
      
      user = session.getId();
    } else {
      
      user = sec.getAuthentication().getName();
    } 



    
    return user;
  }
}

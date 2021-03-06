# 게시판 기능들
![image](https://user-images.githubusercontent.com/53259940/64079344-73af6480-cd21-11e9-881b-a56e9b43d720.png)
![image](https://user-images.githubusercontent.com/53259940/64079362-a5283000-cd21-11e9-96a1-d997711d0f96.png)
![image](https://user-images.githubusercontent.com/53259940/64079474-dead6b00-cd22-11e9-8a5f-2e2094229c0e.png)
![image](https://user-images.githubusercontent.com/53259940/64079490-fdabfd00-cd22-11e9-814c-e13a666ffd55.png)


# 1 스프링 시큐리티   

 1.Authentication은 사용자의 인증 여부, 사용자가 가진 권한(authority) , 이름 및 접근 주체에 대한 정보를 제공 한다  
  시큐리티는 이 정보를 이용해서 사용자가 요청한 자원(URL)에 접근할 수 있는지 여부를 판단한다  
<hr>
 2.근데 Authentication을 사용하려면 가져와야하는데 이때 SecurityContextHolder클래스 사용-> SecurityContextHolder.getContext()  
  메서드는 SecurityContext 객체를 리턴하여 이 객체의 getAuthentication()메서드를 이용하여 Authentication 객체를 구한다  
  
  Authentication auth=SecurityContext.getContext().getAuthentication();  
  
  <hr>
  //SecurityContextHolder에 어떻게 들어가게되는지 살펴보지  
  
3. 시큐리티는 웹 브라우저로부터 요청이 들어오면 서블릿 필터를 이용해서 SecurityContext에 Authentication객체를 설정한다  
   이 과정은 SecurityContextPersistenceFilter클래스의 기능을 이용함  
   시큐리티는 이 필터를 가장 먼저 적용해서 SecurityContext에 Authentication 객체를 보관한다  
   
   Authentication은 두가지 목적으로 사용된다  
   1.AuthenticationManager에 인증을 요청할때 필요한 정보를 담는 목적.  
   2.현재 접속한 사용자에 대한 정보를 표현하기 위한 목적  
   <hr>
4. GrantedAuthority 인터페이스  
   권한을 표현할때 사용   
   SimpleGrantedAuthority 클래스는 GrantedAuthority 타입의 객체를 직접 생성해야 할 때 사용할 수 있는 클래스로서 이 클래스는  
   생성자를 이용해서 String 타입의 권한 값을 전달받는다  
    
	GrantedAuthority authority=new SimpleGrantedAuthority("USER_MANAGER");  
	
<hr>
5. web.xml에 설정한 DelegatingFilterProxy는 스프링 시큐리티가 생성하는 FilterChainProxy에 필터 처리를 위임함.  
   이 FilterChainProxy는 다시 여러 필터를 체인 형식으로 갖고 있는 SecurityFilterChain에 처리를 위임  
   스프링 시큐리티의 설정은 대부분 이 필터들을 위한 설정이다   
   
   *스프링 시큐리티의 기능이 올바르게 동작하려면 SecurityContext와 Authentication이 올바르게 생성되어 있어야 하기때문에  
    SecurityContext를 생성해주는 SecurityContextPersistenceFilter를 다른 필터보다 먼저 적용한다.  
	
	
	**현재 사용자가 인증 전일 경우 임의 사용자에 해당하는 Authentication 객체를 SecurityContext에 설정한다.**  
	  생성된 Authentication 객체는 이름이 "anonymousUser"이고 "ROLE_AONYMOUS"권한을 갖는다.  
	  
	**체인의 앞쪽에 위치한 SecurityContextPersistenceFilter나 AnonymousAuthenticationFilter 등의 필터가  
	   SecurityContextHolder에 SecurityContext를 설정하면 마지막에 위치한 FilterSecurityInterceptor는 SecurityContext에 보관된  
	   Authentication이 요청 경로에 접근할 수 있는지 여부를 검사한다.**  
<hr>
6. 스프링 시큐리티는 인증이 필요할 때 AuthenticationManager 인터페이스를 이용한다  
   Authentication authenticate(Authentication authenticate)throws ~~~  
 
   Authentication객체를 입력으로 전달받는다 인증에 성공하면 인증정보를 담은 Authentication객체를 리턴한다  
   
   일반적으로 사용자 아이디와 암호를 사용해서 사용자가 누구인지 인증한다,  
   그래서 UsernamePasswordAuthenticationToken을 Authentication(인터페이스)의 기본구현체로 사용한다  

<hr>
7. AuthenticationManager 인터페이스의 구현 클래스로 ProviderManager 클래스를 제공하고 있다.  
   이 클래스는 인증 처리를 AuthenticationProvider 인터페이스에게 위임한다.  

	ProviderManager는 한개 이상의 AuthenticationProvider를 가질수 있으며 다음과 같은 방식으로 동작한다.  
	
	*등록된 AuthenticationProvider에 대해 차례대로 다음 과정을 실행한다.  
	A.authenticate() 메서드를 실행해서 인증 처리를 요청한다.  
	B.authenticate() 가 인증 객체를 리턴하면 해당 객체를 리턴한다.  
	C.어떤 AuthenticationProvider도 인증에 성공하지 못할 경우 익셉션발생  
<hr>
8. AuthenticationProvider의 몇 가지 기본 구현체들 ->DaoAuthenticationProvider/LdapAuthenticationProvider/OpenIDAuthenticationProvider  
 
   <sec:authentication-manager>  
     <sec:authentication-provider>  
	   <sec:user-service>  
	     <sec:user name="Janghyunsu" password="1q2w3e4r" authorities="ROLE_USER"/>  
		 
		 
	1. 여기서 DaoAuthenticationProvider를 사용한 것 이다  
	2. DaoAuthenticationProvider는 내부적으로 UserDetailsService인터페이스를 사용해서 사용자 정보를 읽어온다!!!!  
	   근데 이 UserDetailsService를 구현한 것중 InMemoryUserDetailsManager를 사용하도록 설정한 것  

<hr> 
9.<sec:authentication-manager alias="authenticationManager">  
 
    <sec:authentication-provider>  

	 <sec:jdbc-user-service data-source-ref="dataSource"/>  
 
  이렇게 하면 AuthenticationProvider의 구현체로 DaoAuthenticationProvider를 사용하고  
  Dao는 사용자 정보를 읽어올때 UserDetailsService(인터페이스) 객체를 사용함  
  
  **DAP 는 이름에서도 알 수 있듯이 데이터베이스 인증용 Provider 임  
  
  
  A. DaoAuthenticationProvider의 authenticate()메서드 과정     
     
	 1.UserDetailsService의 loadUserByUsername()메서드로 사용자 이름에 해당하는 UserDetails(인터페이스)객체를 구한다 
  /존재하지 않으면 익셉션 발생  
  
  2.입력한 암호가 UserDetails객체의 getPassword()로 구한 암호와 일치하는지 비교한다.  
     
	 **(복습하기)입력한 암호와 UserDetails 객체의 암호와 비교한다고 했는데 입력한 암호란 
	   AuthenticationManage->ProviderManager->AuthenticationProvider->DaAUthenticationProvider 
	   처음 AuthenticationManager로 인증을위해 전송된 Authentication객체를 전달 전달 전달받은 Authentication객체를 통해 얻은 비밀번호를 말한다
	   즉 사용자가 로그인 폼에서 입력한 암호와 아이디가 이부분 까지 전달된 것이고 Dao는 아이디를 가지고 DB에서 해당아이디가 있으면 비밀번호를 가져오고 DB에서 가져온 비밀번호와
	   전달 받은 Authentication객체의 비밀번호를 대조하여 인증을 하는 것이다.
	   Authentication은 인터페이스인데 어떻게 비밀번호 값을 가져오느냐라고 궁금할 수 있는데 보통 유저의 아이디와 비밀번호를 가지고 
    인증을 수행하고 UsernamePasswordAuthenticationToken을 Authentication의 구현 클래스로 많이 사용한다**  
	 
	 3.암호가 일치하면 UserDetails객체로부터 Authentication객체를 생성해서 리턴한다.  
	   **여기서 Authentication객체를 생성한다는 것은 API를 통해 내부의 결과를 보면 UsernamePasswordAuthenticationToken을 만들어 
    반환하는 것이다.   
	 
	 실제 DB에서 사용자 정보를 읽어오는 것은 UserDetailsService가 책임진다. 
	 <jdbc-user-service>태그를 사용하면 UserDetailsService 인터페이스의 구현체로 JdbcUserDetailsManager클래스를 사용한다.  
	 JdbcUserDetailsManager클래스는 JdbcDaoImpl클래스를 상속받고  이 두 클래스들은 JdbcTemplate를 이용해서 DB연동을 처리하기때문에 DataSource가 필요했던것  
	 
<hr>
10. UserDetailsService인터페이스는 한개의 메소드만 정의하고있다  
    UserDetails loadUserByUsername(String username)throws ~  
	username에 해당하는 사용자가 존재하면 해당 사용자의 정보를 담은 UserDetails를 리턴한다  
	
	**UserDetails는 인터페이스이고 이걸 구현한 User클래스를 세팅하여 리턴한다  
	  결국 핵심은 UserDetailsService가 UserDetails를 리턴하는 것  
	  그리고 이 UserDetails에서 JSP Security taglib로 얻을 수 있는 정보는 아이디정도이다.  
	  디비에 있는 이메일 정보나 닉네임을 가져올순 없다  
그럼 디비에서 더많은 사용자정보를 가져와 JSP에서 사용하고자 할때 방법은 UserDetailsService를 직접 구현하여 User클래스를 반환하게 하는 것  

<hr>	 
11. UserDetailsService 구현하기  

    DaoAuthenticationProvider의 authenticate() 메서드는 UserDetailsService로부터 UserDetails를 읽어와 인증을 수행하는 과정은  
	
	(authenticate()과정)  
	
	1.사용자가 입력한 암호와 UserDetails의 암호가 일치하는지 여부를 검사한다,    
	2. 암호가 일치할 경우 UserDetails로부터 Authentication객체를 생성해서 리턴한다   
	
        이 과정을 모두 DaoAuthenticationProvider가 해주기 때문에 UserDetailsService 인터페이스를 상속받은 클래스는 
	loadUserByUsername()메서드만 올바르게 구현해주면 된다,   
	다음은 loadUserByUsername메서드를 구현할때 지켜야할 규칙이다.  
	
	* username에 해당하는 데이터가 존재하면 UserDetails 타입의 객체를 리턴한다.  
	-> UserDetails의 구현체중 하나인 User객체를 생성해서 리턴한다.  
	
	User클래스는 다음의 생성자를 제공하므로 알맞은 생성자를 사용한다  
	
	* User(String username,String password,Collection<? extends GrantedAuthority> authorities)  
	* User(String username,String password,boolean enabled,boolean accountNonExpired,boolean ~~)  
	
	
<hr>

![image](https://user-images.githubusercontent.com/53259940/64074475-a8ea9100-cce6-11e9-88ab-49588dd55b90.png)  
![image](https://user-images.githubusercontent.com/53259940/64074478-b7d14380-cce6-11e9-932a-d262db112992.png)  
![image](https://user-images.githubusercontent.com/53259940/64074482-ca4b7d00-cce6-11e9-9464-926cf88dc456.png)  
![image](https://user-images.githubusercontent.com/53259940/64074488-e2230100-cce6-11e9-83ed-aacd85d35a84.png)
![image](https://user-images.githubusercontent.com/53259940/64074493-0c74be80-cce7-11e9-8e56-9921b3de203c.png)
![image](https://user-images.githubusercontent.com/53259940/64074514-35954f00-cce7-11e9-9b69-7c46f8599bb2.png)
![image](https://user-images.githubusercontent.com/53259940/64074503-24e4d900-cce7-11e9-9b1e-e8420c44e0e7.png)
![image](https://user-images.githubusercontent.com/53259940/64074521-4c3ba600-cce7-11e9-8e56-e05eb5184180.png)



1. CustomUserDetailsService를 사용하기위해 security-context.xml에 설정을 합니다.
2. 결과론적으로 username을 받아서 데이터베이스에서 정보를 가져옵니다
3. 데이터베이스에서 유저 정보를 가져올때 매핑 시켜줄 MemverVO를 설정시켜주고 + (여러개의 권한을 가질수 있다는 가정으로 authList)
4. mapper를 통해 MemverVO가 전체적으로 세팅되면
5. UserDetails를 구현해놓은 User클래스를 상속받은 CustomUser를 만들어 반환시켜줍니다.

**중요한건 JSP에서 security 태그로 정보를 이용할떄  ${pricipal}을 사용하고 이 princiapl은 우리가 반환한 CustomUser를 말합니다
  그래서 ${princiapl.username}을 사용하게되면  CustomUser 작성시 상속받은 User클래스의 username변수를 가져오게되고
  추가적인 정보를 얻기위해 만든 MemverVO안에 email을 사용하기 위해서는 ${principal.member.email} 처럼 사용해야합니다.
  이유는 CustomUser클래스 안에 private MemberVO member도 같이 principal에 들어간 것이기 떄문에.
  **  

 # 2 웹 소켓

웹 표준, 따로 import 하는 것이 없다  
IE10+이상의 스팩부터 사용가능  
사용자의 브라우저와 서버 사이에 인터렉티브한 통신 세션을 설정할 수 있게하는 기술 HTTP상에 존재  
Full duplex 양쪽이 강하게 long polling돼있다  
HTTP는 원래 서버에서 요청을 받고 응답을 주면 연결을 끊는다  
웹소켓 사용시 연결을 끊지않고 지속적으로 연결상태를 유지한다.

servlet-context.xml에 handshake할 handler를 등록 한다  

/replyEcho 로 클라이언트가 접속 하면 class="com.study.msg.ReplyEchoHandler"에 등록된 handler클래스에서 소켓을 처리한다.  

<handshake-interceptor> = 로그인한 유저의 아이디를 알고싶고 세션을 사용하기위함    
웹 소켓 세션에다가 HTTP세션을 올려야함 그래야 HTTP세션에 접근가능함  
 
MessageHandler등록하기.  
MessageHandler는 2가지로 나눌 수 있다.   
TextWebSocketHandler와 BinaryWebSocketHandler  
이 두가지는 이름으로 알 수 있듯이, Text Message/Binary Message를 각각 처리하는데 사용됨  

**3개의 메소드를 오버라이드 해야함**  
1. 처음 클라이언트와 소켓이 연결되었을 때 수행되는 메소드 -> afterConnectionEstablished
2. 소켓에다가 어떤 메소드가 보냈을 때 수행되는 메소드      -> handleTextMessage
3. 소켓연결을 끊을 때 수행되는 메소드			   -> afterConnectionCloesd

+ private String getId(WebSocketSession session) -> 처음 연결됐을때 Map에다가 유저 이름과 세션을 따로 저장하기위해  
						    세션에 저장된(로그인유저만 세션연결) 아이디와 웹소켓 세션을 따로 저장함   

![image](https://user-images.githubusercontent.com/53259940/64078728-4fe82080-cd19-11e9-8db5-95a3a207a225.png) 

<pre><code>
 
public class ReplyEchoHandler extends TextWebSocketHandler
{
  Map<String, WebSocketSession> userSessions = new HashMap<String, WebSocketSession>();
  // 유저 아이디에 해당하는 웹 소켓 세션을 따로 저장하기 위함
   
  public void afterConnectionEstablished(WebSocketSession session) throws Exception 
  {
	  System.out.println("afterConnectionEstablised : " + session);
	  if (session.getAttributes().keySet().size() == 4) {
	//session.getAttributes를 실행 시 로그인한 유저에는 SPRING_SECURITY_CONTEXT키가 추가로 저장되어 4개의 키가된다
	//로그인한 유저만 useSessions에 저장한다
		  String senderId = getId(session); // SecuriyContext에서 로그인한 유저의 아이디를 가져온다
		  this.userSessions.put(senderId, session); //저장소에 저장
    } 
  }
 
  
  public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception 
  {
     
      String msg = (String)message.getPayload();
    
      if (!StringUtils.isEmpty(msg)) { //메시지가 정상적으로 있다면 
      
      String[] strs = ((String)message.getPayload()).split(",");
     //socket.send("reply,"+replyWriter+","+boardWriter+","+bnoValue); //reply,댓글작성자,게시글작성자,글번호
     
     if (strs != null && strs.length == 4) {
        String cmd = strs[0];			
        String replyWriter = strs[1];
        String boardWriter = strs[2];
        String bno = strs[3];
        
	//B가 A의 게시글에 댓글을 달았을때 A에게 알람이 가야한다
	// 이 코드의 전제는 A가 세션에 연결중일때 알람을 보내는것.
	
        WebSocketSession boardWriterSession =userSessions.get(boardWriter); //B가 댓글단 게시글의 주인인 A의 세션 찾기
        if ("reply".equals(cmd) && boardWriterSession != null) {
          
          TextMessage tmpMsg = new TextMessage(replyWriter + " 님이" + bno + "번 게시글에 댓글을 달았습니다!!");
          boardWriterSession.sendMessage(tmpMsg);  //A에게 알람 보내기
	  
        } 
      } 
    } 
  }
 
  
  public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    System.out.println("afterConnectionClose: " + session + " : " + status);
    
    if (session.getAttributes().keySet().size() == 4) { 
      SecurityContext sc = (SecurityContext)session.getAttributes().get("SPRING_SECURITY_CONTEXT"); 
      String name = sc.getAuthentication().getName();
      userSessions.remove(name);
    } 
  }
 
  private String getId(WebSocketSession session) {
	  
    Map<String, Object> httpSession = session.getAttributes();    
    SecurityContext sec = (SecurityContext)httpSession.get("SPRING_SECURITY_CONTEXT");
    //로그인에 Spring-Security를 적용했기 때문에 유저의 정보를 SecurityContext에서 가져온다
 	
	
    String user = null;
    
    if (sec == null) { 
      user = session.getId();
    } else {
      
      user = sec.getAuthentication().getName();
    }    
    
    return user;
  }
}
</code></pre>
	
	
<pre><code>

 var socket=null;
 function connectWS(){
  	
  var ws=new WebSocket("ws://localhost:8080/replyEcho");
  socket=ws;

  ws.onopen=function(){ //커넥션이 연결됐을때 실행 
  	console.log("info: connection opend.");
  	 
  };
 //메시지 왔을때 실행
 //	WebSocketSession.sendMessage(new TextMessage())로 보내와진 것을 뿌린다
  ws.onmessage=function(event){ 
  	console.log("Receiver Message :"+event.data+"\n");
  	 
  	$("#socketAlert").text(event.data);
  	$("#socketAlert").css("display","block");
  	  
  	setTimeout(function(){
   	$("#socketAlert").css("display","none") 	
  	},3000);
  };
	//커넥션 끊어졌을때 실행
  ws.onclose=function(event){
  	console.log("Info: connection closed,");
 
  	};
	//에러 발생할때 실행
  ws.onerror=function(err){console.log("Error:",err);};
  }
  
  </code></pre>
  ---
  <pre><code>
  댓글 버튼 눌렀을때 실행되는 함수
  $("#replyBtn").on("click",function(e){
  		
  		e.preventDefault();
  	
       var replyWriter=$("input[name=replyWriter]").val();
       var replyContent=$("textarea[name=replyContent]").val();
       $("textarea[name=replyContent]").val("");
       
       var reply={reply:replyContent,replyer:replyWriter,bno:bnoValue};
       
       replyService.add(reply,function(result){ 
    	   alert(result); 
    	   showList(-1); 
       });
       
       var boardWriter='<c:out value="${board.writer}"/>';
         
       if(socket){   	//댓글 등록과 동시에 게시글 작성자에게 알림을 보내기위함
    	   socket.send("reply,"+replyWriter+","+boardWriter+","+bnoValue); //reply,댓글작성자,게시글작성자,글번호
       }
         
  	}); /* End of reply inert func */
  </code></pre>
  
![image](https://user-images.githubusercontent.com/53259940/64079282-aa38af80-cd20-11e9-8a05-bd06b911e8b3.png)
	
	
# 이메일 인증

**pom.xml에 관련 라이브러리를 받아준다**
![image](https://user-images.githubusercontent.com/53259940/64079876-49ad7080-cd28-11e9-860e-f467f1acee86.png)

**스프링 root-context.xml에 빈을 추가시켜준다**
![image](https://user-images.githubusercontent.com/53259940/64079892-942eed00-cd28-11e9-9d4b-2f7ad64a1ca5.png)


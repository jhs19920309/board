# 1.스프링 시큐리티 
## A )  

 인증 처리는 **AuthenticationManager(인터페이스)** 의 authenticate 메소드가 수행한다
 <pre><code>
 Authentication authenticate(Authentication auth) 
 </code></pre> 
 
 AuthenticationManager 인터페이스를 구현한 클래스인 **ProviderManager(클래스)** 를 시큐리티에서 지원해준다  
 <br>
      
 ![image](https://user-images.githubusercontent.com/53259940/64058900-d5ba7d80-cbec-11e9-85ca-b5b399e48623.png)
 
 <br>
 
 **ProviderManager(클래스)** 는 authenticate 메소드 인증 구현을 **AuthenticationProvider(인터페이스)** 에게 위임한다
 **AuthenticationProvider(인터페이스)** 구현체로 나의 경우에는 데이터베이스에서 사용자정보를 읽어오기 때문에  
 **DaoAuthenticationProvider(클래스)** 를 사용하게 됐다
 
 <hr>
 여기까지 다시 정리하자면 사용자가 아이디와 비밀번호를 입력하면 Authentication인증 객체에 아이디와 비밀번호가 저장된다음
 Authentication(인터페이스)에게 인증을 처리해달라고 한다  
 그러면 ProviderManager(클래스) 가 인증을 처리하기 위해 authenticate() 메소드를 실행하게 되고  
 이 메소드는 내부적으로 인증처리과정에서 AuthenticationProvider를 사용하고 디비를 인증처리과정에 사용할 경우  
 AuthenticationProvider(인터페이스) 구현 클래스로 DaoAuthenticationProvider 클래스를 사용하게된다
 <hr>
 
 
 
 

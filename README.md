# 1.스프링 시큐리티

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
 

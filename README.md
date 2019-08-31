# 1.스프링 시큐리티

 인증 처리는 **AuthenticationManager(인터페이스)** 의 authenticate 메소드가 수행한다
 <pre><code>
 Authentication authenticate(Authentication auth) 
 </code></pre> 
 
 AuthenticationManager 인터페이스를 구현한 클래스인 **ProviderManager(클래스)** 를 시큐리티에서 지원해준다  
 <br>
      
 ![image](https://user-images.githubusercontent.com/53259940/64058900-d5ba7d80-cbec-11e9-85ca-b5b399e48623.png)
 
 
 **ProviderManager(클래스)** 

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    
<!DOCTYPE html>
<html>
<head>
<script
  src="https://code.jquery.com/jquery-2.2.4.min.js"
  ></script>
<meta charset="UTF-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Monoton&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Miss+Fajardose&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="/resources/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/animate.css">
    
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/css/magnific-popup.css">

    <link rel="stylesheet" href="/resources/css/aos.css">

    <link rel="stylesheet" href="/resources/css/ionicons.min.css">

    <link rel="stylesheet" href="/resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/resources/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="/resources/css/flaticon.css">
    <link rel="stylesheet" href="/resources/css/icomoon.css">
    <link rel="stylesheet" href="/resources/css/style.css">


<title>로그인</title>
</head>
<body>
 <!-- 
 			<form role='form' method='post' action='/login'> 
			 <fieldset>
			 	<div class="form-group">
			 		<input class="form-control" placeholder="userid" name="username" type="text" autofocus>
			 	</div>
			 	
			 	<div class="form-group">
			 	  <input class="form-control" placeholder="Password" name="password" type="password" value="">
			 	</div>
			 	
				<div>
					<button id="sendBtn"class="btn btn-primary btn-lg btn-block">Login</button>
				</div> 
			  
			 </fieldset>
			 
			 <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
			   
			 </form>

			 -->
			 
			 
  
  <section class="ftco-section ftco-no-pt ftco-no-pb contact-section">
      <div class="container">

          <div class="row d-flex align-items-stretch no-gutters">
              <div class="col-md-12 p-5 order-md-last">
                  <div class="row justify-content-md-center">
                  <h3>로그인</h3>
                  </div>
              </div>
          </div>
          <div class="row justify-content-md-center">
          <div class="col-sm-9 col-md-offset-3">
          
              <form role="form" action="/login" method="post">
                 
                  <div class="form-group">
                      <label for="inputName">아이디</label>
                      <input type='text' class="form-control"  name="username" type="text"  minlength="1" placeholder="아이디를 입력해 주세요"  autofocus required>
                       
                  </div>
                  
                  <div class="form-group">
                      <label for="inputPassword">비밀번호</label>
                      <input class="form-control" placeholder="비밀번호" name="password" type="password" value="" minlength="2" required >
                          
                  </div>
                   
                   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

 
			
                  <div class="form-group text-center">
                     	<button id="sendBtn"class="btn btn-primary btn-lg btn-block">Login</button>
                  </div>
                  
                  
                  
              </form>
          </div>
          </div>
      </div>
  </section>
  
			 
			 

</body>
			<script type="text/javascript">
			
			$("#sendBtn").on("click",function(e){
				
				e.preventDefault();
				$("form").submit();
			});
			
			</script>


</html>
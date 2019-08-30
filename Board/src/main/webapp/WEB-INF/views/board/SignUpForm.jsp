 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
  
  <head>
  
      <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <title>회원가입</title>
    <meta charset="utf-8">
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
  </head>
  <body>
  
  <section class="ftco-section ftco-no-pt ftco-no-pb contact-section">
      <div class="container">

          <div class="row d-flex align-items-stretch no-gutters">
              <div class="col-md-12 p-5 order-md-last">
                  <div class="row justify-content-md-center">
                  <h3>회원가입  .</h3>
                  </div>
              </div>
          </div>
          <div class="row justify-content-md-center">
          <div class="col-sm-9 col-md-offset-3">
          
              <form role="form" action="/signup/register" method="post">
                 
                  <div class="form-group">
                      <label for="inputName">아이디</label>
                      <input type="text" class="form-control" minlength="6" name="userid" placeholder="아이디를 입력해 주세요" required>     
                      <button class='btn btn-primary mt-2' id="idcheck">중복 확인</button>
                  </div>
                  
                  <div class="form-group">
                      <label for="inputName">이름</label>
                      <input type="text" class="form-control" minlength="6" name="userName" placeholder="이름을 입력해 주세요" required>     
                      
                  </div>
                 
                  <div class="form-group">
                      <label for="InputEmail">이메일 주소</label>
                      <input type="email" class="form-control" name="email" placeholder="이메일 주소를 입력해주세요" required>
                      <p id="emailCheck" style="color:blue"></p>
                      <!--   
                       <input type="text" class="form-control"id="AuthenNum" placeholder="인증번호"
                              style="width:200px; height:50px; " maxlength="8" >  -->
                        
                      <button class='btn btn-primary mt-2' id="receiveNum" >인증번호 받기</button> 
                  </div>
                 
                  <div class="form-group">
                      <label for="inputPassword">비밀번호</label>
                      <input type="password" class="form-control"  minlength="6" name="userpw" placeholder="비밀번호를 입력해주세요" required>
                   </div>
                 
                  <div class="form-group">
                      <label for="inputPasswordCheck">비밀번호 확인</label>
                      <input type="password" minlength="6" class="form-control" name="passwordcheck" placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요"  required>
                      <p id="checkpw" style="color:blue"></p>
                      <p id="checkpw2" style="color:red"></p>
                      <button id="Pwcheck"class='btn btn-info mt-2'>비밀번호 확인</button>
                  </div>
                  
                   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                  <div class="form-group text-center">
                      <button type="submit" id="register" class="btn btn-primary"> 회원가입<i class="fa fa-check spaceLeft"></i> </button>
                      <button type="reset" class="btn btn-warning"> 가입취소<i class="fa fa-times spaceLeft"></i>
                      </button>
                  </div>
                  
                  
                  
              </form>
          </div>
          </div>
      </div>
  </section>
 
  </body>
   
  <script>

  
  //////////////////////////                    비밀번호 체크				/////////////////
  var pwCheck=false;
  $("#Pwcheck").on("click",function(e){

      e.preventDefault();

      if($("input[name=userpw]").val()===$("input[name=passwordcheck]").val())
      {
          $("#checkpw2").empty();
          $("#checkpw").text("비밀번호가 일치합니다");
          pwCheck=true;
      }
      else{
          $("#checkpw").empty();
          $("#checkpw2").text("비밀번호가 일치하지 않습니다");
          pwCheck=false;
          $("input[name=userpw]").focus();
      }

  });
  //////////////////////////                    비밀번호 체크				/////////////////
  
  
   //////////////////////////                   아이디 중복 체크				/////////////////
   var isDuplicated=false;
  $("#idcheck").on("click",function(e){
	 
	  e.preventDefault();
	 
	  var name=$(this).prev().val(); 
	  
			$.getJSON("/signup/id/"+name+".json",function(data){
				
			 		if(data==1){ 
			 			alert("해당 아이디가 이미 존재합니다")
			 			isDuplicated=false; 
			 		}
			 		
			 		else{
			 			alert("사용 가능한 아이디 입니다");
			 			isDuplicated=true;
			 		}
			}); 
  });
//////////////////////////					아이디 중복 체크				/////////////////
  
  
  
  
 /////////////////////////				   이메일 인증번호 받기				 ///////////////////////
   var number;  
    
  $("#receiveNum").on("click",function(e){
	 
	  e.preventDefault();
	  var temp=$("input[name=email]").val();
	  
	  var dup;
	   
	  $.ajax({
          type: "GET",
          url: "/signup/email/"+temp+".json",
          async:false, // 이 한줄만 추가해주시면 됩니다. 
          dataType: "json",
          success: function (data) {
               dup=data;
          }
      });
   
	    if(dup>0){ 
	    	alert("해당 이메일이 이미 존재합니다")
	    	return;
	    }
		  
	   var strHtml="<input type='text' class='form-control' id='authenNum' placeholder='인증번호' style='width:200px; height:50px;'>" ;
       $("#emailCheck").after(strHtml);
       
       var strHtml2="<button class='btn btn-primary mt-2' id='checkNum'>인증번호 확인</button> ";
       $(this).replaceWith(strHtml2);
	  
	  var temp=$("input[name=email]").val();
	 alert(temp);
	  
	  $.getJSON("/signup/send/"+temp+".json",function(data){
		 
		  number=data;
		   
		  
	  });
	  
	   
  });
  /////////////////////////				   이메일 인증 번호 받기			 ///////////////////////
  
  
  
  ////////////////////////                이메일 인증 번호 체크        		////////////////////
  var isNumberOk=false;;
  $(document).on("click","#checkNum",function(e){
	  e.preventDefault();
	  if($("#authenNum").val()==number)
		  {
		  alert("인증번호가 맞습니다");
		  isNumberOk=true;	
		  }
	  
	  else{
		  isNumberOk=false;
		  alert("인증번호가 틀렸습니다");
	  }
	  
  });
  ////////////////////////                이메일 인증 번호 체크        		////////////////////
  
  
  
  //////////////////////////                   전송 버튼				/////////////////
  $("#register").on("click",function(e){
	 //pwCheck&&isNumberOk&&isDuplicated
	 e.preventDefault();
	 
	   if(!(pwCheck&&isNumberOk&&isDuplicated))
		   {
		   			if(!isDuplicated)
		   			alert("아이디 중복 검사를 해주세요")
		   			if(!isNumberOk)
		   			alert("이메일 인증번호를 올바르게 입력해주세요")
		   			if(!pwCheck)
		   			alert("비밀번호 체크를 해주세요");
		   			
		   			return;
		   }
	   else{
		  $("form[role='form']").submit();
	   }
	  
  });

  
  </script>
  
  
          
<%@include file="footer.jsp" %>         
</html>
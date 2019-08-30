<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
       
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    
   <head>
    
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
  <!-- ------------------------------------------------------------------------------------------- -->
      <div id="socketAlert"class="alert alert-success" role="alert" style="display:none;"> 
	</div>
 <!-- ------------------------------------------------------------------------------------------- -->
    
    
    <section class="hero-wrap hero-wrap-2" style="background-image: url('/resources/images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
           
           				<sec:authorize access="isAnonymous()">
					<h2> 	<a href="/customLogin"> [Login] </a> </h2>
					<h2>    <a href="/board/SignUpForm">[회원가입]</a></h2>
						</sec:authorize>
						
						   <sec:authorize access="isAuthenticated()">
						 <h2>  <a href="#" id="Logout"> [Logout] </a></h2>
						   </sec:authorize>
						   
						   <br>
						   <br>
            <h1 class="mb-2 bread">자유 게시판</h1>
           
          </div>
        </div>
      </div>
    </section>
	

		<section class="ftco-section ftco-no-pt ftco-no-pb contact-section">
			<div class="container">
				<div class="row d-flex align-items-stretch no-gutters">
					<div class="col-md-12 p-5 order-md-last">

 
						<button id="regBtn" type="button" class="btn btn-primary mb-3">글 쓰기 </button>
						 
						  
                      <table class="table table-striped" >
                            <thead>
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col">제목</th>
                                <th scope="col">작성자</th>
                                <th scope="col">작성일</th>
                                <th scope="col">수정일</th>

                            </tr>
                            </thead>
                          <c:forEach items="${list}" var="board">
                              <tr>
                                  <td><c:out value="${board.bno}"/></td> 
                                  
                                  <td><a class='move' href='<c:out value="${board.bno}"/>'>  
                                  <c:out value="${board.title}"/>      <b>  [<c:out value="${board.replyCnt}"/>]</b>
                                  </a>
                                  </td>
                                  
                                  
                                  <td><c:out value="${board.writer}"/></td>
                                  <td> <fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }"/></td>
                                  <td> <fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate }"/></td>
                              </tr>
                          </c:forEach>
                        </table>
                        
       
      		<form id="searchForm" action="/board/list" method="get">
      		
      			<select name="type">
      			  <option value="" <c:out value="${page.pg.type==null? 'selected':''}"/>>--</option>
      			    <option value="T" <c:out value="${page.pg.type eq 'T'?'selected':''}"/>>제목</option>
      			    <option value="C" <c:out value="${page.pg.type eq 'C'?'selected':''}"/> >내용</option>
      			    <option value="W" <c:out value="${page.pg.type eq 'W'?'selected':''}"/>>작성자</option>  		
      		 	</select>
      			
      			<input type="text" name="keyword" value='<c:out value="${page.pg.keyword}"/>'/>
      			<input type="hidden" name="pageNum" value='${page.pg.pageNum}'/>
      			<input type="hidden" name="amount" value='${page.pg.amount}'/>
      			<input type="hidden" name="type" value='${page.pg.type}'/>
      			
      			<button class="btn btn-primary">search</button>
      		
      		
      		
      		</form>	
      	
    
                        
                        
                       
     <div class="row no-gutters my-5">                     
         <div class="block-27">
              <ul>
              
                <c:if test="${page.prev}">
                
                <li class="paginate active"><a href="${page.startPage-1}">Prev </a></li> 
                
                </c:if>
                
                			<c:forEach var="num" begin="${page.startPage}" end="${page.endPage}">
                        	<li class="paginate ${page.pg.pageNum==num ? 'active' :''}" >
                        	 <a href="${num}">${num}</a></li>              	
                        	</c:forEach>
                        	
               <c:if test="${page.next}">
                <li class="paginate active"><a href="${page.endPage+1}"> Next</a></li>
                </c:if>
               
              </ul> 
          </div>
      </div>
        
        
        <form id="actionForm" action="/board/list" method="get">
        <input type="hidden" name="pageNum" value='<c:out value="${page.pg.pageNum }"/>'/>
        <input type="hidden" name="amount" value='<c:out value="${page.pg.amount }"/>'/>
        </form>
                        
                        
 
 
    		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          		  <div class="modal-dialog">
              		    <div class="modal-content">
               		        <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                             <h4 class="modal-title" id="myModalLabel">알림</h4>
                             </div>
                           <div class="modal-body">
                                        		    처리가 완료되었습니다
                           </div>
                          
                           <div class="modal-footer">
                               <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                          <button type="button" class="btn btn-primary">Save changes</button>
                          </div>
                          
                   </div>
                                    <!-- /.modal-content -->
                   </div>
                                <!-- /.modal-dialog -->
         </div>
 




                    

				</div>
			</div> 
			</div>
        </section>




    <%@include file="footer.jsp" %>   
     <sec:authentication property="principal" var="pinfo"/>
  </body>
  
  <script type="text/javascript"> 
  $(document).ready(function(){
  
	  $("#Logout").on("click",function(e){
		 var csrfHeaderName="${_csrf.headerName}";
		 var csrfTokenValue="${_csrf.token}";
		  
		  $.ajax({
			type:'post',
			url:'/customLogout',
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			}
		
			  
		  }); 
		  
		  location.reload();
	  });
  });
  
  
  
  $(document).ready(function(){
	 
	  var result='<c:out value="${result}"/>';
	   
	  
	  checkModal(result);
	  history.replaceState({},null,null);
	   
	  
	  function checkModal(result)
	  {
		  
 
		  	if(result==='' || history.state){
		  			return;
		  	}
		  	if(parseInt(result)>0){
		  			$(".modal-body").html("게시글 "+parseInt(result)+" 번이 등록되었습니다.");
		  	}
		  	
		  	$("#myModal").modal("show");
		  		 
	  }
	  
	  //글 등록 버튼 클릭시 글 등록 페이지로 이동 func	  
	  $("#regBtn").on("click",function(){		 
		  self.location="/board/register";
	  });
	  //글 등록 버튼 클릭시 글 등록 페이지로 이동 func
	  
	  
	  var actionForm=$("#actionForm");
	  
	  $(".paginate a").on("click",function(e){
		 
		  e.preventDefault();
		  
		  actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		  actionForm.submit();
		   
	  });
	  
	  $(".move").on("click",function(e){
		 
		  e.preventDefault();
		  
		  actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
		  actionForm.attr("action","/board/get");
		  actionForm.submit(); 
	  });
	  
	  
	  
	  var searchForm=$("#searchForm");
	  
	  $("#searchForm button").on("click",function(e){
		 
		  if(!searchForm.find("option:selected").val()){
			  alert("검색 종류를 선택하세요");
			  return false;
		  }
		  
		  if(!searchForm.find("input[name='keyword']").val()){
			  alert("키워드를 입력하세요");
			  return false;
		  }
		  
		  searchForm.find("input[name='pageNum']").val("1");
		  e.preventDefault();
		  
		  searchForm.submit();
		  
		   
	  });
	   
	  
	  
  });
  
  
  </script>
  
  
  
  
  
  
  
  <script>	/////////////////// 웹 소켓 설정	//////////////////////////

var socket=null;
  
 $(document).ready(function(){
	  if("${pinfo}"!="anonymousUser")//로그인된 유저만 소켓에 연결해 낭비를 줄인다
			 connectWS();  //get.jsp가 열리자마자 connectWS()메소드로 소켓 연결한다. 그런다음 다른 메소드에서 연결 객체를 쓸수 있게 전역변수로 socket에 소켓을 저장한다

 });

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
  	let $socketAlert=$("div#socketAlert");
  	$socketAlert.text(event.data);
  	$socketAlert.css("display","block");
  	
  	setTimeout(function(){
  		
  		$socketAlert.css("display","none") 	
  	},3000);
  };
	//커넥션 끊어졌을때 실행
  ws.onclose=function(event){
  	console.log("Info: connection closed,");
//  	setTimeout(function(){connect();},1000);
  	};
	//에러 발생할때 실행
  ws.onerror=function(err){console.log("Error:",err);};
  
  }
 
  
  
  </script>
  
  
   
  
  
</html>
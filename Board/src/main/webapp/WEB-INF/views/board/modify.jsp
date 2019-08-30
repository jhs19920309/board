<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<style>

	.uploadResult{
		width:100%;
		background-color:#999999;
		}
		
		.uploadResult ul{
		
		display:flex;
		flex-flow:row;
		justify-content:center;
		align-items:center;
		
		}
		
		.uploadResult ul li{
		
			list-style:none;
			padding:10px;
			align-content:center;
			text-align:center;
		
		}
		
		.uploadResult ul li img{
		width:330px;
		}
		
		.uploadResult ul li span{
			color:white;
		}
		
		.bigPictureWrapper{
		
		position:absolute;
		display:none;
		justify-content:center;
		align-items:center;
		top:0%;
		width:100%;
		height:100%;
		background-color:gary;
		z-index:100;
		background:rgba(255,255,255,0,5);
		
		}
		
		.bigPicture{
		
		position:relative;
		display:flex;
		justify-content:center;
		align-items:center;
		
		
		}
		
		.bigPicture img{
		 width:800px;
		}

</style>
  <head>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <title>Appetizer - Free Bootstrap 4 Template by Colorlib</title>
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
            <h1 class="mb-2 bread">글쓰기</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> </p>
          </div>
        </div>
      </div>
    </section>
	

		<section class="ftco-section ftco-no-pt ftco-no-pb contact-section">
			<div class="container">
				<div class="row d-flex align-items-stretch no-gutters">
					<div class="col-md-12 p-5 order-md-last">


						<h2 class="h4 mb-5 font-weight-bold">게시글 보기</h2>
                         
                         	
                         	<form role="form" action="/board/modify" method="post"> 
                         	
                         	<div class="form-group">
                         			<label>번호</label>
                         			<input class="form-control" name="bno" value='<c:out value="${board.bno}"/>' readonly>
                         	</div>
                         
                         
                            <div class="form-group">
                                <label>제목</label>
                                <input class="form-control" name="title" value='<c:out value="${board.title}"/>'  >
                            </div>
                            
                            
                            <div class="form-group">
                            	<label>작성자</label>
                                <input class="form-control"  name="writer"  value='<c:out value="${board.writer}"/>' readonly>
                            </div>
                             
                            <div class="form-group">
                                <label>내용</label>
                                <textarea class="form-control" name="content" cols="30" rows="7"  ><c:out value="${board.content}"/></textarea>
                            </div>
                            
                            <div class="form-group">
                            <label>RegDate</label>
                            <input class="form-control" name="regDate" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regdate}"/>' readonly> 
                            </div>
                            
                            <div class="form-group">
                            <label>Update Date</label>
                            <input class="form-control" name="updateDate" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.updateDate}"/>' readonly> 
                            </div>
                            
                            
							<button type="submit" data-oper="modify" class="btn btn-primary">수정</button>                            
							<button type="submit" data-oper="remove" class="btn btn-primary">삭제</button>                            
							<button type="submit" data-oper="list" class="btn btn-primary">글 목록</button>                            
							<hr>
                             <input type="hidden" name="pageNum" value='<c:out value="${pg.pageNum}"/>'>
                             <input type="hidden" name="amount" value='<c:out value="${pg.amount}"/>'>
                             
                                 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                             <input type='hidden' name='keyword' value='<c:out value="${pg.keyword}"/>'>
                             <input type='hidden' name='type' value='<c:out value="${pg.type}"/>'>
                             
                        
						 </form>
						 
						 
						 <div class='bigPictureWrapper'>
						   <div class='bigPicture'>
						   
						   </div>
						 </div>
						 
						   <div class='panel-heading'><h3>첨부파일</h3></div>
                          		  <div class='panel-body'>
                              		<div class='form-group uploadDiv'>
                            			<input type='file' name='uploadFile' multiple>
                            		</div>
                            			<div class="uploadResult"> 
											<ul>
							 
											</ul>  
										</div>
                            		
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
	 
	  
	  (function(){
		 
		  var bno='<c:out value="${board.bno}"/>';
		  
		  $.getJSON("/board/getAttachList",{bno:bno},function(arr){
			 
			  console.log(arr);
			  
			  var str="";
			  
			  $(arr).each(function(i,attach){
				 
				   if(attach.fileType){
					   var fileCallPath=encodeURIComponent(attach.uploadPath+"/s_"+attach.uuid+"_"+attach.fileName);
					   
					   str+="<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'>";
					   str+="<span> "+attach.fileName+"</span>";
				  		str+="<button type='button' class='btn btn-primary' data-file=\'"+fileCallPath+"\' data-type='image'>[X]</button><br>";
				    	  //삭제를 위해서는 업로드된 파일의 경로와 uuid가 포함된 파일의 이름이 필요함 위에 button태그에 데이터 속성으로 추가
				  		str+="<img src='/display?fileName="+fileCallPath+"'>";
				  		str+="</div></li>";
				   }
				   else
					   {
					   str+="<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'>";
					   str+="<span> "+attach.fileName+"</span>";
						  str+="<button type='button' class='btn btn-primary'  data-file=\'"+fileCallPath+"\' data-type='file'	>[X]</button><br>";
						  //삭제를 위해서는 업로드된 파일의 경로와 uuid가 포함된 파일의 이름이 필요함 위에 button태그에 데이터 속성으로 추가
					  	  str+="<img src='/resources/img/attach.png'></a>";
					  	  str+="</div></li>";
					    
					   }
			 });
			  
			   $(".uploadResult ul").html(str); 
			  
		  });
		  
		  
		  
	  })();
	  
	  
	  $(".uploadResult").on("click","button",function(e){
		 
		  if(confirm("Remove this file?"))
			  {
			  	var targetLi=$(this).closest("li");
			  	targetLi.remove();
			  }
		  
		  
		  
	  });
	  
	  
	  
	  var regex=new RegExp("(.*?)\.(exe|sh|zip|alz)&");
	  var maxSize=5242880;
	  
	  function checkExtension(fileName,fileSize)
	  {
		  if(fileSize>=maxSize)
			  {
			  	alert("파일 사이즈 초과");
			  	return false;
			  }
		  
		  if(regex.test(fileName))
			  {
			  alert("해당 종류의 파일은 업로드 할 수 없습니다");
			  return false;
			  }
		  return true;
		   
	  }
	  
	  var csrfHeaderName="${_csrf.headerName}";
	  var csrfTokenValue="${_csrf.token}";
	  
	  $("input[type='file']").change(function(e){
		   
		  var formData=new FormData();
		  
		  var inputFile=$("input[name='uploadFile']");
		  
		  var files=inputFile[0].files;
		  
		  for(var i=0;i<files.length;i++)
			  {
			  	if(!checkExtension(files[i].name,files[i].size)){
			  		return false;
			  	}
			  	formData.append("uploadFile",files[i]);
			  
			  
			  }
		  
		  $.ajax({
			 
			  
			  url:'/uploadAjaxAction',
			  processData:false,
			  contentType:false,data:
			  formData,type:'POST',
			  beforeSend:function(xhr)
			  {
				  xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			  },
			  
			  dataType:'json',
			  success:function(result){
				  console.log(result);
				  showUploadResult(result);  //ResponseEntity<List<BoardAttachVO>> 리턴 받아서 showUploadResult 메소드로 넘김
			  }
			   
		  });
		   
	  });
	  
	  
	  function showUploadResult(uploadResultArr)
	  {
		  
		  
		  if(!uploadResultArr||uploadResultArr.length==0){return ;}
		  
		  var uploadUL=$(".uploadResult ul");
		  
		  var str="";
		  
		  $(uploadResultArr).each(function(i,obj){
			 
			  if(obj.fileType)
				  {
				  		var fileCallPath=encodeURIComponent( obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
				  	 	 console.log("이미지 경로 :   "+fileCallPath);
				  		str+="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'	><div>";
				  		str+="<span> "+obj.fileName+"</span>";
				  		str+="<button type='button' class='btn btn-primary' data-file=\'"+fileCallPath+"\' data-type='image'>[X]</button><br>";
				  	  //삭제를 위해서는 업로드된 파일의 경로와 uuid가 포함된 파일의 이름이 필요함 위에 button태그에 데이터 속성으로 추가
				  		str+="<img src='/display?fileName="+fileCallPath+"'>";
				  		str+="</div></li>";
				 
				  }
			  
			  else{
					  var fileCallPath=encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
					  console.log("하기전f");
					  console.log(fileCallPath);
					  console.log("한 후");
					  
					  var fileLink=fileCallPath.replace(new RegExp(/\\/g),"/");
					  console.log(fileLink);
					  
					  str+="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'	><div>";
					  str+="<span> "+obj.fileName+"</span>";
					  str+="<button type='button' class='btn btn-primary'  data-file=\'"+fileCallPath+"\' data-type='file'	>[X]</button><br>";
					  //삭제를 위해서는 업로드된 파일의 경로와 uuid가 포함된 파일의 이름이 필요함 위에 button태그에 데이터 속성으로 추가
				  	  str+="<img src='/resources/img/attach.png'></a>";
				  	  str+="</div></li>";
				  
			  }
			   
		  });
		  
		  uploadUL.append(str);
	  }
	  
	  
  });
  
  
  
  
  
  
  
  
  $(document).ready(function(){
	 
	  var formObj=$("form");
	  
	  $("button").on("click",function(e){
 		  
		  e.preventDefault();
		  
		  var operation=$(this).data("oper");
		  
		  if(operation ==='remove'){
			  formObj.attr("action","/board/remove");
		  }
		  else if(operation ==='list')		//list로의 이동은 데이터가 아무것도 필요없다
			  {
			  formObj.attr("action","/board/list").attr("method","get");
			  var pageNumTag=$("input[name='pageNum']").clone();
			  var amountTag=$("input[name='amount']").clone();
			  
			  var keywordTag=$("input[name='keyword']").clone();
			  var typeTag=$("input[name='type']").clone();
			  
			  formObj.empty();
			  
			  formObj.append(pageNumTag);
			  formObj.append(amountTag);
			  formObj.append(keywordTag);
			  formObj.append(typeTag);
			   
			  }
		  
		  else if(operation==='modify')
			  {
			  	console.log("submit clicked");
			  	
			  	var str="";
			  	
			  	$(".uploadResult ul li").each(function(i,obj){
			  		
			  		var jobj=$(obj);
					console.dir(jobj);
					
					str+="<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";		
					
					str+="<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";		
					
					str+="<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";		
					
					str+="<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";	
			  		 
			  		
			  	}); 
			  	
			  	formObj.append(str).submit();
			  } 
		  formObj.submit(); 
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
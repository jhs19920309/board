<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    
<!DOCTYPE html>
<html>
<style>.uploadResult{
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


						<h2 class="h4 mb-5 font-weight-bold">글 등록</h2>
                        <form action="/board/register" method="post" role="form">
                        
                            <div class="form-group">
                                <input type="text" name="title" class="form-control" placeholder="글 제목">
                            </div>
                            <div class="form-group">
                                <input type="text" name="writer" class="form-control" value='<sec:authentication property="principal.username"/>' readonly/>
                            </div>
                             
                            <div class="form-group">
                                <textarea name="content" id="" cols="30" rows="7" class="form-control" placeholder="글 내용"></textarea>
                            </div>
                            
                          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                   
                            <div class="form-group"> 
                                 <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                            
                        
                        </form>
	
	 
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
  
  $(document).ready(function(e){
	   
	  
	  var formObj=$("form[role='form']");
	  
	  $("button[type='submit']").on("click",function(e){
		 
		  e.preventDefault();
		  

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
		  
		  
	  });
	  
	  
	  
	  /*					특정한 확장자를 제외한 파일들의 업로드 제한하기 웹 공격을 막기위해서 행해지는 조치	+ 파일 크기 제한 조치			*/
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
	  
	  /*					파일 업로드 버튼에 변화가 생겼을시 바로 파일 이미지를 보여주기 위함 그러기 위해 Ajax방식을 사용			 			*/
	  $("input[type='file']").change(function(e){
		 
		  
		  var formData=new FormData();  //Ajax를 이용해 파일 데이터를 전송하는 방식에서는 첨부파일 처리를 FormData라는 객체를 이용함
		  
		  var inputFile=$("input[name='uploadFile']"); // 인풋 객체를 가져와서
		  var files=inputFile[0].files;				   // 파일 꺼내오기 
		  
		  for(var i=0;i<files.length;i++)
			  {
			  	if(!checkExtension(files[i].name,files[i].size)){		//파일 사이즈와 업로드되는 파일의 종류를 체크한다.
			  		return false;
			  	}
			  	formData.append("uploadFile",files[i]);  		//키-값 형식으로 formData에 넣어준다
			  
			  
			  }
		  
		  $.ajax({
			 
			  
			  url:'/uploadAjaxAction',
			  processData:false,				 
			  contentType:false,
			  /*contentType을 false를 해줌으로 써 브라우저로 하여금 FormData를 사용하여 전송 시 자동으로 content-Type을 multipart/formdata로 세팅
			  processData : 기본 값은 true이다. 해당 값이 true 일때는 data 값들이 쿼리스트링 형태인 key1=value1&key2=value2 형태로 전달 된다. 
			    하지만 이렇게 하면 file값들은 제대로 전달되지 못한다. 그래서 해당 값을 false로 해주어 {key1: 'value1', key2: 'value2'} 형태로 전달 해주어야 file값들도 제대로 전달 된다.
			 contentType : 기본값은 'application/x-www-form-urlencoded'이다. 해당 기본 타입으로는 파일이 전송 안되기 때문에 false로 해주어야 한다.
			   processData 플래그를 false로 설정해야합니다. 그렇지 않으면 jQuery가 FormData를 문자열로 변환하려고 시도하는데 이는 실패합니다.*/
			  
			  beforeSend:function(xhr){
				  xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			  },
			  /*Spring-security가 적용된 상태에서는 POST로 전송시 csrf값을 보내야한다*/
			  data:formData,
			  type:'POST', 
			  dataType:'json',  			//서버가 응답(response)할 때 보내줄 데이터의 타입
			  success:function(result){
				  console.log(result);
				  showUploadResult(result);  //ResponseEntity<List<BoardAttachVO>> 리턴 받아서 showUploadResult 메소드로 넘김
			  }
			   
		  });
		   
	  });
	  
	  //파일 업로드후 바로 JSON으로 응답을 받아서 이미지를 보여주기 위한 함수//
	  function showUploadResult(uploadResultArr)
	  {
		  
		  
		  if(!uploadResultArr||uploadResultArr.length==0){return ;}
		  
		  var uploadUL=$(".uploadResult ul");
		  
		  var str="";
		  
		  $(uploadResultArr).each(function(i,obj){
			 
			  if(obj.fileType) //만약의 파일의 타입이 이미지라면
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
			  
			  else{  //만약에 파일의 타입이 이미지가 아닌 일반 타입이라면 attach.png로 첨부파일 이미지를 보여준다
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
	  
	  
	  //////////////파일 삭제 함수 ////////
	  $(".uploadResult").on("click","button",function(e){
		 
		  var targetFile=$(this).data("file");
		  var type=$(this).data("type");
		  
		  var targetLi=$(this).closest("li");
		  
		  $.ajax({
			 
			  url:'/deleteFile',
			  data:{fileName:targetFile,type:type},
			  beforeSend:function(xhr){
				  xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			  },
			  dataType:'text',
			  type:'post',
			  success:function(result)
			  {
				  	alert(result);
				  	targetLi.remove();
			  }
			   
			  
		  });
		  
		  
	  });
	  
	  
	  
	  
	  
	  
	  
  });// End of document
	 
  
  
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
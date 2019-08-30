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
    <title>게시글 보기</title>
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
  
  <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
    <div id="socketAlert"class="alert alert-success" role="alert" style="display:none;">
    
	</div>
  <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
    
	   
    <!-- END nav -->
    
    <section class="hero-wrap hero-wrap-2" style="background-image: url('/resources/images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">글쓰기</h1>
            
          </div>
        </div>
      </div>
    </section>
	

		<section class="ftco-section ftco-no-pt ftco-no-pb contact-section">
			<div class="container">
				<div class="row d-flex align-items-stretch no-gutters">
					<div class="col-md-12 p-5 order-md-last">


						<h2 class="h4 mb-5 font-weight-bold">게시글 보기</h2>
						     
                             <sec:authentication property="principal" var="pinfo"/>
                              <sec:authorize access="isAuthenticated()">
                                <c:if test="${pinfo.username eq board.writer }">
                    
                            	 <button data-oper="modify" class="btn btn-primary float-right mb-2" >수정</button> 
                                </c:if>
                             </sec:authorize>
                             
                             <button data-oper="list" class="btn btn-primary float-right mr-2 mb-2" >글 목록</button>
                         
                         	<div class="form-group">
                         			<label>번호</label>
                         			<input class="form-control" name="bno" value='<c:out value="${board.bno}"/>' readonly>
                         	</div>
                         
                         
                            <div class="form-group">
                                <label>제목 </label>
                                <input class="form-control" name="title" value='<c:out value="${board.title}"/>' readonly>
                            </div>
                            
                            
                            <div class="form-group">
                            	<label>작성자</label>
                                <input class="form-control"  name="writer"  value='<c:out value="${board.writer}"/>' readonly>
                            </div>
                             
                            <div class="form-group">
                            	<label>내용</label>
                                <textarea class="form-control" name="content" cols="30" rows="7"   readonly><c:out value="${board.content}"/></textarea>
                            </div>
                            
                          
                          
                         <!-- ----------------------------------------------------------------- -->    
                             <form id="operForm" action="/board/modify" method="get">
                             
                             <input type="hidden" id='bno' name='bno' value='<c:out value="${board.bno }"/>'>
                             <input type='hidden' name='pageNum' value='<c:out value="${pg.pageNum}"/>'>
                             <input type='hidden' name='amount' value='<c:out value="${pg.amount}"/>'>
                             
                             <input type='hidden' name='keyword' value='<c:out value="${pg.keyword}"/>'>
                             <input type='hidden' name='type' value='<c:out value="${pg.type}"/>'>
                              
                             </form>
                         <!-- ----------------------------------------------------------------- -->    
                             <hr>
                             
                             <div class='bigPictureWrapper'>
                             	<div class='bigPicture'>
                             	
                             	</div>
                             </div>
                             
                             
                             <div class='panel panel-primary'>
                             
                             	 <div class='panel-heading'><h3>첨부 파일 </h3></div>
                             	 
                             	 <div class='panel-body'>
                             	 	<div class='uploadResult'>
                             	 		<ul>
                             	 				 	
                             	 		</ul>
                             	  	</div>
                             	  
                             	 </div> 
                             </div>
                             
                             
                             
                             
                             
                             
                             
                             
                             <hr> 
                            <!-- 댓글 등록하기 --> 
                            
                            <sec:authorize access="isAuthenticated()">
                             <div>
                                
                              <input type="text" name="replyWriter"  style="width:100%" placeholder="이름"  maxlength="50" readonly
                          
                           <sec:authentication property="principal" var="pinfo"/>
                              value='${pinfo.username }'/>
                            
                          
                            

     						   <textarea style="width:100%" rows="3" cols="30" name="replyContent" placeholder="내용을 입력하세요" maxlength="300"></textarea>

      							  <button id="replyBtn" class="btn btn-primary">댓글 등록</button>
      							  
      						</div>
      						</sec:authorize>
                            <!-- --------- -->  
                             <hr>
                             
                             <div class="panel panel-primary">
                               <div class="panel-heading">
                                     <span class="icon-chat"></span> 댓글 목록
                               </div>
                                  
                                   <div class="panel-body">
                                     <ul class="chat" style="list-style: none;">  
                                          
                                     </ul> 
                                   </div>
                               
                             </div><!-- <div class="panel panel-primary"> -->
                             
                           
                             
                             
                             
                      <div class="panel-footer">
                              
                      </div>
                             
                             
                             
                           
 								
                    </div>
					 
				</div>
			</div>
 
        </section>
        
       
        
        
<%@include file="footer.jsp" %>        
 
     
    
  </body>
 
  <script type="text/javascript" src="/resources/js/comment.js"></script> 
 <script type="text/javascript" src="/resources/js/reply.js"></script> 
 <script type="text/javascript">
 
   $(document).ready(function(){
	    
	  
	   (function(){
		   
		   var bno='<c:out value="${board.bno}"/>';
		   
		   $.getJSON("/board/getAttachList",{bno:bno},function(arr){
			  
			   console.log(arr);
			   
			   var str="";
			   
			   $(arr).each(function(i,attach){
				  
				   if(attach.fileType){ //파일이 이미지라면
					   var fileCallPath=encodeURIComponent(attach.uploadPath+"/s_"+attach.uuid+"_"+attach.fileName);
					   
					   str+="<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'>";
					   str+="<div><img src='/display?fileName="+fileCallPath+"'></div></li>";
				   } 
				   else  //파일이 일반 파일이라면
					   {
					   str+="<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'>";
					   str+="<div><span> "+attach.fileName+"</span><br/>";
					   str+="<img src='/resources/img/attach.png'></a>";
					   str+="</div></li>";
					   
					   
					   
					   
					   }
			   });
				$(".uploadResult ul").html(str);
			   });
			   
	   })(); // 즉시 실행함수 End
	   
	   
	   
	   $(".uploadResult").on("click","li",function(e){
		  
		   var liObj=$(this);
		   
		   var path=encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
		   
		   if(liObj.data("type"))  //이미지 타입이라면 크게보여주기만 한다 다운로드는 안된다
			   {
			   console.log("before -> "+path);
			   	showImage(path.replace(new RegExp(/\\/g),"/"));
			   	console.log("change -> "+path.replace(new RegExp(/\\/g),"/"));
			   }
		   else{					// 일반파일의 타입이라면 클릭시 컨트롤러로 파일이름을 보내주면서  다운로드가 수행된다
			   
			   self.location="/download?fileName="+path;
			   	
		   }
		   
	   });
	   
	   function showImage(fileCallPath)
	   {
		   	alert(fileCallPath);
		   	
		   	$(".bigPictureWrapper").css("display","flex").show();
		   	
		   	$(".bigPicture").html("<img src='/display?fileName="+fileCallPath+"'>").animate({width:'100%',height:'100%'},100);
		   	
	   }
	   
	   
	   $(".bigPictureWrapper").on("click",function(e){
		  
		   $(".bigPicture").animate({width:'0%',height:'0%'},1000);
		   setTimeout(function(){
			   $('.bigPictureWrapper').hide();
		   },100);
		   
	   });
	   
	    
   });
	 
  
   
   $(document).ready(function(){
	    
	   
	   var operForm=$("#operForm");
	   
	   $("button[data-oper='modify']").on("click",function(e){
		  
		   operForm.attr("action","/board/modify").submit();
		   
	   });
	   
	   $("button[data-oper='list']").on("click",function(e){
			  
		  operForm.find("#bno").remove();
		  operForm.attr("action","/board/list");
		  operForm.submit();
	   });
	    
	   
   });
    
   </script>
  	<script type="text/javascript">
   
  	$(document).ajaxSend(function(e,xhr,options){
  		var csrfHeaderName="${_csrf.headerName}";
  		var csrfTokenValue="${_csrf.token}";
  		xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
  	});
   
	
  	$(document).ready(function(){
  		
  		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  
  	    var originalReplyer="<c:out value='${secName}'/>";  
  		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  		
  		 	 $(".chat").on("click","a[name=commentDelete]",function(e){
  		 		
  		 		e.preventDefault();
  		 		
  		 		var temp=$(this).attr("id");
  		 	    var cno=temp.slice(13,temp.length);
  		 	    var name=$(this).prev().prev().text();
  		 	 
  		 	    var dto={cno:cno,name:name};
  		 	    
  		 		commentService.remove(dto,function(result){
  		 			
  		 			alert(result);
  		 			showList(pageNum);
  		 		});
  		 		commentService.AllRemove();
  		 		 
  		 		 
   		 	 });
  		 	 
  		 	 
  		 	 $(".chat").on("click","a[name=commentUpdate]",function(e){
   		 		
   		 		e.preventDefault();
   		 		
   		 		var origin=$(this).next().next().next().text();
   	     	 	var temp=$(this).next().next().next();
   	     	 	
   	     	 	var str="<textarea style='width:90%' rows='2' cols='20' name='modify_commentUpdate' maxlength='300'>"+origin+"</textarea>"+"<button name='modify_commentUpdate_btn'class='btn btn-primary btn-sm float-right' style='margin-left:3px;'>수정 확인</button>";
		 		 temp.replaceWith(str);
   		 	    
    		 	 });
  		 	 
  		 	 $(".chat").on("click","button[name=modify_commentUpdate_btn]",function(e){
    		 		
    		 		e.preventDefault();
    		 		
    		 		  
    		 		 var recomment=$(this).prev().val();
    	     	 	var cno=$(this).closest("li").data("cno");
    	     	 	
    		 		 var comment={cno:cno,recomment:recomment}

  	               commentService.update(comment,function(result){
  	                	
  	                	alert(result);
  	                       commentService.AllRemove();
  	                	   showList(pageNum);
  	                }); 
  	     	  
    		 	    
     		 	 });
  		 	 
  		 	 $(".chat").on("click","button[name=Add_commentBtn]",function(e){
  		 		
  		 		 e.preventDefault();
  		 		 
  		 		 var recomment=$(this).prev().prev().val();
  		 		 var commenter=$(this).prev().prev().prev().val();
  		 		 var temp=$(this).attr("id");
  		 		  
  		 		 var rno=temp.slice(13,temp.length);
  		 		 alert(rno);
  		 		
  		 		 var comment={rno:rno,recomment:recomment,commenter:commenter};
  		 		 
  		 		 commentService.add(comment,function(result){
  		 			
  		 			 alert(result);
  		 			 
  		 		 });
  		 	     commentService.AllRemove();
  		 		 showList(pageNum);
  		 		 
  		 	 });
  		 	
  		 
  		 	 
  		  
  		 	 
  	      
  		
  	
  	var bnoValue='<c:out value="${board.bno}"/>';
  	var replyUL=$(".chat");
  	
  	showList(1);
  	
  	
  	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ댓글 보여주는 함수 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
  	function showList(page){
  		 
  		replyService.getList({bno:bnoValue,page:page||1},
  						function(replyCnt,list){
  			 
  			if(page==-1){ 
  				pageNum=Math.ceil(replyCnt/10.0);
  				showList(pageNum);
  				return; 
  			}
  			
  			
  			 
  			var str="";
  			
  			if(list==null||list.length==0)
  				{ 
  				return;
  				}
  			 
  			for(  var i=0, len=list.length||0; i<len; i++){
  	
  				 
  				
  			    str+="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
  				str+="<div><div class='header'><strong class='font-primary' name='savedReplyer'>"+list[i].replyer+"</strong>";
  				str+=" <small class='float-right text-primary'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
  				str+=" <p name='savedContent'>"+list[i].reply+"</p>";
  				str+="<button name='commentBtn' class='btn btn-primary btn-sm'>답글  <span style='font-weight:400'>" +list[i].commentCnt+"</span></button>";
  				
  				
  				if(originalReplyer==list[i].replyer){ 
  				str+="<button name='replyModify'class='btn btn-primary btn-sm float-right' style='margin-left:3px;'>수정</button>";
  				str+="<button name='replyDelete' class='btn btn-primary btn-sm float-right'>삭제</button>"
  				}
  				
  				str+="</div></li><hr>";
  				
  				/*      <li class="left clearfix" data-rno='12'>
                                          <div>
                                              <div class="header">
                                              
                                                <strong class="font-primary" name="savedReplyer">fffffff</strong>

                                                <small   class="float-right text-primary">ffffffffffff</small>

                                              </div>
                                              
                                              <p name="savedContent">good job</p>
                                              <button id="commentBtn" class="btn btn-primary btn-sm">답글 <span style="font-weight:bold">12</span></button>
                                              <button id="replyModify" class=" btn btn-primary btn-sm float-right"style="margin-left:3px;" >수정</button>
                                              <button id="replyDelete" class=" btn btn-primary btn-sm float-right" >삭제</button>
                                          
                                         </div>
					    </li> 
              */
  			}
  			
  			replyUL.html(str);
  			
  			showReplyPage(replyCnt);
  			
  		}); /* End of replyService.getList */
  		
  	} /* End of function showList*/
  	
   
  	
  	//////////////////////	*	댓글 등록	///////////////////////// */
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
  	
  	
  	var check=false;
  	
  	 $(".chat").on("click","button",function(e){

         e.preventDefault();

         
         
     var clicked=$(this).attr("name");
     
    if(clicked=='replyModify'&&check==false)
    {
    	 check=true;
    	 
     var rno=$(this).parent().parent().data("rno");
     var replyWriter=$(this).parent().children('div').children('strong').text();
     var replyContent=$(this).parent().children('div').next("p").text();

     alert(rno+replyWriter+replyContent);

     $(this).parent().children('div').children('strong').replaceWith(" <input type='text' name='replyWriterModify'  style='width:90%' placeholder='이름'  maxlength='50' value='"+replyWriter+"'"+"/ readonly>");
     $(this).parent().children('div').next("p").replaceWith("<textarea style='width:90%' rows='2' cols='30' name='replyContentModify' placeholder='내용을 입력하세요' maxlength='300'>"+replyContent+"</textarea>");
   
     $(this).prev().replaceWith("<input type='hidden' name='replyRnoModify' value='"+rno+"'/>'");
   
     
     $(this).next().remove();
     
     $(this).replaceWith("<button name='replyModifySend'class='btn btn-primary btn-sm float-right' style='margin-left:3px;'>수정 확인</button>")
      
        
    }

    else if(clicked=='replyDelete'&&check==false)
    {
    	 var rno=$(this).parent().parent().data("rno");
    	 
    	 replyService.remove(rno,originalReplyer,function(result){
    		 showList(pageNum);
    		 alert(result);
    	 
    		 
    	 });

    }
    
    
    
   /*
	$("#hide").click(function(){
    	$(".abc").hide();
    	});
*/

     //이 버튼을 누르면 답글을 볼수 있다 하지만 두번이상 누르면 같은 li가 덧붙여진다 어떻게할까
     /*
     	HashSet을 만들어서 답글 버튼을 처음 누를때 해당 댓글의 rno을 넣는다 그리고 다시 누르면 HashSet에서 걸러진다음 닫는다
     	
     	그런데 닫을때 문제가 생긴다 -> 펼쳐놨떤 모든 답글이 닫힌다 그러면 어떻게 해야할까
     	클릭한 버튼의 상위로 가서 해당 div만 닫자
     */
      
     	
     else if(clicked=='commentBtn'){
    	 
         	
    	 var rno=$(this).parent().parent().data("rno");
    	  var top=$(this).parent().parent();
    	 
    	  //처음 눌렀을때
    	  if(commentService.RnoCheck(rno)==false)
    		  {
    		  var isAuth='<c:out value="${secName}"/>'; //인증된 사용자라면 답글을 달 수 있게한다
    		  
    		  commentService.RnoAdd(rno); // 댓글의 기본키를 추가해준다.
    		  
    		  		commentService.getList(rno,function(list){
    	    		 
    	    		 var str="";
    	    		for(  var i=0, len=list.length||0; i<len; i++){
    	  					  		 
    	                
    	    			str+="<div class='com"+rno+"'><li class='left clearfix' data-cno='"+list[i].cno+"'"+" style='background-color:#f8f9fa' >";
    	    			str+=" <div class='container'>";
    	    			str+="<div class='row'>";
    	    			str+=" <div class='col-1'> </div>";
    	    			str+="<div class='col-11'>"; 
    	    			str+=" <span class='icon-comment'>"+list[i].commenter+"</span>";
    	    			
    	    			if(isAuth==list[i].commenter){
    	    			
    	    			str+="<a href='#' name='commentUpdate' id='commentUpdate"+list[i].cno+"' ><span style='font-size: 70%'>[수정]</span></a>";
    	    			str+="<a href='#' name='commentDelete' id='commentDelete"+list[i].cno+"'><span style='font-size: 70%'>[삭제]</span></a>";
    	    			}
    	    			str+="<small class='float-right text-primary'>2019-08-08</small>";
    	    			str+="<p name='savedComment'>"+list[i].recomment+"</p><hr>";
    	    			str+="</div></div></div></li></div>";
    	    		}
    	    		 
    	    		 
    	    		if(isAuth!=""){ //인증된 사용자라면 답글을 달 수 있게한다
    	    		str+="<div class='com"+rno+"'><li class='left clearfix' style='background-color:#f8f9fa'>"
    	    		str+=" <div class='container'> ";
	    			str+="<div class='row'>";
	    			str+=" <div class='col-1'> </div>";
	    			str+="<div class='col-11'>"; 
    	    		str+=" <input type='text' name='CommenterAdd'  style='width:90%' placeholder='이름'  maxlength='50'  value='"+isAuth+"' readonly   />";
    	    		str+="<textarea style='width:90%' rows='2' cols='20' name='RecommentAdd' maxlength='300'></textarea><br>"+"<button name='Add_commentBtn' id='CommentAddBtn"+rno+"' class='btn btn-primary btn-sm float-right' style='margin-left:3px;'>답글 등록</button>";
    	    		str+="</div></div></div></li><div>";
    	    		}
    	    	
    	    	 top.after(str);
    	    	 
    	  		  }); 
    		  }
    	 
    	  else{
    		  commentService.RnoRemove(rno);
    		  $(".com"+rno).hide();
    		  
    	  }
		 
    }
  	 
      
    	   
    	 
  	  
    	/*
		<li class="left clearfix" data-rno='13' style="background-color:#f8f9fa" >
                            <div class="container">
                                  <div class="row">
                                      <div class="col-1"> </div>
                                      <div class="col-11">
                                        <span class="icon-comment">작성자  </span>
                                         <a href="#" ><span style="font-size: 70%">[수정]</span></a>
                                         <a href="#" ><span style="font-size: 70%">[삭제]</span></a>
                                         <small class="float-right text-primary">2019-08-08</small>
                                    <p id="savedContent">내용</p>
                                      </div>

                                  </div>
                             </div>
                            </li>
    */
    		
    	  
					 
    
    	 
   


     }); /*End of 버튼 클릭 함수 */
  	 
  	
  	 $(document).on("click","button[name=replyModifySend]",function(e){

               // var writer=$("input[name=replyWriterModify]").val();
                var content=$("textarea[name=replyContentModify]").val();
                var rno=$("input[name=replyRnoModify]").val();
                
                
                
                var reply={rno:rno,reply:content,replyer:originalReplyer}
                
                replyService.update(reply,function(result){
                	
                	alert(result);
                	check=false;
                	   showList(pageNum);
                }); 
       }); 
  	
     
     
     
     var pageNum=1;
     var replyPageFooter=$(".panel-footer");
     
     function showReplyPage(replyCnt){
    	 
    	 
    	 var endNum=Math.ceil(pageNum/10.0)*10;
    	 var startNum=endNum-9;
    	 
    	 
    	 var prev=startNum!=1;
    	 var next=false;
    	 
    	 
    	 if(endNum*10>=replyCnt)
    		 {
    		 endNum=Math.ceil(replyCnt/10.0);
    		 }
    	 
    	 if(endNum*10<replyCnt)
    		 {
    		 	next=true;
    		 }
    	 
    	
    	 var str="<ul class='pagination float-right'>";
    	 
    	 if(prev){
    		 		str+="<li class='page-item'><a class='page-ling' href='"+(startNum-1)+"'>Previous</a></li>";
    	 }
    	 
    	 for(var i=startNum ; i<=endNum; i++)
    		 {
    		 		var active=pageNum==i? "active":"";
    		 		
    		 		str+="<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
    		 		
    		 		
    		 }
    	 
    	 if(next){
    		 		str+="<li class='page-item'><a class='page-link' href='"+(endNum+1)+"'>Next</a></li>";
    	 }
    	 
    	 str+="</ul></div>";
    	 
    	 replyPageFooter.html(str);
    	 
     }
     
     replyPageFooter.on("click","li a",function(e){
    	 
    	 e.preventDefault();
    	 
    	 var targetPageNum=$(this).attr("href");
    	 
    	 pageNum=targetPageNum;
    	 
    	 showList(pageNum);
    	 
     });
     
     
     
     
   
  	}); /* End of document.ready(function())*/
  	  
   
		 
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
  	
  	//let $socketAlert=$("div#socketAlert");
  	//$socketAlert.text(event.data);
  	//$socketAlert.css("display","block");
  	
  	$("#socketAlert").text(event.data);
  	$("#socketAlert").css("display","block");
  	  
  	setTimeout(function(){
  		
  		$("#socketAlert").css("display","none") 	
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
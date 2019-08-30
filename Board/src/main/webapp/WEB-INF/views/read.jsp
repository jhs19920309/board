<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>




<h2>msg</h2> 
<input type="text" id="msg" name='test' value='1212' class='form-control'>

<button class="btn btn-primary" id="btnSend">클릭</button>

</body>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  ></script>
<script>
$(document).ready(function(){
	
	$("#btnSend").on("click",function(e){
		
		e.preventDefault();
		
		if(socket.readyState!==1) return;
		
		let msg=$("input#msg").val();
		socket.send(msg);
		
	});

	connect();
}); 

</script>

 <script>




var socket=null;
function connect(){
	
var ws=new WebSocket("ws://localhost:8080/replyEcho");
socket=ws;

ws.onopen=function(){
	console.log("info: connection opend.");
	 
};

ws.onmessage=function(event){
	console.log("Receiver Message :"+event.data+"\n");
};

ws.onclose=function(event){
	console.log("Info: connection closed,");
//	setTimeout(function(){connect();},1000);
	};

ws.onerror=function(err){console.log("Error:",err);};
}



</script>


 





</html>
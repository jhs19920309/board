<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

			<h2>이메일보내기</h2>
			<form method="post" action="/signup/send"> 
			발신자 이름:<input name="senderName"><br>
			발신자 이메일 주소: <input name="senderMail"><br>
			수신자 이메일 주소: <input name="receiveMail"><br>
			제목:<input name="subject"><br>
			내용:<textarea rows="5" cols="80" name="message"></textarea><br>
			<input type="submit" value="전송">    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			</form>

			<span style="color:red;">${message }</span>
		


 </body>
</html>
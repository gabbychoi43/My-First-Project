<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
 	if(session.getAttribute("sessionId")== null){
 		
 		
 	
 
 %>
 	<form action="loginForm.jsp" method= "post">
 	
 		id <input type="text" name="id" id="" />
 		pw <input type="password" name="pw" id="" />
 		<input type="submit" value="로그인" />
 	
 	</form>
 <% }else{  %>
	 <h2>
	 	<%= session.getAttribute("sessionId") %>님 로그인 되었다
	 </h2>
	 
	 <input type="button" value="로그아웃 " onClick = "window.location='logout.jsp'" />
	 
	 
 <% }%> 
 
 
 
</body>
</html>
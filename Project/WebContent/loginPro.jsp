<%@page import="dao.MemberDAO"%>
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
		
		String id = request.getParameter("mbid");
		String pw = request.getParameter("mbpw");
		
		MemberDAO dao = new MemberDAO();
		boolean result = dao.loginCheck(id, pw);

		if(result){
			session.setAttribute("sessionId", id);
			session.setAttribute("sessionPw", pw);
			
			response.sendRedirect("Main.jsp");
			
			
		}else {
			response.sendRedirect("findinfoNo.jsp");
			
		}
		
		session.setAttribute("sessionId", id);
		session.setAttribute("sessionPw", pw);
		
		
	%>


</body>
</html>
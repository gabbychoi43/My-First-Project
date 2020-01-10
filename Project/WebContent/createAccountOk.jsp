<%@page import="vo.AccountVO"%>
<%@page import="dao.AccountDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
	<%
		String name = request.getParameter("name");
		String acc = request.getParameter("acc");
		String pw = request.getParameter("pw");
		
		AccountDAO dao = new AccountDAO();
		AccountVO vo = new AccountVO();
		String id = session.getAttribute("sessionId")+"";
				
		vo.setAccount(acc);
		vo.setAccountpw(pw);
		vo.setBalance(0);
		vo.setMemberid(id);
		vo.setMembername(name);
		
		dao.addAccount(vo);
		
		
	%>
</head>
<body>
	<h3>계좌개설을 축하드립니다.</h3>

</body>
</html>
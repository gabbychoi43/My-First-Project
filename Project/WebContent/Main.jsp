<%@page import="dao.MemberDAO"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����ȭ��</title>
<style type="text/css">

	#welcome {
		margin-left: 70%;
		margin-top: 0 auto;
	}
	
	 #div1{border: 1px; width: 450px; height: 450px; border-radius: 10px;
		text-align: center; margin: auto; margin-top: 100px; background-color: #BDBDBD;
	}
	
	 .in {
		-webkit-transition: all 300ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		-moz-transition: all 300ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		-ms-transition: all 300ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		-o-transition: all 300ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		-transition: all 300ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		width: 200px; height: 50px; margin: 29px; font-weight: bold;font-size: 30px; border-radius: 15px;
		background-color: white; color: black; transition:all 0.9s, color 0.3;
	}
	
	 input:hover{
		color: white;
		box-shadow: 200px 0 0 0 rgba(0,0,0,0.25) inset, -200px 0 0 0 rgba(0,0,0,0.8) inset;
	} 
	
</style>
</head>
<body>
	<div id = "welcome">
	<%
	
	
	if(session.getAttribute("sessionId")==null) {
		response.sendRedirect("test.jsp");
		out.print("�α����ϼ���");
		
	}else{ 
	%>
	
	
	
			<%= session.getAttribute("sessionId") %> �� ȯ���մϴ�.
		
		<%
		}
		%>
		<input type="button" value="�α׾ƿ�" onClick="window.location='logout.jsp'" />
		<input type="button" value="��������" onClick="window.location='update.jsp'" />
	</div>
		

	<div id="div1">
		<div><a href="exchange.jsp"><input class="in" type="button" value="ȯ��" /></a></div>
		
		<div><a href="select.jsp"><input class="in" type="button" value="��ȸ" /></a></div>
		<div><a href="Transfer.jsp"><input class="in" type="button" value="��ü" /></a></div>
		<div><a href="createAccount.jsp"><input class="in" type="button" value="����" /></a></div>
		
	</div>
	

</body>
</html>
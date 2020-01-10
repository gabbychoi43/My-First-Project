<%@page import="vo.TradeRecordVO"%>
<%@page import="dao.TradeRecordDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.AccountVO"%>
<%@page import="dao.AccountDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계좌정보확인</title>
<style type="text/css">
table,tr,td,th{
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
}
</style>
</head>




<body>
		
		<%
			String accountn = request.getParameter("acn");
			AccountDAO dao = new AccountDAO();
			ArrayList<TradeRecordVO> tlist = new ArrayList<>();
			String id = session.getAttribute("sessionId")+"";
			
			AccountVO vo = dao.AccountInfoByAccount(accountn);
			
			TradeRecordDAO tdao = new TradeRecordDAO();
			AccountVO tvo = dao.AccountInfoByAccount(accountn);			
			tlist = tdao.TradeView(tvo);	
			
			
		%>
	
	<h1><%=vo.getMembername() %>님 환영합니다.</h1>
	<h2>계좌 : <%=accountn %></h2>
	<h2>계좌 잔액 : <%=vo.getBalance() %></h2>
	
	<div>
	<table>
	<tr>
		<th>입/출금여부</th>
			<th>입금</th>
			<th>출금</th>
			<th>시간</th>
			<th>보낸 사람</th>
			<th>받는 사람</th>
			<th>메모</th>
	</tr>
				
				
			<%
			for(TradeRecordVO tvo2 : tlist){
			
			%>

		<tr>
			<td><%=tvo2.getWD() %></td>
	
			<td><%=tvo2.getDeposit() %></td>
	
			<td><%=tvo2.getWithraw() %></td>
		
			<td><%=tvo2.getTradetime() %></td>
	
			<td><%=tvo2.getSendaccount() %></td>
	
		
			<td><%=tvo2.getReceiveaccount() %></td>
	
			<td><%=tvo2.getMemo() %></td>
		</tr>	
			<%
			} 
			%>
	</table>
	</div>	
	
	






</body>
</html>
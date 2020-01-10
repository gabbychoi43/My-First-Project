<%@page import="dao.TradeRecordDAO"%>
<%@page import="vo.AccountVO"%>
<%@page import="dao.AccountDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <%
 	request.setCharacterEncoding("UTF-8");
 	String id=session.getAttribute("sessionId")+"";
 	String SendAccount= request.getParameter("send");
 	
 	
 	String ReceiveAccount=request.getParameter("div3");
 	String SendAccountPW=request.getParameter("div5");
 	int money=Integer.parseInt(request.getParameter("div6"));
 	String memo=request.getParameter("div7");
 	
 	StringBuffer sb=new StringBuffer();
 	sb.setLength(0);

 	
 	
 	System.out.println(ReceiveAccount);
 	System.out.println(money);
 	System.out.println(memo);
 	System.out.println(id);
 	
 	System.out.println(SendAccount);
 	System.out.println(SendAccountPW);
 	
 	AccountDAO adao=new AccountDAO();
 	TradeRecordDAO Tdao = new TradeRecordDAO();
 	AccountVO vo= adao.AccountInfoByAccount(SendAccount);
 	
	 	if(SendAccountPW.equals(vo.getAccountpw())){
	 		if(adao.AccountInfoByAccount(ReceiveAccount)!=null){
	 	
			 	boolean flag=Tdao.TransferDeposit(vo, ReceiveAccount, money, memo);
			 	
			 	if(flag==true){
			 		sb.setLength(0);
			 		sb.append("<h1>");
			 		sb.append("계좌"+ReceiveAccount+"로"+money+"원이 입금되었습니다.");
			 		sb.append("</h1>");
			 	}
			 	else{
			 		sb.setLength(0);
			 		sb.append("<h1>");
			 		sb.append("이체에 실패하였습니다");
			 		sb.append("</h1>");
			 		
			 	}
	 		}
	 	}
	 	else{
	 		sb.setLength(0);
	 		sb.append("<h1>");
	 		sb.append("비밀번호를 잘못 입력하셨습니다.");
	 		sb.append("</h1>");
	 		
	 	}
  
 %>
<body>
	
	<div name="div1" >
	<%=sb.toString() %>
		
	</div>
	<a href="Main.jsp"><input type="button" value="메인화면으로" class="button1" /></a>

</body>
</html>
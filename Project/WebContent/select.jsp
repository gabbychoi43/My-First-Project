<%@page import="com.sun.xml.internal.bind.v2.runtime.Location"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.AccountVO"%>
<%@page import="dao.AccountDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계좌 조회</title>
<style type="text/css">
	h, td, tr, input, textarea, select, FORM
 {
   font-family:고딕;
  font-size:1em;
  border-radius:5px;
 }
  table, FORM
 {
  border:1px solid rgba(36, 228, 172, 0.29);
  border-spacing:15px;
 }



</style>
<%
		String id = session.getAttribute("sessionId")+"";
 	 	AccountDAO dao = new AccountDAO();
 	 	
 	 	boolean result = dao.accountCheck(id);
 	 	if(result == false){
 	 		response.sendRedirect("createAccount.jsp");
 	 	}else{
 	 	
		ArrayList<AccountVO> list = new ArrayList<>(); 
		list = dao.AccountInfoById(id);
			AccountVO vo1 = list.get(0);
 	 	
%>
</head>
<script type="text/javascript">
	function subm(){
		var txt = document.getElementById('txt')
		var txtpw = txt.value;
		
		if(txtpw == <%=vo1.getAccountpw()%>){
			document.frm.action="selectOk.jsp";
			document.frm.method="get";
			document.frm.submit();
		}else{
			alert("비밀번호가 틀렸습니다.");
		}		
	}	


</script>
<body>
		<h2><%=vo1.getMembername() %>님 환영합니다.</h2>					

	<form action="#" name = "frm" >
		<div>
			<select name="acn">
				<option value="--">--</option>
			<%
			for(AccountVO vo : list) {
			%>
				<option value="<%=vo.getAccount()%>"><%=vo.getAccount() %></option>
			<%
			}}
			%>
			</select> 
	<input type="text" name="txt" id="txt" />
	<input type="button" value="입력" onclick = "subm()" />
		</div>
	</form>
</body>
</html> 
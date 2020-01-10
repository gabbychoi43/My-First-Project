<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>회원 가1입</title>
<style type="text/css">
#msg, h4 {
	
		display: inline;
		color : coral;
		
	}
	 body {
        background: #f8f8f7;
        padding: 60px 0;
    }
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/httpRequest.js"></script>
<script type="text/javascript">
	
</script>
  
  
 </head>
 <%
 	request.setCharacterEncoding("UTF-8");
 
 
 	
 	String id = request.getParameter("mbid");
 	String pw = request.getParameter("mbpw");
 	
 	
 	MemberDAO dao = new MemberDAO();
 	
 	dao.DeleteOne(id, pw);
 
 %>
 
 <body>
 		<form action = "#" name="userInfo" method="post" >
  			 <table width="940" style="padding:5px 0 5px 0; ">
   	  
      
      		  <tr>
         		 <th>탈퇴가 완료 되었습니다. 초기화면으로 이동합니다 </th>
         	
        	  </tr>
      
          	  <tr height="2" bgcolor="#FFC8C3"><td colspan="2"></td></tr>
         	  <tr>
             <td colspan="2" align="center">
               <input type="button" value="확인" id ="" onClick = "window.location='test.jsp'">
            </td>
           </tr>
           </table>
         
       </form>
 </body>
</html>

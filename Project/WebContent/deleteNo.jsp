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

 <body>
 		<form action = "#" name="userInfo" method="post" >
  			 <table width="940" style="padding:5px 0 5px 0; ">
   	  
      
      		  <tr>
         		 <th>아이디와 비밀번호를 다시 확인해주세요 </th>
         	
        	  </tr>
      
          	  <tr height="2" bgcolor="#FFC8C3"><td colspan="2"></td></tr>
         	  <tr>
             <td colspan="2" align="center">
               <input type="button" value="확인" id ="" onClick = "window.location='delete.jsp'">
            </td>
           </tr>
           </table>
         
       </form>
 </body>
</html>

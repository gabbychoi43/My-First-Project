<%@page import="vo.MemberVO"%>
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
<%
	String id = session.getAttribute("sessionId")+"";
	String pw = session.getAttribute("sessionPw")+"";	
%>
<script type="text/javascript">
	
	$(function(){
		
		$("#ok").click(function(){
		if ($("#mbid").val() == "<%=id%>" ){
			if($("#mbpw").val() == "<%=pw%>"){
			document.userInfo.action= "deleteOk.jsp";
			document.userInfo.method = "get";
			document.userInfo.submit();
			
				
			}
			else{
				
				console.log("no");
				document.userInfo.action= "deleteNo.jsp";
				document.userInfo.method = "get";
				document.userInfo.submit();
				
		
			}
			
		}else{
			
			console.log("no");
			document.userInfo.action= "deleteNo.jsp";
			document.userInfo.method = "get";
			document.userInfo.submit();
			
	
		}
		});		
	});
	

</script>
  
  
 </head>
 <body>
 
 <form action = "#" name="userInfo" method="post" >
   <table width="940" style="padding:5px 0 5px 0; ">
      <tr height="2" bgcolor="#FFC8C3"><td colspan="2"></td></tr>
     
    
       <tr>
         <th>아이디</th>
         <td><input type="text" name="mbid" id="mbid"> </td>
       </tr>
       <tr>
         <th>비밀번호</th>
         <td><input type="password" name="mbpw" id ="mbpw"></td>
       </tr>
   
     
 
           <tr height="2" bgcolor="#FFC8C3"><td colspan="2"></td></tr>
           <tr>
             <td colspan="2" align="center">
               <input type="button" value="확인" id = "ok" >
               <input type="reset" value="취소" id = "can" onClick = "window.location='update.jsp'">
            </td>
           </tr>
           </table>
          </td>
          </tr>
          </form>
 </body>
</html>

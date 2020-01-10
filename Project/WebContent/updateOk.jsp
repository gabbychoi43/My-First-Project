<%@page import="dao.MemberDAO"%>
<%@page import="vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MemberDAO"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>회원 가입</title>
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
 
 <%
 	request.setCharacterEncoding("UTF-8");

 	String id = session.getAttribute("sessionId")+"";
 	String name = request.getParameter("mbname");
 	String pw = request.getParameter("mbpw");
 	String birth = request.getParameter("mbbirth");
 	String tel = request.getParameter("tel");
 	
 	MemberVO vo = new MemberVO();
 	MemberDAO dao = new MemberDAO();
 	vo.setMemberid(id);
 	vo.setMembername(name);
 	vo.setMemberpw(pw);
 	vo.setMemberbirth(birth);
 	vo.setmemberphoneno(tel);
 	dao.updateAll(vo);	
 		

	
	
 	
 
 %>
 <form action = "#" name="userInfo" method="post" onsubmit = "return checkValue()">
   <table width="940" style="padding:5px 0 5px 0; ">
      <tr height="2" bgcolor="#FFC8C3"><td colspan="2"></td></tr>
      <b><font size="5" color="gray">회원 수정 정보를 확인하세요.</font></b>
     <br><br>
     

      <tr>
         <th> 이름</th>
         <td> <%= vo.getMembername() %> </td>
      </tr>
      
      <tr>
         <th>생년월일</th>
         <td> <%= vo.getMemberbirth() %></td>
       </tr>
       
    
        <tr>
         <th>비밀번호</th>
         <td><%= vo.getMemberpw() %></td>
       </tr>
     
        <tr>
          <th>핸드폰 번호</th>
           <td> <%=vo.getmemberphoneno() %>       </td>
          </tr>
  
 
           <tr height="2" bgcolor="#FFC8C3"><td colspan="2"></td></tr>
           <tr>
             <td colspan="2" align="center">
               <input type="button" value="확인" id ="check" onClick= "window.location = 'Main.jsp'">
            </td>
           </tr>
           </table>
          </td>
          </tr>
          </form>
        
 </body>
</html>

<%@page import="dao.MemberDAO"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%
    request.setCharacterEncoding("UTF-8");
   
    String name = request.getParameter("mbname");
    String birth = request.getParameter("mbbirth");
    String id = request.getParameter("mbid");
    String pw = request.getParameter("mbpw");
    String pwre = request.getParameter("mbpw_re");
    String phone = request.getParameter("tel");
    
    
    
    
  	
     MemberVO vo = new MemberVO(id, pw, name, birth, phone);
    
    MemberDAO dao = new MemberDAO();
    
    boolean is = dao.isExist(id);
    
    if(is == true)
    {
    
    response.sendRedirect("registerNo.jsp");
		    	
    }else{
    dao.addData(vo);  
    }
    
    
    %>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>회원 가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
	
	$("#check").on('click', function(){
		
		location.href = "test.jsp";		
	});
	
	});
	

</script>


</head>
 <body>
 <form action = "#" name="userInfo" method="post" onsubmit = "return checkValue()">
   <table width="940" style="padding:5px 0 5px 0; ">
      <tr height="2" bgcolor="#FFC8C3"><td colspan="2"></td></tr>
      
     <b><font size="5" color="gray">회원가입 정보를 확인하세요.</font></b>
     <br><br>
     <font color="blue"> <%=vo.getMembername()%></font>님 가입을 축하드립니다.

      <tr>
         <th> 이름</th>
         <td> <%= vo.getMembername() %> </td>
      </tr>
      
      <tr>
         <th>생년원일</th>
         <td> <%= vo.getMemberbirth() %></td>
       </tr>
       
       <tr>
         <th>아이디</th>
         <td> <%= vo.getMemberid() %>  </td>
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
               <input type="button" value="확인" id ="check">
            </td>
           </tr>
           </table>
          </td>
          </tr>
          </form>
 </body>
</html>

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
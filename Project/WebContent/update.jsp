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
	

	$(function(){
		
		$("#update").click(function(){
											
				if($("#mbname").val()==""){
					alert("이름을 입력하세요");
					document.userInfo.mbname.focus(); // 커서위치
					return;
				}else if($("#mbbirth").val()==""){
					alert("생년월일을 입력하세요");
					document.userInfo.mbbirth.focus();
					return;
				}else if($("#mbpw").val()==""){
					alert("비밀번호를 입력하세요");
					document.userInfo.mbpw.focus();
					return;
				}else if($("#mbpw_re").val()==""){
					alert("같은 비밀번호를 입력하세요");
					document.userInfo.mbpw_re.focus();
					return;
				}else if($("#tel").val()==""){
					alert("핸드폰 번호를 입력하세요");
					document.userInfo.tel.focus();
					return;
				
				}else if($("#mbpw").val() != $("#mbpw_re").val()){
					alert("같은 비밀번호가 아닙니다");
					document.userInfo.mbpw_re.focus();
					return;
				}else {
					
						document.userInfo.action="updateOk.jsp"
						document.userInfo.method="get"; //겟방식
						document.userInfo.submit();
						
				}
			
		});
		
		
	});


</script>
  
  
 </head>
 <body>
 
 <%
 
 
 	
 	MemberDAO dao = new MemberDAO();
 	
 	String id = session.getAttribute("sessionId")+"";
 	 
 
	ArrayList<MemberVO> list = dao.selectAll(id);
	

	for(MemberVO vo : list) {
		
	
			  

	
	
 	
 
 %>
 <form action = "#" name="userInfo" method="post" onsubmit = "return checkValue()">
   <table width="940" style="padding:5px 0 5px 0; ">
      <tr height="2" bgcolor="#FFC8C3"><td colspan="2"></td></tr>
      <tr>
         <th> 이름</th>
         <td><input type="text" name="mbname" id="mbname" value ="<%= vo.getMembername() %>" ></td>
      </tr>
      <tr>
         <th>생년원일</th>
         <td><input type="text" name="mbbirth" id ="mbbirth" value ="<%= vo.getMemberbirth() %>">
       </tr>
       
       <tr>
         <th> 아이디 </th>
         <td><input type="text" name="mbid" id="mbid" value ="<%= vo.getMemberid() %>" disabled="disabled"> </td>
       </tr>
       <tr>
    
       <tr>
         <th>비밀번호</th>
         <td><input type="password" name="mbpw" id="mbpw" value ="<%= vo.getMemberpw() %>"> </td>
       </tr>
       <tr>
         <th>비밀번호 확인</th>
         <td><input type="password" name="mbpw_re" id ="mbpw_re" value ="<%= vo.getMemberpw() %>"></td>
       </tr>
       
      
      
        <tr>
          <th>핸드폰 번호</th>
           <td><input type="text"name="tel" id="tel" value ="<%= vo.getmemberphoneno() %>"> "-" 없이 작성
              
           </td>
          </tr>
       
      
              
 
      
 
           <tr height="2" bgcolor="#FFC8C3"><td colspan="2"></td></tr>
           <tr>
             <td colspan="2" align="center">
               <input type="button" value="수정" id ="update" >
               <input type="button" value="회원 탈퇴" id = "del" onClick="window.location='delete.jsp'">
               <input type="button" value="취소" id = "can" onClick="window.location='Main.jsp'">
             
            </td>
           </tr>
           </table>
          </td>
          </tr>
          </form>
          <% } %>
 </body>
</html>

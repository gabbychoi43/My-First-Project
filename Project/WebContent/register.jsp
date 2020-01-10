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
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript">
	
	
	
		function checkUp(){
			
			var txt = $("#mbid").val().trim(); // trim() 공백 제거 함수
			//console.log(txt);
			
			var params = "id="+encodeURIComponent(txt);
			console.log(params);
			
			sendRequest('idCheck.jsp', params, callback, 'GET');
		}

		function callback() {
	
		if(xhr.readyState==4 && xhr.status ==200){
		var msg = xhr.responseText.trim();
		
		//console.log(msg);
		
		//응답이 true 라면 span에 아이디가 존재합니다 출력
		//응답이 false라면 span에 사용가능한 아이디 입니다 출력
		
		if(msg=='true') {
			
			$("#msg").html("<h4>아이디가 이미 존재합니다</h4>");
			alert("아이디가 이미 존재합니다");
			document.userInfo.mbid.focus();
			//return;
			
		}
		else {
			$("#msg").html("<h4>사용 가능한 아이디 입니다</h4>");
		}
		
		
	}
}
	
	$(function(){
		
		$("#mbid").on('keyup', checkUp);
		
		
		$("#reg").click(function(){
		
		
		if($("#mbname").val()==""){
			alert("이름을 입력하세요");
			document.userInfo.mbname.focus(); // 커서위치
			return;
		}else if($("#mbbirth").val()==""){
			alert("생년월일을 입력하세요");
			document.userInfo.mbbirth.focus();
			return;
		}else if($("#mbid").val()==""){
			alert("아이디를 입력하세요");
			document.userInfo.mbid.focus();
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
		}

		if(msg=='true'){
			
			alert("아이디가 이미 존재합니다.");
			location.href = "register.jsp";			
				
		}else {
				
			document.userInfo.action="registerOk.jsp"
			document.userInfo.method="get"; //겟방식
			document.userInfo.submit();
			
				
			 
		}			
		
		
		});
		
		
		$("#can").click(function(){
			
			location.href = "test.jsp";
			
		});
		
	});
	
	


</script>
  
  
 </head>
 <body>
 <form action = "#" name="userInfo" method="post" onsubmit = "return checkValue()">
   <table width="940" style="padding:5px 0 5px 0; ">
      <tr height="2" bgcolor="#FFC8C3"><td colspan="2"></td></tr>
      <tr>
         <th> 이름</th>
         <td><input type="text" name="mbname" id="mbname"></td>
      </tr>
      <tr>
         <th>생년월일</th>
         <td><input type="text" name="mbbirth" id ="mbbirth">
       </tr>
       <tr>
         <th>아이디</th>
         <td>
         <input type="text" name="mbid" id = "mbid">
        	<span id = "msg"></span>
         </td>
       </tr>
       <tr>
         <th>비밀번호</th>
         <td><input type="password" name="mbpw" id="mbpw"> 영문/숫자포함 6자 이상</td>
       </tr>
       <tr>
         <th>비밀번호 확인</th>
         <td><input type="password" name="mbpw_re" id ="mbpw_re"></td>
       </tr>
       
      
      
        <tr>
          <th>핸드폰 번호</th>
           <td><input type="text"name="tel" id="tel"> "-" 없이 작성
              
           </td>
          </tr>
       
      
              
 
      
 
           <tr height="2" bgcolor="#FFC8C3"><td colspan="2"></td></tr>
           <tr>
             <td colspan="2" align="center">
               <input type="button" value="회원가입" id ="reg">
               <input type="reset" value="취소" id = "can">
            </td>
           </tr>
           </table>
          </td>
          </tr>
          </form>
 </body>
</html>

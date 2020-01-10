<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TEST123</title>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

response.setHeader("Pragma", "no-cache");

response.setHeader("Expires", "0");

%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		
		
		//로그인 버튼
		$("#btn1").click(function(){
			
			if($("#mbid").val()==""){
				alert("아이디를 입력하세요");
				document.frm.mbid.focus(); // 커서위치
				return;
			}else if($("#mbpw").val()==""){
				alert("비밀번호를 입력하세요");
				document.frm.mbpw.focus();
				return;
			}else if($("#mbid").val()!="" && $("#mbpw").val() !="" ){
				
				document.frm.action = "loginPro.jsp";
				document.frm.method = "get";
				document.frm.submit();
				
			}
			
		}); 
		
		//회원가입 버튼
		$("#btn2").click(function(){
			
			document.frm.action = "register.jsp";
			document.frm.method = "get";
			document.frm.submit();
			
		});
		
		//아이디 찾기
		$("#btn3").click(function(){
			
		 	document.frm.action = "findID.jsp";
			document.frm.method = "get";
			document.frm.submit(); 
		});
		
		
		//비밀번호 찾기
		
		$("#btn4").click(function(){
			
			document.frm.action = "findPW.jsp";
			document.frm.method = "get";
			document.frm.submit();
 		
			
		});
	
		
		
	});

</script>
<style>
    body {
        background: #f8f8f8;
        padding: 60px 0;
    }
    
    #login-form > div {
        margin: 15px 0;
    }

</style>
</head>
<body>

	<div class="container">
    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-success">
            <div class="panel-heading">
                <div class="panel-title">환영합니다!</div>
            </div>
            <div class="panel-body">
                <form id="login-form" name="frm" method="post">
                    <div>
                        <input type="text" class="form-control" name="mbid" id = "mbid" placeholder="UserID" autofocus>
                    </div>
                    <div>
                        <input type="password" class="form-control" name="mbpw" id = "mbpw" placeholder="Password">
                    </div>
                    <div>
                        <button type="button" class="form-control btn btn-primary" id = "btn1">로그인</button>
                        <br /><br />
                        <button type="button" class="form-control btn btn-primary" id = "btn2">회원가입</button>
                        <br /><br />
                        <button type="button" class="form-control btn btn-primary" id = "btn3">ID 찾기</button>
                        <br /><br />
                        <button type="button" class="form-control btn btn-primary" id = "btn4">PW 찾기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
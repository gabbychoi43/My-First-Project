<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TEST6</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	
	
	$(function(){
		
		$("#btn4").click(function(){
			
 		
			if($("#mbname").val()==""){
				alert("이름을 입력하세요");
				document.userInfo.mbname.focus(); // 커서위치
				return;
			}else if($("#mbbirth").val()==""){
				alert("생년월일을 입력하세요");
				document.userInfo.mbbirth.focus();
				return;
			}
			
		    document.frm.action = "findIdOk.jsp";
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
           
            <div class="panel-body">
                <form id="login-form" name="frm">
                    <div>
                    <span>이름 입력</span><input type="text" class="form-control" name="mbname" placeholder="UserName" autofocus id ="mbname">
                    </div>
                    <div>
                      <span>생년월일 입력</span> <input type="text" class="form-control" name="mbbirth" placeholder="UserBirth" id = "mbbirth">
                    </div>
                    <div>
                    
                        <button type="button" class="form-control btn btn-primary" id = "btn4">ID 찾기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<%@page import="vo.AccountVO"%>
<%@page import="dao.AccountDAO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계좌생성</title>

<style type="text/css">
	#div1 {border: 1px; width: 600px; height: 550px; border-radius: 10px; text-align: center; margin: auto; background-color: #BDBDBD; margin-top: 100px;}
	#div2 {font-size: 3em; font-weight: bold; margin-top: 20px;}
	#name {width: 354px; margin-left: 132px; border-radius: 5px; height: 30px; margin-top: 30px; padding-left: 10px;}
	#nb {width: 156px; border-radius: 5px; height: 30px; margin-top: 30px; padding-left: 10px;}
	#nb2 {width: 156px; border-radius: 5px; height: 30px; margin-top: 30px; padding-left: 10px;}
	#nb1{margin-right: 70px;}
	#acc {width: 356px; margin-left: 103px; border-radius: 5px; height: 30px; margin-top: 30px; padding-left: 10px;}
	#pw {width: 356px; margin-left: 66px; border-radius: 5px; height: 30px; margin-top: 30px; padding-left: 10px;}
	#pwc {width: 356px; margin-left: 28px; border-radius: 5px; height: 30px; margin-top: 30px; padding-left: 10px;}
	#acc1 {width: 150px; height:50px; font-size: 20px; border-radius: 10px; font-weight: bold;
			line-height: 100%; margin: 20px; margin-top: 60px;background-color: white; color: black; transition:all 0.9s, color 0.3;
			-webkit-transition: all 300ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
			-moz-transition: all 300ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
			-ms-transition: all 300ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
			-o-transition: all 300ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
			-transition: all 300ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		}
	#acc2 {width: 150px; height:50px; font-size: 20px; border-radius: 10px; font-weight: bold;
			line-height: 100%; margin: 20px; margin-top: 60px;background-color: white; color: black; transition:all 0.9s, color 0.3;
			-webkit-transition: all 300ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
			-moz-transition: all 300ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
			-ms-transition: all 300ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
			-o-transition: all 300ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
			-transition: all 300ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		}
	#acc1:hover{
		color: white;
		box-shadow: 200px 0 0 0 rgba(0,0,0,0.25) inset, -200px 0 0 0 rgba(0,0,0,0.8) inset;
	} 
	#acc2:hover{
		color: white;
		box-shadow: 200px 0 0 0 rgba(0,0,0,0.25) inset, -200px 0 0 0 rgba(0,0,0,0.8) inset;
	} 
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#acc1").on('click', function(){

			if($("#name").val()==""){
				alert("이름을 입력해주세요");
				$("#name").focus();
				return;
				
			}else if($("#pw").val()==""){
				alert("비밀번호를 입력해주세요");
				$("#pw").focus();
				return;
				
			}else if($("#pwc").val()==""){
				alert("다시 한번 입력하세요");
				$("#pwc").focus();
				return;
				
			}else if($("#pw").val() != $("#pwc").val()){
				alert("같은 비밀번호가 아닙니다");
				$("#pwc").focus();
				return;
			}else if($("#name")!="" && $("#pw")!="" && $("#acc")!=""){
				document.frm.action = "createAccountOk.jsp";
				document.frm.method = "get";
				document.frm.submit();
				
			}
		});	
	});
</script>
</head>
<body>
	<form id="frm" name="frm" >
		<div id="div1">
			<div id="div2">계좌개설</div>
			<div>이름<input type="text" name="name" id="name" /></div>
			<div>계좌번호<input type="number" name="acc" id="acc" placeholder="  숫자를 입력하세요"></div>
			<div>계좌 비밀번호<input type="password" name="pw" id="pw" placeholder="  Password"></div>
			<div>계좌 비밀번호 확인<input type="password" name="pwc" id="pwc" placeholder="  Password"></div>
			<input type="button" value="개설" id="acc1">
			<input type="button" value="이전" id="acc2">
		</div>
	</form>
</body>
</html>
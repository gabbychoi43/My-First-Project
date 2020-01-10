<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	#div1{
		border: 1px; width: 550px; height: 600px; border-radius: 10px; margin: auto; margin-top: 100px; background-color: #BDBDBD;
	}
	div{margin-left: 30px; margin-top: 26px;}
	#top{padding: 6px 0 0 0;}
	#top1{font-size: 3em; font-weight: bold;}
	#top2{font-size: 1em; font-weight: bold; margin-left: 250px;}
	#div2{width: 310px;	height: 25px; margin-left: 39px; border-radius: 5px; padding-left: 10px;}
	#div3{width: 308px;	height: 25px; margin-left: 8px; border-radius: 5px; padding-left: 10px;}
	#div4{width: 310px;	height: 25px; margin-left: 60px; border-radius: 5px; padding-left: 10px;}
	#div5{width: 310px;	height: 25px; margin-left: 23px; border-radius: 5px; padding-left: 10px;}
	#div6{width: 310px;	height: 25px; margin-left: 39px; border-radius: 5px; padding-left: 10px;}
	#div7{margin-left: 92px; border-radius: 5px; padding-left: 10px;}
	#div8{
		width: 100px; height: 50px; margin-left: 18%; margin-top: 12px; border-radius: 15px; font-size:18px; 
		font-weight: bold; background-color: white; color: black; transition:all 0.9s, color 0.3;
		-webkit-transition: all 300ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		-moz-transition: all 300ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		-ms-transition: all 300ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		-o-transition: all 300ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		-transition: all 300ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		}
	#div8:hover{
		color: white;
		box-shadow: 200px 0 0 0 rgba(0,0,0,0.25) inset, -200px 0 0 0 rgba(0,0,0,0.8) inset;
	}
	#div9{
		width: 100px; height: 50px; margin-left: 18%; margin-top: 12px; border-radius: 15px; font-size:18px; 
		font-weight: bold; background-color: white; color: black; transition:all 0.9s, color 0.3;
		-webkit-transition: all 300ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		-moz-transition: all 300ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		-ms-transition: all 300ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		-o-transition: all 300ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		-transition: all 300ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		}
	#div9:hover{
		color: white;
		box-shadow: 200px 0 0 0 rgba(0,0,0,0.25) inset, -200px 0 0 0 rgba(0,0,0,0.8) inset;
	}
	
	#div10{margin-left: 160px; margin-top: 1px;}
	#div11{border-radius: 5px; font-weight: bold; margin: 8px;}
	#div12{border-radius: 5px; font-weight: bold; margin: 8px;}
	#div13{border-radius: 5px; font-weight: bold; margin: 8px;}
	#div14{border-radius: 5px; font-weight: bold; margin: 8px;}
	#note{margin: auto;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#div11").click(function(){ 
		    var n = $("#div11").index(this);
		    var num = $("#div6:eq("+n+")").val();
		    num = $("#div6:eq("+n+")").val(num*1+1000); 
		  });
		$("#div12").click(function(){ 
		    var n = $("#div12").index(this);
		    var num = $("#div6:eq("+n+")").val();
		    num = $("#div6:eq("+n+")").val(num*1+5000); 
		  });
		$("#div13").click(function(){ 
		    var n = $("#div13").index(this);
		    var num = $("#div6:eq("+n+")").val();
		    num = $("#div6:eq("+n+")").val(num*1+10000); 
		  });
		$("#div14").click(function(){ 
		    var n = $("#div14").index(this);
		    var num = $("#div6:eq("+n+")").val();
		    num = $("#div6:eq("+n+")").val(num*1+100000); 
		  });
		
		$("#div8").on('click', function(){
			
			if($("#div2").val()==""){
				alert("������ ����� �Է����ּ���");
				$("#div2").focus();
				return;
			
			}else if($("#div3").val()==""){
				alert("�۱��� ���¹�ȣ�� �Է����ּ���");
				$("#div3").focus();
				return;
				
			}else if($("#div4").val()==""){
				alert("���¹�ȣ�� �Է����ּ���");
				$("#div4").focus();
				return;
				
			}else if($("#div5").val()==""){
				alert("��й�ȣ�� �Է����ּ���");
				$("#div5").focus();
				return;
				
			}else if($("#div6").val()==""){
				alert("�۱��� �ݾ��� �Է����ּ���");
				$("#div6").focus();
				return;
				
			}
			
		});	
	});
</script>
</head>
<body>
	<div id="div1">
		<div id="top"><span id="top1">��ü</span><span id="top2">����</span> <select name="" id="" style="width: 80px; height: 30px;">
			<option value="">---------</option>
			<option value="">---------</option>
			<option value="">---------</option>
			<option value="">---------</option>
		</select></div>
		<div>������ ���<input type="text" name="div2" id="div2" /></div>
		<div>�۱��� ���¹�ȣ<input type="number" name="div3" id="div3" /></div>
		<div>���¹�ȣ<input type="number" name="div4" id="div4" placeholder="  Password"/></div>
		<div>���� ��й�ȣ<input type="password" name="div5" id="div5" placeholder="  Password"/></div>
		<div>�۱��� �ݾ�<input type="number" name="div6" id="div6" placeholder="  �ݾ��� �Է����ּ���"/></div>
		<div id="div10">
			<input type="button" value="1000" id="div11"/>
			 <input type="button" value="5000" id="div12"/>
			 <input type="button" value="10000" id="div13"/>
			 <input type="button" value="100000" id="div14"/>
		</div>
		<div><span id="note">�޸�</span><textarea name="div7" id="div7" cols="47" rows="5" placeholder=" ������ �Է����ּ���"></textarea></div>
		<div>
			<input type="button" value="��ü" id="div8"/>
			<input type="button" value="����" id="div9"/>
		</div>
	</div>

</body>
</html>
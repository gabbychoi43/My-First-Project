<%@page import="dao.MemberDAO"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
   		request.setCharacterEncoding("UTF-8");
    
	    String id = request.getParameter("mbid");
	    String birth = request.getParameter("mbbirth");
	   
	  
	    MemberDAO dao = new MemberDAO();
	 
     	MemberVO vo = dao.findPw(id, birth);
     	
     	String findpw= "";
     	
     	if(vo.getMemberpw()== null){
     		response.sendRedirect("findinfoNo.jsp");
     	}else{
     		findpw=vo.getMemberpw();
     	}
     	
	    
	    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TEST</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	
	
	$(function(){
		
		$("#btn").click(function(){
			
			location.href = "test.jsp";
			
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
                      <span>찾으시는 PW : <%=findpw %></span>
                    </div>
                    <div>
                    
                        <button type="button" class="form-control btn btn-primary" id = "btn">확인</button>
                    </div>
                </form>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
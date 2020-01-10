<%@page import="Json.JsontoArray"%>
<%@page import="Crawl.tests"%>
<%@page import="Crawl.CrawlMainYesterDay"%>
<%@page import="Crawl.CrawlMain"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환율</title>

<style type="text/css">
table, tr, th, td{
	border: 1px solid black;
	border-collapse: collapse;
}


</style>
	 


</head>
<body>
	<table>
		<tr>
			<th>국가명</th>
			<th>송금받을때</th>
			<th>송금할때</th>
			<th>매매 기준율</th>
			<th>전일대비(원)</th>
			<th>등락률(%)</th>
		</tr> 
					
		
	

<%
	CrawlMain cw= new CrawlMain();
	CrawlMainYesterDay cwy=new CrawlMainYesterDay(); 
	cw.info();
	cwy.infoyester();
   JsontoArray jta=new JsontoArray();
   String[][] o1;
   String[][] o2;
   o1=jta.ConvertToJson("C:\\Users\\soldesk\\web_workspace\\project\\WebContent\\Output.Json");
   o2=jta.ConvertToJson("C:\\Users\\soldesk\\web_workspace\\project\\WebContent\\Outputyesterday.Json");
   Object[][] result =new Object[22][6];
   for(int i=0;i<22;i++)
   {
      result[i][0]=o1[i][7];
      result[i][1]=o1[i][2];
      result[i][2]=o1[i][1];
      result[i][3]=o1[i][10];
      result[i][4]= String.format("%.2f", ((Double.parseDouble(o1[i][10]))-(Double.parseDouble(o2[i][10]))));
      result[i][5]= String.format("%.3f", (((Double.parseDouble(o1[i][10]))-(Double.parseDouble(o2[i][10])))/(Double.parseDouble(o2[i][10])))*100);
   }
   
 

   	
   
   for(int i=0;i<22;i++){
      %>
      <tr>
      <%
      for(int j=0;j<6;j++){
         
         
         %>
         <td><%=result[i][j] %></td>
         
         <%
      }
      %>
      </tr>
      <%
   }
%>
</table>
<br /><br />
<a href="Main.jsp"><input type="button" value="뒤로가기" /></a>


</body>
</html>
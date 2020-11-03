<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="wgu.cafeteriamenu.ticket.model.vo.CafeteriaTicket" %>
<%
	CafeteriaTicket cafeteriaTicket = (CafeteriaTicket)request.getAttribute("cafeteriaTicket");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여성시대학교 - 식권사용</title>
<style>
	body {font-family: '맑은 고딕';}
	#divhead{width : 100%; height : 70px; background : rgb(56, 103, 166); color : white; font-size: 25px; text-align: center; line-height: 58px;}
	.inform{position : absolute; top : 130px; left : 100px; font-size: 25px;}
	#cancle{background : rgb(56, 103, 166); border : 1px solid rgb(56, 103, 166); color : white; 
			   margin-left: 200px; margin-top : 130px; width : 90px; height : 30px;}
</style>
</head>
<body onload = 'inputValue();'>
	<div id = 'divhead'>식권사용</div>
	<% if(cafeteriaTicket.getUseYN().equals("N")){ %>
	<label class = 'inform'>식권 번호 : <%= cafeteriaTicket.getTicketNo() %> 사용완료</label><br>
	<% } else { %>
	<label class = 'inform'> 이미 사용한 식권입니다</label><br>
	<% } %>
	<input type = 'button' id = 'cancle' value = '확인' onclick = 'cancleYE();'>
	<script>
		function cancleYE(){
			opener.location.reload();
		    window.close();
		}
	</script>
</body>
</html>
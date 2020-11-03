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
<title>여성시대학교 - 식권구매</title>
<style>
	body {font-family: '맑은 고딕';}
	#divhead{width : 100%; height : 70px; background : rgb(56, 103, 166); color : white; font-size: 25px; text-align: center; line-height: 58px;}
	.inform{position : absolute; top : 130px; left : 100px; font-size: 25px;}
	#cancle{background : rgb(56, 103, 166); border : 1px solid rgb(56, 103, 166); color : white; 
			   margin-left: 200px; margin-top : 130px; width : 90px; height : 30px;}
</style>
</head>
<body onload = 'inputValue();'>
	<div id = 'divhead'>식권구매 완료</div>
	<label class = 'inform'>예약식당 : <%= cafeteriaTicket.getTodayMenuTitle() %> 예약완료</label><br>
	<input type = 'button' id = 'cancle' value = '확인' onclick = 'window.close();'>
</body>
</html>
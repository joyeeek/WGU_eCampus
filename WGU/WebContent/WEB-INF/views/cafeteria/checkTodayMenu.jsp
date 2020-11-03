<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="wgu.cafeteria.model.vo.Cafeteria"%>
<%@page import="wgu.member.model.vo.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여성시대학교 - 식권구매</title>
<style>
	body {font-family: '맑은 고딕';}
	#divhead{width : 100%; height : 70px; background : rgb(56, 103, 166); color : white; font-size: 25px; text-align: center; line-height: 58px;}
	.inform{padding-left : 70px;}
	#buyTicket{background : rgb(56, 103, 166); border : 1px solid rgb(56, 103, 166); color : white; 
			   margin-left: 150px; margin-top : 90px; width : 90px; height : 30px;}
	#cancle{background : rgb(56, 103, 166); border : 1px solid rgb(56, 103, 166); color : white; 
			    width : 90px; height : 30px;}
	#inputCafeTitle{margin-left : 20px; width : 250px;}
	#inputCafeLocation{margin-left : 4px; width : 250px;}
	#inputCafePrice{margin-left : 36px; width : 250px;}
</style>
</head>
<body onload = 'inputValue();'>
	<div id = 'divhead'>식권구매</div>
	<form action="<%= request.getContextPath() %>/buy.foodTicket" id="todayMenuCheck">
	<br><br>
	<label class = 'inform'>식당명 : </label><input type = 'text' id = 'inputCafeTitle' name = 'inputCafeTitle' readonly><br>
	<label class = 'inform'>식당위치 : </label><input type = 'text' id = 'inputCafeLocation' name = 'inputCafeLocation' readonly><br>
	<label class = 'inform'>가격 : </label><input type = 'text' id = 'inputCafePrice' name = 'inputCafePrice' readonly>
	<br><br>
	<button type = 'submit' id = 'buyTicket'>구매</button>
	<input type = 'button' id = 'cancle' value = '취소' onclick = 'window.close();'>
	<script>
		function inputValue(){
			document.getElementById('inputCafeTitle').value = opener.document.showCafeteria.listName.value;
			document.getElementById('inputCafeLocation').value = opener.document.showCafeteria.place1.value;
			document.getElementById('inputCafePrice').value = opener.document.showCafeteria.price1.value;
		}
	</script>
	</form>
</body>
</html>
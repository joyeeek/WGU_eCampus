<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="wgu.cafeteria.model.vo.Cafeteria"%>
<%@page import="wgu.member.model.vo.Member"%>
<% 
    Cafeteria cafeteria = (Cafeteria)request.getAttribute("cafeteria");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여성시대학교 - 식권사용</title>
<style>
   body {font-family: '맑은 고딕';}
   #divhead{width : 100%; height : 70px; background : rgb(56, 103, 166); color : white; font-size: 25px; text-align: center; line-height: 58px;}
   .inform{padding-left : 70px;}
   #buyTicket{background : rgb(56, 103, 166); border : 1px solid rgb(56, 103, 166); color : white; 
            margin-left: 180px; margin-top : 90px; width : 90px; height : 30px;}
   #cancle{background : rgb(56, 103, 166); border : 1px solid rgb(56, 103, 166); color : white; 
             width : 90px; height : 30px;}
   #inputCafeTitle{margin-left : 20px; width : 250px;}
   #inputCafeTitle1{margin-left : 20px; width : 250px;}
   #inputCafeLocation{margin-left : 4px; width : 250px;}
</style>
</head>
<body onload = 'inputValue();'>
   <div id = 'divhead'>식권사용</div>
   <form action="<%= request.getContextPath() %>/use.ticketFood" id="ticketFoodUseha">
   <br><br>
   <label class = 'inform'>예약번호 : </label><input type = 'text' id = 'inputCafeTitle' name = 'inputCafeTitle' readonly><br>
   <label class = 'inform'>사용여부 : </label><input type = 'text' id = 'inputCafeTitle1' name = 'inputCafeTitle1' readonly><br>
   <br><br>
   <button type = 'submit' id = 'buyTicket'>사용</button>
   <input type = 'button' id = 'cancle' value = '취소' onclick = 'window.close();'>
   <script>
      function inputValue(){
         document.getElementById('inputCafeTitle').value = opener.document.showCafeTicket.ynUse.value;
         document.getElementById('inputCafeTitle1').value = opener.document.showCafeTicket.cafeTicketUse.value;
      }
   </script>
   </form>
</body>
</html>
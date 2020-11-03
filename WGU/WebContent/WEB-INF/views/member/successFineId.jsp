<%@page import="wgu.member.model.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="wgu.member.model.vo.Member"%>
<%	
	Member userFineId = (Member)session.getAttribute("userFineId"); 		
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script src="js/jquery-3.5.1.min.js"></script>
<style>
#idFine{font-size: 25px; 
  		font-weight: 800;
  		text-align: center;
		 font-family: "맑은 고딕";
		 margin-top: 5px;}
		 
#idFineMsg{font-size: 15px;
			text-align: center;
			color: rgb(93, 93, 93);
			margin-top: -20px;}		 

#idFineText{border: 2px solid rgb(216,216,216);
			margin-left: 40px;
			padding: 50px; width: 200px; height: 80px;
			background-color: rgba(242, 255, 237, 0.4);
			text-align: center;
			font-weight: 800;}
			
#goLoginClick{background-color: rgb(56, 103, 166);
			color: white;
			border: none;
			width: 200px; height: 40px;
			font-size: 15px;
			margin-top: 20px;
			border-radius: 5px;
			cursor: pointer; }
	
</style>
</head>
<body> 
         <div>
   		 <p id="idFine">아이디 찾기</p> 
   		 <p id="idFineMsg">회원님의 정보와 일치하는 아이디 입니다.</p>
   		
   		<!-- 텍스트 다이브 -->
   		<form>
   		<div id = "idFineText">
		<table id="fineIdTable">
		<tr>
			<td>등록된 아이디 : <%= userFineId.getMemberId() %>  </td>
		</tr>
		<tr>
			<td><button id="goLoginClick" onclick="goLoginPage()">로그인</button></td>
		</tr>
		</table>
		</div>	
		</form>	
   		</div>

      <script>
         //로그인 버튼 클릭시 로그인 페이지로 이동
         function goLoginPage(){
        	 opener.location.href="<%=request.getContextPath()%>/loginForm.me";
        	 window.close();
         }
      </script>
</body>
</html>
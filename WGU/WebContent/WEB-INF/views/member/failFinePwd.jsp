<%@page import="wgu.member.model.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="wgu.member.model.vo.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script src="js/jquery-3.5.1.min.js"></script>
<style>
#pwdFine{font-size: 25px; 
  		font-weight: 800;
  		text-align: center;
		 font-family: "맑은 고딕";
		 margin-top: 40px;}
		 
#pwdFineMsg{font-size: 15px;
			text-align: center;
			color: rgb(93, 93, 93);
			margin-top: 40px;}		 

#click{background-color: rgb(56, 103, 166);
			color: white;
			border: none;
			width: 200px; height: 40px;
			font-size: 15px;
			margin-top: 30px;
			margin-left: 115px;
			border-radius: 5px;
			cursor: pointer; }
	
</style>
</head>
<body> 
         
   		 <p id="pwdFine">비밀번호 찾기</p> 
   		 <p id="pwdFineMsg">입력하신 정보와 일치하는 정보가 없습니다.<br>입력하신 정보를 다시 확인해주세요.</p>
		<button id="click" onclick="pageExit()">닫기</button>
      <script>
         //창닫기
         function pageExit(){
        	 window.close();
         }
      </script>
</body>
</html>